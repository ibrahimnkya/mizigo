"use client";

import { useQuery } from "@tanstack/react-query";
import {
  Users,
  Timer,
  Package2,
  Shield,
  ArrowUpRight,
  TrendingUp,
  MapPin,
  CheckCircle2,
} from "lucide-react";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";

export default function OperatorOverviewPage() {
  const { data: reportData, isLoading } = useQuery({
    queryKey: ["reports", "operator", "overview"],
    queryFn: async () => {
      const res = await api.get("/reports/operator/overview");
      return res.data.data || res.data;
    },
  });

  const overview = reportData || {
    stationName: "Awaiting Node Deployment",
    totalHandled: 0,
    pendingRelease: 0,
    revenueGenerated: 0,
    dailyPerformance: [],
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
      <div className="max-w-[1520px] mx-auto space-y-10">
        {/* Utility Action Bar */}
        <div className="flex items-center justify-between gap-6 bg-white border border-slate-100 rounded-[10px] p-4 shadow-sm">
          <div className="flex items-center gap-3 text-blue-600">
            <Shield size={18} className="animate-pulse" />
            <span className="text-[10px] font-black uppercase tracking-[0.3em]">
              Operational Protocol Active
            </span>
          </div>

          <div className="flex items-center gap-4 bg-slate-50 border border-slate-100 rounded-[10px] p-2 px-6">
            <div className="flex items-center gap-2">
              <MapPin size={12} className="text-blue-500" />
              <span className="text-[11px] font-black uppercase tracking-widest text-slate-900">
                {overview.stationName}
              </span>
            </div>
            <div className="w-px h-6 bg-slate-200" />
            <div className="flex items-center gap-2">
              <CheckCircle2 size={12} className="text-emerald-500" />
              <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                Node Active
              </span>
            </div>
          </div>
        </div>

        {/* Localized Metrics Grid */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {/* Activity Pillar */}
          <div className="bg-white p-10 rounded-[10px] border border-slate-100 shadow-sm flex flex-col gap-10 group hover:border-slate-200 transition-all">
            <div className="flex items-center justify-between">
              <div className="w-12 h-12 rounded-[10px] bg-slate-50 flex items-center justify-center text-slate-400 group-hover:bg-slate-900 group-hover:text-white transition-all shadow-sm">
                <Package2 size={22} strokeWidth={2.5} />
              </div>
              <span className="text-[10px] font-black uppercase tracking-widest px-3 py-1.5 rounded-[10px] bg-slate-50 text-slate-400">
                Logistics Flow
              </span>
            </div>
            <div className="space-y-1">
              <h4 className="text-[32px] font-black tracking-tight text-slate-900 leading-none">
                {overview.totalHandled || 0}
              </h4>
              <p className="text-[12px] font-black text-slate-400 uppercase tracking-[0.2em]">
                Total Processed items
              </p>
            </div>
            <div className="mt-auto h-1.5 w-full bg-slate-50 rounded-full overflow-hidden">
              <div className="h-full bg-blue-600 w-3/4 rounded-full" />
            </div>
          </div>

          {/* Monetary Contribution */}
          <div className="bg-white p-10 rounded-[10px] border border-slate-100 shadow-sm flex flex-col gap-10 group hover:border-slate-200 transition-all">
            <div className="flex items-center justify-between">
              <div className="w-12 h-12 rounded-[10px] bg-emerald-50 text-emerald-600 flex items-center justify-center shadow-sm group-hover:bg-slate-900 group-hover:text-white transition-all">
                <TrendingUp size={22} strokeWidth={2.5} />
              </div>
              <span className="text-[10px] font-black uppercase tracking-widest px-3 py-1.5 rounded-[10px] bg-emerald-50 text-emerald-600">
                Financial Impact
              </span>
            </div>
            <div className="space-y-1">
              <h4 className="text-[32px] font-black tracking-tight text-emerald-600 leading-none">
                {new Intl.NumberFormat("en-TZ", {
                  style: "currency",
                  currency: "TZS",
                  maximumFractionDigits: 0,
                }).format(overview.revenueGenerated || 0)}
              </h4>
              <p className="text-[12px] font-black text-slate-400 uppercase tracking-[0.2em]">
                Net Revenue Generated
              </p>
            </div>
            <div className="mt-auto flex items-center justify-between text-slate-400 font-bold text-[11px] uppercase tracking-widest">
              Station Performance{" "}
              <ArrowUpRight
                size={14}
                strokeWidth={3}
                className="text-blue-500"
              />
            </div>
          </div>

          {/* Temporal Efficiency */}
          <div className="bg-white p-10 rounded-[10px] border border-slate-100 shadow-sm flex flex-col gap-10 group hover:border-slate-200 transition-all">
            <div className="flex items-center justify-between">
              <div className="w-12 h-12 rounded-[10px] bg-blue-50 text-blue-600 flex items-center justify-center shadow-sm group-hover:bg-slate-900 group-hover:text-white transition-all">
                <Timer size={22} strokeWidth={2.5} />
              </div>
              <span className="text-[10px] font-black uppercase tracking-widest px-3 py-1.5 rounded-[10px] bg-blue-50 text-blue-600 transition-all">
                Operational Pulse
              </span>
            </div>
            <div className="space-y-1">
              <h4 className="text-[32px] font-black tracking-tight text-blue-600 leading-none">
                12m 4s
              </h4>
              <p className="text-[12px] font-black text-slate-400 uppercase tracking-[0.2em]">
                Avg Throughput Time
              </p>
            </div>
            <div className="mt-auto pt-6 border-t border-slate-50 flex items-center justify-between text-slate-300 font-bold text-[12px] uppercase tracking-widest">
              View Shift Metrics <ArrowUpRight size={14} strokeWidth={3} />
            </div>
          </div>
        </div>

        {/* Footer Strategic Banner */}
        <div className="bg-white border border-slate-100 rounded-[10px] p-8 flex flex-col md:flex-row items-center justify-between gap-6 shadow-sm overflow-hidden relative">
          <div className="flex items-center gap-6 relative z-10">
            <div className="w-14 h-14 rounded-[10px] bg-slate-900 flex items-center justify-center text-white shadow-xl">
              <Package2 size={24} strokeWidth={2.5} />
            </div>
            <div>
              <h4 className="text-[18px] font-black text-slate-900 mb-0.5">
                Automated Operations Log
              </h4>
              <p className="text-[13px] text-slate-400 font-bold max-w-lg leading-relaxed">
                System-wide synchronization of parcel events and terminal
                processing timestamps.
              </p>
            </div>
          </div>
          <button className="relative z-10 h-14 px-10 bg-slate-100 hover:bg-slate-200 text-slate-900 rounded-[10px] font-black text-[12px] uppercase tracking-widest transition-all shadow-sm">
            Audit Shift Ledger
          </button>

          <div className="absolute right-0 top-0 bottom-0 w-[4px] bg-blue-600" />
        </div>
      </div>
    </div>
  );
}
