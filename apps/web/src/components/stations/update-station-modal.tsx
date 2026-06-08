"use client";

import { useState, useEffect } from "react";
import { useQuery } from "@tanstack/react-query";
import {
  Edit3,
  Loader2,
  CheckCircle2,
  Building2,
  Shield,
  MapPin,
  Activity,
  PackageCheck,
  Send,
  Truck,
  Users,
  Zap,
  UserX,
} from "lucide-react";
import { Button } from "@repo/ui/button";
import {
  Sheet,
  SheetContent,
  SheetTitle,
  SheetDescription,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import { useUpdateStation } from "@/modules/stations/use-stations";
import { cn } from "@/lib/utils";
import api from "@/lib/api/client";
import { format } from "date-fns";

function ParcelStatusBadge({ status }: { status: string }) {
  const colors: Record<string, string> = {
    RECEIVED: "bg-blue-50 text-blue-700 border-blue-100",
    DISPATCHED: "bg-indigo-50 text-indigo-700 border-indigo-100",
    IN_TRANSIT: "bg-amber-50 text-amber-700 border-amber-100",
    OFFLOADED: "bg-purple-50 text-purple-700 border-purple-100",
    DELIVERED: "bg-emerald-50 text-emerald-700 border-emerald-100",
    CANCELED: "bg-rose-50 text-rose-700 border-rose-100",
  };
  return (
    <span
      className={cn(
        "text-[8px] font-extrabold px-1.5 py-0.5 rounded-md border uppercase tracking-wider shrink-0",
        colors[status] || "bg-slate-50 text-slate-700 border-slate-100",
      )}
    >
      {status}
    </span>
  );
}

interface UpdateStationModalProps {
  station: any;
  open: boolean;
  onOpenChange: (open: boolean) => void;
  onSuccess: () => void;
}

export function UpdateStationModal({
  station,
  open,
  onOpenChange,
  onSuccess,
}: UpdateStationModalProps) {
  const { mutate: updateStation, isPending: loading } = useUpdateStation();
  const [error, setError] = useState<string | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [activeSubTab, setActiveSubTab] = useState<
    "overview" | "staffs" | "parcels"
  >("overview");

  const [name, setName] = useState("");
  const [code, setCode] = useState("");
  const [location, setLocation] = useState("");
  const isActive = station?.isActive ?? true;

  // React Query to fetch fresh metrics and parcels log
  const { data: stationDetail, isLoading: loadingDetails } = useQuery({
    queryKey: ["station-details", station?.id],
    queryFn: async () => {
      const { data } = await api.get(`/stations/${station.id}`);
      return data.data || data;
    },
    enabled: !!station?.id && open,
  });

  useEffect(() => {
    if (station) {
      setName(station.name || "");
      setCode(station.code || "");
      setLocation(station.location || "");
      setIsEditing(false);
      setActiveSubTab("overview");
    }
  }, [station]);

  const handleUpdate = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);

    const payload = {
      id: station.id,
      name,
      code: code.toUpperCase(),
      location,
    };

    updateStation(payload, {
      onSuccess: () => {
        setIsEditing(false);
        onOpenChange(false);
        onSuccess();
      },
      onError: (err: any) => {
        setError(err.message || "Failed to update station");
      },
    });
  };

  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 rounded-2xl shadow-2xl">
        {/* Header Section */}
        <div className="bg-slate-900 px-8 py-8 flex items-center justify-between shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="flex items-center gap-5 relative z-10 pr-24">
            <div className="w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md">
              {isEditing ? (
                <Edit3 className="w-6 h-6 text-white" strokeWidth={2.5} />
              ) : (
                <Building2 className="w-6 h-6 text-white" strokeWidth={2.5} />
              )}
            </div>
            <div className="flex flex-col relative z-10 text-left">
              <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase">
                {isEditing ? "Edit Station" : "Station Details"}
              </SheetTitle>
              <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
                {isEditing
                  ? "Update rail network connection point"
                  : "Verify physical operational hub node"}
              </SheetDescription>
            </div>
          </div>
          {/* Edit Station Action on the Header */}
          {station && (
            <button
              id="header-edit-station-button"
              type="button"
              onClick={() => setIsEditing(!isEditing)}
              className={cn(
                "absolute right-20 top-8 w-10 h-10 rounded-[10px] flex items-center justify-center z-20 transition-all hover:scale-105 active:scale-95 shadow-md",
                isEditing
                  ? "bg-blue-600 text-white border border-blue-500 animate-in spin-in-12 duration-200"
                  : "bg-white/10 text-white/80 border border-white/10 hover:bg-white/20 hover:text-white",
              )}
              title={isEditing ? "View Details" : "Edit Station"}
            >
              <Edit3 className="w-5 h-5" strokeWidth={2.5} />
            </button>
          )}
        </div>

        {/* Tab Navigation (only visible in View Mode) */}
        {!loadingDetails && stationDetail && !isEditing && (
          <div className="flex items-center gap-1 border-b border-slate-100 px-8 py-2.5 bg-slate-50 shrink-0">
            <button
              id="station-tab-overview"
              onClick={() => setActiveSubTab("overview")}
              className={cn(
                "px-4 py-2 rounded-lg text-[10px] font-black uppercase tracking-wider transition-all",
                activeSubTab === "overview"
                  ? "bg-white text-slate-900 shadow-sm border border-slate-200"
                  : "text-slate-400 hover:text-slate-600",
              )}
            >
              Overview
            </button>
            <button
              id="station-tab-staffs"
              onClick={() => setActiveSubTab("staffs")}
              className={cn(
                "px-4 py-2 rounded-lg text-[10px] font-black uppercase tracking-wider transition-all flex items-center gap-1.5",
                activeSubTab === "staffs"
                  ? "bg-white text-slate-900 shadow-sm border border-slate-200"
                  : "text-slate-400 hover:text-slate-600",
              )}
            >
              <span>Staffs</span>
              <span className="bg-slate-200 text-slate-600 text-[8px] font-bold px-1.5 py-0.5 rounded-full">
                {stationDetail.staff?.length || 0}
              </span>
            </button>
            <button
              id="station-tab-parcels"
              onClick={() => setActiveSubTab("parcels")}
              className={cn(
                "px-4 py-2 rounded-lg text-[10px] font-black uppercase tracking-wider transition-all flex items-center gap-1.5",
                activeSubTab === "parcels"
                  ? "bg-white text-slate-900 shadow-sm border border-slate-200"
                  : "text-slate-400 hover:text-slate-600",
              )}
            >
              <span>Parcels Log</span>
              <span className="bg-slate-200 text-slate-600 text-[8px] font-bold px-1.5 py-0.5 rounded-full">
                {stationDetail.metrics?.totalHandled || 0}
              </span>
            </button>
          </div>
        )}

        {/* Content Area */}
        {loadingDetails ? (
          <div className="flex-1 flex flex-col items-center justify-center gap-3 text-slate-400">
            <Loader2
              className="w-8 h-8 animate-spin text-blue-500"
              strokeWidth={2.5}
            />
            <span className="text-[11px] font-black uppercase tracking-widest">
              Fetching Network Stats...
            </span>
          </div>
        ) : !isEditing ? (
          /* READ ONLY VIEW MODE */
          <div className="p-8 space-y-8 flex-1 overflow-y-auto custom-scrollbar">
            {activeSubTab === "overview" && (
              <div className="space-y-8 animate-in fade-in duration-300">
                {/* Station Specs */}
                <div className="space-y-4">
                  <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-widest text-left">
                    Station Specs
                  </h3>
                  <div className="grid grid-cols-1 gap-3.5 bg-slate-50 p-5 rounded-[12px] border border-slate-100">
                    <DetailRow
                      icon={<Building2 className="w-4 h-4 text-slate-400" />}
                      label="Station Name"
                      value={stationDetail?.name || name}
                    />
                    <DetailRow
                      icon={<Shield className="w-4 h-4 text-slate-400" />}
                      label="Station Code"
                      value={stationDetail?.code || code}
                    />
                    <DetailRow
                      icon={<MapPin className="w-4 h-4 text-slate-400" />}
                      label="Physical Location"
                      value={stationDetail?.location || location || "N/A"}
                    />
                    <DetailRow
                      icon={<Building2 className="w-4 h-4 text-slate-400" />}
                      label="Parent Organization"
                      value={
                        stationDetail?.organization?.name ||
                        station?.organization?.name ||
                        "ROOT · PLATFORM"
                      }
                    />
                    <DetailRow
                      icon={<Activity className="w-4 h-4 text-slate-400" />}
                      label="Network Status"
                      value={
                        (stationDetail?.isActive ?? station?.isActive)
                          ? "Online"
                          : "Offline"
                      }
                      isBadge
                    />
                  </div>
                </div>

                {/* Station Metrics */}
                <div className="space-y-4">
                  <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-widest text-left">
                    Operations Performance
                  </h3>
                  <div className="grid grid-cols-3 gap-4">
                    <StatBox
                      icon={<PackageCheck className="w-5 h-5 text-blue-500" />}
                      bg="bg-blue-50"
                      label="Total Handled"
                      value={stationDetail?.metrics?.totalHandled || 0}
                    />
                    <StatBox
                      icon={<Send className="w-5 h-5 text-amber-500" />}
                      bg="bg-amber-50"
                      label="Dispatched"
                      value={stationDetail?.metrics?.dispatched || 0}
                    />
                    <StatBox
                      icon={<Truck className="w-5 h-5 text-emerald-500" />}
                      bg="bg-emerald-50"
                      label="Received"
                      value={stationDetail?.metrics?.received || 0}
                    />
                  </div>
                </div>

                {/* Workforce Metrics */}
                <div className="space-y-4">
                  <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-widest text-left">
                    Workforce Registry
                  </h3>
                  <div className="grid grid-cols-3 gap-4">
                    <StatBox
                      icon={<Users className="w-5 h-5 text-indigo-500" />}
                      bg="bg-indigo-50"
                      label="Total Staff"
                      value={stationDetail?.metrics?.totalStaff || 0}
                    />
                    <StatBox
                      icon={<Zap className="w-5 h-5 text-emerald-500" />}
                      bg="bg-emerald-50"
                      label="Active Staff"
                      value={stationDetail?.metrics?.activeStaff || 0}
                    />
                    <StatBox
                      icon={<UserX className="w-5 h-5 text-slate-500" />}
                      bg="bg-slate-50"
                      label="Inactive Staff"
                      value={
                        (stationDetail?.metrics?.totalStaff || 0) -
                        (stationDetail?.metrics?.activeStaff || 0)
                      }
                    />
                  </div>
                </div>
              </div>
            )}

            {activeSubTab === "staffs" && (
              <div className="space-y-4 animate-in fade-in duration-300">
                <div className="flex items-center justify-between">
                  <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                    Station Personnel
                  </h3>
                  <span className="text-[10px] font-black uppercase text-indigo-600 bg-indigo-50 px-2.5 py-0.5 rounded-full">
                    {stationDetail?.staff?.length || 0} active nodes
                  </span>
                </div>

                {!stationDetail?.staff || stationDetail.staff.length === 0 ? (
                  <div className="p-8 text-center bg-slate-50 border border-slate-100 rounded-xl">
                    <p className="text-[11px] font-bold text-slate-400">
                      No staff members assigned to this station
                    </p>
                  </div>
                ) : (
                  <div className="space-y-3 max-h-[380px] overflow-y-auto pr-1 custom-scrollbar">
                    {stationDetail.staff.map((member: any) => {
                      const initials =
                        member.name
                          ?.split(" ")
                          ?.map((n: string) => n[0])
                          ?.join("")
                          ?.slice(0, 2)
                          ?.toUpperCase() || "?";
                      return (
                        <div
                          key={member.id}
                          className="p-4 bg-white border border-slate-100 rounded-xl shadow-sm flex items-center justify-between gap-4 text-left animate-in fade-in duration-200"
                        >
                          <div className="flex items-center gap-3 min-w-0">
                            <div className="w-10 h-10 rounded-[10px] bg-slate-100 border border-slate-200 flex items-center justify-center text-slate-600 text-[12px] font-black shrink-0">
                              {initials}
                            </div>
                            <div className="flex flex-col min-w-0">
                              <span className="text-[12px] font-black text-slate-900 truncate uppercase tracking-tight">
                                {member.name}
                              </span>
                              <span className="text-[10px] font-semibold text-slate-400 truncate lowercase tracking-tight mt-0.5">
                                {member.email}
                              </span>
                            </div>
                          </div>

                          <div className="flex items-center gap-3 shrink-0">
                            <span className="px-2.5 py-1.5 rounded-[8px] bg-slate-50 border border-slate-100 text-slate-600 text-[9px] font-black uppercase tracking-[0.1em] shadow-sm">
                              {member.role?.name?.replace("_", " ") || "USER"}
                            </span>
                            <div
                              className={cn(
                                "inline-flex items-center gap-1.5 px-2.5 py-1 rounded-[8px] border text-[9px] font-black uppercase tracking-wider",
                                member.isActive
                                  ? "bg-emerald-50 text-emerald-600 border-emerald-100"
                                  : "bg-rose-50 text-rose-600 border-rose-100",
                              )}
                            >
                              <div
                                className={cn(
                                  "w-1.5 h-1.5 rounded-full",
                                  member.isActive
                                    ? "bg-emerald-500 animate-pulse"
                                    : "bg-rose-500",
                                )}
                              />
                              {member.isActive ? "Online" : "Offline"}
                            </div>
                          </div>
                        </div>
                      );
                    })}
                  </div>
                )}
              </div>
            )}

            {activeSubTab === "parcels" && (
              <div className="space-y-4 animate-in fade-in duration-300">
                <div className="flex items-center justify-between">
                  <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                    Handled Transit Log
                  </h3>
                  <span className="text-[10px] font-black uppercase text-blue-600 bg-blue-50 px-2.5 py-0.5 rounded-full">
                    {stationDetail?.parcels?.length || 0} entries
                  </span>
                </div>

                {!stationDetail?.parcels ||
                stationDetail.parcels.length === 0 ? (
                  <div className="p-8 text-center bg-slate-50 border border-slate-100 rounded-xl">
                    <p className="text-[11px] font-bold text-slate-400">
                      No parcels logged through this station
                    </p>
                  </div>
                ) : (
                  <div className="space-y-3 max-h-[380px] overflow-y-auto pr-1 custom-scrollbar">
                    {stationDetail.parcels.map((parcel: any) => (
                      <div
                        key={parcel.id}
                        className="p-4 bg-white border border-slate-100 rounded-xl shadow-sm flex items-center justify-between gap-4"
                      >
                        <div className="flex flex-col text-left">
                          <div className="flex items-center gap-2">
                            <span className="text-xs font-black text-slate-900 tracking-tight">
                              {parcel.trackingNumber}
                            </span>
                            <ParcelStatusBadge status={parcel.status} />
                          </div>
                          <div className="flex items-center gap-1.5 mt-2.5 text-[10.5px] font-semibold text-slate-500">
                            <span className="truncate max-w-[120px]">
                              {parcel.origin?.name ||
                                parcel.fromAddress ||
                                "Hub"}
                            </span>
                            <span className="text-slate-300">➔</span>
                            <span className="truncate max-w-[120px]">
                              {parcel.destination?.name ||
                                parcel.toAddress ||
                                "Station"}
                            </span>
                          </div>
                        </div>
                        <div className="flex flex-col items-end shrink-0">
                          <span className="text-[10.5px] font-black text-slate-700">
                            {format(new Date(parcel.createdAt), "MMM dd, yyyy")}
                          </span>
                          <span className="text-[8px] font-black text-slate-400 uppercase tracking-widest mt-1">
                            Log Date
                          </span>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            )}
          </div>
        ) : (
          /* EDITABLE FORM MODE */
          <form
            id="update-station-form"
            onSubmit={handleUpdate}
            className="p-8 space-y-10 flex-1 overflow-y-auto custom-scrollbar text-left animate-in slide-in-from-top-2 duration-300"
          >
            {error && (
              <div className="bg-rose-50 border border-rose-100 text-rose-600 text-[13px] font-bold p-4 rounded-[12px] flex items-center gap-3 animate-in fade-in slide-in-from-top-2">
                <div className="w-2 h-2 rounded-full bg-rose-500 shadow-md" />
                {error}
              </div>
            )}

            <div className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-10">
              <div className="space-y-3 md:col-span-2">
                <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
                  Station Name
                </Label>
                <Input
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[12px] px-5 text-[14px] font-bold transition-all"
                  required
                />
              </div>

              <div className="space-y-3">
                <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
                  Station Code
                </Label>
                <Input
                  value={code}
                  onChange={(e) => setCode(e.target.value)}
                  maxLength={5}
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[12px] px-5 text-[14px] font-bold uppercase transition-all"
                  required
                />
              </div>

              <div className="space-y-3">
                <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
                  Location
                </Label>
                <Input
                  value={location}
                  onChange={(e) => setLocation(e.target.value)}
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[12px] px-5 text-[14px] font-bold transition-all"
                />
              </div>
            </div>

            {/* Metadata */}
            <div className="pt-8 border-t border-slate-100 flex items-center justify-between">
              <div className="flex flex-col gap-1">
                <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                  Network Security
                </span>
                <p className="text-[10px] font-bold text-slate-400 leading-tight max-w-[280px]">
                  Station updates are logged for the audit trail.
                </p>
              </div>
              <div
                className={cn(
                  "flex items-center gap-1.5 px-3 py-1.5 rounded-lg border",
                  isActive
                    ? "bg-emerald-50 text-emerald-600 border-emerald-100"
                    : "bg-slate-50 text-slate-400 border-slate-100",
                )}
              >
                <CheckCircle2 size={12} strokeWidth={3} />
                <span className="text-[9px] font-black uppercase tracking-widest">
                  {isActive ? "Online" : "Offline"}
                </span>
              </div>
            </div>
          </form>
        )}

        {/* Action Footer */}
        {isEditing && (
          <div className="p-6 bg-slate-50 border-t border-slate-100 flex gap-3">
            <button
              type="button"
              onClick={() => setIsEditing(false)}
              className="flex-1 h-14 rounded-xl bg-white border border-slate-200 text-slate-400 text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-50 transition-all active:scale-[0.98]"
            >
              Cancel
            </button>
            <button
              type="submit"
              form="update-station-form"
              disabled={loading || !name || !code}
              className="flex-[1.5] h-14 rounded-xl bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 flex items-center justify-center gap-3 active:scale-[0.98]"
            >
              {loading ? (
                <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
              ) : (
                <>
                  <CheckCircle2 className="w-5 h-5" strokeWidth={3} />
                  Save Changes
                </>
              )}
            </button>
          </div>
        )}
      </SheetContent>
    </Sheet>
  );
}

// Sub-components

function DetailRow({
  icon,
  label,
  value,
  isBadge = false,
}: {
  icon: React.ReactNode;
  label: string;
  value: string;
  isBadge?: boolean;
}) {
  return (
    <div className="flex items-center justify-between py-1.5 first:pt-0 last:pb-0">
      <div className="flex items-center gap-3.5">
        {icon}
        <span className="text-xs font-bold text-slate-400 uppercase tracking-wider">
          {label}
        </span>
      </div>
      {isBadge ? (
        <span
          className={cn(
            "text-[9px] font-extrabold px-2 py-0.5 rounded-md uppercase tracking-wider",
            value === "Online"
              ? "bg-emerald-100 text-emerald-700"
              : "bg-slate-100 text-slate-700",
          )}
        >
          {value}
        </span>
      ) : (
        <span className="text-xs font-black text-slate-700 uppercase tracking-tight truncate max-w-[240px]">
          {value}
        </span>
      )}
    </div>
  );
}

function StatBox({
  icon,
  bg,
  label,
  value,
}: {
  icon: React.ReactNode;
  bg: string;
  label: string;
  value: number;
}) {
  return (
    <div className="flex items-center gap-4 p-4 border border-slate-100 rounded-[12px] bg-slate-50 shadow-sm">
      <div className={cn("p-2.5 rounded-[10px] shrink-0", bg)}>{icon}</div>
      <div className="flex flex-col overflow-hidden text-left">
        <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest leading-none mb-1">
          {label}
        </span>
        <span className="text-xl font-black text-slate-900 tabular-nums leading-none">
          {value}
        </span>
      </div>
    </div>
  );
}
