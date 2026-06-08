import { ParcelList } from "@/components/parcel/parcel-list";
import { RefreshTrigger } from "@/components/utils/refresh-trigger";
import {
  Terminal,
  Activity,
  Search,
  Truck,
  CheckCircle2,
  XCircle,
  AlertTriangle,
  Inbox,
  LogOut,
  ArrowUpRight,
} from "lucide-react";
import { prisma } from "@repo/database";
import { cn } from "@/lib/utils";

async function getStatusCounts() {
  const counts = await prisma.parcel.groupBy({
    by: ["status"],
    _count: true,
  });

  const stats: Record<string, number> = {};
  counts.forEach((c) => {
    stats[c.status] = c._count;
  });
  return stats;
}

export default async function OperationsPage() {
  const stats = await getStatusCounts();

  const statusCards = [
    {
      title: "Received Parcels",
      description:
        "Shipments logged at this terminal awaiting further processing.",
      count: stats.RECEIVED || 0,
      icon: Inbox,
      tag: "Incoming",
      color: "text-blue-600",
      bg: "bg-blue-50",
    },
    {
      title: "Dispatched Loads",
      description: "Shipments assigned to outbound transit vehicles today.",
      count: stats.DISPATCHED || 0,
      icon: LogOut,
      tag: "Outbound",
      color: "text-indigo-600",
      bg: "bg-indigo-50",
    },
    {
      title: "Offloaded Items",
      description: "Shipments reaching this node for sorting and distribution.",
      count: stats.OFFLOADED || 0,
      icon: Truck,
      tag: "Intermediate",
      color: "text-amber-600",
      bg: "bg-amber-50",
    },
    {
      title: "Delivered Final",
      description:
        "Shipments successfully handed over to the receiver at node.",
      count: stats.DELIVERED || 0,
      icon: CheckCircle2,
      tag: "Handover",
      color: "text-emerald-600",
      bg: "bg-emerald-50",
    },
    {
      title: "Cancelled Requests",
      description: "Terminated protocols at this terminal station.",
      count: stats.CANCELED || 0,
      icon: XCircle,
      tag: "Voided",
      color: "text-slate-500",
      bg: "bg-slate-50",
    },
    {
      title: "Lost Shipments",
      description: "Parcels flagged as unlocatable in the local manifest.",
      count: stats.LOST || 0,
      icon: AlertTriangle,
      tag: "Check",
      color: "text-rose-600",
      bg: "bg-rose-50",
    },
  ];

  const today = new Date().toLocaleDateString("en-US", {
    month: "long",
    day: "numeric",
    year: "numeric",
  });

  return (
    <div className="min-h-screen bg-[#f8f9fb]">
      <RefreshTrigger interval={30000} />
      <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-10">
        {/* Top Bar - Standardized Design */}
        <div className="flex items-center justify-between gap-6 bg-white border border-slate-100 rounded-[10px] p-4 shadow-sm">
          <div className="flex items-center gap-3 text-indigo-600">
            <div className="w-8 h-8 rounded-full bg-indigo-50 flex items-center justify-center">
              <Terminal size={16} className="animate-pulse" />
            </div>
            <span className="text-[10px] font-black uppercase tracking-[0.3em]">
              Station Operations Protocol
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
                Station Active
              </span>
            </div>
          </div>
        </div>

        {/* Header Section */}
        <div className="flex flex-col sm:flex-row sm:items-end justify-between gap-4">
          <div>
            <div className="flex items-center gap-2 mb-2">
              <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-indigo-500 bg-indigo-50 px-2.5 py-1 rounded-full">
                Terminal Terminal
              </span>
            </div>
            <h1 className="text-3xl font-black text-slate-900 tracking-tight">
              Operational Hub
            </h1>
            <p className="text-sm text-slate-400 font-bold mt-1 uppercase tracking-tight opacity-80">
              Unified execution suite for processing and tracking all terminal
              parcels.
            </p>
          </div>
        </div>

        {/* Status Cards */}
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
                <div className="flex items-center gap-1.5 text-[12px] font-bold text-slate-400 group-hover:text-indigo-600 transition-all">
                  Inspect Data <ArrowUpRight size={14} strokeWidth={3} />
                </div>

                <div className="w-8 h-8 rounded-full bg-slate-50 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-all">
                  <div className="w-1.5 h-1.5 rounded-full bg-indigo-600 animate-pulse" />
                </div>
              </div>

              <div className="absolute top-0 right-0 w-32 h-32 bg-slate-50/40 rounded-bl-[4rem]" />
              <div className="absolute bottom-0 left-0 w-full h-[3px] bg-indigo-600 scale-x-0 group-hover:scale-x-100 origin-left transition-transform duration-300" />
            </div>
          ))}
        </div>

        {/* Main Content - Table */}
        <div className="animate-in fade-in slide-in-from-bottom-4 duration-700 mt-4">
          <ParcelList />
        </div>

        {/* Footer CTA - Search/Track */}
        <div className="bg-slate-900 rounded-[10px] p-8 flex items-center justify-between text-white relative overflow-hidden mt-6 shadow-2xl shadow-slate-900/20">
          <div className="relative z-10">
            <h4 className="text-[22px] font-black mb-1 tracking-tight">
              Terminal Tracking Node
            </h4>
            <p className="text-slate-400 text-[14px] font-bold opacity-80">
              Search for any shipment across the terminal network for status
              updates.
            </p>
          </div>
          <button className="relative z-10 bg-indigo-600 hover:bg-indigo-500 text-white h-14 px-10 rounded-[10px] font-black text-[13px] uppercase tracking-widest shadow-xl shadow-indigo-600/20 transition-all active:scale-95 flex items-center gap-3">
            Search/Track Parcel <Search size={18} strokeWidth={3} />
          </button>

          {/* Pursuit Graphics */}
          <div className="absolute right-0 top-0 bottom-0 w-1/3 bg-indigo-600/10 skew-x-[-20deg] translate-x-20" />
          <div className="absolute left-10 top-[-20%] opacity-5 pointer-events-none">
            <Terminal size={200} strokeWidth={1} />
          </div>
        </div>
      </div>
    </div>
  );
}
