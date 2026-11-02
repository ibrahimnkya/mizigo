"use client";

import {
  Download,
  Globe,
  ArrowUpRight,
  MapPin,
  Users,
  Activity,
  Building2,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { useState, useMemo } from "react";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { DataTable } from "@/components/shared/data-table";

export function OrganizationReportClient({
  organization,
  metrics,
  generatedAt,
  timeframe,
}: any) {
  const [searchQuery, setSearchQuery] = useState("");

  const stationData = metrics.topStations || [];
  const filteredStations = stationData.filter((s: any) =>
    s.name.toLowerCase().includes(searchQuery.toLowerCase()),
  );

  const pdfData = useMemo(
    () =>
      filteredStations.map((s: any) => ({
        name: s.name,
        volume: s.volume.toLocaleString(),
        share: `${metrics.totalVolume > 0 ? ((s.volume / metrics.totalVolume) * 100).toFixed(1) : 0}%`,
      })),
    [filteredStations, metrics.totalVolume],
  );

  const pdfColumns = [
    { header: "Station Name", key: "name" },
    { header: "Total Volume", key: "volume" },
    { header: "Network Share", key: "share" },
  ];

  const columns = [
    {
      header: "Station",
      accessor: (item: any) => (
        <div className="flex items-center gap-3">
          <div className="h-10 w-10 rounded-xl bg-[#5C0B19] text-white flex items-center justify-center">
            <MapPin className="h-5 w-5" />
          </div>
          <div className="flex flex-col">
            <span className="font-semibold text-slate-900 text-[13px] tracking-tight uppercase">
              {item.name}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-[0.05em]">
              Active Hub
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Total Parcels",
      accessor: (item: any) => (
        <div className="flex items-center gap-1.5 px-3 py-1.5 bg-slate-50 border border-slate-100 rounded-xl w-fit">
          <span className="text-[10px] font-semibold text-slate-500 uppercase tracking-[0.05em]">
            {item.volume.toLocaleString()} Units
          </span>
        </div>
      ),
    },
    {
      header: "Network Share",
      accessor: (item: any) => {
        const percentage =
          metrics.totalVolume > 0
            ? (item.volume / metrics.totalVolume) * 100
            : 0;
        return (
          <div className="flex flex-col gap-2 w-full max-w-[150px]">
            <div className="flex items-center justify-between">
              <span className="text-[10px] font-semibold text-slate-400 uppercase">
                {percentage.toFixed(1)}% Share
              </span>
            </div>
            <div className="h-1.5 bg-slate-100 rounded-full overflow-hidden">
              <div
                className="h-full bg-blue-600 rounded-full transition-all duration-1000"
                style={{ width: `${percentage}%` }}
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
          <button className="h-9 px-4 bg-[#5C0B19] hover:bg-blue-600 text-white rounded-xl text-[10px] font-semibold uppercase tracking-[0.05em] transition-all active:scale-95  flex items-center gap-2">
            View <ArrowUpRight size={12} strokeWidth={3} />
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Corporate Intelligence"
          subtitle={`Network analysis for ${organization.name}`}
          icon={Globe}
          onSearch={setSearchQuery}
          pdfData={pdfData}
          pdfColumns={pdfColumns}
        />

        <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden">
          <DataTable
            title="Stations List"
            columns={columns}
            data={filteredStations}
            isLoading={false}
            searchKey="name"
            searchPlaceholder="Search stations..."
            hideInternalSearch
          />
        </div>
    </div>
  );
}
