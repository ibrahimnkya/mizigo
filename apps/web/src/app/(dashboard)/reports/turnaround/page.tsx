"use client";

import { useQuery } from "@tanstack/react-query";
import { Timer, Activity, ArrowUpRight, Zap } from "lucide-react";
import api from "@/lib/api/client";
import { DataTable } from "@/components/shared/data-table";
import { cn } from "@/lib/utils";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useState, useMemo } from "react";

export default function TurnaroundReportPage() {
  const [searchQuery, setSearchQuery] = useState("");
  const { data: reportData, isLoading } = useQuery({
    queryKey: ["reports", "turnaround"],
    queryFn: async () => {
      const res = await api.get("/reports/turnaround");
      return res.data.data || res.data;
    },
  });

  const trends = reportData?.speedTrend || [];

  const filteredData = trends.filter((v: any) =>
    v.name.toLowerCase().includes(searchQuery.toLowerCase()),
  );

  const pdfData = useMemo(
    () =>
      filteredData.map((v: any) => ({
        date: v.name,
        speed: `${v.speed} MINS`,
        efficiency: `${Math.max(0, 100 - (v.speed / 1440) * 100).toFixed(0)}%`,
      })),
    [filteredData],
  );

  const pdfColumns = [
    { header: "Reporting Date", key: "date" },
    { header: "Average Speed", key: "speed" },
    { header: "Efficiency Rating", key: "efficiency" },
  ];

  const columns = [
    {
      header: "Date",
      accessor: (item: any) => (
        <div className="flex items-center gap-3">
          <div className="h-10 w-10 rounded-[10px] bg-slate-900 text-white flex items-center justify-center">
            <Activity className="h-5 w-5" />
          </div>
          <div className="flex flex-col">
            <span className="font-black text-slate-900 text-[13px] tracking-tight uppercase">
              {item.name}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">
              Reporting Date
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Average Time",
      accessor: (item: any) => (
        <div className="flex items-center gap-2">
          <div
            className={cn(
              "px-3 py-1.5 rounded-[10px] border text-[12px] font-black tracking-tighter shadow-sm",
              item.speed < 120
                ? "bg-emerald-50 text-emerald-600 border-emerald-100"
                : item.speed < 240
                  ? "bg-blue-50 text-blue-600 border-blue-100"
                  : "bg-rose-50 text-rose-600 border-rose-100",
            )}
          >
            {item.speed} MINS
          </div>
        </div>
      ),
    },
    {
      header: "Efficiency",
      accessor: (item: any) => {
        const efficiency = Math.max(0, 100 - (item.speed / 1440) * 100);
        return (
          <div className="flex flex-col gap-2 w-full max-w-[150px]">
            <div className="flex items-center justify-between">
              <span className="text-[10px] font-black text-slate-400 uppercase">
                {efficiency.toFixed(0)}% Optimal
              </span>
            </div>
            <div className="h-1.5 bg-slate-100 rounded-full overflow-hidden">
              <div
                className={cn(
                  "h-full rounded-full transition-all duration-1000",
                  efficiency > 80
                    ? "bg-emerald-500"
                    : efficiency > 50
                      ? "bg-blue-500"
                      : "bg-rose-500",
                )}
                style={{ width: `${efficiency}%` }}
              />
            </div>
          </div>
        );
      },
    },
    {
      header: "Actions",
      accessor: (item: any) => (
        <div className="flex items-center justify-end pr-4">
          <button className="h-9 px-4 bg-slate-900 hover:bg-blue-600 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm flex items-center gap-2">
            View Logs <ArrowUpRight size={12} strokeWidth={3} />
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto">
        <ReportPageHeader
          title="Turnaround Intelligence"
          subtitle="Monitoring operational velocity and node throughput"
          icon={Timer}
          onSearch={setSearchQuery}
          pdfData={pdfData}
          pdfColumns={pdfColumns}
        />

        <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden">
          <DataTable
            title="Delivery Speed List"
            columns={columns}
            data={filteredData}
            isLoading={isLoading}
            searchKey="name"
            searchPlaceholder="Search dates..."
            hideInternalSearch
          />
        </div>
      </div>
    </div>
  );
}
