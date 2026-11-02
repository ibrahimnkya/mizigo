"use client";
import { Suspense, useState, useEffect } from "react";
import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { StationList } from "@/components/stations/station-list";
import { StationsOverview } from "@/components/stations/stations-overview";
import { CreateStationModal } from "@/components/stations/create-station-modal";
import { Zap, Activity, Network, PauseCircle } from "lucide-react";
import { cn } from "@/lib/utils";
import { useRouter, useSearchParams } from "next/navigation";
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

  const router = useRouter();
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
            <StationsOverview
              stations={stations ?? []}
              onViewAll={() => router.push("?tab=all+stations")}
            />
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
