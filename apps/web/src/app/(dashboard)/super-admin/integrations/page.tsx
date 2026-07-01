"use client";

import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";
import {
  Settings,
  Globe,
  ShieldCheck,
  Database,
  RefreshCcw,
  Zap,
  Loader2,
  Lock,
  ExternalLink,
  ChevronRight,
  Save,
  MessageSquare,
  Send,
  CreditCard,
  CheckCircle2,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { useState, Suspense } from "react";
import { toast } from "sonner";
import { useSearchParams } from "next/navigation";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { HugeiconsIcon } from "@hugeicons/react";
import { ApiIcon } from "@hugeicons/core-free-icons";

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

function IntegrationsPageInner() {
  const queryClient = useQueryClient();
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  // State for editor sheets
  const [openPaymentEditor, setOpenPaymentEditor] = useState(false);
  const [openSmsEditor, setOpenSmsEditor] = useState(false);

  // State for sandbox tests
  const [testSmsPhone, setTestSmsPhone] = useState("");
  const [testSmsMsg, setTestSmsMsg] = useState("MiziGo Test: SMS Gateway integration is active!");
  const [testPaymentPhone, setTestPaymentPhone] = useState("");
  const [testPaymentAmount, setTestPaymentAmount] = useState("1000");
  const [testPaymentChannel, setTestPaymentChannel] = useState("");

  // Fetch payment providers for sandbox testing
  const { data: providers = [], isLoading: loadingProviders } = useQuery<any[]>({
    queryKey: ["payment-providers"],
    queryFn: async () => {
      const { data } = await api.get("/payments/providers");
      return data.data || data;
    },
    retry: 1,
  });

  const activeProviders = providers.filter((p) => p.isActive);
  const effectiveChannel =
    testPaymentChannel ||
    (activeProviders[0]?.code || "Tigo");

  // Fetch all integrations
  const { data: integrations, isLoading } = useQuery<any[]>({
    queryKey: ["integrations"],
    queryFn: async () => {
      const { data } = await api.get("/integrations");
      return data.data || data;
    },
  });

  const paymentIntegration = integrations?.find((i: any) => i.type === "PAYMENT_GATEWAY") || null;
  const paymentConfig = (paymentIntegration?.config || {}) as any;

  const smsIntegration = integrations?.find((i: any) => i.type === "SMS_GATEWAY") || null;
  const smsConfigRaw = (smsIntegration?.config || {}) as any;
  const smsConfig = {
    ...smsConfigRaw,
    baseUrl: smsConfigRaw.baseUrl || smsConfigRaw.apiUrl || "",
    apiUrl: smsConfigRaw.apiUrl || smsConfigRaw.baseUrl || "",
  } as any;

  // Mutations
  const { mutate: updatePayment, isPending: isUpdatingPayment } = useMutation({
    mutationFn: async (payload: any) => {
      if (paymentIntegration?.id) {
        const { data } = await api.put(`/payment-config/${paymentIntegration.id}`, payload);
        return data;
      } else {
        const { data } = await api.post("/payment-config", payload);
        return data;
      }
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["integrations"] });
      toast.success("Payment Gateway configured successfully");
      setOpenPaymentEditor(false);
    },
    onError: (err: any) => {
      toast.error(err.response?.data?.error?.message || "Failed to save Payment Gateway config");
    },
  });

  const { mutate: updateSms, isPending: isUpdatingSms } = useMutation({
    mutationFn: async (payload: any) => {
      if (smsIntegration?.id) {
        const { data } = await api.put(`/sms-config/${smsIntegration.id}`, payload);
        return data;
      } else {
        const { data } = await api.post("/sms-config", payload);
        return data;
      }
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["integrations"] });
      toast.success("SMS Gateway configured successfully");
      setOpenSmsEditor(false);
    },
    onError: (err: any) => {
      toast.error(err.response?.data?.error?.message || "Failed to save SMS Gateway config");
    },
  });

  // Sandbox Test Mutations
  const { mutate: triggerTestSms, isPending: isTestingSms } = useMutation({
    mutationFn: async ({ id, payload }: { id: string; payload: any }) => {
      const { data } = await api.post(`/sms-config/${id}/test`, payload);
      return data;
    },
    onSuccess: () => {
      toast.success("Test SMS dispatched successfully");
    },
    onError: (err: any) => {
      toast.error(err.response?.data?.error?.message || err.message || "Failed to send test SMS");
    },
  });

  const { mutate: triggerTestPayment, isPending: isTestingPayment } = useMutation({
    mutationFn: async ({ id, payload }: { id: string; payload: any }) => {
      const { data } = await api.post(`/payment-config/${id}/test`, payload);
      return data;
    },
    onSuccess: (data: any) => {
      toast.success(data.message || "Test push payment sandbox request initiated");
    },
    onError: (err: any) => {
      toast.error(err.response?.data?.error?.message || err.message || "Failed to trigger test payment");
    },
  });

  const handlePaymentSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const formData = new FormData(e.currentTarget);
    updatePayment({
      name: formData.get("name") as string,
      baseUrl: formData.get("baseUrl") as string,
      apiKey: formData.get("apiKey") as string,
      appName: formData.get("appName") as string,
      clientId: formData.get("clientId") as string,
      clientSecret: formData.get("clientSecret") as string,
      isActive: true,
    });
  };

  const handleSmsSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const formData = new FormData(e.currentTarget);
    updateSms({
      name: formData.get("name") as string,
      apiUrl: formData.get("apiUrl") as string,
      apiId: formData.get("apiId") as string,
      apiPassword: formData.get("apiPassword") as string,
      defaultSenderId: formData.get("defaultSenderId") as string,
      isActive: true,
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
        <ReportPageHeader
          title="Integrations Matrix"
          subtitle="Configure third-party service connections and API gateways"
          icon={(props: any) => <HugeiconsIcon icon={ApiIcon} {...props} />}
          tabs={["Overview", "All"]}
          tabParamName="tab"
          activeTab={tab}
          hideBackArrow={true}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-6">
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                {[
                  {
                    label: "Active Gateways",
                    count: (paymentIntegration?.isActive ? 1 : 0) + (smsIntegration?.isActive ? 1 : 0),
                    icon: Globe,
                    color: "text-emerald-500",
                    bg: "bg-emerald-50",
                  },
                  {
                    label: "System Health",
                    count: "100%",
                    icon: ShieldCheck,
                    color: "text-blue-500",
                    bg: "bg-blue-50",
                  },
                  {
                    label: "Data Syncs",
                    count: "Live",
                    icon: RefreshCcw,
                    color: "text-indigo-500",
                    bg: "bg-indigo-50",
                  },
                  {
                    label: "Pending Updates",
                    count: 0,
                    icon: Save,
                    color: "text-slate-500",
                    bg: "bg-slate-50",
                  },
                ].map((stat, i) => (
                  <div
                    key={i}
                    className="flex flex-col p-6 bg-white border border-slate-100 rounded-[10px] shadow-sm group hover:border-slate-300 transition-all hover:shadow-xl hover:shadow-slate-100/50"
                  >
                    <div className="flex items-center justify-between mb-4">
                      <div className={cn("p-2.5 rounded-[10px]", stat.bg)}>
                        <stat.icon className={cn("w-5 h-5", stat.color)} />
                      </div>
                      <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest leading-none">
                        {stat.label}
                      </span>
                    </div>
                    <div className="flex items-baseline gap-2">
                      <span className="text-3xl font-black text-slate-900 tabular-nums">
                        {stat.count}
                      </span>
                    </div>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-slate-900 rounded-[10px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[400px]">
                  <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-blue-500/10 rounded-full blur-[100px]" />

                  <div className="relative z-10">
                    <div className="h-12 w-12 rounded-[10px] bg-white/10 flex items-center justify-center mb-8 border border-white/10 backdrop-blur-md shadow-2xl shadow-blue-500/10">
                      <HugeiconsIcon
                        icon={ApiIcon}
                        className="h-6 w-6 text-blue-400"
                      />
                    </div>
                    <h3 className="text-[24px] font-black tracking-tight leading-none mb-3">
                      API Connectivity
                    </h3>
                    <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-80 mb-6">
                      Seamless integration with third-party payment corridors,
                      SMS gateways, and external data services.
                    </p>
                  </div>

                  <div className="relative z-10 space-y-3">
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          Payment Gateway
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          {paymentIntegration?.isActive ? "Active Sync" : "Inactive"}
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-emerald-400 tabular-nums">
                        {paymentIntegration?.isActive ? "ONLINE" : "OFFLINE"}
                      </span>
                    </div>

                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          SMS Gateway
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          {smsIntegration?.isActive ? "Active Sync" : "Inactive"}
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-emerald-400 tabular-nums">
                        {smsIntegration?.isActive ? "ONLINE" : "OFFLINE"}
                      </span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-16 h-16 rounded-full bg-blue-50 flex items-center justify-center mb-4">
                    <Zap className="w-8 h-8 text-blue-500 animate-pulse" />
                  </div>
                  <h4 className="text-[16px] font-black text-slate-900 mb-2">
                    Integration Hub Operational
                  </h4>
                  <p className="text-[13px] text-slate-400 max-w-md">
                    Both the SMS Gateway and Payment Gateway are linked and fully configurable. Access details and sandbox modes under the "All" tab.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all" && (
            <div className="grid grid-cols-1 xl:grid-cols-2 gap-8">
              {/* Payment Gateway Card */}
              <div className="bg-white rounded-[10px] border border-slate-100 overflow-hidden shadow-sm flex flex-col justify-between">
                <div className="p-8 space-y-6">
                  <div className="flex items-start justify-between">
                    <div className="flex items-center gap-4">
                      <div className="h-12 w-12 rounded-[10px] bg-blue-50 border border-blue-100 flex items-center justify-center">
                        <CreditCard className="w-6 h-6 text-blue-600" />
                      </div>
                      <div>
                        <h3 className="text-lg font-black text-slate-900 tracking-tight">
                          {paymentIntegration?.name || "Payment Gateway"}
                        </h3>
                        <p className="text-slate-500 font-bold text-xs mt-0.5">
                          Tanzanian Mobile Money STK pushes & callback handler.
                        </p>
                      </div>
                    </div>
                    <span className={cn(
                      "text-[9px] font-black uppercase tracking-widest px-2.5 py-1 rounded-full border",
                      paymentIntegration?.isActive
                        ? "text-emerald-600 bg-emerald-50 border-emerald-100"
                        : "text-slate-400 bg-slate-50 border-slate-100"
                    )}>
                      {paymentIntegration?.isActive ? "Active" : "Inactive"}
                    </span>
                  </div>

                  <div className="bg-slate-50 border border-slate-100 rounded-[10px] p-6 space-y-4">
                    <div className="space-y-1">
                      <span className="text-[9px] font-black text-slate-400 uppercase tracking-widest block">
                        Gateway Endpoint URL
                      </span>
                      <span className="text-xs font-mono font-bold text-slate-700 truncate block">
                        {paymentConfig?.baseUrl || "—"}
                      </span>
                    </div>

                    <div className="space-y-1">
                      <span className="text-[9px] font-black text-slate-400 uppercase tracking-widest block">
                        API Security Key
                      </span>
                      <span className="text-xs font-mono font-bold text-slate-400 block">
                        {paymentConfig?.apiKey ? "••••••••••••••••••••••••••••••••" : "—"}
                      </span>
                    </div>

                    {paymentConfig?.appName && (
                      <div className="space-y-1">
                        <span className="text-[9px] font-black text-slate-400 uppercase tracking-widest block">
                          App Name
                        </span>
                        <span className="text-xs font-bold text-slate-700 truncate block">
                          {paymentConfig.appName}
                        </span>
                      </div>
                    )}

                    {paymentConfig?.clientId && (
                      <div className="space-y-1">
                        <span className="text-[9px] font-black text-slate-400 uppercase tracking-widest block">
                          Client ID
                        </span>
                        <span className="text-xs font-bold text-slate-700 truncate block">
                          {paymentConfig.clientId}
                        </span>
                      </div>
                    )}

                    {paymentConfig?.clientSecret && (
                      <div className="space-y-1">
                        <span className="text-[9px] font-black text-slate-400 uppercase tracking-widest block">
                          Client Secret
                        </span>
                        <span className="text-xs font-mono font-bold text-slate-400 block">
                          ••••••••••••••••••••••••••••••••
                        </span>
                      </div>
                    )}
                  </div>

                  {/* Payment Sandbox Test */}
                  {paymentIntegration && (
                    <div className="bg-slate-950 text-white rounded-[10px] p-6 space-y-4 shadow-xl">
                      <div className="flex items-center gap-2 text-blue-400">
                        <Zap size={14} className="animate-pulse" />
                        <span className="text-[9px] font-black uppercase tracking-[0.2em]">
                          Payment Sandbox Tester
                        </span>
                      </div>
                      <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                        <div className="space-y-1 text-left">
                          <label className="text-[8px] font-black text-slate-400 uppercase tracking-widest">
                            Payment Channel
                          </label>
                          {loadingProviders ? (
                            <div className="h-10 bg-white/5 border border-white/10 rounded-[10px] flex items-center px-3 gap-2">
                              <Loader2 size={10} className="animate-spin text-slate-500" />
                              <span className="text-[10px] text-slate-500 font-semibold">Loading...</span>
                            </div>
                          ) : activeProviders.length > 0 ? (
                            <select
                              value={testPaymentChannel || activeProviders[0]?.code || ""}
                              onChange={(e) => setTestPaymentChannel(e.target.value)}
                              className="w-full h-10 bg-white/5 border border-white/10 text-white rounded-[10px] text-xs px-3 outline-none focus:bg-white/10 focus:border-white/20 transition-all"
                              required
                            >
                              {activeProviders.map((p: any) => (
                                <option key={p.id} value={p.code} className="bg-slate-900 text-white">
                                  {p.name}
                                </option>
                              ))}
                            </select>
                          ) : (
                            <select
                              value={testPaymentChannel || "Tigo"}
                              onChange={(e) => setTestPaymentChannel(e.target.value)}
                              className="w-full h-10 bg-white/5 border border-white/10 text-white rounded-[10px] text-xs px-3 outline-none focus:bg-white/10 focus:border-white/20 transition-all"
                            >
                              <option value="Tigo" className="bg-slate-900 text-white">Tigo Pesa</option>
                              <option value="Airtel" className="bg-slate-900 text-white">Airtel Money</option>
                              <option value="Halopesa" className="bg-slate-900 text-white">HaloPesa</option>
                              <option value="Azampesa" className="bg-slate-900 text-white">AzamPesa</option>
                              <option value="Vodacom" className="bg-slate-900 text-white">M-Pesa (Vodacom)</option>
                            </select>
                          )}
                        </div>
                        <div className="space-y-1 text-left">
                          <label className="text-[8px] font-black text-slate-400 uppercase tracking-widest">
                            Phone Number
                          </label>
                          <Input
                            value={testPaymentPhone}
                            onChange={(e) => setTestPaymentPhone(e.target.value)}
                            placeholder="e.g. +255 700 000 000"
                            className="h-10 bg-white/5 border border-white/10 text-white placeholder-slate-600 rounded-[10px] text-xs focus:bg-white/10"
                          />
                        </div>
                        <div className="space-y-1 text-left">
                          <label className="text-[8px] font-black text-slate-400 uppercase tracking-widest">
                            Amount (TZS)
                          </label>
                          <Input
                            value={testPaymentAmount}
                            onChange={(e) => setTestPaymentAmount(e.target.value)}
                            placeholder="Amount"
                            type="number"
                            className="h-10 bg-white/5 border border-white/10 text-white placeholder-slate-600 rounded-[10px] text-xs focus:bg-white/10"
                          />
                        </div>
                      </div>
                      <button
                        type="button"
                        onClick={() => {
                          if (!testPaymentPhone || !testPaymentAmount) {
                            toast.error("Phone number and amount are required");
                            return;
                          }
                          triggerTestPayment({
                            id: paymentIntegration.id,
                            payload: {
                              phoneNumber: testPaymentPhone,
                              amount: testPaymentAmount,
                              paymentChannel: effectiveChannel,
                            },
                          });
                        }}
                        disabled={isTestingPayment}
                        className="w-full h-10 bg-blue-600 hover:bg-blue-700 disabled:bg-slate-800 disabled:text-slate-500 text-white rounded-[10px] font-black text-[10px] uppercase tracking-widest transition-all flex items-center justify-center gap-2"
                      >
                        {isTestingPayment ? (
                          <Loader2 className="w-4 h-4 animate-spin" />
                        ) : (
                          <>
                            <Send size={12} />
                            Dispatch Sandbox Push
                          </>
                        )}
                      </button>
                    </div>
                  )}
                </div>

                <div className="p-6 bg-slate-50 border-t border-slate-100 flex justify-between items-center">
                  <Sheet open={openPaymentEditor} onOpenChange={setOpenPaymentEditor}>
                    <SheetTrigger asChild>
                      <button className="h-11 px-6 bg-slate-900 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest shadow-md hover:bg-slate-800 transition-all">
                        Configure Credentials
                      </button>
                    </SheetTrigger>
                    <SheetContent className="w-full sm:w-[600px] p-0 border border-slate-100 bg-white shadow-2xl flex flex-col text-left">
                      <div className="bg-slate-900 px-8 py-8 flex items-center gap-4 text-white relative shrink-0">
                        <CreditCard className="w-8 h-8 text-blue-400" />
                        <div>
                          <SheetTitle className="text-lg font-black text-white uppercase tracking-tight">
                            Payment Gateway Setup
                          </SheetTitle>
                          <SheetDescription className="text-white/40 text-[10px] font-bold uppercase tracking-widest mt-0.5">
                            Update endpoint configuration and API keys
                          </SheetDescription>
                        </div>
                      </div>
                      <form onSubmit={handlePaymentSubmit} className="p-8 space-y-6 flex-1 overflow-y-auto">
                        <div className="space-y-2">
                          <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                            Gateway Name
                          </Label>
                          <Input
                            name="name"
                            defaultValue={paymentIntegration?.name || "MySafari Pay"}
                            className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-sm font-bold"
                            required
                          />
                        </div>
                        <div className="space-y-2">
                          <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                            API Endpoint URL
                          </Label>
                          <Input
                            name="baseUrl"
                            defaultValue={paymentConfig?.baseUrl || "https://mysafari.co.tz"}
                            className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-sm font-bold"
                            required
                          />
                        </div>
                         <div className="space-y-2">
                          <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                            API Security Key
                          </Label>
                          <Input
                            name="apiKey"
                            type="password"
                            defaultValue={paymentConfig?.apiKey || ""}
                            className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-sm font-bold"
                            placeholder="API Key / Secret"
                          />
                        </div>
                        <div className="space-y-2">
                          <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                            App Name
                          </Label>
                          <Input
                            name="appName"
                            defaultValue={paymentConfig?.appName || ""}
                            className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-sm font-bold"
                            placeholder="e.g. Vodacom App Name"
                          />
                        </div>
                        <div className="space-y-2">
                          <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                            Client ID
                          </Label>
                          <Input
                            name="clientId"
                            defaultValue={paymentConfig?.clientId || ""}
                            className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-sm font-bold"
                            placeholder="Vodacom Client ID"
                          />
                        </div>
                        <div className="space-y-2">
                          <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                            Client Secret
                          </Label>
                          <Input
                            name="clientSecret"
                            type="password"
                            defaultValue={paymentConfig?.clientSecret || ""}
                            className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-sm font-bold"
                            placeholder="Vodacom Client Secret"
                          />
                        </div>
                        <div className="pt-4 flex gap-3">
                          <button
                            type="button"
                            onClick={() => setOpenPaymentEditor(false)}
                            className="flex-1 h-14 bg-white border border-slate-200 text-slate-400 text-[10px] font-black uppercase tracking-widest rounded-xl"
                          >
                            Cancel
                          </button>
                          <button
                            type="submit"
                            disabled={isUpdatingPayment}
                            className="flex-[1.5] h-14 bg-slate-900 text-white text-[10px] font-black uppercase tracking-widest rounded-xl flex items-center justify-center gap-2"
                          >
                            {isUpdatingPayment ? (
                              <Loader2 className="w-5 h-5 animate-spin" />
                            ) : (
                              <>
                                <CheckCircle2 size={16} />
                                Save Changes
                              </>
                            )}
                          </button>
                        </div>
                      </form>
                    </SheetContent>
                  </Sheet>

                  <span className="text-[10px] font-extrabold text-slate-400 uppercase tracking-widest">
                    AES-256 Secured
                  </span>
                </div>
              </div>

              {/* SMS Gateway Card */}
              <div className="bg-white rounded-[10px] border border-slate-100 overflow-hidden shadow-sm flex flex-col justify-between">
                <div className="p-8 space-y-6">
                  <div className="flex items-start justify-between">
                    <div className="flex items-center gap-4">
                      <div className="h-12 w-12 rounded-[10px] bg-amber-50 border border-amber-100 flex items-center justify-center">
                        <MessageSquare className="w-6 h-6 text-amber-600" />
                      </div>
                      <div>
                        <h3 className="text-lg font-black text-slate-900 tracking-tight">
                          {smsIntegration?.name || "SMS Gateway"}
                        </h3>
                        <p className="text-slate-500 font-bold text-xs mt-0.5">
                          Carrier network SMS delivery for Otps & receipts.
                        </p>
                      </div>
                    </div>
                    <span className={cn(
                      "text-[9px] font-black uppercase tracking-widest px-2.5 py-1 rounded-full border",
                      smsIntegration?.isActive
                        ? "text-emerald-600 bg-emerald-50 border-emerald-100"
                        : "text-slate-400 bg-slate-50 border-slate-100"
                    )}>
                      {smsIntegration?.isActive ? "Active" : "Inactive"}
                    </span>
                  </div>

                  <div className="bg-slate-50 border border-slate-100 rounded-[10px] p-6 space-y-4">
                    <div className="space-y-1">
                      <span className="text-[9px] font-black text-slate-400 uppercase tracking-widest block">
                        API Endpoint URL
                      </span>
                      <span className="text-xs font-mono font-bold text-slate-700 truncate block">
                        {smsConfig?.baseUrl || "—"}
                      </span>
                    </div>

                    <div className="grid grid-cols-2 gap-4">
                      <div className="space-y-1">
                        <span className="text-[9px] font-black text-slate-400 uppercase tracking-widest block">
                          Sender ID
                        </span>
                        <span className="text-xs font-bold text-slate-800">
                          {smsConfig?.defaultSenderId || "—"}
                        </span>
                      </div>
                      <div className="space-y-1">
                        <span className="text-[9px] font-black text-slate-400 uppercase tracking-widest block">
                          API ID / User
                        </span>
                        <span className="text-xs font-bold text-slate-800 truncate block">
                          {smsConfig?.apiId || "—"}
                        </span>
                      </div>
                    </div>
                  </div>

                  {/* SMS Sandbox Test */}
                  {smsIntegration && (
                    <div className="bg-slate-950 text-white rounded-[10px] p-6 space-y-4 shadow-xl">
                      <div className="flex items-center gap-2 text-amber-400">
                        <Zap size={14} className="animate-pulse" />
                        <span className="text-[9px] font-black uppercase tracking-[0.2em]">
                          SMS Sandbox Tester
                        </span>
                      </div>
                      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                        <div className="space-y-1 text-left">
                          <label className="text-[8px] font-black text-slate-400 uppercase tracking-widest">
                            Destination Phone
                          </label>
                          <Input
                            value={testSmsPhone}
                            onChange={(e) => setTestSmsPhone(e.target.value)}
                            placeholder="e.g. +255 700 000 000"
                            className="h-10 bg-white/5 border border-white/10 text-white placeholder-slate-600 rounded-[10px] text-xs focus:bg-white/10"
                          />
                        </div>
                        <div className="space-y-1 text-left">
                          <label className="text-[8px] font-black text-slate-400 uppercase tracking-widest">
                            Test Message
                          </label>
                          <Input
                            value={testSmsMsg}
                            onChange={(e) => setTestSmsMsg(e.target.value)}
                            placeholder="Message Content"
                            className="h-10 bg-white/5 border border-white/10 text-white placeholder-slate-600 rounded-[10px] text-xs focus:bg-white/10"
                          />
                        </div>
                      </div>
                      <button
                        type="button"
                        onClick={() => {
                          if (!testSmsPhone || !testSmsMsg) {
                            toast.error("Destination phone and message are required");
                            return;
                          }
                          triggerTestSms({
                            id: smsIntegration.id,
                            payload: { phoneNumber: testSmsPhone, message: testSmsMsg },
                          });
                        }}
                        disabled={isTestingSms}
                        className="w-full h-10 bg-amber-600 hover:bg-amber-700 disabled:bg-slate-800 disabled:text-slate-500 text-white rounded-[10px] font-black text-[10px] uppercase tracking-widest transition-all flex items-center justify-center gap-2"
                      >
                        {isTestingSms ? (
                          <Loader2 className="w-4 h-4 animate-spin" />
                        ) : (
                          <>
                            <Send size={12} />
                            Dispatch Sandbox SMS
                          </>
                        )}
                      </button>
                    </div>
                  )}
                </div>

                <div className="p-6 bg-slate-50 border-t border-slate-100 flex justify-between items-center">
                  <Sheet open={openSmsEditor} onOpenChange={setOpenSmsEditor}>
                    <SheetTrigger asChild>
                      <button className="h-11 px-6 bg-slate-900 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest shadow-md hover:bg-slate-800 transition-all">
                        Configure Credentials
                      </button>
                    </SheetTrigger>
                    <SheetContent className="w-full sm:w-[600px] p-0 border border-slate-100 bg-white shadow-2xl flex flex-col text-left">
                      <div className="bg-slate-900 px-8 py-8 flex items-center gap-4 text-white relative shrink-0">
                        <MessageSquare className="w-8 h-8 text-amber-400" />
                        <div>
                          <SheetTitle className="text-lg font-black text-white uppercase tracking-tight">
                            SMS Gateway Setup
                          </SheetTitle>
                          <SheetDescription className="text-white/40 text-[10px] font-bold uppercase tracking-widest mt-0.5">
                            Update endpoint configuration and gateway credentials
                          </SheetDescription>
                        </div>
                      </div>
                      <form onSubmit={handleSmsSubmit} className="p-8 space-y-6 flex-1 overflow-y-auto">
                        <div className="space-y-2">
                          <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                            Provider Name
                          </Label>
                          <Input
                            name="name"
                            defaultValue={smsIntegration?.name || "Sprint SMS"}
                            className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-sm font-bold"
                            required
                          />
                        </div>
                        <div className="space-y-2">
                          <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                            API Endpoint URL
                          </Label>
                          <Input
                            name="apiUrl"
                            defaultValue={smsConfig?.baseUrl || "https://api.sprintsmsservice.com/api/SendSMS"}
                            className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-sm font-bold"
                            required
                          />
                        </div>
                        <div className="space-y-2">
                          <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                            API ID (Username)
                          </Label>
                          <Input
                            name="apiId"
                            defaultValue={smsConfig?.apiId || ""}
                            className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-sm font-bold"
                            required
                          />
                        </div>
                        <div className="space-y-2">
                          <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                            API Password
                          </Label>
                          <Input
                            name="apiPassword"
                            type="password"
                            defaultValue={smsConfig?.apiPassword || ""}
                            className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-sm font-bold"
                            required
                          />
                        </div>
                        <div className="space-y-2">
                          <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                            Default Sender ID
                          </Label>
                          <Input
                            name="defaultSenderId"
                            defaultValue={smsConfig?.defaultSenderId || "MIZIGO"}
                            className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-sm font-bold uppercase"
                            required
                          />
                        </div>
                        <div className="pt-4 flex gap-3">
                          <button
                            type="button"
                            onClick={() => setOpenSmsEditor(false)}
                            className="flex-1 h-14 bg-white border border-slate-200 text-slate-400 text-[10px] font-black uppercase tracking-widest rounded-xl"
                          >
                            Cancel
                          </button>
                          <button
                            type="submit"
                            disabled={isUpdatingSms}
                            className="flex-[1.5] h-14 bg-slate-900 text-white text-[10px] font-black uppercase tracking-widest rounded-xl flex items-center justify-center gap-2"
                          >
                            {isUpdatingSms ? (
                              <Loader2 className="w-5 h-5 animate-spin" />
                            ) : (
                              <>
                                <CheckCircle2 size={16} />
                                Save Changes
                              </>
                            )}
                          </button>
                        </div>
                      </form>
                    </SheetContent>
                  </Sheet>

                  <span className="text-[10px] font-extrabold text-slate-400 uppercase tracking-widest">
                    Carrier Confirmed
                  </span>
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default function IntegrationsPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">
          Loading page...
        </div>
      }
    >
      <IntegrationsPageInner />
    </Suspense>
  );
}
