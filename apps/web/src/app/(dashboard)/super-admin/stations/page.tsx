"use client";
import { Suspense, useState, useEffect } from "react";

import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { StationList } from "@/components/stations/station-list";
import { CreateStationModal } from "@/components/stations/create-station-modal";
import {
  MapPin,
  Zap,
  Activity,
  ShieldCheck,
  Globe,
  Network,
  Plus,
  Building2,
  Users,
  PauseCircle,
} from "lucide-react";
import { cn } from "@/lib/utils";

import { useSearchParams } from "next/navigation";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { DashboardTabs } from "@/components/dashboard/dashboard-tabs";

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
  accentBar,
  description,
  seed,
}: StationStatCardProps) {
  const counted = useCountUp(value, 1000);
  const displayValue = isPercent ? `${counted}%` : counted.toLocaleString();

  return (
    <div className="bg-white rounded-[20px] border border-[#E2E2E2] p-5 flex flex-col gap-3">
      <div className="flex items-start justify-between">
        <div className={cn("w-8 h-8 rounded-xl flex items-center justify-center", iconBg)}>
          <Icon size={15} strokeWidth={2.5} className={iconColor} />
        </div>
        <span className={cn("inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border", tagBg, tagColor)}>
          {tag}
        </span>
      </div>
      <div>
        <p className="text-[26px] font-semibold text-slate-900 tabular-nums leading-none">
          {displayValue}
        </p>
        <h3 className="text-[14px] font-semibold text-slate-800 mt-2">
          {label}
        </h3>
        <p className="text-[12px] text-slate-500 mt-1 leading-normal line-clamp-2">
          {description}
        </p>
      </div>
    </div>
  );
}

function SuperAdminStationsPageInner() {
  // Fetch all stations including inactive ones
  const {
    data: stations,
    isLoading,
    refetch,
  } = useQuery({
    queryKey: ["stations-stats"],
    queryFn: async () => {
      const { data } = await api.get("/stations", {
        params: { includeInactive: "true" },
      });
      return data.data || data;
    },
  });

  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  // Calculate basic stats
  const totalStations = stations?.length || 0;
  const activeStations = stations?.filter((s: any) => s.isActive).length || 0;
  const inactiveStations = totalStations - activeStations;
  const uniqueOrgs =
    new Set(stations?.map((s: any) => s.organizationId)).size || 0;
  const uptime = totalStations
    ? `${((activeStations / totalStations) * 100).toFixed(1)}%`
    : "0%";

  return (
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Stations Network"
          subtitle="Manage all physical operational hubs globally"
          iconName="Network"
          action={<CreateStationModal onSuccess={refetch} />}
          tabs={["Overview", "All"]}
          tabParamName="tab"
          activeTab={tab}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-6">
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                <StationStatCard
                  label="Active Stations"
                  value={activeStations}
                  icon={Zap}
                  iconBg="bg-emerald-50"
                  iconColor="text-emerald-600"
                  tag="ONLINE"
                  tagBg="bg-emerald-50 border-emerald-200"
                  tagColor="text-emerald-700"
                  accentBar="bg-emerald-500"
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
                  tagBg="bg-rose-50 border-rose-200"
                  tagColor="text-rose-700"
                  accentBar="bg-rose-500"
                  description="Stations temporarily closed or disabled"
                  seed={2}
                />
                <StationStatCard
                  label="Organizations"
                  value={uniqueOrgs}
                  icon={Building2}
                  iconBg="bg-blue-50"
                  iconColor="text-blue-600"
                  tag="TENANTS"
                  tagBg="bg-blue-50 border-blue-200"
                  tagColor="text-blue-700"
                  accentBar="bg-blue-500"
                  description="Distinct logistic provider tenants"
                  seed={3}
                />
                <StationStatCard
                  label="Operational Uptime"
                  value={totalStations ? Math.round((activeStations / totalStations) * 100) : 0}
                  isPercent={true}
                  icon={Activity}
                  iconBg="bg-indigo-50"
                  iconColor="text-indigo-600"
                  tag="UPTIME"
                  tagBg="bg-indigo-50 border-indigo-200"
                  tagColor="text-indigo-700"
                  accentBar="bg-indigo-500"
                  description="Percentage of active network hubs"
                  seed={4}
                />
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-white border border-[#E2E2E2] rounded-[20px] flex flex-col min-h-[360px]">
                  <div className="px-5 py-4 border-b border-slate-200 flex items-center gap-2">
                    <Network className="h-4 w-4 text-slate-500" strokeWidth={2.5} />
                    <h3 className="text-[14px] font-semibold text-slate-800">
                      Station Network
                    </h3>
                  </div>
                  <div className="p-5 flex flex-col flex-1">
                    <p className="text-[13px] text-slate-500 leading-relaxed mb-5">
                      Stations represent the physical hubs where parcels are
                      dispatched and received. Uptime dictates operational
                      capacity.
                    </p>
                    <div className="space-y-2 mt-auto">
                      <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Active Hubs
                        </span>
                        <span className="text-[14px] font-semibold text-emerald-600 tabular-nums">
                          {activeStations}
                        </span>
                      </div>
                      <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Inactive
                        </span>
                        <span className="text-[14px] font-semibold text-rose-600 tabular-nums">
                          {inactiveStations}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[20px] border border-[#E2E2E2] p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-12 h-12 rounded-xl bg-blue-50 flex items-center justify-center mb-4">
                    <Activity className="w-6 h-6 text-blue-600" />
                  </div>
                  <h4 className="text-[14px] font-semibold text-slate-800 mb-2">
                    Network Activity Graph
                  </h4>
                  <p className="text-[13px] text-slate-500 max-w-md">
                    Detailed graphical analysis of station uptime and parcel
                    throughput will be populated here as data accumulates.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all" && (
            <div className="bg-white rounded-[20px] border border-[#E2E2E2] overflow-hidden">
              <StationList />
            </div>
          )}
        </div>
    </div>
  );
}


export default function SuperAdminStationsPage() {
  return (
    <Suspense
      fallback={
        <div className="flex items-center justify-center min-h-[300px]">
          Loading page...
        </div>
      }
    >
      <SuperAdminStationsPageInner />
    </Suspense>
  );
}
