"use client";

import { useQuery } from "@tanstack/react-query";
import { Package2, TrendingUp, ArrowUpRight, Truck } from "lucide-react";
import api from "@/lib/api/client";
import { DataTable } from "@/components/shared/data-table";
import { cn } from "@/lib/utils";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useState, useMemo } from "react";

export default function ParcelVolumeReportPage() {
  const [searchQuery, setSearchQuery] = useState("");
  const { data: reportData, isLoading } = useQuery({
    queryKey: ["reports", "volume"],
    queryFn: async () => {
      const res = await api.get("/reports/volume");
      return res.data.data || res.data;
    },
  });

  const volumeData = reportData?.volumeByStation || [];
  const totalVolume = volumeData.reduce(
    (acc: number, v: any) => acc + (v.volume || 0),
    0,
  );

  const filteredData = volumeData.filter((v: any) =>
    v.name.toLowerCase().includes(searchQuery.toLowerCase()),
  );

  const pdfData = useMemo(
    () =>
      filteredData.map((v: any) => ({
        name: v.name,
        volume: v.volume.toLocaleString(),
        share: `${totalVolume > 0 ? ((v.volume / totalVolume) * 100).toFixed(1) : 0}%`,
      })),
    [filteredData, totalVolume],
  );

  const pdfColumns = [
    { header: "Station Name", key: "name" },
    { header: "Parcel Volume", key: "volume" },
    { header: "Market Share", key: "share" },
  ];

  const columns = [
    {
      header: "Station",
      accessor: (item: any) => (
        <div className="flex items-center gap-3">
          <div className="h-8 w-8 rounded-xl bg-slate-100 text-slate-600 flex items-center justify-center">
            <Truck className="h-4 w-4" />
          </div>
          <div className="flex flex-col">
            <span className="font-semibold text-slate-900 text-[13px]">
              {item.name}
            </span>
            <span className="text-[11px] font-medium text-slate-500">
              Active Hub
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Total Parcels",
      accessor: (item: any) => (
        <div className="flex items-center gap-1.5 px-1.5 py-0.5 bg-slate-50 border border-slate-200 rounded-lg w-fit">
          <span className="text-[11px] font-semibold text-slate-600">
            {item.volume.toLocaleString()} units
          </span>
        </div>
      ),
    },
    {
      header: "Market Share",
      accessor: (item: any) => {
        const percentage =
          totalVolume > 0 ? (item.volume / totalVolume) * 100 : 0;
        return (
          <div className="flex flex-col gap-2 w-full max-w-[120px]">
            <div className="flex items-center justify-between">
              <span className="text-[11px] font-semibold text-slate-900">
                {percentage.toFixed(1)}%
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
          <button className="bg-blue-600 hover:bg-blue-700 text-white rounded-xl h-8 px-3 text-[12px] font-semibold transition-colors flex items-center gap-1.5">
            View <ArrowUpRight size={12} />
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Parcel Volume"
          subtitle="Analysis of parcel quantities and station distribution"
          icon={Package2}
          onSearch={setSearchQuery}
          pdfData={pdfData}
          pdfColumns={pdfColumns}
        />

        <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden">
          <DataTable
            title="Volumes List"
            columns={columns}
            data={filteredData}
            isLoading={isLoading}
            searchKey="name"
            searchPlaceholder="Search stations..."
            hideInternalSearch
          />
        </div>
    </div>
  );
}
