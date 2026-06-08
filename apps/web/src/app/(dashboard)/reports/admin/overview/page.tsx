"use client";

import { useQuery } from "@tanstack/react-query";
import {
  Shield,
  TrendingUp,
  Building2,
  MapPin,
  Package2,
  ArrowUpRight,
  BarChart3,
  Globe,
} from "lucide-react";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";

export default function AdminOverviewPage() {
  const { data: reportData, isLoading } = useQuery({
    queryKey: ["reports", "admin", "overview"],
    queryFn: async () => {
      const res = await api.get("/reports/admin/overview");
      return res.data.data || res.data;
    },
  });

  const overview = reportData || {
    totalRevenue: 0,
    totalOrganizations: 0,
    totalStations: 0,
    totalParcel: 0,
  };

  if (isLoading) {
    return (
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-slate-900 rounded-full animate-spin" />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto space-y-10">
        {/* Top Overview Bar */}
        <div className="flex items-center justify-between gap-6 bg-white border border-slate-100 rounded-[10px] p-4 shadow-sm">
          <div className="flex items-center gap-3 text-emerald-600">
            <Globe size={18} className="animate-pulse" />
            <span className="text-[10px] font-black uppercase tracking-[0.3em]">
              Platform Overview
            </span>
          </div>

          <div className="flex items-center gap-10 bg-slate-50 border border-slate-100 rounded-[10px] p-2 px-10">
            <div className="text-center">
              <p className="text-[9px] font-black text-slate-300 uppercase tracking-widest mb-1">
                Total Revenue
              </p>
              <h3 className="text-[18px] font-black text-emerald-600 tabular-nums">
                {new Intl.NumberFormat("en-TZ", {
                  style: "currency",
                  currency: "TZS",
                  maximumFractionDigits: 0,
                }).format(overview.totalRevenue || 0)}
              </h3>
            </div>
            <div className="w-px h-10 bg-slate-200" />
            <div className="text-center">
              <p className="text-[9px] font-black text-slate-300 uppercase tracking-widest mb-1">
                Active Stations
              </p>
              <h3 className="text-[18px] font-black text-slate-900 tabular-nums">
                {overview.totalStations || 0}
              </h3>
            </div>
          </div>
        </div>

        {/* Metrics + Activity */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Metrics */}
          <div className="lg:col-span-2 grid grid-cols-1 md:grid-cols-2 gap-6">
            {[
              {
                label: "Organizations",
                value: overview.totalOrganizations,
                icon: Building2,
                color: "text-blue-600",
                tag: "Organizations",
              },
              {
                label: "Stations",
                value: overview.totalStations,
                icon: MapPin,
                color: "text-slate-900",
                tag: "Locations",
              },
              {
                label: "Parcels Handled",
                value: overview.totalParcel,
                icon: Package2,
                color: "text-slate-900",
                tag: "Parcels",
              },
              {
                label: "Performance",
                value: "98.4%",
                icon: TrendingUp,
                color: "text-emerald-600",
                tag: "System Health",
              },
            ].map((p, idx) => (
              <div
                key={idx}
                className="bg-white p-10 rounded-[10px] border border-slate-100 shadow-sm flex flex-col gap-8 group hover:border-slate-200 transition-all hover:shadow-lg h-full"
              >
                <div className="flex items-center justify-between">
                  <div className="w-12 h-12 rounded-[10px] bg-slate-50 flex items-center justify-center text-slate-400 group-hover:bg-slate-900 group-hover:text-white transition-all shadow-sm">
                    <p.icon size={20} strokeWidth={2.5} />
                  </div>
                  <span className="text-[10px] font-black uppercase tracking-widest px-3 py-1.5 rounded-[10px] bg-slate-50 text-slate-400">
                    {p.tag}
                  </span>
                </div>

                <div className="space-y-1">
                  <h4
                    className={cn(
                      "text-[32px] font-black tracking-tight",
                      p.color,
                    )}
                  >
                    {p.value}
                  </h4>
                  <p className="text-[12px] font-black text-slate-400 uppercase tracking-[0.2em]">
                    {p.label}
                  </p>
                </div>

                <div className="mt-auto pt-6 border-t border-slate-50 flex items-center justify-between text-slate-300 font-bold text-[12px]">
                  View Details <ArrowUpRight size={14} strokeWidth={3} />
                </div>
              </div>
            ))}
          </div>

          {/* Activity Panel */}
          <div className="bg-slate-900 rounded-[10px] p-8 text-white shadow-2xl relative overflow-hidden flex flex-col gap-8 group">
            <div className="relative z-10">
              <div className="flex items-center gap-2 mb-4">
                <BarChart3
                  className="text-blue-400"
                  size={18}
                  strokeWidth={3}
                />
                <span className="text-[11px] font-black uppercase tracking-[0.2em] text-slate-400">
                  System Overview
                </span>
              </div>

              <h3 className="text-[22px] font-black tracking-tight leading-tight mb-2">
                Platform Activity
              </h3>

              <p className="text-[13px] text-slate-400 font-bold leading-relaxed">
                Live view of activity across your stations and operations.
              </p>
            </div>

            {/* Chart Placeholder */}
            <div className="flex-1 min-h-[140px] flex items-center justify-center relative z-10 border-y border-white/5 py-8">
              <div className="bg-white/5 w-full h-full rounded-[10px] border border-white/10 flex items-center justify-center group-hover:bg-white/10 transition-all">
                <TrendingUp size={48} className="text-blue-500 opacity-20" />
              </div>
            </div>

            <button className="relative z-10 w-full h-14 bg-white text-slate-900 rounded-[10px] font-black text-[12px] uppercase tracking-widest hover:bg-blue-600 hover:text-white transition-all active:scale-95 shadow-xl">
              Download Report
            </button>

            <div className="absolute top-0 right-0 w-64 h-64 bg-blue-500/10 rounded-full blur-3xl -mr-32 -mt-32 pointer-events-none" />
          </div>
        </div>

        {/* Footer */}
        <div className="bg-white border border-slate-100 rounded-[10px] p-10 flex flex-col md:flex-row items-center justify-between gap-10 shadow-sm">
          <div className="flex items-center gap-8">
            <div className="w-20 h-20 rounded-[10px] bg-slate-900 flex items-center justify-center text-white shadow-2xl">
              <Shield size={32} strokeWidth={2.5} />
            </div>
            <div>
              <h4 className="text-[20px] font-black text-slate-900 mb-1">
                Activity & Security
              </h4>
              <p className="text-[14px] text-slate-400 font-bold max-w-xl leading-relaxed">
                View key actions and transactions to keep your operations secure
                and on track.
              </p>
            </div>
          </div>

          <button className="h-14 px-10 bg-slate-100 hover:bg-slate-200 text-slate-900 rounded-[10px] font-black text-[12px] uppercase tracking-widest transition-all">
            View Activity Logs
          </button>
        </div>
      </div>
    </div>
  );
}
