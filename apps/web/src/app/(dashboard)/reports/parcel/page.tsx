"use client";

import { useQuery } from "@tanstack/react-query";
import {
  Package2,
  CheckCircle2,
  Clock,
  AlertCircle,
  ArrowUpRight,
} from "lucide-react";
import api from "@/lib/api/client";
import { DataTable } from "@/components/shared/data-table";
import { cn } from "@/lib/utils";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useState, useMemo } from "react";

const STATUS_MAP = {
  RECEIVED: {
    label: "Received",
    color: "bg-slate-100 text-slate-600 border-slate-200",
    icon: Clock,
  },
  DISPATCHED: {
    label: "Dispatched",
    color: "bg-blue-50 text-blue-600 border-blue-100",
    icon: Package2,
  },
  OFFLOADED: {
    label: "At Station",
    color: "bg-indigo-50 text-indigo-600 border-indigo-100",
    icon: Package2,
  },
  DELIVERED: {
    label: "Delivered",
    color: "bg-emerald-50 text-emerald-600 border-emerald-100",
    icon: CheckCircle2,
  },
  CANCELED: {
    label: "Cancelled",
    color: "bg-rose-50 text-rose-600 border-rose-100",
    icon: AlertCircle,
  },
  LOST: {
    label: "Lost",
    color: "bg-rose-50 text-rose-600 border-rose-100",
    icon: AlertCircle,
  },
} as const;

export default function ParcelReportPage() {
  const [searchQuery, setSearchQuery] = useState("");
  const { data: reportData, isLoading } = useQuery({
    queryKey: ["reports", "parcel"],
    queryFn: async () => {
      const res = await api.get("/reports/parcel");
      return res.data.data || res.data;
    },
  });

  // API normalises field names: trackingId, senderName, fromStation, totalPrice, paymentStatus
  const parcel = reportData?.parcel || [];

  const filteredParcel = parcel.filter(
    (p: any) =>
      (p.trackingId || p.trackingNumber || "").toLowerCase().includes(searchQuery.toLowerCase()) ||
      (p.receiverName || "").toLowerCase().includes(searchQuery.toLowerCase()) ||
      (p.senderName || "").toLowerCase().includes(searchQuery.toLowerCase()),
  );

  const pdfData = useMemo(
    () =>
      filteredParcel.map((p: any) => ({
        id: (p.trackingId || p.trackingNumber || "").slice(-8) || "N/A",
        sender: p.senderName || "Unknown",
        receiver: p.receiverName || "Unknown",
        status: (STATUS_MAP as any)[p.status]?.label || p.status,
        price: new Intl.NumberFormat("en-TZ", {
          style: "currency",
          currency: "TZS",
        }).format(p.totalPrice || p.amount || 0),
      })),
    [filteredParcel],
  );

  const pdfColumns = [
    { header: "Tracking ID", key: "id" },
    { header: "Sender", key: "sender" },
    { header: "Receiver", key: "receiver" },
    { header: "Status", key: "status" },
    { header: "Price", key: "price" },
  ];

  const columns = [
    {
      header: "Parcel",
      accessor: (item: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-10 w-10 rounded-xl flex items-center justify-center transition-all duration-300 bg-slate-900 text-white",
            )}
          >
            <Package2 className="h-5 w-5" />
          </div>
          <div className="flex flex-col">
            <span className="font-semibold text-slate-900 text-[13px] tracking-tight group-hover:text-blue-600 transition-colors uppercase">
              #{(item.trackingId || item.trackingNumber || "MZ-UNKNOWN").slice(-8)}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-[0.05em] line-clamp-1">
              TO: {item.receiverName || "Receiver"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Sender Details",
      accessor: (item: any) => (
        <div className="flex flex-col gap-1">
          <span className="text-[12px] font-bold text-slate-600">
            {item.senderName || "Unknown"}
          </span>
          <span className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em]">
            From: {item.fromStation || item.fromAddress || "Origin"}
          </span>
        </div>
      ),
    },
    {
      header: "Status",
      accessor: (item: any) => {
        const statusKey = (item.status as string) || "RECEIVED";
        const statusObj = (STATUS_MAP as any)[statusKey] || STATUS_MAP.RECEIVED;
        return (
          <div
            className={cn(
              "inline-flex items-center gap-2 px-3 py-1.5 rounded-xl border text-[10px] font-semibold uppercase tracking-[0.05em] ",
              statusObj.color,
            )}
          >
            <div
              className={cn(
                "w-1.5 h-1.5 rounded-full",
                statusKey === "DISPATCHED" || statusKey === "OFFLOADED"
                  ? "bg-blue-500 animate-pulse"
                  : "bg-current",
              )}
            />
            {statusObj.label}
          </div>
        );
      },
    },
    {
      header: "Pricing & Weight",
      accessor: (item: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1 text-emerald-600">
            <span className="text-[14px] font-semibold tracking-tight">
              {new Intl.NumberFormat("en-TZ", {
                style: "currency",
                currency: "TZS",
                maximumSignificantDigits: 3,
              }).format(item.totalPrice || item.amount || 0)}
            </span>
          </div>
          <span className="text-[9px] font-semibold text-slate-300 uppercase tracking-[0.05em]">
            {item.weight || 0} KG · {item.paymentStatus || "UNPAID"}
          </span>
        </div>
      ),
    },
    {
      header: "Actions",
      accessor: (item: any) => (
        <div className="flex items-center justify-end pr-4">
          <button className="h-9 px-4 bg-slate-900 hover:bg-blue-600 text-white rounded-xl text-[10px] font-semibold uppercase tracking-[0.05em] transition-all active:scale-95  flex items-center gap-2">
            View <ArrowUpRight size={12} strokeWidth={3} />
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Parcel Analytics"
          subtitle="Parcels, weights, and movement intelligence"
          icon={Package2}
          onSearch={setSearchQuery}
          pdfData={pdfData}
          pdfColumns={pdfColumns}
        />

        <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden">
          <DataTable
            title="Parcels List"
            columns={columns}
            data={filteredParcel}
            isLoading={isLoading}
            searchKey="trackingId"
            searchPlaceholder="Search parcels..."
            hideInternalSearch
          />
        </div>
    </div>
  );
}
