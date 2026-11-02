"use client";

import { useQuery } from "@tanstack/react-query";
import {
  TrendingUp,
  Coins,
  Wallet,
  CreditCard,
  Activity,
  ArrowUpRight,
} from "lucide-react";
import api from "@/lib/api/client";
import { DataTable } from "@/components/shared/data-table";
import { cn } from "@/lib/utils";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useState, useMemo } from "react";

export default function RevenueReportPage() {
  const [searchQuery, setSearchQuery] = useState("");
  const { data: reportData, isLoading } = useQuery({
    queryKey: ["reports", "revenue"],
    queryFn: async () => {
      const res = await api.get("/reports/revenue");
      return res.data.data || res.data;
    },
  });

  const ledgerData = reportData?.chartData || [];

  const filteredData = ledgerData.filter((v: any) =>
    v.name.toLowerCase().includes(searchQuery.toLowerCase()),
  );

  const pdfData = useMemo(
    () =>
      filteredData.map((v: any) => ({
        period: v.name,
        revenue: new Intl.NumberFormat("en-TZ", {
          style: "currency",
          currency: "TZS",
        }).format(v.total || 0),
        status: "Verified",
      })),
    [filteredData],
  );

  const pdfColumns = [
    { header: "Reporting Period", key: "period" },
    { header: "Revenue Collected", key: "revenue" },
    { header: "Verification Status", key: "status" },
  ];

  const columns = [
    {
      header: "Reporting Period",
      accessor: (item: any) => (
        <div className="flex items-center gap-3">
          <div className="h-8 w-8 rounded-xl bg-slate-100 text-slate-600 flex items-center justify-center">
            <Coins className="h-4 w-4" />
          </div>
          <div className="flex flex-col">
            <span className="font-semibold text-slate-900 text-[13px]">
              {item.name}
            </span>
            <span className="text-[11px] font-medium text-slate-500">
              Fiscal Cycle
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Revenue",
      accessor: (item: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1 text-emerald-600">
            <TrendingUp className="w-4 h-4" strokeWidth={3} />
            <span className="text-[14px] font-semibold">
              {new Intl.NumberFormat("en-TZ", {
                style: "currency",
                currency: "TZS",
                maximumSignificantDigits: 3,
              }).format(item.total || 0)}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Audit Status",
      accessor: (item: any) => (
        <div className="inline-flex items-center gap-1.5 px-1.5 py-0.5 rounded-lg bg-slate-50 border border-slate-200 text-[10px] font-semibold text-slate-600">
          <div className="w-1.5 h-1.5 rounded-full bg-slate-400" />
          Verified
        </div>
      ),
    },
    {
      header: "Actions",
      accessor: (item: any) => (
        <div className="flex items-center justify-end pr-4">
          <button className="bg-blue-600 hover:bg-blue-700 text-white rounded-xl h-8 px-3 text-[12px] font-semibold transition-colors flex items-center gap-1.5">
            Details <ArrowUpRight size={12} />
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Revenue Overview"
          subtitle="Earnings, collections, and financial intelligence"
          icon={TrendingUp}
          onSearch={setSearchQuery}
          pdfData={pdfData}
          pdfColumns={pdfColumns}
        />

        <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden">
          <DataTable
            title="Revenue List"
            columns={columns}
            data={filteredData}
            isLoading={isLoading}
            searchKey="name"
            searchPlaceholder="Search periods..."
            hideInternalSearch
          />
        </div>
    </div>
  );
}
