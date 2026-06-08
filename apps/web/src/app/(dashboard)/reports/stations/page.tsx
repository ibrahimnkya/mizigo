"use client";

import { useQuery } from "@tanstack/react-query";
import { MapPin, TrendingUp, ArrowUpRight } from "lucide-react";
import api from "@/lib/api/client";
import { DataTable } from "@/components/shared/data-table";
import { cn } from "@/lib/utils";
import Link from "next/link";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useState, useMemo } from "react";

export default function StationsReportPage() {
  const [searchQuery, setSearchQuery] = useState("");
  const { data: reportData, isLoading } = useQuery({
    queryKey: ["reports", "stations"],
    queryFn: async () => {
      const res = await api.get("/reports/stations");
      return res.data.data || res.data;
    },
  });

  const stations = reportData?.stations || [];

  const filteredStations = stations.filter(
    (s: any) =>
      s.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      (s.organizationName || "")
        .toLowerCase()
        .includes(searchQuery.toLowerCase()),
  );

  // Prepare PDF data
  const pdfData = useMemo(
    () =>
      filteredStations.map((s: any) => ({
        name: s.name,
        id: s.id?.slice(0, 8),
        status: s.isActive ? "Active" : "Inactive",
        revenue: new Intl.NumberFormat("en-TZ", {
          style: "currency",
          currency: "TZS",
        }).format(s.totalRevenue || 0),
      })),
    [filteredStations],
  );

  const pdfColumns = [
    { header: "Station Name", key: "name" },
    { header: "Station ID", key: "id" },
    { header: "Active Status", key: "status" },
    { header: "Total Revenue", key: "revenue" },
  ];

  const columns = [
    {
      header: "Station",
      accessor: (item: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-10 w-10 rounded-[10px] flex items-center justify-center transition-all duration-300",
              item.isActive
                ? "bg-slate-900 text-white"
                : "bg-slate-100 text-slate-400 grayscale",
            )}
          >
            <MapPin className="h-5 w-5" />
          </div>
          <div className="flex flex-col">
            <span className="font-black text-slate-900 text-[13px] tracking-tight group-hover:text-blue-600 transition-colors uppercase">
              {item.name}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest line-clamp-1">
              {item.organizationName || "Headquarters"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Station ID",
      accessor: (item: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1.5 px-2.5 py-1 bg-slate-50 border border-slate-100 rounded-[10px] w-fit">
            <span className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
              {item.id?.slice(0, 8) || "STA-001"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Status",
      accessor: (item: any) => (
        <div
          className={cn(
            "inline-flex items-center gap-2 px-3 py-1.5 rounded-[10px] border text-[10px] font-black uppercase tracking-widest shadow-sm",
            item.isActive
              ? "bg-emerald-50 text-emerald-600 border-emerald-100"
              : "bg-rose-50 text-rose-600 border-rose-100",
          )}
        >
          <div
            className={cn(
              "w-1.5 h-1.5 rounded-full",
              item.isActive ? "bg-emerald-500 animate-pulse" : "bg-rose-500",
            )}
          />
          {item.isActive ? "Active" : "Inactive"}
        </div>
      ),
    },
    {
      header: "Total Revenue",
      accessor: (item: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1 text-emerald-600">
            <TrendingUp className="w-4 h-4" strokeWidth={3} />
            <span className="text-[14px] font-black tracking-tighter">
              {new Intl.NumberFormat("en-TZ", {
                style: "currency",
                currency: "TZS",
                maximumSignificantDigits: 3,
              }).format(item.totalRevenue || 0)}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Actions",
      accessor: (item: any) => (
        <div className="flex items-center justify-end gap-2 pr-4">
          <Link href={`/reports/station/${item.id}`}>
            <button className="h-9 px-4 bg-slate-900 hover:bg-blue-600 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm flex items-center gap-2">
              View Station <ArrowUpRight size={12} strokeWidth={3} />
            </button>
          </Link>
        </div>
      ),
    },
  ];

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto">
        <ReportPageHeader
          title="Station Performance"
          subtitle="Revenue and parcel activity across all stations"
          icon={MapPin}
          onSearch={setSearchQuery}
          pdfData={pdfData}
          pdfColumns={pdfColumns}
        />

        <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden">
          <DataTable
            title="Stations List"
            columns={columns}
            data={filteredStations}
            isLoading={isLoading}
            searchKey="name"
            searchPlaceholder="Search stations..."
            hideInternalSearch
          />
        </div>
      </div>
    </div>
  );
}
