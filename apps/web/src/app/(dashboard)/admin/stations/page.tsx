"use client";
import { Suspense, useState, useEffect } from "react";
import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { StationList } from "@/components/stations/station-list";
import { CreateStationModal } from "@/components/stations/create-station-modal";
import { Zap, Activity, Network, PauseCircle } from "lucide-react";
import { cn } from "@/lib/utils";
import { useSearchParams } from "next/navigation";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useSession } from "next-auth/react";

// --- Animated counter hook ---
function useCountUp(target: number, duration = 1200): number {
  const [value, setValue] = useState(0);
  useEffect(() => {
    if (!target) {
      setValue(0);
      return;
    }
    const steps = 40;
    const increment = target / steps;
    let current = 0;
    const timer = setInterval(() => {
      current += increment;
      if (current >= target) {
        setValue(target);
        clearInterval(timer);
      } else {
        setValue(Math.floor(current));
      }
    }, duration / steps);
    return () => clearInterval(timer);
  }, [target, duration]);
  return value;
}

// --- Custom StationStatCard Component ---
interface StationStatCardProps {
  label: string;
  value: number;
  isPercent?: boolean;
  icon: React.ElementType;
  iconBg: string;
  iconColor: string;
  tag: string;
  tagBg: string;
  tagColor: string;
  accentBar: string;
  description: string;
  seed: number;
}

function StationStatCard({
  label,
  value,
  isPercent = false,
  icon: Icon,
  iconBg,
  iconColor,
  tag,
  tagBg,
  tagColor,
  description,
}: StationStatCardProps) {
  const counted = useCountUp(value, 1000);
  const displayValue = isPercent ? `${counted}%` : counted.toLocaleString();

  return (
    <div className="bg-white border border-[#E2E2E2] rounded-[20px] p-5 flex flex-col gap-3">
      {/* Top Row */}
      <div className="flex items-start justify-between">
        <div className={cn("w-8 h-8 rounded-xl flex items-center justify-center", iconBg, iconColor)}>
          <Icon size={14} strokeWidth={2} />
        </div>
        <span className={cn("inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border", tagBg, tagColor)}>
          {tag}
        </span>
      </div>

      {/* Value */}
      <p className={cn("text-[26px] font-semibold leading-none tabular-nums", iconColor)}>
        {displayValue}
      </p>

      {/* Title & Description */}
      <div>
        <h3 className="text-[14px] font-semibold text-slate-800">{label}</h3>
        <p className="text-[11px] font-medium text-slate-500 mt-0.5 leading-normal line-clamp-2">
          {description}
        </p>
      </div>
    </div>
  );
}

function AdminStationsPageInner() {
  const { data: session } = useSession();
  const orgId = (session?.user as any)?.organizationId;

  const {
    data: stations,
    isLoading,
    refetch,
  } = useQuery({
    queryKey: ["stations-stats", orgId],
    queryFn: async () => {
      const { data } = await api.get("/stations", {
        params: { includeInactive: "true" },
      });
      return data.data || data;
    },
    enabled: !!session,
  });

  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  // Calculate basic stats
  const totalStations = stations?.length || 0;
  const activeStations = stations?.filter((s: any) => s.isActive).length || 0;
  const inactiveStations = totalStations - activeStations;
  const uptime = totalStations
    ? `${((activeStations / totalStations) * 100).toFixed(1)}%`
    : "0%";

  return (
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Station Network"
          subtitle="Manage your physical logistics hubs and terminals"
          iconName="Network"
          action={<CreateStationModal onSuccess={refetch} />}
          tabs={["Overview", "All Stations"]}
          tabParamName="tab"
          activeTab={tab}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-6">
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                <StationStatCard
                  label="Active Stations"
                  value={activeStations}
                  icon={Zap}
                  iconBg="bg-emerald-50"
                  iconColor="text-emerald-600"
                  tag="ONLINE"
                  tagBg="bg-emerald-50"
                  tagColor="text-emerald-700 border-emerald-200"
                  accentBar=""
                  description="Stations actively processing parcels"
                  seed={1}
                />
                <StationStatCard
                  label="Inactive Stations"
                  value={inactiveStations}
                  icon={PauseCircle}
                  iconBg="bg-rose-50"
                  iconColor="text-rose-600"
                  tag="OFFLINE"
                  tagBg="bg-rose-50"
                  tagColor="text-rose-700 border-rose-200"
                  accentBar=""
                  description="Stations temporarily closed or disabled"
                  seed={2}
                />
                <StationStatCard
                  label="Operational Uptime"
                  value={totalStations ? Math.round((activeStations / totalStations) * 100) : 0}
                  isPercent={true}
                  icon={Activity}
                  iconBg="bg-indigo-50"
                  iconColor="text-indigo-600"
                  tag="UPTIME"
                  tagBg="bg-indigo-50"
                  tagColor="text-indigo-700 border-indigo-200"
                  accentBar=""
                  description="Percentage of active network hubs"
                  seed={3}
                />
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-white border border-[#E2E2E2] rounded-[20px] p-6 flex flex-col justify-between min-h-[400px]">
                  <div>
                    <div className="h-10 w-10 rounded-xl bg-slate-100 border border-slate-200 flex items-center justify-center mb-6">
                      <Network className="h-5 w-5 text-slate-600" strokeWidth={2} />
                    </div>
                    <h3 className="text-[20px] font-semibold text-slate-800 mb-2">
                      Station Network
                    </h3>
                    <p className="text-[13px] font-medium text-slate-500 leading-relaxed mb-6">
                      Stations represent the physical hubs where parcels are
                      dispatched and received. Uptime dictates operational
                      capacity.
                    </p>
                  </div>

                  <div className="space-y-2">
                    <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                      <div className="flex flex-col">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Active Hubs
                        </span>
                        <span className="text-[11px] font-medium text-slate-400">
                          Processing
                        </span>
                      </div>
                      <span className="text-[14px] font-semibold text-emerald-600 tabular-nums">
                        {activeStations}
                      </span>
                    </div>
                    <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                      <div className="flex flex-col">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Inactive
                        </span>
                        <span className="text-[11px] font-medium text-slate-400">
                          Offline
                        </span>
                      </div>
                      <span className="text-[14px] font-semibold text-rose-600 tabular-nums">
                        {inactiveStations}
                      </span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white border border-[#E2E2E2] rounded-[20px] p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-12 h-12 rounded-xl bg-blue-50 border border-blue-200 flex items-center justify-center mb-4">
                    <Activity className="w-6 h-6 text-blue-600" strokeWidth={2} />
                  </div>
                  <h4 className="text-[14px] font-semibold text-slate-800 mb-2">
                    Network Activity Graph
                  </h4>
                  <p className="text-[13px] font-medium text-slate-500 max-w-md">
                    Detailed graphical analysis of station uptime and parcel
                    throughput will be populated here as data accumulates.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all stations" && (
            <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden p-1">
              <StationList organizationId={orgId} />
            </div>
          )}
        </div>
    </div>
  );
}

export default function AdminStationsPage() {
  return (
    <Suspense
      fallback={
        <div className="flex items-center justify-center min-h-[300px]">
          Loading page...
        </div>
      }
    >
      <AdminStationsPageInner />
    </Suspense>
  );
}
