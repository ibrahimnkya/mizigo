"use client";

import { useQuery } from "@tanstack/react-query";
import { MapPin, TrendingUp, ArrowUpRight, ChevronDown, Building2 } from "lucide-react";
import api from "@/lib/api/client";
import { DataTable } from "@/components/shared/data-table";
import { cn } from "@/lib/utils";
import Link from "next/link";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useState, useMemo } from "react";

export default function StationsReportPage() {
  const [searchQuery, setSearchQuery] = useState("");
  const [statusFilter, setStatusFilter] = useState<"all" | "active" | "inactive">("all");
  const [orgFilter, setOrgFilter] = useState<string>("all");

  const { data: reportData, isLoading } = useQuery({
    queryKey: ["reports", "stations"],
    queryFn: async () => {
      const res = await api.get("/reports/stations");
      return res.data.data || res.data;
    },
  });

  const stations = reportData?.stations || [];

  const orgOptions = useMemo(() => {
    const names = Array.from(
      new Set(stations.map((s: any) => s.organizationName).filter(Boolean))
    ) as string[];
    return names.sort();
  }, [stations]);

  const filteredStations = stations.filter((s: any) => {
    const matchSearch =
      s.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      (s.organizationName || "").toLowerCase().includes(searchQuery.toLowerCase());
    const matchStatus =
      statusFilter === "all" ||
      (statusFilter === "active" && s.isActive) ||
      (statusFilter === "inactive" && !s.isActive);
    const matchOrg =
      orgFilter === "all" || s.organizationName === orgFilter;
    return matchSearch && matchStatus && matchOrg;
  });

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
              "h-10 w-10 rounded-xl flex items-center justify-center transition-all duration-300",
              item.isActive
                ? "bg-slate-900 text-white"
                : "bg-slate-100 text-slate-400 grayscale",
            )}
          >
            <MapPin className="h-5 w-5" />
          </div>
          <div className="flex flex-col">
            <span className="font-semibold text-slate-900 text-[13px] tracking-tight group-hover:text-blue-600 transition-colors uppercase">
              {item.name}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-[0.05em] line-clamp-1">
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
          <div className="flex items-center gap-1.5 px-2.5 py-1 bg-slate-50 border border-slate-100 rounded-xl w-fit">
            <span className="text-[10px] font-semibold text-slate-500 uppercase tracking-[0.05em]">
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
            "inline-flex items-center gap-2 px-3 py-1.5 rounded-xl border text-[10px] font-semibold uppercase tracking-[0.05em] ",
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
            <span className="text-[14px] font-semibold tracking-tight">
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
            <button className="h-9 px-4 bg-slate-900 hover:bg-blue-600 text-white rounded-xl text-[10px] font-semibold uppercase tracking-[0.05em] transition-all active:scale-95  flex items-center gap-2">
              View Station <ArrowUpRight size={12} strokeWidth={3} />
            </button>
          </Link>
        </div>
      ),
    },
  ];

  return (
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Station Performance"
          subtitle="Revenue and parcel activity across all stations"
          icon={MapPin}
          onSearch={setSearchQuery}
          pdfData={pdfData}
          pdfColumns={pdfColumns}
        />

        {/* Filter bar */}
        <div className="flex flex-wrap items-center gap-3 mb-4">
          {/* Status pills */}
          <div className="flex items-center bg-white border border-[#E2E2E2] rounded-[20px]  p-1 gap-1">
            {(["all", "active", "inactive"] as const).map((s) => (
              <button
                key={s}
                onClick={() => setStatusFilter(s)}
                className={cn(
                  "px-3 py-1.5 rounded-xl text-[10px] font-semibold uppercase tracking-[0.05em] transition-all",
                  statusFilter === s
                    ? s === "active"
                      ? "bg-emerald-500 text-white "
                      : s === "inactive"
                      ? "bg-rose-500 text-white "
                      : "bg-slate-900 text-white "
                    : "text-slate-400 hover:text-slate-700 hover:bg-slate-50"
                )}
              >
                {s === "all" ? "All Status" : s}
              </button>
            ))}
          </div>

          {/* Organisation dropdown */}
          {orgOptions.length > 0 && (
            <div className="relative">
              <div className="absolute inset-y-0 left-3 flex items-center pointer-events-none">
                <Building2 size={13} className="text-slate-400" strokeWidth={2.5} />
              </div>
              <select
                value={orgFilter}
                onChange={(e) => setOrgFilter(e.target.value)}
                className="appearance-none h-10 pl-8 pr-8 bg-white border border-[#E2E2E2] rounded-[20px]  text-[11px] font-semibold text-slate-700 uppercase tracking-[0.05em] focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-400 transition-all cursor-pointer"
              >
                <option value="all">All Organisations</option>
                {orgOptions.map((org) => (
                  <option key={org} value={org}>{org}</option>
                ))}
              </select>
              <div className="absolute inset-y-0 right-2.5 flex items-center pointer-events-none">
                <ChevronDown size={12} className="text-slate-400" strokeWidth={3} />
              </div>
            </div>
          )}

          {/* Active filter count badge */}
          {(statusFilter !== "all" || orgFilter !== "all") && (
            <button
              onClick={() => { setStatusFilter("all"); setOrgFilter("all"); }}
              className="h-10 px-3 bg-slate-100 hover:bg-slate-200 text-slate-600 rounded-xl text-[10px] font-semibold uppercase tracking-[0.05em] transition-all flex items-center gap-2"
            >
              Clear filters
              <span className="w-4 h-4 rounded-full bg-slate-600 text-white flex items-center justify-center text-[9px]">
                {(statusFilter !== "all" ? 1 : 0) + (orgFilter !== "all" ? 1 : 0)}
              </span>
            </button>
          )}
        </div>

        <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden">
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
  );
}
