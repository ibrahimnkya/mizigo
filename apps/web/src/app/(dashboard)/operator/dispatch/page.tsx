"use client";

import {
  useParcelList,
  useUpdateParcelStatus,
} from "@/modules/parcel/use-parcel";
import { DataTable } from "@/components/shared/data-table";
import { StatusBadge } from "@/components/shared/status-badge";
import { format } from "date-fns";
import {
  Truck,
  Navigation,
  CheckCircle,
  Package,
  ArrowRight,
  Loader2,
} from "lucide-react";
import { useState } from "react";
import { toast } from "sonner";
import { cn } from "@/lib/utils";

export default function DispatchPage() {
  const { data: parcel, isLoading } = useParcelList({ status: "APPROVED" });
  const { mutate: updateStatus, isPending: isUpdating } =
    useUpdateParcelStatus();

  const handleDispatch = (id: string) => {
    updateStatus(
      { id, status: "IN_TRANSIT" },
      {
        onSuccess: () => toast.success("Parcel dispatched successfully"),
      },
    );
  };

  const columns = [
    {
      header: "Entity Node",
      accessor: (item: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-10 w-10 rounded-[10px] flex items-center justify-center shadow-lg transition-all duration-300 bg-slate-900 shadow-slate-100",
            )}
          >
            <Package className="h-5 w-5 text-white" />
          </div>
          <div className="flex flex-col">
            <span className="font-black text-slate-900 text-[13px] tracking-tight group-hover:text-blue-600 transition-colors uppercase">
              #{item.id.slice(-8).toUpperCase()}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest line-clamp-1">
              {item.parcelType || "Standard Parcel"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "System Protocol",
      accessor: (item: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1.5 px-2.5 py-1 bg-slate-50 border border-slate-100 rounded-[10px] w-fit">
            <span className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
              {item.toAddress}
            </span>
          </div>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest pl-1">
            REC: {item.receiverName?.split(" ")[0]}
          </span>
        </div>
      ),
    },
    {
      header: "Service Capability",
      accessor: (item: any) => (
        <div
          className={cn(
            "inline-flex items-center gap-2 px-3 py-1.5 rounded-[10px] border text-[10px] font-black uppercase tracking-widest shadow-sm",
            item.urgency === "Express"
              ? "bg-amber-50 text-amber-600 border-amber-100"
              : "bg-blue-50 text-blue-600 border-blue-100",
          )}
        >
          <div
            className={cn(
              "w-1.5 h-1.5 rounded-full",
              item.urgency === "Express"
                ? "bg-amber-500 animate-pulse"
                : "bg-blue-500",
            )}
          />
          {item.urgency} Priority
        </div>
      ),
    },
    {
      header: "Fee Protocol",
      accessor: (item: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1 text-slate-700">
            <span className="text-[14px] font-black tracking-tighter">
              {item.weight} KG
            </span>
          </div>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest pl-0.5">
            Physical Mass
          </span>
        </div>
      ),
    },
    {
      header: "Action Suite",
      accessor: (item: any) => (
        <div className="flex items-center justify-end pr-4">
          <button
            onClick={() => handleDispatch(item.id)}
            disabled={isUpdating}
            className="h-9 px-4 bg-slate-900 hover:bg-emerald-600 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm flex items-center gap-2"
          >
            {isUpdating ? (
              <Loader2 size={12} className="animate-spin" />
            ) : (
              <ArrowRight size={12} strokeWidth={3} />
            )}
            Dispatch
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-12 py-8 px-2 animate-in fade-in duration-700">
      {/* Header section standardized */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 bg-white p-6 rounded-[10px] border border-slate-100 shadow-sm mx-2">
        <div>
          <div className="flex items-center gap-2 mb-2">
            <div className="w-2 h-2 rounded-full bg-blue-500 animate-pulse" />
            <span className="text-[10px] font-black text-slate-400 uppercase tracking-[0.3em]">
              Load Protocol Active
            </span>
          </div>
          <h1 className="text-3xl font-black text-slate-900 tracking-tight flex items-center gap-3">
            <Navigation size={28} className="text-blue-500" />
            Dispatch Terminal
          </h1>
          <p className="text-slate-500 font-medium mt-1">
            Select verified nodes to initiate physical transit.
          </p>
        </div>

        <div className="flex items-center gap-6">
          <div className="hidden lg:flex flex-col items-end pr-6 border-r border-slate-100">
            <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
              Awaiting Transport
            </span>
            <span className="text-xl font-black text-slate-900 tabular-nums">
              {parcel?.length || 0} Units
            </span>
          </div>
          <button className="h-12 px-6 bg-slate-900 text-white rounded-[10px] text-sm font-black flex items-center gap-2 shadow-xl shadow-slate-900/10 border border-white/10 active:scale-95 transition-all">
            <Truck size={18} />
            Bulk Dispatch
          </button>
        </div>
      </div>

      {/* Main Data Grid */}
      <div className="bg-white rounded-[10px] border border-slate-200 shadow-[0_20px_50px_-20px_rgba(0,0,0,0.06)] overflow-hidden p-1">
        <DataTable
          title="Manifest Directory"
          columns={columns}
          data={parcel || []}
          isLoading={isLoading}
        />
      </div>
    </div>
  );
}
