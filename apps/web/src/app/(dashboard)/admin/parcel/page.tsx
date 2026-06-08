"use client";

import {
  useParcelList,
  useUpdateParcelStatus,
} from "@/modules/parcel/use-parcel";
import { DataTable } from "@/components/shared/data-table";
import { StatusBadge } from "@/components/shared/status-badge";
import {
  Package,
  Activity,
  ArrowUpRight,
  Search,
  ShieldCheck,
  TrendingUp,
  Truck,
  CheckCircle2,
  XCircle,
  AlertTriangle,
  Inbox,
  LogOut,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { useState, useMemo } from "react";
import { toast } from "sonner";
import Link from "next/link";

export default function AdminParcelPage() {
  const [tab, setTab] = useState<"overview" | "table">("overview");
  const [filter, setFilter] = useState("ALL");
  const { data: parcels, isLoading } = useParcelList();
  const { mutate: updateStatus, isPending: isUpdating } =
    useUpdateParcelStatus();

  const handleAction = (id: string, status: string) => {
    updateStatus(
      { id, status },
      {
        onSuccess: () =>
          toast.success(`Parcel ${status.toLowerCase()} successfully`),
      },
    );
  };

  const stats = useMemo(() => {
    const s: Record<string, number> = {};
    parcels?.forEach((p: any) => {
      s[p.status] = (s[p.status] || 0) + 1;
    });
    return s;
  }, [parcels]);

  const statusCards = [
    {
      title: "Received Parcels",
      description:
        "Global registry of shipments logged across all terminal nodes.",
      count: stats.RECEIVED || 0,
      icon: Inbox,
      tag: "Registry",
      color: "text-blue-600",
      bg: "bg-blue-50",
    },
    {
      title: "Dispatched Loads",
      description: "Active shipments currently in outbound transit vehicles.",
      count: stats.DISPATCHED || 0,
      icon: LogOut,
      tag: "In-Transit",
      color: "text-indigo-600",
      bg: "bg-indigo-50",
    },
    {
      title: "Offloaded Items",
      description:
        "Shipments reaching intermediate processing and sorting hubs.",
      count: stats.OFFLOADED || 0,
      icon: Truck,
      tag: "Sorting",
      color: "text-amber-600",
      bg: "bg-amber-50",
    },
    {
      title: "Delivered Final",
      description: "Shipments that have successfully reached target customers.",
      count: stats.DELIVERED || 0,
      icon: CheckCircle2,
      tag: "Settled",
      color: "text-emerald-600",
      bg: "bg-emerald-50",
    },
    {
      title: "Cancelled Requests",
      description: "Terminated shipment protocols across the network.",
      count: stats.CANCELED || 0,
      icon: XCircle,
      tag: "Void",
      color: "text-slate-500",
      bg: "bg-slate-50",
    },
    {
      title: "Lost Shipments",
      description: "High-priority anomalies requiring administrative review.",
      count: stats.LOST || 0,
      icon: AlertTriangle,
      tag: "Critical",
      color: "text-rose-600",
      bg: "bg-rose-50",
    },
  ];

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
              {item.senderName}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest line-clamp-1">
              TO: {item.receiverName}
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
              ID:{item.id.slice(0, 8)}
            </span>
          </div>
          <div className="flex items-center gap-1.5 text-[9px] font-black text-slate-300 uppercase tracking-widest pl-1">
            <span>{item.fromAddress?.split(",")[0]}</span>
            <span className="text-blue-500">→</span>
            <span>{item.toAddress?.split(",")[0]}</span>
          </div>
        </div>
      ),
    },
    {
      header: "Service Capability",
      accessor: (item: any) => (
        <div className="flex flex-col gap-1.5">
          <StatusBadge status={item.status} />
          <div className="flex items-center gap-1.5 pl-1.5">
            <div className="w-1 h-1 rounded-full bg-emerald-500 animate-pulse" />
            <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest">
              Protocol Active
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Fee Protocol",
      accessor: (item: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1 text-blue-600">
            <span className="text-[14px] font-black tracking-tighter">
              {item.amount ? `TSh ${item.amount.toLocaleString()}` : "Pending"}
            </span>
          </div>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest">
            Service Fee
          </span>
        </div>
      ),
    },
    {
      header: "Action Suite",
      accessor: (item: any) => (
        <div className="flex items-center justify-end gap-2 pr-4">
          <Link
            href={`/parcel/${item.id}`}
            className="h-9 px-4 bg-slate-900 hover:bg-blue-600 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm flex items-center gap-2"
          >
            Details
          </Link>
          {item.status === "PENDING" && (
            <>
              <button
                onClick={() => handleAction(item.id, "APPROVED")}
                className="h-9 px-4 bg-emerald-50 hover:bg-emerald-600 text-emerald-600 hover:text-white border border-emerald-100 rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm flex items-center gap-2"
              >
                Approve
              </button>
              <button
                onClick={() => handleAction(item.id, "REJECTED")}
                className="h-9 px-4 bg-rose-50 hover:bg-rose-600 text-rose-600 hover:text-white border border-rose-100 rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm flex items-center gap-2"
              >
                Reject
              </button>
            </>
          )}
        </div>
      ),
    },
  ];

  const filteredParcels = useMemo(() => {
    if (filter === "ALL") return parcels;
    return parcels?.filter((p: any) => p.status === filter);
  }, [parcels, filter]);

  const today = new Date().toLocaleDateString("en-US", {
    month: "long",
    day: "numeric",
    year: "numeric",
  });

  return (
    <div className="min-h-screen bg-[#f8f9fb]">
      <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-10">
        {/* Top Bar - Standardized Design */}
        <div className="flex items-center justify-between gap-6 bg-white border border-slate-100 rounded-[10px] p-4 shadow-sm">
          <div className="flex items-center gap-3 text-indigo-600">
            <div className="w-8 h-8 rounded-full bg-indigo-50 flex items-center justify-center">
              <ShieldCheck size={16} className="animate-pulse" />
            </div>
            <span className="text-[10px] font-black uppercase tracking-[0.3em]">
              Admin Manifest Protocol
            </span>
          </div>

          <div className="flex items-center gap-4 bg-slate-50 border border-slate-100 rounded-[10px] p-2 px-6">
            <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest leading-none">
              {today}
            </span>
            <div className="h-6 w-px bg-slate-200" />
            <div className="flex items-center gap-2">
              <Activity size={12} className="text-emerald-500" />
              <span className="text-[12px] font-black text-emerald-600 uppercase tracking-tighter">
                Active Node
              </span>
            </div>
          </div>
        </div>

        {/* Header Section */}
        <div className="flex flex-col gap-8">
          <div className="flex flex-col sm:flex-row sm:items-end justify-between gap-6">
            <div>
              <div className="flex items-center gap-2 mb-2">
                <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-indigo-500 bg-indigo-50 px-2.5 py-1 rounded-full">
                  Administrative Overview
                </span>
              </div>
              <h1 className="text-3xl font-black text-slate-900 tracking-tight">
                Logistics Registry
              </h1>
              <p className="text-sm text-slate-400 font-bold mt-1 uppercase tracking-tight opacity-80">
                High-level monitoring and approval suite for the global
                logistics network.
              </p>
            </div>

            <div className="flex bg-white border border-slate-100 rounded-[10px] p-1 shadow-sm shrink-0">
              <button
                onClick={() => setTab("overview")}
                className={cn(
                  "px-6 py-2.5 rounded-[10px] text-[11px] font-black uppercase tracking-widest transition-all flex items-center gap-2",
                  tab === "overview"
                    ? "bg-slate-900 text-white shadow-lg"
                    : "text-slate-400 hover:text-slate-600",
                )}
              >
                <TrendingUp size={14} />
                Overview
              </button>
              <button
                onClick={() => setTab("table")}
                className={cn(
                  "px-6 py-2.5 rounded-[10px] text-[11px] font-black uppercase tracking-widest transition-all flex items-center gap-2",
                  tab === "table"
                    ? "bg-slate-900 text-white shadow-lg"
                    : "text-slate-400 hover:text-slate-600",
                )}
              >
                <Package size={14} />
                All Manifest
              </button>
            </div>
          </div>
        </div>

        {/* Content Area */}
        {tab === "overview" ? (
          <div className="space-y-10 animate-in fade-in slide-in-from-bottom-4 duration-700">
            {/* Status Grid */}
            <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
              {statusCards.map((card) => (
                <div
                  key={card.title}
                  className="group relative bg-white rounded-[10px] border border-slate-100 p-10 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 overflow-hidden h-full flex flex-col gap-8"
                >
                  {/* Icon + Tag */}
                  <div className="flex items-start justify-between">
                    <div
                      className={cn(
                        "w-14 h-14 rounded-[10px] flex items-center justify-center transition-all",
                        "bg-slate-50 text-slate-400 border border-slate-100 group-hover:bg-slate-900 group-hover:text-white",
                      )}
                    >
                      <card.icon size={24} strokeWidth={2.5} />
                    </div>
                    <div className="flex flex-col items-end gap-1">
                      <span className="text-[10px] font-black uppercase tracking-[0.18em] px-3 py-1.5 rounded-[10px] bg-slate-50 text-slate-400 group-hover:bg-indigo-50 group-hover:text-indigo-600 transition-colors">
                        {card.tag}
                      </span>
                      <span
                        className={cn(
                          "text-[24px] font-black tracking-tighter",
                          card.color,
                        )}
                      >
                        {card.count}
                      </span>
                    </div>
                  </div>

                  {/* Content */}
                  <div className="flex-1">
                    <h3 className="text-[20px] font-black text-slate-900 group-hover:text-indigo-600 transition-colors mb-3 uppercase tracking-tight">
                      {card.title}
                    </h3>
                    <p className="text-[14px] text-slate-500 font-medium leading-relaxed">
                      {card.description}
                    </p>
                  </div>

                  {/* CTA */}
                  <div className="flex items-center justify-between mt-auto pt-6 border-t border-slate-50">
                    <button
                      onClick={() => {
                        setTab("table");
                        setFilter(card.title.includes("Lost") ? "LOST" : "ALL");
                      }}
                      className="flex items-center gap-1.5 text-[12px] font-bold text-slate-400 group-hover:text-indigo-600 transition-all"
                    >
                      Inspect Data <ArrowUpRight size={14} strokeWidth={3} />
                    </button>

                    <div className="w-8 h-8 rounded-full bg-slate-50 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-all">
                      <div className="w-1.5 h-1.5 rounded-full bg-indigo-600 animate-pulse" />
                    </div>
                  </div>

                  <div className="absolute top-0 right-0 w-32 h-32 bg-slate-50/40 rounded-bl-[4rem]" />
                  <div className="absolute bottom-0 left-0 w-full h-[3px] bg-indigo-600 scale-x-0 group-hover:scale-x-100 origin-left transition-transform duration-300" />
                </div>
              ))}
            </div>

            {/* Footer CTA */}
            <div className="bg-slate-900 rounded-[10px] p-8 flex items-center justify-between text-white relative overflow-hidden mt-6 shadow-2xl shadow-slate-900/20">
              <div className="relative z-10">
                <h4 className="text-[22px] font-black mb-1 tracking-tight">
                  Tracking Protocol Terminal
                </h4>
                <p className="text-slate-400 text-[14px] font-bold opacity-80">
                  Global locator service for all active shipments within the
                  organization.
                </p>
              </div>
              <button className="relative z-10 bg-indigo-600 hover:bg-indigo-500 text-white h-14 px-10 rounded-[10px] font-black text-[13px] uppercase tracking-widest shadow-xl shadow-indigo-600/20 transition-all active:scale-95 flex items-center gap-3">
                Search/Track Parcel <Search size={18} strokeWidth={3} />
              </button>

              <div className="absolute right-0 top-0 bottom-0 w-1/3 bg-white/5 skew-x-[-20deg] translate-x-20" />
              <div className="absolute left-10 top-[-20%] opacity-5 pointer-events-none">
                <ShieldCheck size={200} strokeWidth={1} />
              </div>
            </div>
          </div>
        ) : (
          <div className="space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-700">
            <div className="flex bg-white border border-slate-100 rounded-[10px] p-1 shadow-sm w-fit">
              {["ALL", "PENDING", "PAID", "DELIVERED"].map((f) => (
                <button
                  key={f}
                  onClick={() => setFilter(f)}
                  className={cn(
                    "px-4 py-2 rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all",
                    filter === f
                      ? "bg-slate-900 text-white shadow-lg"
                      : "text-slate-400 hover:text-slate-600",
                  )}
                >
                  {f}
                </button>
              ))}
            </div>
            <DataTable
              title="Organization Manifest"
              data={filteredParcels || []}
              columns={columns}
              isLoading={isLoading}
            />
          </div>
        )}
      </div>
    </div>
  );
}
