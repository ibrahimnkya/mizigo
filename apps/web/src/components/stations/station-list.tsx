"use client";

import { useState } from "react";
import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { DataTable } from "@/components/shared/data-table";
import { MapPin } from "lucide-react";
import { UpdateStationModal } from "./update-station-modal";
import { StationStatusModal } from "./station-status-modal";
import { cn } from "@/lib/utils";

interface StationListProps {
  organizationId?: string;
}

export function StationList({ organizationId }: StationListProps) {
  // Keep track of which station is being managed
  const [selectedStation, setSelectedStation] = useState<any>(null);
  const [isUpdateOpen, setIsUpdateOpen] = useState(false);
  const [isStatusOpen, setIsStatusOpen] = useState(false);

  // Fetch stations (all or for a specific organization)
  const {
    data: stations,
    isLoading,
    refetch,
  } = useQuery({
    queryKey: ["stations", organizationId],
    queryFn: async () => {
      const params = organizationId ? { organizationId } : {};
      const { data } = await api.get("/stations", {
        params: { ...params, includeInactive: "true" },
      });
      return data.data || data;
    },
  });

  // Define table columns
  const columns = [
    {
      header: "Station Name",
      accessor: (s: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-10 w-10 rounded-[10px] flex items-center justify-center shadow-lg transition-all duration-300",
              s.isActive
                ? "bg-slate-900 shadow-slate-100"
                : "bg-slate-200 shadow-transparent grayscale",
            )}
          >
            <MapPin
              className={cn(
                "h-5 w-5 text-white",
                !s.isActive && "text-slate-400",
              )}
            />
          </div>
          <div className="flex flex-col">
            <span className="font-black text-slate-900 text-[13px] tracking-tight group-hover:text-blue-600 transition-colors uppercase">
              {s.name}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest line-clamp-1">
              {s.organization?.name || "ROOT · PLATFORM"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Station ID",
      accessor: (s: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1.5 px-2.5 py-1 bg-slate-50 border border-slate-100 rounded-[10px] w-fit">
            <span className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
              ID: {s.code || s.id?.slice(0, 8)}
            </span>
          </div>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest pl-1">
            Protocol v2.1
          </span>
        </div>
      ),
    },
    {
      header: "Status",
      accessor: (s: any) => (
        <div className="flex items-center gap-2">
          <div
            className={cn(
              "w-1.5 h-1.5 rounded-full",
              s.isActive
                ? "bg-emerald-500 shadow-[0_0_8px_rgba(16,185,129,0.5)]"
                : "bg-rose-500 shadow-[0_0_8px_rgba(244,63,94,0.5)]",
            )}
          />
          <span className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em]">
            {s.isActive ? "Active Network" : "Node Suspended"}
          </span>
        </div>
      ),
    },
    {
      header: "Location",
      accessor: (s: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1 text-slate-600">
            <MapPin className="w-4 h-4" strokeWidth={3} />
            <span className="text-[14px] font-black tracking-tighter">
              {s.location || "Dar es Salaam, TZ"}
            </span>
          </div>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest">
            Physical Hub
          </span>
        </div>
      ),
    },
    {
      header: "Action Suite",
      accessor: (s: any) => (
        <div className="flex items-center justify-end gap-2 pr-4">
          <button
            onClick={() => {
              setSelectedStation(s);
              setIsUpdateOpen(true);
            }}
            className="h-9 px-4 bg-slate-900 hover:bg-blue-600 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm flex items-center gap-2"
          >
            Manage
          </button>
        </div>
      ),
    },
  ];

  return (
    <>
      <DataTable
        title="Logistics Network Directory"
        columns={columns}
        data={stations || []}
        isLoading={isLoading}
        hideInternalSearch={true}
        hideActions={true}
      />

      {/* Modal to update station details */}
      <UpdateStationModal
        station={selectedStation}
        open={isUpdateOpen}
        onOpenChange={setIsUpdateOpen}
        onSuccess={refetch}
      />

      {/* Modal to change station status */}
      <StationStatusModal
        station={selectedStation}
        open={isStatusOpen}
        onOpenChange={setIsStatusOpen}
        onSuccess={refetch}
      />
    </>
  );
}
