"use client";

import { Suspense, useState, useEffect } from "react";
import { useSearchParams } from "next/navigation";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { toast } from "sonner";
import {
  Bell,
  Send,
  CheckCircle2,
  AlertTriangle,
  Database,
  Zap,
  MessageSquare,
  Globe,
  Loader2,
  Settings,
  Building2,
  FileText,
  Activity,
  ChevronDown,
  RotateCcw,
  Shield,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { HugeiconsIcon } from "@hugeicons/react";
import { MessageSecure01Icon } from "@hugeicons/core-free-icons";
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
  SheetDescription,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import { ReportPageHeader } from "@/components/reports/report-page-header";

// ─── Types ───────────────────────────────────────────────────────────────────

interface Organization {
  id: string;
  name: string;
  isActive: boolean;
}

const TEMPLATE_DEFS = [
  {
    key: "SMS_TEMPLATE_RECEIPT_SENDER",
    label: "Sender Receipt",
    subtitle: "Sent to the sender when a parcel is received",
    placeholders: "{trackingNumber}, {packageName}, {receiverName}, {otp}, {agentName}, {trackingUrl}",
    rows: 8,
  },
  {
    key: "SMS_TEMPLATE_RECEIPT_RECEIVER",
    label: "Receiver Receipt",
    subtitle: "Sent to the receiver when their parcel is accepted",
    placeholders: "{receiverName}, {packageName}, {trackingNumber}, {senderName}, {originName}, {destinationName}, {agentName}, {agentPhone}, {orgName}, {helpdesk}, {website}, {trackingUrl}",
    rows: 10,
  },
  {
    key: "SMS_TEMPLATE_DISPATCH",
    label: "Parcel Dispatch",
    subtitle: "Sent when a parcel is dispatched en route",
    placeholders: "{receiverName}, {trackingNumber}, {originName}, {destinationName}, {carrierName}, {dispatcherName}, {dispatcherPhone}, {otp}, {orgName}, {support}, {trackingUrl}",
    rows: 8,
  },
  {
    key: "SMS_TEMPLATE_ARRIVED",
    label: "Parcel Arrival",
    subtitle: "Sent when a parcel is offloaded / arrives at destination",
    placeholders: "{trackingNumber}, {senderName}, {packageName}, {receiverName}, {destinationName}, {support}, {trackingUrl}",
    rows: 8,
  },
  {
    key: "SMS_TEMPLATE_DELIVERY_OTP",
    label: "Pickup OTP",
    subtitle: "Secure one-time code for parcel handover",
    placeholders: "{trackingNumber}, {otp}",
    rows: 4,
  },
] as const;

// ─── Inner Page ───────────────────────────────────────────────────────────────

function SmsConfigPageInner() {
  const queryClient = useQueryClient();
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  const [openEditor, setOpenEditor] = useState(false);
  const [testPhone, setTestPhone] = useState("");
  const [testMessage, setTestMessage] = useState("MiziGo Test: Your SMS gateway is now fully operational!");

  // Templates state — keyed by template key
  const [templates, setTemplates] = useState<Record<string, string>>({});
  const [initialTemplates, setInitialTemplates] = useState<Record<string, string>>({});
  const [overrideKeys, setOverrideKeys] = useState<string[]>([]);
  const [selectedOrgId, setSelectedOrgId] = useState<string>(""); // "" = global

  const insertVariable = (key: string, variable: string) => {
    const textarea = document.getElementById(key) as HTMLTextAreaElement | null;
    if (!textarea) {
      setTemplates((prev) => ({
        ...prev,
        [key]: (prev[key] || "") + variable,
      }));
      return;
    }

    const start = textarea.selectionStart;
    const end = textarea.selectionEnd;
    const text = templates[key] || "";
    const before = text.substring(0, start);
    const after = text.substring(end, text.length);
    const newValue = before + variable + after;

    setTemplates((prev) => ({
      ...prev,
      [key]: newValue,
    }));

    setTimeout(() => {
      textarea.focus();
      textarea.setSelectionRange(start + variable.length, start + variable.length);
    }, 0);
  };

  // ── Queries ──

  const { data: configs, isLoading } = useQuery({
    queryKey: ["sms-config"],
    queryFn: async () => {
      const { data } = await api.get("/sms-config");
      return data.data || data;
    },
  });

  const { data: organizations = [] } = useQuery<Organization[]>({
    queryKey: ["organizations-list"],
    queryFn: async () => {
      const { data } = await api.get("/organizations");
      return data.data || data;
    },
  });

  const { data: settingsResponse, isLoading: isLoadingSettings } = useQuery({
    queryKey: ["platform-settings", selectedOrgId],
    queryFn: async () => {
      const url = selectedOrgId
        ? `/admin/platform/settings?organizationId=${selectedOrgId}`
        : "/admin/platform/settings";
      const { data } = await api.get(url);
      return data.data || data;
    },
  });

  useEffect(() => {
    if (!settingsResponse) return;
    // If org-scoped, response is { settings, overrideKeys }
    const raw = settingsResponse.settings ?? settingsResponse;
    const overrides: string[] = settingsResponse.overrideKeys ?? [];
    const loaded: Record<string, string> = {};
    for (const def of TEMPLATE_DEFS) {
      loaded[def.key] = raw[def.key] ?? "";
    }
    setTemplates(loaded);
    setInitialTemplates(loaded);
    setOverrideKeys(overrides);
  }, [settingsResponse]);

  const isDirty = TEMPLATE_DEFS.some(
    (d) => templates[d.key] !== initialTemplates[d.key]
  );

  // ── Mutations ──

  const { mutate: saveTemplates, isPending: isSaving } = useMutation({
    mutationFn: async () => {
      await Promise.all(
        TEMPLATE_DEFS.map((def) =>
          api.patch("/admin/platform/settings", {
            key: def.key,
            value: templates[def.key] ?? "",
            description: def.subtitle,
            organizationId: selectedOrgId || undefined,
          })
        )
      );
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["platform-settings"] });
      toast.success(
        selectedOrgId
          ? `Templates saved for ${organizations.find((o) => o.id === selectedOrgId)?.name}`
          : "Global SMS templates updated"
      );
      setInitialTemplates({ ...templates });
    },
    onError: (err: any) => {
      toast.error(err.response?.data?.error?.message || "Failed to save templates");
    },
  });

  const { mutate: resetToGlobal, isPending: isResetting } = useMutation({
    mutationFn: async () => {
      // Delete org-scoped overrides by setting them to the same as global
      const { data } = await api.get("/admin/platform/settings");
      const globalSettings = data.data || data;
      await Promise.all(
        TEMPLATE_DEFS.map((def) =>
          api.patch("/admin/platform/settings", {
            key: def.key,
            value: globalSettings[def.key] ?? "",
            organizationId: selectedOrgId || undefined,
          })
        )
      );
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["platform-settings", selectedOrgId] });
      toast.success("Reset to global platform templates");
    },
    onError: (err: any) => {
      toast.error(err.response?.data?.error?.message || "Failed to reset");
    },
  });

  const { mutate: createConfig, isPending: isCreating } = useMutation({
    mutationFn: async (payload: any) => {
      const { data } = await api.post("/sms-config", payload);
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["sms-config"] });
      toast.success("SMS Gateway configured successfully");
      setOpenEditor(false);
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error?.message || "Failed to configure SMS Gateway");
    },
  });

  const { mutate: updateConfig, isPending: isUpdating } = useMutation({
    mutationFn: async ({ id, payload }: { id: string; payload: any }) => {
      const { data } = await api.put(`/sms-config/${id}`, payload);
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["sms-config"] });
      toast.success("SMS Gateway updated successfully");
      setOpenEditor(false);
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error?.message || "Failed to update SMS Gateway");
    },
  });

  const { mutate: testSms, isPending: isTesting } = useMutation({
    mutationFn: async ({ id, payload }: { id: string; payload: any }) => {
      const { data } = await api.post(`/sms-config/${id}/test`, payload);
      return data;
    },
    onSuccess: () => toast.success("Test SMS dispatched successfully"),
    onError: (error: any) => {
      toast.error(error.response?.data?.error?.message || "Failed to send test SMS");
    },
  });

  const activeConfig = configs?.[0] || null;
  const configData = (activeConfig?.config || {}) as any;

  const handleEditorSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const formData = new FormData(e.currentTarget);
    const payload = {
      name: formData.get("name") as string,
      apiUrl: formData.get("apiUrl") as string,
      apiId: formData.get("apiId") as string,
      apiPassword: formData.get("apiPassword") as string,
      defaultSenderId: formData.get("defaultSenderId") as string,
      isActive: true,
    };
    if (activeConfig?.id) {
      updateConfig({ id: activeConfig.id, payload });
    } else {
      createConfig(payload);
    }
  };

  const handleTestSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!activeConfig?.id) { toast.error("Configure the SMS gateway first"); return; }
    if (!testPhone || !testMessage) { toast.error("Phone and message are required"); return; }
    testSms({ id: activeConfig.id, payload: { phoneNumber: testPhone, message: testMessage } });
  };

  if (isLoading) {
    return (
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    );
  }

  // ── Render ──

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">

        <ReportPageHeader
          title="SMS Notifications"
          subtitle="Manage SMS gateway, message templates, and delivery configuration"
          iconName="MessageSquare"
          action={
            <Sheet open={openEditor} onOpenChange={setOpenEditor}>
              <SheetTrigger asChild>
                <button className="h-11 px-6 bg-slate-900 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 shadow-xl shadow-slate-900/10 hover:bg-slate-800 transition-all active:scale-95">
                  <Settings size={14} strokeWidth={3} />
                  Configure Gateway
                </button>
              </SheetTrigger>
              <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden border border-slate-100 bg-white shadow-2xl rounded-2xl flex flex-col">
                <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
                  <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
                  <div className="w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md">
                    <Database className="w-6 h-6 text-white" strokeWidth={2.5} />
                  </div>
                  <div className="flex flex-col relative z-10 text-left">
                    <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase">
                      SMS Gateway Setup
                    </SheetTitle>
                    <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
                      Configure SMS provider credentials and defaults
                    </SheetDescription>
                  </div>
                </div>
                <form id="sms-gateway-form" onSubmit={handleEditorSubmit} className="p-8 space-y-6 flex-1 overflow-y-auto">
                  <div className="space-y-2">
                    <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">Provider Name</Label>
                    <Input name="name" defaultValue={activeConfig?.name || ""} className="h-14 bg-slate-50 border-slate-100 rounded-[10px]" placeholder="e.g. Sprint SMS" required />
                  </div>
                  <div className="space-y-2">
                    <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">API Base URL</Label>
                    <Input name="apiUrl" defaultValue={configData.apiUrl || ""} className="h-14 bg-slate-50 border-slate-100 rounded-[10px]" placeholder="https://provider.com/api/sms" required />
                  </div>
                  <div className="space-y-2">
                    <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">API ID / Username</Label>
                    <Input name="apiId" defaultValue={configData.apiId || ""} className="h-14 bg-slate-50 border-slate-100 rounded-[10px]" placeholder="API identifier" />
                  </div>
                  <div className="space-y-2">
                    <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">API Password / Key</Label>
                    <Input name="apiPassword" type="password" defaultValue={configData.apiPassword || ""} className="h-14 bg-slate-50 border-slate-100 rounded-[10px]" placeholder="••••••••" />
                  </div>
                  <div className="space-y-2">
                    <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">Default Sender ID</Label>
                    <Input name="defaultSenderId" defaultValue={configData.defaultSenderId || ""} className="h-14 bg-slate-50 border-slate-100 rounded-[10px]" placeholder="e.g. MIZIGO" />
                  </div>
                </form>
                <div className="p-6 bg-slate-50 border-t border-slate-100 flex gap-3">
                  <button type="button" onClick={() => setOpenEditor(false)} className="flex-1 h-14 rounded-xl bg-white border border-slate-200 text-slate-400 text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-50 transition-all">
                    Cancel
                  </button>
                  <button type="submit" form="sms-gateway-form" disabled={isCreating || isUpdating} className="flex-[1.5] h-14 rounded-xl bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all flex items-center justify-center gap-3">
                    {(isCreating || isUpdating) ? <Loader2 className="w-5 h-5 animate-spin" /> : <><CheckCircle2 size={16} />{activeConfig ? "Update Gateway" : "Save Gateway"}</>}
                  </button>
                </div>
              </SheetContent>
            </Sheet>
          }
          tabs={["Overview", "Templates", "Advanced Config"]}
          tabParamName="tab"
          activeTab={tab}
          hideBackArrow={true}
        />

        <div className="animate-in fade-in duration-500">

          {/* ── OVERVIEW TAB ── */}
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-6">
              {/* Stats Row */}
              <div className="grid grid-cols-2 md:grid-cols-4 gap-5">
                {[
                  { label: "Gateway Status", value: activeConfig?.isActive ? "Active" : "Inactive", icon: Globe, color: activeConfig?.isActive ? "text-emerald-600" : "text-amber-500", tag: "Provider" },
                  { label: "Provider", value: activeConfig?.name || "Not set", icon: Database, color: "text-blue-600", tag: "Integration" },
                  { label: "Templates", value: `${TEMPLATE_DEFS.length} Active`, icon: FileText, color: "text-violet-600", tag: "Messages" },
                  { label: "Companies", value: organizations.length.toString(), icon: Building2, color: "text-slate-900", tag: "Configured" },
                ].map((stat, i) => (
                  <div key={i} className="flex flex-col p-6 bg-white border border-slate-100 rounded-[10px] shadow-sm group hover:border-slate-300 transition-all hover:shadow-xl hover:shadow-slate-100/50">
                    <div className="flex items-center justify-between mb-4">
                      <div className={cn("w-12 h-12 rounded-[10px] bg-slate-50 flex items-center justify-center border border-slate-100 transition-all group-hover:bg-slate-900 group-hover:text-white", stat.color)}>
                        <stat.icon size={20} strokeWidth={2.5} />
                      </div>
                      <span className="text-[10px] font-black uppercase tracking-widest px-3 py-1.5 rounded-[10px] bg-slate-50 text-slate-400">{stat.tag}</span>
                    </div>
                    <h4 className="text-[24px] font-black tracking-tight text-slate-900 leading-none">{stat.value}</h4>
                    <p className="text-[11px] font-black text-slate-400 uppercase tracking-[0.2em] mt-2">{stat.label}</p>
                  </div>
                ))}
              </div>

              {/* Hero + Test Panel */}
              <div className="grid grid-cols-1 lg:grid-cols-5 gap-6">
                {/* Hero Card */}
                <div className="lg:col-span-2 bg-slate-900 rounded-[10px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[420px]">
                  <div className="absolute top-[-80px] right-[-80px] w-64 h-64 bg-blue-500/10 rounded-full blur-[80px]" />
                  <div className="relative z-10">
                    <div className="h-12 w-12 rounded-[10px] bg-white/10 flex items-center justify-center mb-8 border border-white/10">
                      <HugeiconsIcon icon={MessageSecure01Icon} className="w-6 h-6 text-blue-400" />
                    </div>
                    <h3 className="text-[24px] font-black tracking-tight leading-none mb-3">SMS Gateway</h3>
                    <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-80 mb-6">
                      Route transactional notifications through your configured SMS provider with per-company template overrides.
                    </p>
                  </div>
                  <div className="relative z-10 space-y-3">
                    {[
                      { label: "Provider", value: activeConfig?.name || "Not configured" },
                      { label: "Sender ID", value: configData.defaultSenderId || "—" },
                      { label: "Status", value: activeConfig?.isActive ? "✓ Live" : "⚠ Inactive" },
                    ].map((row) => (
                      <div key={row.label} className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">{row.label}</span>
                        <span className="text-[13px] font-black text-white tabular-nums">{row.value}</span>
                      </div>
                    ))}
                  </div>
                </div>

                {/* Test SMS Panel */}
                <div className="lg:col-span-3 bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 flex flex-col justify-between relative overflow-hidden">
                  <div className="absolute top-0 right-0 w-1/2 h-full bg-gradient-to-l from-blue-50/30 to-transparent pointer-events-none" />
                  <div className="relative z-10">
                    <div className="flex items-center gap-3 mb-8">
                      <div className="h-10 w-10 rounded-[10px] bg-blue-600 flex items-center justify-center">
                        <Zap className="h-5 w-5 text-white" strokeWidth={2.5} />
                      </div>
                      <div>
                        <h3 className="text-[16px] font-black text-slate-900">Test SMS Sandbox</h3>
                        <p className="text-[11px] font-bold text-slate-400 uppercase tracking-widest">Dispatch a live test message</p>
                      </div>
                    </div>
                    <form onSubmit={handleTestSubmit} className="space-y-5">
                      <div className="space-y-2">
                        <label className="text-[10px] font-black uppercase tracking-widest text-slate-400">Recipient Phone</label>
                        <input value={testPhone} onChange={(e) => setTestPhone(e.target.value)} className="w-full h-14 px-5 bg-slate-50 border border-slate-100 rounded-[10px] text-sm font-bold focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all" placeholder="+255 7XX XXX XXX" />
                      </div>
                      <div className="space-y-2">
                        <label className="text-[10px] font-black uppercase tracking-widest text-slate-400">Test Message</label>
                        <textarea value={testMessage} onChange={(e) => setTestMessage(e.target.value)} className="w-full h-24 px-5 py-4 bg-slate-50 border border-slate-100 rounded-[10px] text-sm font-bold resize-none focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all" />
                      </div>
                      <button type="submit" disabled={isTesting || !activeConfig} className="w-full h-14 bg-blue-600 hover:bg-blue-700 disabled:bg-slate-100 disabled:text-slate-400 text-white rounded-[10px] font-black text-[11px] uppercase tracking-widest transition-all flex items-center justify-center gap-2">
                        {isTesting ? <Loader2 className="w-5 h-5 animate-spin" /> : <><Send size={14} />Dispatch Test</>}
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* ── TEMPLATES TAB ── */}
          {tab.toLowerCase() === "templates" && (
            <div className="space-y-6">
              {/* Company Scope Selector */}
              <div className="bg-white border border-slate-100 rounded-[10px] shadow-sm p-6 flex flex-col sm:flex-row items-start sm:items-center gap-4">
                <div className="flex items-center gap-3 flex-1">
                  <div className="w-10 h-10 rounded-[10px] bg-blue-50 flex items-center justify-center">
                    <Building2 size={18} className="text-blue-600" />
                  </div>
                  <div>
                    <p className="text-[11px] font-black uppercase tracking-widest text-slate-400">Template Scope</p>
                    <p className="text-[13px] font-bold text-slate-700">
                      {selectedOrgId
                        ? <>Editing overrides for <span className="text-blue-600">{organizations.find((o) => o.id === selectedOrgId)?.name}</span></>
                        : "Editing global platform-wide templates"}
                    </p>
                  </div>
                </div>
                <div className="relative">
                  <select
                    value={selectedOrgId}
                    onChange={(e) => setSelectedOrgId(e.target.value)}
                    className="h-12 pl-4 pr-10 bg-slate-50 border border-slate-200 rounded-[10px] text-[13px] font-bold text-slate-700 focus:outline-none focus:ring-2 focus:ring-blue-500 appearance-none min-w-[220px] cursor-pointer"
                  >
                    <option value="">🌐 Global (Platform Default)</option>
                    {organizations.map((org) => (
                      <option key={org.id} value={org.id}>{org.name}</option>
                    ))}
                  </select>
                  <ChevronDown size={14} className="absolute right-4 top-1/2 -translate-y-1/2 text-slate-400 pointer-events-none" />
                </div>
                {selectedOrgId && overrideKeys.length > 0 && (
                  <button
                    onClick={() => resetToGlobal()}
                    disabled={isResetting}
                    className="h-12 px-5 bg-slate-100 hover:bg-slate-200 text-slate-600 rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 transition-all"
                  >
                    {isResetting ? <Loader2 size={14} className="animate-spin" /> : <RotateCcw size={14} />}
                    Reset to Global
                  </button>
                )}
              </div>

              {/* Loading skeleton */}
              {isLoadingSettings && (
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  {TEMPLATE_DEFS.map((_, i) => (
                    <div key={i} className="bg-white border border-slate-100 rounded-[10px] p-6 animate-pulse space-y-3">
                      <div className="h-4 bg-slate-100 rounded w-1/3" />
                      <div className="h-32 bg-slate-50 rounded-[10px]" />
                    </div>
                  ))}
                </div>
              )}

              {/* Template Cards */}
              {!isLoadingSettings && (
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  {TEMPLATE_DEFS.map((def) => {
                    const hasOrgOverride = overrideKeys.includes(def.key);
                    const isDirtyField = templates[def.key] !== initialTemplates[def.key];
                    return (
                      <div
                        key={def.key}
                        className={cn(
                          "bg-white border rounded-[10px] shadow-sm p-6 space-y-4 transition-all",
                          isDirtyField ? "border-blue-300 shadow-blue-100" : "border-slate-100",
                          def.key === "SMS_TEMPLATE_DELIVERY_OTP" && "md:col-span-2"
                        )}
                      >
                        <div className="flex items-start justify-between">
                          <div>
                            <div className="flex items-center gap-2 mb-1">
                              <h4 className="text-[13px] font-black text-slate-900 uppercase tracking-wide">{def.label}</h4>
                              {hasOrgOverride && (
                                <span className="text-[9px] font-black uppercase tracking-widest px-2 py-0.5 rounded-full bg-blue-50 text-blue-600 border border-blue-100">
                                  Company Override
                                </span>
                              )}
                              {isDirtyField && (
                                <span className="text-[9px] font-black uppercase tracking-widest px-2 py-0.5 rounded-full bg-amber-50 text-amber-600 border border-amber-100">
                                  Unsaved
                                </span>
                              )}
                            </div>
                            <p className="text-[11px] text-slate-400 font-medium">{def.subtitle}</p>
                          </div>
                        </div>
                        <textarea
                          id={def.key}
                          value={templates[def.key] ?? ""}
                          onChange={(e) => setTemplates((prev) => ({ ...prev, [def.key]: e.target.value }))}
                          rows={def.rows}
                          className="w-full p-4 bg-slate-50 border border-slate-100 rounded-[10px] text-sm font-mono text-slate-800 leading-relaxed focus:outline-none focus:ring-2 focus:ring-blue-500 focus:bg-white transition-all resize-y"
                          placeholder={`Enter ${def.label} template...`}
                        />
                        <div className="flex flex-wrap gap-1.5">
                          {def.placeholders.split(", ").map((p) => (
                            <button
                              key={p}
                              type="button"
                              onClick={() => insertVariable(def.key, p)}
                              className="text-[9px] font-black font-mono px-2 py-1 bg-slate-900 hover:bg-blue-600 text-slate-100 rounded-[6px] tracking-wide transition-colors cursor-pointer"
                              title="Click to insert at cursor"
                            >
                              {p}
                            </button>
                          ))}
                        </div>
                      </div>
                    );
                  })}
                </div>
              )}

              {/* Save Bar */}
              <div className={cn(
                "sticky bottom-6 flex items-center justify-between bg-white border rounded-[10px] shadow-xl p-5 transition-all duration-300",
                isDirty ? "border-blue-200 shadow-blue-100/50" : "border-slate-100"
              )}>
                <div>
                  <p className="text-[12px] font-black text-slate-900 uppercase tracking-wide">
                    {isDirty ? "You have unsaved changes" : "All templates saved"}
                  </p>
                  <p className="text-[11px] text-slate-400 font-medium">
                    {selectedOrgId
                      ? `Changes will override platform defaults for ${organizations.find((o) => o.id === selectedOrgId)?.name}`
                      : "Changes will apply platform-wide to all companies without custom overrides"}
                  </p>
                </div>
                <button
                  onClick={() => saveTemplates()}
                  disabled={isSaving || !isDirty}
                  className="h-14 px-8 bg-slate-900 hover:bg-slate-800 disabled:bg-slate-100 disabled:text-slate-400 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-3 transition-all shadow-xl shadow-slate-200"
                >
                  {isSaving ? <Loader2 className="w-4 h-4 animate-spin" /> : <><CheckCircle2 size={16} strokeWidth={3} />Save Templates</>}
                </button>
              </div>
            </div>
          )}

          {/* ── ADVANCED CONFIG TAB ── */}
          {(tab.toLowerCase() === "advanced config" || tab.toLowerCase() === "advanced-config") && (
            <div className="space-y-6">
              {/* Gateway Config Card */}
              <div className="bg-white border border-slate-100 rounded-[10px] shadow-sm p-8">
                <div className="flex items-center justify-between mb-8">
                  <div className="flex items-center gap-4">
                    <div className="w-12 h-12 rounded-[10px] bg-slate-900 flex items-center justify-center">
                      <Shield className="w-6 h-6 text-white" strokeWidth={2.5} />
                    </div>
                    <div>
                      <h3 className="text-[18px] font-black text-slate-900 uppercase tracking-tight">Gateway Configuration</h3>
                      <p className="text-[11px] font-bold text-slate-400 uppercase tracking-widest">API credentials and connectivity</p>
                    </div>
                  </div>
                  <Sheet open={openEditor} onOpenChange={setOpenEditor}>
                    <SheetTrigger asChild>
                      <button className="h-11 px-6 bg-slate-900 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 hover:bg-slate-800 transition-all active:scale-95">
                        <Settings size={14} strokeWidth={3} />
                        {activeConfig ? "Edit Gateway" : "Configure Gateway"}
                      </button>
                    </SheetTrigger>
                  </Sheet>
                </div>

                {activeConfig ? (
                  <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                    {[
                      { label: "Provider Name", value: activeConfig.name },
                      { label: "API Endpoint", value: configData.apiUrl || "—" },
                      { label: "Sender ID", value: configData.defaultSenderId || "—" },
                      { label: "Status", value: activeConfig.isActive ? "Active" : "Inactive" },
                      { label: "Created", value: activeConfig.createdAt ? new Date(activeConfig.createdAt).toLocaleDateString() : "—" },
                      { label: "API ID", value: configData.apiId || "—" },
                    ].map((row) => (
                      <div key={row.label} className="p-4 bg-slate-50 rounded-[10px] border border-slate-100">
                        <p className="text-[9px] font-black uppercase tracking-widest text-slate-400 mb-1">{row.label}</p>
                        <p className="text-[13px] font-bold text-slate-900 break-all">{row.value}</p>
                      </div>
                    ))}
                  </div>
                ) : (
                  <div className="flex flex-col items-center justify-center py-16 text-center">
                    <AlertTriangle className="w-10 h-10 text-amber-400 mb-4" />
                    <h4 className="text-[16px] font-black text-slate-900 mb-2">No Gateway Configured</h4>
                    <p className="text-[13px] text-slate-400 max-w-sm mb-6">Configure your SMS gateway credentials to enable message delivery.</p>
                  </div>
                )}
              </div>

              {/* System Config Raw Keys */}
              {settingsResponse && (
                <div className="bg-white border border-slate-100 rounded-[10px] shadow-sm overflow-hidden">
                  <div className="p-6 border-b border-slate-50 bg-slate-50/40 flex items-center gap-3">
                    <div className="p-2 bg-slate-900 rounded-[10px] text-white">
                      <Database size={16} strokeWidth={2.5} />
                    </div>
                    <div>
                      <h3 className="text-[14px] font-black text-slate-900 uppercase tracking-tight">System Config Keys</h3>
                      <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">Live platform configuration store</p>
                    </div>
                  </div>
                  <div className="overflow-x-auto">
                    <table className="w-full text-left">
                      <thead>
                        <tr className="bg-slate-50/50">
                          <th className="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Key</th>
                          <th className="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Value Preview</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-slate-50">
                        {Object.entries(settingsResponse.settings ?? settingsResponse)
                          .filter(([key]) => key.startsWith("SMS_"))
                          .map(([key, val]) => (
                            <tr key={key} className="hover:bg-slate-50/50 transition-colors">
                              <td className="px-6 py-4">
                                <span className="text-[11px] font-mono font-bold text-slate-900 bg-slate-100 px-2 py-1 rounded">{key}</span>
                              </td>
                              <td className="px-6 py-4 text-[12px] text-slate-500 max-w-[400px] truncate">
                                {String(val).substring(0, 80)}{String(val).length > 80 ? "…" : ""}
                              </td>
                            </tr>
                          ))}
                      </tbody>
                    </table>
                  </div>
                </div>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

// ─── Page Export ──────────────────────────────────────────────────────────────

export default function SmsConfigPage() {
  return (
    <Suspense fallback={
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    }>
      <SmsConfigPageInner />
    </Suspense>
  );
}
