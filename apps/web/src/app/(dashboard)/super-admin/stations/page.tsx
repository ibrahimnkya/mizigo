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

// --- Sparkline SVG ---
function Sparkline({ color = "#10b981", seed = 0 }: { color?: string; seed?: number }) {
  const basePoints = [30, 55, 40, 70, 52, 80, 65, 90, 72, 95];
  const points = basePoints.map((p, i) => {
    const shift = Math.sin(seed + i) * 8;
    return Math.max(10, Math.min(100, p + shift));
  });
  const h = 48, w = 120;
  const max = Math.max(...points), min = Math.min(...points);
  const coords: [number, number][] = points.map((p, i) => [
    (i / (points.length - 1)) * w,
    h - ((p - min) / (max - min)) * (h - 4) - 2,
  ]);
  const path = coords.map(([x, y], i) => `${i === 0 ? "M" : "L"}${x.toFixed(1)},${y.toFixed(1)}`).join(" ");
  const fill = path + ` L${w},${h} L0,${h} Z`;
  const gradId = `spark-${color.replace("#", "")}-${seed}`;

  return (
    <svg viewBox={`0 0 ${w} ${h}`} className="w-full h-12" preserveAspectRatio="none">
      <defs>
        <linearGradient id={gradId} x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stopColor={color} stopOpacity="0.2" />
          <stop offset="100%" stopColor={color} stopOpacity="0" />
        </linearGradient>
      </defs>
      <path d={fill} fill={`url(#${gradId})`} />
      <path d={path} fill="none" stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" />
    </svg>
  );
}

// --- Helper to map text class to Hex ---
const getSparkColor = (colorClass: string) => {
  if (colorClass.includes("blue")) return "#3b82f6";
  if (colorClass.includes("emerald")) return "#10b981";
  if (colorClass.includes("indigo")) return "#6366f1";
  if (colorClass.includes("amber")) return "#f59e0b";
  if (colorClass.includes("orange")) return "#f97316";
  if (colorClass.includes("violet")) return "#8b5cf6";
  if (colorClass.includes("cyan")) return "#06b6d4";
  if (colorClass.includes("rose")) return "#f43f5e";
  return "#94a3b8";
};

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
  const sparkColor = getSparkColor(iconColor);

  const displayValue = isPercent ? `${counted}%` : counted.toLocaleString();

  return (
    <div className="group bg-white rounded-2xl border border-slate-100 p-5 flex flex-col justify-between hover:shadow-xl hover:border-slate-200 hover:-translate-y-0.5 transition-all duration-300 h-full relative overflow-hidden">
      {/* Top Row */}
      <div className="flex items-start justify-between">
        <div className={cn("w-9 h-9 rounded-xl flex items-center justify-center transition-all duration-300 group-hover:scale-110 shadow-sm", iconBg, iconColor)}>
          <Icon size={16} strokeWidth={2.5} />
        </div>
        <span className={cn("text-[9px] font-bold uppercase tracking-[0.18em] px-2.5 py-1.5 rounded-md border", tagBg, tagColor)}>
          {tag}
        </span>
      </div>

      {/* Main Content */}
      <div className="mt-4 flex-1 flex flex-col justify-between">
        <div>
          {/* Primary value */}
          <p className={cn("text-[26px] font-black tracking-tight leading-none tabular-nums", iconColor)}>
            {displayValue}
          </p>
          
          {/* Title & Description */}
          <h3 className="text-[13px] font-black text-slate-800 tracking-tight mt-3">
            {label}
          </h3>
          <p className="text-[10px] font-bold text-slate-400 mt-1 leading-normal line-clamp-2">
            {description}
          </p>
        </div>

        {/* Sparkline */}
        <div className="mt-4 space-y-3">
          <div className="opacity-40 group-hover:opacity-100 transition-opacity duration-300">
            <Sparkline color={sparkColor} seed={seed} />
          </div>
        </div>
      </div>

      {/* Bottom accent glow */}
      <div className={cn("absolute bottom-0 left-0 right-0 h-[3px] opacity-0 group-hover:opacity-100 transition-opacity duration-300", accentBar)} />
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
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
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
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                <StationStatCard
                  label="Active Stations"
                  value={activeStations}
                  icon={Zap}
                  iconBg="bg-emerald-50"
                  iconColor="text-emerald-600"
                  tag="ONLINE"
                  tagBg="bg-emerald-50/50 border-emerald-100"
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
                  tagBg="bg-rose-50/50 border-rose-100"
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
                  tagBg="bg-blue-50/50 border-blue-100"
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
                  tagBg="bg-indigo-50/50 border-indigo-100"
                  tagColor="text-indigo-700"
                  accentBar="bg-indigo-500"
                  description="Percentage of active network hubs"
                  seed={4}
                />
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-slate-900 rounded-[10px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[400px]">
                  <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-blue-500/10 rounded-full blur-[100px]" />

                  <div className="relative z-10">
                    <div className="h-12 w-12 rounded-[10px] bg-white/10 flex items-center justify-center mb-8 border border-white/10 backdrop-blur-md shadow-2xl shadow-blue-500/10">
                      <Network
                        className="h-6 w-6 text-blue-400"
                        strokeWidth={2.5}
                      />
                    </div>
                    <h3 className="text-[24px] font-black tracking-tight leading-none mb-3">
                      Station Network
                    </h3>
                    <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-80 mb-6">
                      Stations represent the physical hubs where parcels are
                      dispatched and received. Uptime dictates operational
                      capacity.
                    </p>
                  </div>

                  <div className="relative z-10 space-y-3">
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          Active Hubs
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          Processing
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-emerald-400 tabular-nums">
                        {activeStations}
                      </span>
                    </div>
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          Inactive
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          Offline
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-rose-400 tabular-nums">
                        {inactiveStations}
                      </span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-16 h-16 rounded-full bg-blue-50 flex items-center justify-center mb-4">
                    <Activity className="w-8 h-8 text-blue-500" />
                  </div>
                  <h4 className="text-[16px] font-black text-slate-900 mb-2">
                    Network Activity Graph
                  </h4>
                  <p className="text-[13px] text-slate-400 max-w-md">
                    Detailed graphical analysis of station uptime and parcel
                    throughput will be populated here as data accumulates.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all" && (
            <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden p-1">
              <StationList />
            </div>
          )}
        </div>
      </div>
    </div>
  );
}


export default function SuperAdminStationsPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">
          Loading page...
        </div>
      }
    >
      <SuperAdminStationsPageInner />
    </Suspense>
  );
}
