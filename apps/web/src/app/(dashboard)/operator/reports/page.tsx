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
          <span className="font-semibold text-slate-900 text-[12px]">
            #{item.trackingNumber?.slice(-8).toUpperCase()}
          </span>
          <span className="text-[11px] font-medium text-slate-500">
            {format(new Date(item.createdAt), "HH:mm:ss")}
          </span>
        </div>
      ),
    },
    {
      header: "Protocol",
      accessor: (item: any) => (
        <span className="text-[11px] font-medium text-slate-600">
          {item.parcelType}
        </span>
      ),
    },
    {
      header: "Entity Status",
      accessor: (item: any) => (
        <div
          className={cn(
            "inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border",
            item.status === "DELIVERED"
              ? "bg-emerald-50 text-emerald-600 border-emerald-200"
              : "bg-blue-50 text-blue-600 border-blue-200",
          )}
        >
          {item.status.replace("_", " ")}
        </div>
      ),
    },
    {
      header: "Value",
      accessor: (item: any) => (
        <span className="font-semibold text-slate-900 text-[12px] tabular-nums">
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
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Terminal Analytics"
          subtitle="Operational performance & volume logs"
          iconName="BarChart3"
          hideBackArrow={true}
          action={
            <div className="flex items-center gap-1 bg-white p-1 rounded-xl border border-slate-200">
              {["today", "weekly", "monthly"].map((period) => (
                <button
                  key={period}
                  onClick={() => setDateRange(period)}
                  className={cn(
                    "px-3 py-1 rounded-xl text-[12px] font-semibold transition-colors",
                    dateRange === period
                      ? "bg-blue-600 text-white"
                      : "text-slate-500 hover:text-slate-800 hover:bg-slate-50",
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
                color: "text-blue-600",
                trend: "+5% vs Avg",
              },
            ].map((s, i) => (
              <div
                key={i}
                className="bg-white border border-[#E2E2E2] rounded-[20px] p-5 relative overflow-hidden"
              >
                <div className="flex justify-between items-start mb-4">
                  <div className="h-8 w-8 rounded-xl bg-slate-100 flex items-center justify-center text-slate-500">
                    <s.icon size={16} />
                  </div>
                  <span className="inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border border-emerald-200 bg-emerald-50 text-emerald-700">
                    {s.trend}
                  </span>
                </div>

                <h4 className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em] mb-1">
                  {s.label}
                </h4>
                <span className={cn("text-[26px] font-semibold", s.color)}>
                  {s.value}
                </span>
              </div>
            ))}
          </div>

          {/* 3. Detailed Logs & Actions */}
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div className="lg:col-span-2 bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden">
              <DataTable
                title="Daily Operational Log"
                columns={columns}
                data={parcel || []}
                isLoading={isLoading}
              />
            </div>

            <div className="space-y-6">
              {/* Export Card */}
              <div className="bg-blue-600 rounded-xl p-6 text-white relative overflow-hidden">
                <div className="relative z-10 space-y-4">
                  <div className="flex items-center gap-3">
                    <div className="h-10 w-10 bg-white/10 rounded-xl flex items-center justify-center">
                      <FileText size={20} />
                    </div>
                    <div>
                      <h3 className="text-[14px] font-semibold">
                        Performance Summary
                      </h3>
                      <p className="text-blue-200 text-[11px] font-medium mt-0.5">
                        Generate daily manifest PDF
                      </p>
                    </div>
                  </div>

                  <p className="text-[12px] text-blue-100 leading-relaxed">
                    Generate a comprehensive manifest of all collections and
                    deliveries processed at this terminal for physical archival.
                  </p>

                  <button className="w-full bg-white text-blue-600 rounded-xl h-8 font-semibold text-[12px] flex items-center justify-center gap-2 transition-colors hover:bg-slate-50">
                    <Download size={14} />
                    Sync & Download PDF
                  </button>
                </div>

                <div className="absolute bottom-[-10%] right-[-10%] opacity-10">
                  <BarChart3 size={160} strokeWidth={1} />
                </div>
              </div>

              {/* Quick Filter Card */}
              <div className="bg-white border border-[#E2E2E2] rounded-[20px] p-5 space-y-4">
                <div className="flex items-center gap-2">
                  <Filter size={14} className="text-slate-400" />
                  <h4 className="text-[14px] font-semibold text-slate-800">
                    Active Filters
                  </h4>
                </div>

                <div className="space-y-2">
                  <div className="flex items-center justify-between p-2.5 bg-slate-50 rounded-xl border border-slate-100">
                    <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                      Terminal Node
                    </span>
                    <span className="text-[12px] font-semibold text-slate-800">
                      AUTO_DETECTED
                    </span>
                  </div>
                  <div className="flex items-center justify-between p-2.5 bg-slate-50 rounded-xl border border-slate-100">
                    <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                      Service Line
                    </span>
                    <span className="text-[12px] font-semibold text-slate-800">
                      ALL_FLOWS
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div className="text-center mt-6">
            <p className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
              mizigo-pos · reporting layer v2.0 · secure sync
            </p>
          </div>
        </div>
    </div>
  );
}
