"use client";

import {
  BarChart3,
  Download,
  TrendingUp,
  Package,
  CheckCircle2,
  Clock,
  Filter,
  Calendar,
  FileText,
  Loader2,
} from "lucide-react";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useState } from "react";
import { cn } from "@/lib/utils";
import { useParcelList } from "@/modules/parcel/use-parcel";
import { DataTable } from "@/components/shared/data-table";
import { format } from "date-fns";

export default function OperatorReportsPage() {
  const [dateRange, setDateRange] = useState("today");
  const { data: parcel, isLoading } = useParcelList();

  // Simplified metric calculation for the terminal
  const stats = {
    totalHandled: parcel?.length || 0,
    delivered: parcel?.filter((c: any) => c.status === "DELIVERED").length || 0,
    pending:
      parcel?.filter(
        (c: any) => c.status !== "DELIVERED" && c.status !== "CANCELLED",
      ).length || 0,
    revenue:
      parcel?.reduce(
        (acc: number, curr: any) => acc + (curr.totalPrice || 0),
        0,
      ) || 0,
  };

  const columns = [
    {
      header: "Operation ID",
      accessor: (item: any) => (
        <div className="flex flex-col">
          <span className="font-black text-slate-900 text-xs uppercase tracking-tight">
            #{item.trackingNumber?.slice(-8).toUpperCase()}
          </span>
          <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">
            {format(new Date(item.createdAt), "HH:mm:ss")}
          </span>
        </div>
      ),
    },
    {
      header: "Protocol",
      accessor: (item: any) => (
        <span className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
          {item.parcelType}
        </span>
      ),
    },
    {
      header: "Entity Status",
      accessor: (item: any) => (
        <div
          className={cn(
            "inline-flex items-center gap-1.5 px-2 py-1 rounded-[10px] border text-[9px] font-black uppercase tracking-tighter",
            item.status === "DELIVERED"
              ? "bg-emerald-50 text-emerald-600 border-emerald-100"
              : "bg-blue-50 text-blue-600 border-blue-100",
          )}
        >
          {item.status.replace("_", " ")}
        </div>
      ),
    },
    {
      header: "Value",
      accessor: (item: any) => (
        <span className="font-black text-slate-900 text-xs tabular-nums">
          {new Intl.NumberFormat("en-TZ", {
            style: "currency",
            currency: "TZS",
            maximumSignificantDigits: 3,
          }).format(item.totalPrice || 0)}
        </span>
      ),
    },
  ];

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
        <ReportPageHeader
          title="Terminal Analytics"
          subtitle="Operational performance & volume logs"
          iconName="BarChart3"
          hideBackArrow={true}
          action={
            <div className="flex items-center gap-2 bg-white p-1 rounded-[10px] border border-slate-200 shadow-sm">
              {["today", "weekly", "monthly"].map((period) => (
                <button
                  key={period}
                  onClick={() => setDateRange(period)}
                  className={cn(
                    "px-4 py-1.5 rounded-[8px] text-[10px] font-black uppercase tracking-widest transition-all",
                    dateRange === period
                      ? "bg-slate-900 text-white shadow-md"
                      : "text-slate-500 hover:text-slate-900 hover:bg-slate-50",
                  )}
                >
                  {period}
                </button>
              ))}
            </div>
          }
        />

        <div className="mt-2 animate-in fade-in duration-700 space-y-10">
          {/* 2. Metric Grid */}
          <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
            {[
              {
                label: "Parcel Handled",
                value: stats.totalHandled,
                icon: Package,
                color: "text-blue-600",
                trend: "+12%",
              },
              {
                label: "Delivered Units",
                value: stats.delivered,
                icon: CheckCircle2,
                color: "text-emerald-600",
                trend: "On Target",
              },
              {
                label: "Pending Exit",
                value: stats.pending,
                icon: Clock,
                color: "text-amber-600",
                trend: "High Priority",
              },
              {
                label: "Daily Revenue",
                value: `TSh ${stats.revenue.toLocaleString()}`,
                icon: TrendingUp,
                color: "text-indigo-600",
                trend: "+5% vs Avg",
              },
            ].map((s, i) => (
              <div
                key={i}
                className="bg-white p-8 rounded-[10px] border border-slate-100 shadow-sm shadow-slate-200/40 relative overflow-hidden group hover:border-indigo-500 transition-all"
              >
                <div className="flex justify-between items-start">
                  <div
                    className={cn(
                      "h-12 w-12 rounded-[10px] flex items-center justify-center mb-6 shadow-xl shadow-slate-200",
                      i % 2 === 0
                        ? "bg-slate-900 text-white"
                        : "bg-slate-50 text-slate-400",
                    )}
                  >
                    <s.icon size={22} />
                  </div>
                  <span className="text-[9px] font-black text-emerald-500 bg-emerald-50 px-2 py-1 rounded-[10px] uppercase tracking-widest">
                    {s.trend}
                  </span>
                </div>

                <h4 className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em] mb-1">
                  {s.label}
                </h4>
                <span
                  className={cn("text-2xl font-black tracking-tight", s.color)}
                >
                  {s.value}
                </span>

                <div className="absolute top-0 right-0 p-8 opacity-[0.02] group-hover:opacity-[0.05] transition-opacity">
                  <s.icon size={120} strokeWidth={1} />
                </div>
              </div>
            ))}
          </div>

          {/* 3. Detailed Logs & Actions */}
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div className="lg:col-span-2 bg-white rounded-[10px] border border-slate-100 shadow-xl shadow-slate-200/50 overflow-hidden">
              <DataTable
                title="Daily Operational Log"
                columns={columns}
                data={parcel || []}
                isLoading={isLoading}
              />
            </div>

            <div className="space-y-6">
              {/* Export Card */}
              <div className="bg-indigo-600 rounded-[10px] p-10 text-white shadow-2xl shadow-indigo-900/20 relative overflow-hidden">
                <div className="relative z-10 space-y-6">
                  <div className="flex items-center gap-4">
                    <div className="h-14 w-14 bg-white/10 rounded-[10px] flex items-center justify-center backdrop-blur-md">
                      <FileText size={28} />
                    </div>
                    <div>
                      <h3 className="text-xl font-black tracking-tight">
                        Performance Summary
                      </h3>
                      <p className="text-indigo-200 text-[10px] font-black uppercase tracking-widest mt-0.5">
                        Generate daily manifest PDF
                      </p>
                    </div>
                  </div>

                  <p className="text-sm font-medium text-indigo-100 leading-relaxed">
                    Generate a comprehensive manifest of all collections and
                    deliveries processed at this terminal for physical archival.
                  </p>

                  <button className="w-full h-14 bg-white text-indigo-600 rounded-[10px] font-black text-sm uppercase tracking-widest flex items-center justify-center gap-3 shadow-xl transition-all hover:bg-slate-50 active:scale-95">
                    <Download size={18} />
                    Sync & Download PDF
                  </button>
                </div>

                <div className="absolute bottom-[-10%] right-[-10%] opacity-10">
                  <BarChart3 size={200} strokeWidth={1} />
                </div>
              </div>

              {/* Quick Filter Card */}
              <div className="bg-white rounded-[10px] border border-slate-100 p-8 space-y-6">
                <div className="flex items-center gap-3">
                  <Filter size={18} className="text-slate-400" />
                  <h4 className="text-[10px] font-black text-slate-900 uppercase tracking-widest">
                    Active Filters
                  </h4>
                </div>

                <div className="space-y-3">
                  <div className="flex items-center justify-between p-3 bg-slate-50 rounded-[10px] border border-slate-100">
                    <span className="text-xs font-bold text-slate-500">
                      Terminal Node
                    </span>
                    <span className="text-xs font-black text-slate-900">
                      AUTO_DETECTED
                    </span>
                  </div>
                  <div className="flex items-center justify-between p-3 bg-slate-50 rounded-[10px] border border-slate-100">
                    <span className="text-xs font-bold text-slate-500">
                      Service Line
                    </span>
                    <span className="text-xs font-black text-slate-900">
                      ALL_FLOWS
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div className="text-center mt-8">
            <p className="text-[10px] font-black text-slate-400 uppercase tracking-[0.4em]">
              mizigo-pos · reporting layer v2.0 · secure sync
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
