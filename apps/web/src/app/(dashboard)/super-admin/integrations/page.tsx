"use client";

import { useQuery, useMutation } from "@tanstack/react-query";
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
} from "lucide-react";
import { cn } from "@/lib/utils";
import { useState, Suspense } from "react";
import { toast } from "sonner";

import { useSearchParams } from "next/navigation";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { Activity } from "lucide-react";

function IntegrationsPageInner() {
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  const { data: config, isLoading } = useQuery({
    queryKey: ["system-config"],
    queryFn: async () => {
      const { data } = await api.get("/integrations/payment-gateway");
      return data.data;
    },
  });

  const { mutate: updateConfig, isPending: isSaving } = useMutation({
    mutationFn: async (url: string) => {
      const { data } = await api.patch("/integrations/payment-gateway/url", {
        url,
      });
      return data.data;
    },
    onSuccess: () => toast.success("Integration updated successfully"),
  });

  const [url, setUrl] = useState("");

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
        <ReportPageHeader
          title="Integrations Matrix"
          subtitle="Configure third-party service connections and API gateways"
          iconName="Globe"
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
                    count: 1,
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
                      <Globe
                        className="h-6 w-6 text-blue-400"
                        strokeWidth={2.5}
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
                          Payment Corridors
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          Active Sync
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-emerald-400 tabular-nums">
                        1
                      </span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-16 h-16 rounded-full bg-blue-50 flex items-center justify-center mb-4">
                    <Activity className="w-8 h-8 text-blue-500" />
                  </div>
                  <h4 className="text-[16px] font-black text-slate-900 mb-2">
                    Integration Sync Logs
                  </h4>
                  <p className="text-[13px] text-slate-400 max-w-md">
                    Detailed graphical analysis of third-party API calls and
                    latency metrics will be populated here.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all" && (
            <div className="grid grid-cols-1 gap-8">
              <div className="bg-white rounded-[10px] border border-slate-100 overflow-hidden shadow-2xl relative">
                <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-blue-600/5 rounded-full blur-[100px]" />

                <div className="p-10 relative z-10 flex flex-col md:flex-row gap-10 items-start">
                  <div className="h-24 w-24 shrink-0 bg-slate-50 rounded-[10px] flex items-center justify-center border border-slate-100 shadow-sm overflow-hidden">
                    <img
                      src="/mono.png"
                      className="w-12 h-12 grayscale opacity-40"
                    />
                  </div>

                  <div className="flex-1 space-y-6">
                    <div className="flex items-center justify-between">
                      <div>
                        <h3 className="text-2xl font-black text-slate-900 tracking-tight">
                          MySafari Payment Gateway
                        </h3>
                        <p className="text-slate-500 font-medium text-sm mt-1">
                          Official corridor for Tanzanian Mobile Money
                          settlements.
                        </p>
                      </div>
                      <span className="text-[10px] font-black uppercase tracking-widest text-emerald-600 bg-emerald-50 px-3 py-1 rounded-full border border-emerald-100">
                        Certified
                      </span>
                    </div>

                    <div className="bg-slate-50 border border-slate-100 rounded-[10px] p-8 space-y-8">
                      <div className="flex flex-col gap-2">
                        <label className="text-[10px] font-extrabold uppercase tracking-widest text-slate-400 flex items-center gap-2">
                          <Database size={12} className="text-slate-400" />
                          Gateway Endpoint URL
                        </label>
                        <div className="relative group">
                          <input
                            value={url || config?.url || ""}
                            onChange={(e) => setUrl(e.target.value)}
                            className="w-full h-14 pl-6 pr-32 bg-white border border-slate-100 rounded-[10px] text-sm font-bold font-mono focus:ring-4 ring-blue-500/10 focus:border-blue-500 transition-all shadow-sm"
                            placeholder="https://mysafari-sandbox.mizigo.com/api/v1"
                          />
                          <button
                            onClick={() => updateConfig(url)}
                            disabled={isSaving}
                            className="absolute right-2 top-2 bottom-2 px-6 bg-slate-900 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest shadow-lg hover:bg-slate-800 transition-all flex items-center gap-2"
                          >
                            {isSaving ? (
                              <Loader2 size={12} className="animate-spin" />
                            ) : (
                              <Save size={12} />
                            )}
                            Update Entry
                          </button>
                        </div>
                        <p className="text-[10px] text-slate-400 font-bold mt-1 flex items-center gap-1.5 ml-1">
                          <ShieldCheck size={10} className="text-blue-500" />
                          Connections are cryptographically signed using
                          Mizigo-Core keys.
                        </p>
                      </div>

                      <div className="grid grid-cols-2 gap-4">
                        <div className="p-4 bg-white border border-slate-100 rounded-[10px] flex items-center gap-4 group hover:border-blue-200 transition-all">
                          <div className="h-10 w-10 rounded-[10px] bg-blue-50 flex items-center justify-center text-blue-500 border border-blue-50">
                            <RefreshCcw size={18} />
                          </div>
                          <div className="flex flex-col">
                            <span className="text-[10px] font-extrabold text-slate-400 uppercase tracking-widest">
                              Environment
                            </span>
                            <span className="text-xs font-black text-slate-800">
                              {config?.url?.includes("sandbox")
                                ? "SANDBOX_NODE"
                                : "PRODUCTION_CORRIDOR"}
                            </span>
                          </div>
                        </div>

                        <div className="p-4 bg-white border border-slate-100 rounded-[10px] flex items-center gap-4 group hover:border-emerald-200 transition-all">
                          <div className="h-10 w-10 rounded-[10px] bg-emerald-50 flex items-center justify-center text-emerald-500 border border-emerald-50">
                            <Lock size={18} />
                          </div>
                          <div className="flex flex-col">
                            <span className="text-[10px] font-extrabold text-slate-400 uppercase tracking-widest">
                              Key Rotation
                            </span>
                            <span className="text-xs font-black text-slate-800">
                              Auto (90 Days)
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="px-10 py-6 bg-slate-50 border-t border-slate-100 flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <Zap size={14} className="text-amber-500" />
                    <span className="text-xs font-bold text-slate-500">
                      Last successful ping: 2 minutes ago
                    </span>
                  </div>
                  <button className="text-[11px] font-black text-blue-600 uppercase tracking-widest flex items-center gap-1.5 hover:underline">
                    Developer Documentation
                    <ExternalLink size={12} />
                  </button>
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
