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

  const parcel = reportData?.parcel || [];

  const filteredParcel = parcel.filter(
    (p: any) =>
      p.trackingId.toLowerCase().includes(searchQuery.toLowerCase()) ||
      (p.receiverName || "")
        .toLowerCase()
        .includes(searchQuery.toLowerCase()) ||
      (p.senderName || "").toLowerCase().includes(searchQuery.toLowerCase()),
  );

  const pdfData = useMemo(
    () =>
      filteredParcel.map((p: any) => ({
        id: p.trackingId?.slice(-8) || "N/A",
        sender: p.senderName || "Unknown",
        receiver: p.receiverName || "Unknown",
        status: (STATUS_MAP as any)[p.status]?.label || p.status,
        price: new Intl.NumberFormat("en-TZ", {
          style: "currency",
          currency: "TZS",
        }).format(p.totalPrice || 0),
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
              "h-10 w-10 rounded-[10px] flex items-center justify-center transition-all duration-300 bg-slate-900 text-white",
            )}
          >
            <Package2 className="h-5 w-5" />
          </div>
          <div className="flex flex-col">
            <span className="font-black text-slate-900 text-[13px] tracking-tight group-hover:text-blue-600 transition-colors uppercase">
              #{item.trackingId?.slice(-8) || "MZ-UNKNOWN"}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest line-clamp-1">
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
          <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
            From: {item.fromStation || "Origin"}
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
              "inline-flex items-center gap-2 px-3 py-1.5 rounded-[10px] border text-[10px] font-black uppercase tracking-widest shadow-sm",
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
            <span className="text-[14px] font-black tracking-tighter">
              {new Intl.NumberFormat("en-TZ", {
                style: "currency",
                currency: "TZS",
                maximumSignificantDigits: 3,
              }).format(item.totalPrice || 0)}
            </span>
          </div>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest">
            {item.weight || 0} KG · {item.paymentStatus || "UNPAID"}
          </span>
        </div>
      ),
    },
    {
      header: "Actions",
      accessor: (item: any) => (
        <div className="flex items-center justify-end pr-4">
          <button className="h-9 px-4 bg-slate-900 hover:bg-blue-600 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm flex items-center gap-2">
            View <ArrowUpRight size={12} strokeWidth={3} />
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto">
        <ReportPageHeader
          title="Parcel Analytics"
          subtitle="Shipments, weights, and movement intelligence"
          icon={Package2}
          onSearch={setSearchQuery}
          pdfData={pdfData}
          pdfColumns={pdfColumns}
        />

        <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden">
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
    </div>
  );
}
