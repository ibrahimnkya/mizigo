"use client";

import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { useState, Suspense } from "react";
import { toast } from "sonner";
import {
  CreditCard,
  ShieldCheck,
  Send,
  CheckCircle2,
  Database,
  Zap,
  Globe,
  Loader2,
  Settings,
  Wifi,
  WifiOff,
  RefreshCw,
  Phone,
  AlertTriangle,
  Lock,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { useSearchParams } from "next/navigation";
import {
  Sheet,
  SheetContent,
  SheetTitle,
  SheetTrigger,
  SheetDescription,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import { ReportPageHeader } from "@/components/reports/report-page-header";

// ─── Types ────────────────────────────────────────────────────────────────────

interface PaymentProvider {
  id: string;
  name: string;
  code: string;
  description?: string;
  isActive: boolean;
}

// ─── Channel color map ────────────────────────────────────────────────────────

const CHANNEL_COLORS: Record<string, { bg: string; text: string; dot: string }> = {
  mpesa:     { bg: "bg-green-50",   text: "text-green-700",  dot: "bg-green-500" },
  tigo:      { bg: "bg-blue-50",    text: "text-blue-700",   dot: "bg-blue-500" },
  tigopesa:  { bg: "bg-blue-50",    text: "text-blue-700",   dot: "bg-blue-500" },
  airtel:    { bg: "bg-red-50",     text: "text-red-700",    dot: "bg-red-500" },
  halopesa:  { bg: "bg-orange-50",  text: "text-orange-700", dot: "bg-orange-500" },
  azampesa:  { bg: "bg-purple-50",  text: "text-purple-700", dot: "bg-purple-500" },
  default:   { bg: "bg-slate-50",   text: "text-slate-700",  dot: "bg-slate-400" },
};

type ChannelColor = { bg: string; text: string; dot: string };

const getChannelColors = (code: string): ChannelColor => {
  const key = code.toLowerCase().replace(/[^a-z]/g, "");
  return (CHANNEL_COLORS[key] ?? CHANNEL_COLORS["default"]) as ChannelColor;
};

// ─── Page Inner ───────────────────────────────────────────────────────────────

function PaymentConfigPageInner() {
  const queryClient = useQueryClient();
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  const [openEditor, setOpenEditor] = useState(false);
  const [testPhone, setTestPhone] = useState("");
  const [testAmount, setTestAmount] = useState("1000");
  const [testChannel, setTestChannel] = useState("");

  // ── Queries ──
  const { data: configs, isLoading } = useQuery({
    queryKey: ["payment-config"],
    queryFn: async () => {
      const { data } = await api.get("/payment-config");
      return data.data || data;
    },
  });

  const {
    data: providers = [],
    isLoading: loadingProviders,
    isError: providersError,
    refetch: refetchProviders,
    isFetching: refetchingProviders,
  } = useQuery<PaymentProvider[]>({
    queryKey: ["payment-providers"],
    queryFn: async () => {
      const { data } = await api.get("/payments/providers");
      return data.data || data;
    },
    retry: 1,
  });

  const activeConfig = configs?.[0] || null;
  const configData = (activeConfig?.config || {}) as any;

  // Auto-select first available channel from providers
  const activeProviders = providers.filter((p) => p.isActive);
  const effectiveChannel =
    testChannel ||
    (activeProviders[0]?.code || "Tigo");

  // ── Mutations ──
  const { mutate: createConfig, isPending: isCreating } = useMutation({
    mutationFn: async (payload: any) => {
      const { data } = await api.post("/payment-config", payload);
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["payment-config"] });
      queryClient.invalidateQueries({ queryKey: ["payment-providers"] });
      toast.success("Payment Gateway configured successfully");
      setOpenEditor(false);
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error?.message || "Failed to configure Payment Gateway");
    },
  });

  const { mutate: updateConfig, isPending: isUpdating } = useMutation({
    mutationFn: async ({ id, payload }: { id: string; payload: any }) => {
      const { data } = await api.put(`/payment-config/${id}`, payload);
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["payment-config"] });
      queryClient.invalidateQueries({ queryKey: ["payment-providers"] });
      toast.success("Payment Gateway updated successfully");
      setOpenEditor(false);
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error?.message || "Failed to update Payment Gateway");
    },
  });

  const { mutate: testPayment, isPending: isTesting } = useMutation({
    mutationFn: async ({ id, payload }: { id: string; payload: any }) => {
      const { data } = await api.post(`/payment-config/${id}/test`, payload);
      return data;
    },
    onSuccess: (data) => {
      toast.success(data.data?.message || data.message || "Push payment initiated — check the phone for the STK prompt");
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error?.message || error.message || "Failed to initiate push payment");
    },
  });

  // ── Handlers ──
  const handleEditorSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const formData = new FormData(e.currentTarget);
    const payload = {
      name: formData.get("name") as string,
      baseUrl: formData.get("baseUrl") as string,
      apiKey: formData.get("apiKey") as string,
      appName: formData.get("appName") as string,
      clientId: formData.get("clientId") as string,
      clientSecret: formData.get("clientSecret") as string,
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
    if (!activeConfig?.id) {
      toast.error("Please configure the Payment gateway first");
      return;
    }
    if (!testPhone) {
      toast.error("Phone number is required");
      return;
    }
    testPayment({
      id: activeConfig.id,
      payload: {
        phoneNumber: testPhone,
        amount: testAmount,
        paymentChannel: effectiveChannel,
      },
    });
  };

  if (isLoading) {
    return (
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">

        {/* ── Header Action Bar ── */}
        <ReportPageHeader
          title="Payment Settings"
          subtitle="Manage digital payment gateways, mobile channels, and configurations"
          iconName="CreditCard"
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
                      Payment Gateway Setup
                    </SheetTitle>
                    <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
                      Configure API endpoint and security credentials
                    </SheetDescription>
                  </div>
                </div>

                <form
                  id="payment-gateway-form"
                  onSubmit={handleEditorSubmit}
                  className="p-8 space-y-8 flex-1 overflow-y-auto"
                >
                  <div className="space-y-6">
                    <div className="space-y-2">
                      <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                        Gateway Name
                      </Label>
                      <Input
                        name="name"
                        defaultValue={activeConfig?.name || "MySafari Pay"}
                        className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-[14px] font-bold"
                        placeholder="e.g. MySafari Pay"
                        required
                      />
                    </div>

                    <div className="space-y-2">
                      <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                        API Endpoint URL
                      </Label>
                      <Input
                        name="baseUrl"
                        defaultValue={configData?.baseUrl || "https://mysafari.co.tz"}
                        className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-[14px] font-bold"
                        placeholder="e.g. https://mysafari.co.tz"
                        required
                      />
                    </div>

                    <div className="space-y-2">
                      <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                        API Security Key
                      </Label>
                      <Input
                        name="apiKey"
                        type="password"
                        defaultValue={configData?.apiKey || ""}
                        className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-[14px] font-bold"
                        placeholder="API Key / Private Secret"
                      />
                    </div>

                    <div className="space-y-2">
                      <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                        App Name
                      </Label>
                      <Input
                        name="appName"
                        defaultValue={configData?.appName || ""}
                        className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-[14px] font-bold"
                        placeholder="e.g. Vodacom App Name"
                      />
                    </div>

                    <div className="space-y-2">
                      <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                        Client ID
                      </Label>
                      <Input
                        name="clientId"
                        defaultValue={configData?.clientId || ""}
                        className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-[14px] font-bold"
                        placeholder="Vodacom Client ID"
                      />
                    </div>

                    <div className="space-y-2">
                      <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                        Client Secret
                      </Label>
                      <Input
                        name="clientSecret"
                        type="password"
                        defaultValue={configData?.clientSecret || ""}
                        className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-[14px] font-bold"
                        placeholder="Vodacom Client Secret"
                      />
                    </div>
                  </div>
                </form>

                <div className="p-6 bg-slate-50 border-t border-slate-100 flex gap-3">
                  <button
                    type="button"
                    onClick={() => setOpenEditor(false)}
                    className="flex-1 h-14 rounded-xl bg-white border border-slate-200 text-slate-400 text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-50 transition-all active:scale-[0.98]"
                  >
                    Cancel
                  </button>
                  <button
                    type="submit"
                    form="payment-gateway-form"
                    disabled={isCreating || isUpdating}
                    className="flex-[1.5] h-14 rounded-xl bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 flex items-center justify-center gap-3 active:scale-[0.98]"
                  >
                    {isCreating || isUpdating ? (
                      <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
                    ) : (
                      <>
                        <CheckCircle2 size={16} strokeWidth={3} />
                        Save Configuration
                      </>
                    )}
                  </button>
                </div>
              </SheetContent>
            </Sheet>
          }
          tabs={["Overview", "Advanced Config"]}
          tabParamName="tab"
          activeTab={tab}
          hideBackArrow={true}
        />

        <div className="animate-in fade-in duration-500">

          {/* ── OVERVIEW TAB ── */}
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-6">
              {/* Stats Row */}
              <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
                {[
                  {
                    label: "API Gateway",
                    value: activeConfig?.isActive ? "ONLINE" : "OFFLINE",
                    icon: Globe,
                    color: activeConfig?.isActive ? "text-emerald-600" : "text-slate-400",
                    tag: "Status",
                  },
                  {
                    label: "Security Level",
                    value: activeConfig ? "AES-256" : "—",
                    icon: ShieldCheck,
                    color: "text-blue-600",
                    tag: "Encryption",
                  },
                  {
                    label: "Provider",
                    value: activeConfig?.name || "None",
                    icon: Database,
                    color: "text-slate-900",
                    tag: "Channel Partner",
                  },
                  {
                    label: "Active Channels",
                    value: providersError ? "Error" : loadingProviders ? "—" : String(activeProviders.length),
                    icon: Zap,
                    color: activeProviders.length > 0 ? "text-emerald-500" : "text-amber-500",
                    tag: "Mobile Wallets",
                  },
                ].map((stat, i) => (
                  <div
                    key={i}
                    className="bg-white p-8 rounded-[10px] border border-slate-100 shadow-sm flex flex-col gap-8 group hover:border-slate-200 transition-all"
                  >
                    <div className="flex items-center justify-between">
                      <div className={cn(
                        "w-12 h-12 rounded-[10px] bg-slate-50 flex items-center justify-center border border-slate-100 transition-all group-hover:bg-slate-900 group-hover:text-white group-hover:scale-110",
                        stat.color,
                      )}>
                        <stat.icon size={20} strokeWidth={2.5} />
                      </div>
                      <span className="text-[10px] font-black uppercase tracking-widest px-3 py-1.5 rounded-[10px] bg-slate-50 text-slate-400">
                        {stat.tag}
                      </span>
                    </div>
                    <div>
                      <h4 className="text-[28px] font-black tracking-tight text-slate-900 leading-none">
                        {stat.value}
                      </h4>
                      <p className="text-[11px] font-black text-slate-400 uppercase tracking-[0.2em] mt-3">
                        {stat.label}
                      </p>
                    </div>
                  </div>
                ))}
              </div>

              {/* Main Content Grid */}
              <div className="grid grid-cols-1 lg:grid-cols-5 gap-8">
                {/* Available Payment Channels */}
                <div className="lg:col-span-3 bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 flex flex-col">
                  <div className="flex items-start justify-between mb-6">
                    <div>
                      <h3 className="text-[20px] font-black text-slate-900 tracking-tight mb-1">
                        Payment Channels
                      </h3>
                      <p className="text-slate-500 font-bold text-[13px]">
                        Mobile wallets available from the configured gateway.
                      </p>
                    </div>
                    <button
                      onClick={() => refetchProviders()}
                      disabled={refetchingProviders || loadingProviders}
                      className="p-2 text-slate-400 hover:text-blue-600 hover:bg-blue-50 rounded-[8px] transition-all disabled:opacity-40"
                      title="Refresh channels"
                    >
                      <RefreshCw size={15} className={cn(refetchingProviders && "animate-spin")} />
                    </button>
                  </div>

                  {loadingProviders || refetchingProviders ? (
                    <div className="min-h-[280px] flex-1 flex items-center justify-center">
                      <div className="flex flex-col items-center gap-3">
                        <Loader2 className="w-6 h-6 animate-spin text-slate-400" />
                        <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                          Fetching channels...
                        </span>
                      </div>
                    </div>
                  ) : providersError ? (
                    <div className="min-h-[280px] flex-1 flex flex-col items-center justify-center gap-4 text-center py-8">
                      <div className="w-14 h-14 rounded-[10px] bg-red-50 flex items-center justify-center">
                        <WifiOff className="w-7 h-7 text-red-400" />
                      </div>
                      <div>
                        <p className="text-sm font-black text-slate-700 mb-1">Gateway Unreachable</p>
                        <p className="text-[11px] font-semibold text-slate-400 max-w-[200px] leading-relaxed">
                          Could not fetch channels from the payment gateway. Check credentials and try again.
                        </p>
                      </div>
                      <button
                        onClick={() => refetchProviders()}
                        className="h-9 px-4 bg-slate-900 text-white rounded-[8px] text-[10px] font-black uppercase tracking-widest transition-all hover:bg-slate-800"
                      >
                        Retry
                      </button>
                    </div>
                  ) : providers.length === 0 ? (
                    <div className="min-h-[280px] flex-1 flex flex-col items-center justify-center gap-4 text-center py-8">
                      <div className="w-14 h-14 rounded-[10px] bg-slate-100 flex items-center justify-center">
                        <Wifi className="w-7 h-7 text-slate-400" />
                      </div>
                      <div>
                        <p className="text-sm font-black text-slate-700 mb-1">No Channels Found</p>
                        <p className="text-[11px] font-semibold text-slate-400 max-w-[200px] leading-relaxed">
                          Configure the gateway URL and API key, then refresh.
                        </p>
                      </div>
                    </div>
                  ) : (
                    <div className="flex-1 space-y-3 max-h-[360px] overflow-y-auto pr-1">
                      {providers.map((provider) => {
                        const colors = getChannelColors(provider.code);
                        return (
                          <div
                            key={provider.id}
                            className={cn(
                              "flex items-center justify-between gap-3 p-4 rounded-[10px] border transition-all",
                              provider.isActive
                                ? "border-transparent " + colors.bg
                                : "bg-slate-50 border-slate-100 opacity-60"
                            )}
                          >
                            <div className="flex items-center gap-3 min-w-0">
                              <div className={cn("w-2.5 h-2.5 rounded-full shrink-0", provider.isActive ? colors.dot : "bg-slate-300")} />
                              <div className="min-w-0">
                                <p className={cn("text-[13px] font-black leading-tight truncate", provider.isActive ? colors.text : "text-slate-500")}>
                                  {provider.name}
                                </p>
                                <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mt-0.5 truncate">
                                  {provider.code}
                                  {provider.description && ` · ${provider.description}`}
                                </p>
                              </div>
                            </div>
                            <span className={cn(
                              "shrink-0 px-2.5 py-1 text-[9px] font-black uppercase tracking-widest rounded-[6px]",
                              provider.isActive ? "bg-white/60 " + colors.text : "bg-slate-100 text-slate-400"
                            )}>
                              {provider.isActive ? "Live" : "Inactive"}
                            </span>
                          </div>
                        );
                      })}
                    </div>
                  )}

                  <div className="pt-4 border-t border-slate-100 mt-4 flex items-center justify-between">
                    <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                      {activeProviders.length} of {providers.length} channels live
                    </span>
                  </div>
                </div>

                {/* Live Push Test Panel */}
                <div className="lg:col-span-2 bg-slate-900 rounded-[10px] p-8 text-white overflow-hidden relative shadow-2xl flex flex-col min-h-[420px]">
                  <div className="relative z-10 flex flex-col flex-1">
                    <div className="flex items-center gap-3 text-blue-400 mb-6">
                      <ShieldCheck size={20} strokeWidth={2.5} />
                      <span className="text-[11px] font-black uppercase tracking-[0.3em]">
                        Live Push Test
                      </span>
                    </div>

                    <div className="mb-6">
                      <h3 className="text-[24px] font-black tracking-tight leading-tight mb-2">
                        Send Real STK Push
                      </h3>
                      <p className="text-slate-400 font-medium text-[12px] leading-relaxed">
                        Sends a live payment prompt to the customer's phone via the configured gateway.
                      </p>
                    </div>

                    <form onSubmit={handleTestSubmit} className="space-y-4 flex-1 flex flex-col justify-between">
                      <div className="space-y-4">
                        {/* Channel selector — from live providers */}
                        <div className="space-y-2">
                          <label className="text-[9px] font-black uppercase tracking-widest text-slate-500">
                            Payment Channel
                          </label>
                          {loadingProviders ? (
                            <div className="h-12 bg-white/5 border border-white/10 rounded-[10px] flex items-center px-4 gap-2">
                              <Loader2 size={13} className="animate-spin text-slate-500" />
                              <span className="text-[11px] text-slate-500 font-semibold">Loading channels...</span>
                            </div>
                          ) : activeProviders.length > 0 ? (
                            <select
                              value={testChannel || activeProviders[0]?.code || ""}
                              onChange={(e) => setTestChannel(e.target.value)}
                              className="w-full h-12 bg-white/5 border border-white/10 text-white rounded-[10px] text-[13px] px-4 outline-none focus:bg-white/10 focus:border-white/20 transition-all cursor-pointer text-slate-100"
                              required
                            >
                              {activeProviders.map((p) => (
                                <option key={p.id} value={p.code} className="bg-slate-900 text-white">
                                  {p.name}
                                </option>
                              ))}
                            </select>
                          ) : (
                            <select
                              value={testChannel || "Tigo"}
                              onChange={(e) => setTestChannel(e.target.value)}
                              className="w-full h-12 bg-white/5 border border-white/10 text-white rounded-[10px] text-[13px] px-4 outline-none focus:bg-white/10 focus:border-white/20 transition-all cursor-pointer"
                            >
                              <option value="Tigo" className="bg-slate-900">Tigo Pesa</option>
                              <option value="Airtel" className="bg-slate-900">Airtel Money</option>
                              <option value="Halopesa" className="bg-slate-900">HaloPesa</option>
                              <option value="Azampesa" className="bg-slate-900">AzamPesa</option>
                              <option value="Vodacom" className="bg-slate-900">M-Pesa (Vodacom)</option>
                            </select>
                          )}
                        </div>

                        <div className="space-y-2">
                          <label className="text-[9px] font-black uppercase tracking-widest text-slate-500">
                            Recipient Phone
                          </label>
                          <div className="relative">
                            <Phone size={13} className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-500" />
                            <Input
                              value={testPhone}
                              onChange={(e) => setTestPhone(e.target.value)}
                              className="h-12 bg-white/5 border border-white/10 text-white placeholder-slate-600 rounded-[10px] text-[13px] pl-10 focus:bg-white/10"
                              placeholder="+255 700 000 000"
                              required
                            />
                          </div>
                        </div>

                        <div className="space-y-2">
                          <label className="text-[9px] font-black uppercase tracking-widest text-slate-500">
                            Amount (TZS)
                          </label>
                          <Input
                            type="number"
                            value={testAmount}
                            onChange={(e) => setTestAmount(e.target.value)}
                            className="h-12 bg-white/5 border border-white/10 text-white placeholder-slate-600 rounded-[10px] text-[13px] focus:bg-white/10"
                            placeholder="Amount in TZS"
                            required
                          />
                        </div>
                      </div>

                      <div className="pt-4">
                        <button
                          type="submit"
                          disabled={isTesting || !activeConfig}
                          className="w-full h-12 bg-blue-600 hover:bg-blue-700 disabled:bg-slate-800 disabled:text-slate-500 text-white rounded-[10px] font-black text-[11px] uppercase tracking-widest transition-all shadow-xl shadow-blue-500/20 active:scale-95 flex items-center justify-center gap-2"
                        >
                          {isTesting ? (
                            <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
                          ) : (
                            <>
                              <Send size={14} />
                              Send Push Request
                            </>
                          )}
                        </button>
                        {!activeConfig && (
                          <p className="text-center text-[10px] font-black text-slate-600 uppercase tracking-widest mt-3">
                            Configure gateway to enable testing
                          </p>
                        )}
                      </div>
                    </form>
                  </div>
                  <div className="absolute top-0 right-0 w-1/2 h-full bg-white/5 skew-x-[-15deg] translate-x-20 pointer-events-none" />
                </div>
              </div>
            </div>
          )}

          {/* ── ADVANCED CONFIG TAB ── */}
          {(tab.toLowerCase() === "advanced config" || tab.toLowerCase() === "advanced-config") && (
            <div className="space-y-6">
              {/* Credentials & Details Card */}
              <div className="bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 space-y-8">
                <div className="flex items-center justify-between pb-6 border-b border-slate-50">
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 rounded-[10px] bg-slate-900 flex items-center justify-center text-white">
                      <Lock size={18} strokeWidth={2.5} />
                    </div>
                    <div>
                      <h3 className="text-[18px] font-black text-slate-900 uppercase tracking-tight">
                        Gateway Credentials
                      </h3>
                      <p className="text-[11px] font-bold text-slate-400 uppercase tracking-widest">
                        API credentials and configuration parameters
                      </p>
                    </div>
                  </div>
                  <button
                    onClick={() => setOpenEditor(true)}
                    className="h-10 px-5 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-[10px] text-[10px] font-black uppercase tracking-widest flex items-center gap-2 transition-all"
                  >
                    <Settings size={12} strokeWidth={2.5} />
                    Edit Gateway Credentials
                  </button>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                  <div className="space-y-1">
                    <span className="text-[9px] font-black uppercase tracking-widest text-slate-400">Gateway Provider</span>
                    <p className="text-sm font-bold text-slate-950">{activeConfig?.name || "Not Configured"}</p>
                  </div>

                  <div className="space-y-1">
                    <span className="text-[9px] font-black uppercase tracking-widest text-slate-400">API Endpoint URL</span>
                    <p className="text-sm font-bold text-slate-950 truncate">{configData?.baseUrl || "—"}</p>
                  </div>

                  <div className="space-y-1">
                    <span className="text-[9px] font-black uppercase tracking-widest text-slate-400">App Name</span>
                    <p className="text-sm font-bold text-slate-950">{configData?.appName || "—"}</p>
                  </div>

                  <div className="space-y-1">
                    <span className="text-[9px] font-black uppercase tracking-widest text-slate-400">Client ID</span>
                    <p className="text-sm font-mono font-semibold text-slate-800 break-all">{configData?.clientId || "—"}</p>
                  </div>

                  <div className="space-y-1">
                    <span className="text-[9px] font-black uppercase tracking-widest text-slate-400">Client Secret</span>
                    <p className="text-sm font-mono text-slate-400">{configData?.clientSecret ? "••••••••••••••••••••••••••••••••" : "—"}</p>
                  </div>

                  <div className="space-y-1">
                    <span className="text-[9px] font-black uppercase tracking-widest text-slate-400">Security Key</span>
                    <p className="text-sm font-mono text-slate-400">{configData?.apiKey ? "••••••••••••••••••••••••••••••••" : "—"}</p>
                  </div>
                </div>
              </div>
            </div>
          )}

        </div>
      </div>
    </div>
  );
}

// ─── Export Page ──────────────────────────────────────────────────────────────

export default function PaymentConfigPage() {
  return (
    <Suspense fallback={
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    }>
      <PaymentConfigPageInner />
    </Suspense>
  );
}
