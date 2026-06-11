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
          <div className="h-10 w-10 rounded-[10px] bg-slate-900 text-white flex items-center justify-center">
            <Coins className="h-5 w-5" />
          </div>
          <div className="flex flex-col">
            <span className="font-black text-slate-900 text-[13px] tracking-tight uppercase">
              {item.name}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">
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
            <span className="text-[14px] font-black tracking-tighter">
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
        <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-[10px] bg-slate-50 border border-slate-100 text-[10px] font-black uppercase tracking-widest text-slate-500 shadow-sm">
          <div className="w-1.5 h-1.5 rounded-full bg-slate-400" />
          Verified
        </div>
      ),
    },
    {
      header: "Actions",
      accessor: (item: any) => (
        <div className="flex items-center justify-end pr-4">
          <button className="h-9 px-4 bg-slate-900 hover:bg-blue-600 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm flex items-center gap-2">
            Details <ArrowUpRight size={12} strokeWidth={3} />
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto">
        <ReportPageHeader
          title="Revenue Overview"
          subtitle="Earnings, collections, and financial intelligence"
          icon={TrendingUp}
          onSearch={setSearchQuery}
          pdfData={pdfData}
          pdfColumns={pdfColumns}
        />

        <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden">
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
    </div>
  );
}
