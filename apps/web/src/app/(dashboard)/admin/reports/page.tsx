"use client";

import {
  BarChart3,
  TrendingUp,
  Package,
  Users,
  Download,
  Calendar,
  Filter,
  PieChart,
  ArrowUpRight,
  ChevronRight,
} from "lucide-react";
import { cn } from "@/lib/utils";

const reportTypes = [
  {
    id: "revenue",
    label: "Revenue Report",
    description: "Daily, weekly and monthly income summaries.",
    icon: TrendingUp,
  },
  {
    id: "volume",
    label: "Parcel Volume",
    description: "Analyze terminal throughput and weight trends.",
    icon: Package,
  },
  {
    id: "performance",
    label: "Operator KPIs",
    description: "Track speed and efficiency of station clerks.",
    icon: Users,
  },
  {
    id: "rejections",
    label: "Rejection Log",
    description: "Review denied parcel requests and reasons.",
    icon: BarChart3,
  },
];

export default function AdminReportsPage() {
  return (
    <div className="space-y-10 py-6 animate-in fade-in duration-500">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-6">
        <div>
          <h1 className="text-3xl font-black text-slate-900 tracking-tight">
            Analytics & Intelligence
          </h1>
          <p className="text-slate-500 font-medium mt-1">
            Harness logistics data for better terminal decision making.
          </p>
        </div>

        <div className="flex items-center gap-3">
          <button className="h-11 px-6 bg-white border border-slate-200 rounded-[10px] text-slate-600 text-sm font-bold flex items-center gap-2 hover:bg-slate-50 transition-all shadow-sm">
            <Calendar size={16} />
            Past 30 Days
          </button>
          <button className="h-11 px-6 bg-slate-900 text-white rounded-[10px] text-sm font-black flex items-center gap-2 hover:bg-slate-800 transition-all shadow-xl shadow-slate-900/10">
            <Download size={16} />
            Export Master Log
          </button>
        </div>
      </div>

      {/* Snapshot Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {[
          {
            label: "Total Revenue",
            value: "TZS 18.2M",
            trend: "+12.5%",
            color: "bg-emerald-50 text-emerald-600",
            icon: TrendingUp,
          },
          {
            label: "Parcel Vol.",
            value: "1,240 pkts",
            trend: "+5.2%",
            color: "bg-blue-50 text-blue-600",
            icon: Package,
          },
          {
            label: "Active Users",
            value: "48 Agents",
            trend: "Stable",
            color: "bg-indigo-50 text-indigo-600",
            icon: Users,
          },
          {
            label: "Avg TTR",
            value: "18 mins",
            trend: "-2.1%",
            color: "bg-amber-50 text-amber-600",
            icon: PieChart,
          },
        ].map((stat, i) => (
          <div
            key={i}
            className="bg-white p-6 rounded-[10px] border border-slate-200 shadow-sm flex flex-col gap-4"
          >
            <div className="flex items-center justify-between">
              <div
                className={cn(
                  "h-10 w-10 rounded-[10px] flex items-center justify-center",
                  stat.color,
                )}
              >
                <stat.icon size={20} />
              </div>
              <div className="flex items-center gap-1 text-[10px] font-black uppercase text-emerald-600 bg-emerald-50 px-2 py-0.5 rounded-full">
                <ArrowUpRight size={10} />
                {stat.trend}
              </div>
            </div>
            <div>
              <span className="text-[10px] font-extrabold text-slate-400 uppercase tracking-widest block mb-1">
                {stat.label}
              </span>
              <span className="text-2xl font-black text-slate-800 tracking-tight">
                {stat.value}
              </span>
            </div>
          </div>
        ))}
      </div>

      {/* Report Library */}
      <div className="space-y-6">
        <div className="flex items-center justify-between border-b border-slate-100 pb-4">
          <h3 className="text-lg font-black tracking-tight text-slate-800 uppercase text-xs opacity-50 tracking-widest">
            Report Modules
          </h3>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {reportTypes.map((report) => (
            <button
              key={report.id}
              className="group p-6 bg-white border border-slate-200 rounded-[10px] hover:border-blue-500 transition-all text-left flex items-center justify-between hover:shadow-xl hover:shadow-blue-500/5"
            >
              <div className="flex items-center gap-6">
                <div className="h-16 w-16 bg-slate-50 rounded-[10px] flex items-center justify-center text-slate-400 group-hover:bg-blue-50 group-hover:text-blue-500 transition-all border border-slate-100 group-hover:border-blue-100">
                  <report.icon size={28} />
                </div>
                <div className="flex flex-col">
                  <h4 className="text-lg font-black text-slate-800 tracking-tight">
                    {report.label}
                  </h4>
                  <p className="text-xs text-slate-400 font-medium mt-1">
                    {report.description}
                  </p>
                </div>
              </div>
              <div className="h-10 w-10 rounded-full bg-slate-50 flex items-center justify-center text-slate-300 group-hover:bg-blue-500 group-hover:text-white transition-all">
                <ChevronRight size={18} strokeWidth={3} />
              </div>
            </button>
          ))}
        </div>
      </div>
    </div>
  );
}
