"use client";

import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import {
  Bell,
  ShieldCheck,
  Plus,
  Activity,
  Send,
  CheckCircle2,
  AlertTriangle,
  Database,
  Zap,
  MessageSquare,
  Globe,
} from "lucide-react";
import { cn } from "@/lib/utils";

export default function SmsConfigPage() {
  const { data: configs, isLoading } = useQuery({
    queryKey: ["sms-config"],
    queryFn: async () => {
      const { data } = await api.get("/sms-config");
      return data.data || data;
    },
  });

  const activeConfig = configs?.[0] || null;
  const configData = (activeConfig?.config || {}) as any;

  if (isLoading) {
    return (
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 space-y-10">
      <div className="max-w-[1520px] mx-auto space-y-10">
        {/* Utility Action Bar */}
        <div className="flex items-center justify-between gap-6 bg-white border border-slate-100 rounded-[10px] p-4 shadow-sm">
          <div className="flex items-center gap-3 text-blue-600">
            <Bell size={18} className="animate-pulse" />
            <span className="text-[10px] font-black uppercase tracking-[0.3em]">
              SMS Notifications
            </span>
          </div>

          <div className="flex items-center gap-4">
            <div className="hidden lg:flex items-center gap-6 pr-6 border-r border-slate-100">
              <div className="text-right">
                <p className="text-[9px] font-black text-slate-300 uppercase tracking-widest leading-none mb-1">
                  Available Credits
                </p>
                <h3 className="text-[18px] font-black text-slate-900 tabular-nums">
                  {configData?.credits
                    ? new Intl.NumberFormat().format(configData.credits)
                    : "—"}
                </h3>
              </div>
              <div className="text-right">
                <p className="text-[9px] font-black text-slate-300 uppercase tracking-widest leading-none mb-1">
                  Delivery Rate
                </p>
                <h3 className="text-[18px] font-black text-emerald-600 tabular-nums">
                  {activeConfig?.isActive ? "Active" : "Inactive"}
                </h3>
              </div>
            </div>
            <button className="h-11 px-6 bg-slate-900 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 shadow-xl shadow-slate-900/10 hover:bg-slate-800 transition-all active:scale-95">
              <Plus size={14} strokeWidth={3} />
              Request Sender ID
            </button>
          </div>
        </div>

        {/* Analytical Matrices */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          {[
            {
              label: "Messages Sent",
              value: "—",
              icon: Send,
              color: "text-blue-600",
              tag: "All Time",
            },
            {
              label: "Gateway",
              value: activeConfig?.isActive ? "Active" : "Inactive",
              icon: Globe,
              color: activeConfig?.isActive
                ? "text-emerald-600"
                : "text-slate-400",
              tag: "Status",
            },
            {
              label: "Sender Name",
              value: configData?.defaultSenderId || "—",
              icon: MessageSquare,
              color: "text-amber-500",
              tag: "Approved ID",
            },
            {
              label: "Provider",
              value: activeConfig?.name?.replace("_", " ") || "None",
              icon: Database,
              color: "text-slate-900",
              tag: "SMS Gateway",
            },
          ].map((stat, i) => (
            <div
              key={i}
              className="bg-white p-8 rounded-[10px] border border-slate-100 shadow-sm flex flex-col gap-8 group hover:border-slate-200 transition-all"
            >
              <div className="flex items-center justify-between">
                <div
                  className={cn(
                    "w-12 h-12 rounded-[10px] bg-slate-50 flex items-center justify-center border border-slate-100 transition-all group-hover:bg-slate-900 group-hover:text-white group-hover:scale-110",
                    stat.color,
                  )}
                >
                  <stat.icon size={22} strokeWidth={2.5} />
                </div>
                <span className="text-[10px] font-black uppercase tracking-widest px-3 py-1.5 rounded-[10px] bg-slate-50 text-slate-400">
                  {stat.tag}
                </span>
              </div>
              <div>
                <h4 className="text-[32px] font-black tracking-tight text-slate-900 leading-none">
                  {stat.value}
                </h4>
                <p className="text-[12px] font-black text-slate-400 uppercase tracking-[0.2em] mt-3">
                  {stat.label}
                </p>
              </div>
            </div>
          ))}
        </div>

        {/* Configuration Architecture */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-10">
          <div className="bg-white rounded-[10px] border border-slate-100 shadow-sm p-10 space-y-10">
            <div>
              <h3 className="text-[20px] font-black text-slate-900 tracking-tight mb-2">
                Primary Gateway Matrix
              </h3>
              <p className="text-slate-500 font-bold text-[14px]">
                Technical credentials for the active SMS corridor.
              </p>
            </div>

            <div className="space-y-6">
              <div className="space-y-2">
                <label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                  Provider
                </label>
                <div className="h-14 px-6 bg-slate-50 border border-slate-100 rounded-[10px] flex items-center text-sm font-black text-slate-900">
                  {activeConfig?.name || "Not configured"}
                </div>
              </div>
              <div className="space-y-2">
                <label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                  Sender Name
                </label>
                <div className="h-14 px-6 bg-white border border-slate-100 rounded-[10px] flex items-center justify-between group hover:border-blue-200 transition-all">
                  <span className="text-sm font-black text-slate-900">
                    {configData?.defaultSenderId || "—"}
                  </span>
                  <CheckCircle2 size={16} className="text-emerald-500" />
                </div>
              </div>
            </div>

            <button className="w-full h-14 bg-slate-50 hover:bg-slate-900 text-slate-400 hover:text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest transition-all">
              Update Provider Credentials
            </button>
          </div>

          <div className="bg-slate-900 rounded-[10px] p-10 text-white overflow-hidden relative shadow-2xl">
            <div className="relative z-10 h-full flex flex-col">
              <div className="flex items-center gap-3 text-blue-400 mb-8">
                <ShieldCheck size={20} strokeWidth={2.5} />
                <span className="text-[11px] font-black uppercase tracking-[0.3em]">
                  Developer Sandbox
                </span>
              </div>

              <h3 className="text-[28px] font-black tracking-tight leading-tight mb-4">
                Send Test Message
              </h3>
              <p className="text-slate-400 font-medium text-[15px] mb-10 leading-relaxed max-w-md">
                Send a test SMS to verify the active gateway is configured
                correctly.
              </p>

              <div className="mt-auto flex items-center gap-4">
                <div className="flex-1 h-12 bg-white/5 border border-white/10 rounded-[10px] flex items-center px-6 text-[13px] font-mono text-slate-400">
                  +255 700 000 000
                </div>
                <button className="h-12 px-8 bg-blue-600 hover:bg-blue-700 text-white rounded-[10px] font-black text-[11px] uppercase tracking-widest transition-all shadow-xl shadow-blue-500/20 active:scale-95">
                  Dispatch Test
                </button>
              </div>
            </div>

            <div className="absolute top-0 right-0 w-1/2 h-full bg-white/5 skew-x-[-15deg] translate-x-20" />
          </div>
        </div>
      </div>
    </div>
  );
}
