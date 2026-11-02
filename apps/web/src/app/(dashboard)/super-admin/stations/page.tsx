"use client";
import { Suspense, useState, useEffect } from "react";

import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { StationList } from "@/components/stations/station-list";
import { StationsOverview } from "@/components/stations/stations-overview";
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

import { useRouter, useSearchParams } from "next/navigation";
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

  const router = useRouter();
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
            <StationsOverview
              stations={stations ?? []}
              onViewAll={() => router.push("?tab=all")}
            />
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
