"use client";

import {
  MapPin,
  Building2,
  Hash,
  Star,
  Calendar,
  Activity,
  Clock,
  PackageCheck,
  PackageMinus,
  Boxes,
  Users,
  Loader2,
  Inbox,
} from "lucide-react";
import { Sheet, SheetContent, SheetDescription, SheetTitle } from "@repo/ui/sheet";
import { useStation } from "@/modules/stations/use-stations";
import { cn } from "@/lib/utils";

interface ViewStationModalProps {
  station: any;
  open: boolean;
  onOpenChange: (open: boolean) => void;
}

export function ViewStationModal({
  station,
  open,
  onOpenChange,
}: ViewStationModalProps) {
  const { data: detail, isLoading } = useStation(open ? station?.id : undefined);

  const formatDate = (dateString: string) => {
    if (!dateString) return "N/A";
    return new Date(dateString).toLocaleDateString("en-GB", {
      day: "2-digit",
      month: "long",
      year: "numeric",
      hour: "2-digit",
      minute: "2-digit",
    });
  };

  const s = detail || station;
  if (!s) return null;

  const metrics = detail?.metrics;

  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100  flex flex-col rounded-xl">
        {/* Header Section */}
        <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="w-12 h-12 rounded-xl bg-white/10 border border-slate-200 flex items-center justify-center shrink-0 relative z-10  ">
            <MapPin className="w-6 h-6 text-white" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10 text-left min-w-0">
            <div className="flex items-center gap-3 mb-1">
              <SheetTitle className="text-[20px] font-semibold text-white tracking-tight leading-none uppercase truncate">
                {s.name}
              </SheetTitle>
              <div
                className={cn(
                  "px-2 py-0.5 rounded text-[9px] font-semibold uppercase tracking-[0.05em] shrink-0",
                  s.isActive
                    ? "bg-emerald-500 text-white"
                    : "bg-rose-500 text-white",
                )}
              >
                {s.isActive ? "Active" : "Inactive"}
              </div>
            </div>
            <SheetDescription className="text-slate-500 text-[11px] font-bold uppercase tracking-[0.05em] mt-0.5">
              Station Protocol · {s.code || s.id?.slice(0, 8).toUpperCase()}
            </SheetDescription>
          </div>
        </div>

        {isLoading ? (
          <div className="flex-1 flex items-center justify-center py-24">
            <Loader2 className="w-6 h-6 animate-spin text-slate-300" />
          </div>
        ) : (
          <div className="p-10 flex flex-col gap-10 bg-slate-50/30 flex-1 overflow-y-auto custom-scrollbar">
            {/* Identity row */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <h3 className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-3 flex items-center gap-2">
                  <Building2 className="w-3 h-3 text-blue-600" strokeWidth={4} />
                  Organization
                </h3>
                <div className="p-4 bg-white rounded-[20px] border border-[#E2E2E2] ">
                  <span className="text-[13px] font-semibold text-slate-700 uppercase tracking-[0.05em]">
                    {s.organization?.name || "Root · Platform"}
                  </span>
                </div>
              </div>
              <div>
                <h3 className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-3 flex items-center gap-2">
                  <MapPin className="w-3 h-3 text-blue-600" strokeWidth={4} />
                  Location
                </h3>
                <div className="p-4 bg-white rounded-[20px] border border-[#E2E2E2] ">
                  <span className="text-[13px] font-semibold text-slate-700">
                    {s.location || "Not specified"}
                  </span>
                </div>
              </div>
            </div>

            {/* Metrics grid */}
            <div>
              <h3 className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-3 flex items-center gap-2">
                <Activity className="w-3 h-3 text-blue-600" strokeWidth={4} />
                Operational Metrics
              </h3>
              <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                <StatTile
                  icon={PackageMinus}
                  label="Dispatched"
                  value={metrics?.dispatched ?? 0}
                  color="text-blue-600"
                  bg="bg-blue-50"
                />
                <StatTile
                  icon={PackageCheck}
                  label="Received"
                  value={metrics?.received ?? 0}
                  color="text-emerald-600"
                  bg="bg-emerald-50"
                />
                <StatTile
                  icon={Boxes}
                  label="Handled"
                  value={metrics?.totalHandled ?? 0}
                  color="text-indigo-600"
                  bg="bg-indigo-50"
                />
                <StatTile
                  icon={Star}
                  label="Rating"
                  value={typeof s.rating === "number" ? s.rating.toFixed(1) : "5.0"}
                  color="text-amber-600"
                  bg="bg-amber-50"
                />
              </div>
            </div>

            {/* Staff */}
            <div>
              <h3 className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-3 flex items-center gap-2">
                <Users className="w-3 h-3 text-blue-600" strokeWidth={4} />
                Staff
                {metrics && (
                  <span className="text-slate-300 normal-case tracking-normal font-bold">
                    · {metrics.activeStaff}/{metrics.totalStaff} active
                  </span>
                )}
              </h3>
              <div className="bg-white rounded-[20px] border border-[#E2E2E2]  max-h-40 overflow-y-auto custom-scrollbar divide-y divide-slate-50">
                {detail?.staff?.length ? (
                  detail.staff.map((u: any) => (
                    <div
                      key={u.id}
                      className="px-4 py-3 flex items-center justify-between"
                    >
                      <span className="text-[12px] font-semibold text-slate-700">
                        {u.name}
                      </span>
                      <span className="text-[9px] font-semibold text-slate-400 uppercase tracking-[0.05em] bg-slate-50 border border-slate-100 px-2 py-0.5 rounded-md">
                        {u.role?.name || "—"}
                      </span>
                    </div>
                  ))
                ) : (
                  <div className="px-4 py-6 flex flex-col items-center gap-2 text-slate-300">
                    <Inbox className="w-5 h-5" />
                    <span className="text-[10px] font-bold uppercase tracking-[0.05em]">
                      No staff assigned
                    </span>
                  </div>
                )}
              </div>
            </div>

            {/* Recent parcels */}
            <div>
              <h3 className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-3 flex items-center gap-2">
                <Hash className="w-3 h-3 text-blue-600" strokeWidth={4} />
                Recent Parcels
              </h3>
              <div className="bg-white rounded-[20px] border border-[#E2E2E2]  max-h-52 overflow-y-auto custom-scrollbar divide-y divide-slate-50">
                {detail?.parcels?.length ? (
                  detail.parcels.slice(0, 10).map((p: any) => (
                    <div
                      key={p.id}
                      className="px-4 py-3 flex items-center justify-between gap-3"
                    >
                      <div className="min-w-0">
                        <p className="text-[11px] font-semibold text-slate-700 font-mono truncate">
                          {p.trackingNumber}
                        </p>
                        <p className="text-[9px] font-bold text-slate-400 uppercase tracking-[0.05em] truncate">
                          {p.origin?.name || "—"} → {p.destination?.name || "—"}
                        </p>
                      </div>
                      <span className="shrink-0 text-[9px] font-semibold text-slate-500 uppercase tracking-[0.05em] bg-slate-50 border border-slate-100 px-2 py-0.5 rounded-md">
                        {p.status}
                      </span>
                    </div>
                  ))
                ) : (
                  <div className="px-4 py-6 flex flex-col items-center gap-2 text-slate-300">
                    <Inbox className="w-5 h-5" />
                    <span className="text-[10px] font-bold uppercase tracking-[0.05em]">
                      No parcels handled yet
                    </span>
                  </div>
                )}
              </div>
            </div>

            {/* Dates */}
            <div>
              <h3 className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-3 flex items-center gap-2">
                <Clock className="w-3 h-3 text-blue-600" strokeWidth={4} />
                Dates
              </h3>
              <div className="space-y-3">
                <div className="p-4 bg-white rounded-[20px] border border-[#E2E2E2]  flex items-center justify-between">
                  <div className="flex items-center gap-3">
                    <div className="w-8 h-8 rounded-full bg-blue-50 flex items-center justify-center text-blue-500">
                      <Calendar size={14} />
                    </div>
                    <span className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em]">
                      Created
                    </span>
                  </div>
                  <span className="text-[11px] font-semibold text-slate-900 uppercase tracking-[0.05em]">
                    {formatDate(s.createdAt)}
                  </span>
                </div>
                <div className="p-4 bg-white rounded-[20px] border border-[#E2E2E2]  flex items-center justify-between">
                  <div className="flex items-center gap-3">
                    <div className="w-8 h-8 rounded-full bg-slate-50 flex items-center justify-center text-slate-400">
                      <Activity size={14} />
                    </div>
                    <span className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em]">
                      Updated
                    </span>
                  </div>
                  <span className="text-[11px] font-semibold text-slate-900 uppercase tracking-[0.05em]">
                    {formatDate(s.updatedAt)}
                  </span>
                </div>
              </div>
            </div>
          </div>
        )}
      </SheetContent>
    </Sheet>
  );
}

function StatTile({
  icon: Icon,
  label,
  value,
  color,
  bg,
}: {
  icon: React.ElementType;
  label: string;
  value: number | string;
  color: string;
  bg: string;
}) {
  return (
    <div className="bg-white rounded-[20px] border border-[#E2E2E2]  p-4 flex flex-col gap-2">
      <div
        className={cn(
          "w-7 h-7 rounded-xl flex items-center justify-center",
          bg,
          color,
        )}
      >
        <Icon size={14} strokeWidth={2.5} />
      </div>
      <div>
        <p className={cn("text-[18px] font-semibold tracking-tight tabular-nums", color)}>
          {value}
        </p>
        <p className="text-[9px] font-semibold text-slate-400 uppercase tracking-[0.05em]">
          {label}
        </p>
      </div>
    </div>
  );
}
