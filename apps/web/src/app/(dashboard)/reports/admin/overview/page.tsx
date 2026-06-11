"use client";

import { useQuery } from "@tanstack/react-query";
import { useState, useEffect } from "react";
import {
  Shield,
  TrendingUp,
  Building2,
  MapPin,
  Package2,
  ArrowUpRight,
  BarChart3,
  Globe,
  Activity,
  ChevronRight,
  Download,
  Zap,
  RefreshCw,
} from "lucide-react";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";
import { ReportPageHeader } from "@/components/reports/report-page-header";

// --- Animated counter hook ---
function useCountUp(target: number, duration = 1200): number {
  const [value, setValue] = useState(0);
  useEffect(() => {
    if (!target) return;
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
function Sparkline({ color = "#10b981" }: { color?: string }) {
  const points = [30, 55, 40, 70, 52, 80, 65, 90, 72, 95];
  const h = 48, w = 120;
  const max = Math.max(...points), min = Math.min(...points);
  const coords: [number, number][] = points.map((p, i) => [
    (i / (points.length - 1)) * w,
    h - ((p - min) / (max - min)) * (h - 4) - 2,
  ]);
  const path = coords.map(([x, y], i) => `${i === 0 ? "M" : "L"}${x.toFixed(1)},${y.toFixed(1)}`).join(" ");
  const fill = path + ` L${w},${h} L0,${h} Z`;
  const gradId = `spark-${color.replace("#", "")}`;

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

// --- Metric Card ---
interface MetricCardProps {
  label: string;
  value: number | string;
  icon: React.ElementType;
  color: string;
  tag: string;
  delay?: number;
}

function MetricCard({ label, value, icon: Icon, color, tag, delay = 0 }: MetricCardProps) {
  const numeric = typeof value === "number" ? value : null;
  const counted = useCountUp(numeric ?? 0, 1000);

  const iconBg =
    color === "text-blue-600" ? "bg-blue-50 text-blue-600" :
    color === "text-emerald-600" ? "bg-emerald-50 text-emerald-600" :
    "bg-slate-100 text-slate-600";

  const sparkColor =
    color === "text-blue-600" ? "#3b82f6" :
    color === "text-emerald-600" ? "#10b981" :
    "#94a3b8";

  return (
    <div
      className="group bg-white rounded-2xl border border-slate-100 p-4 flex flex-col justify-between hover:shadow-lg hover:border-slate-200 hover:-translate-y-0.5 transition-all duration-300 cursor-pointer h-full"
      style={{ animationDelay: `${delay}ms` }}
    >
      {/* Top row */}
      <div className="flex items-start justify-between">
        <div className={cn("w-8 h-8 rounded-lg flex items-center justify-center transition-all duration-300 group-hover:scale-110", iconBg)}>
          <Icon size={15} strokeWidth={2} />
        </div>
        <span className="text-[8px] font-bold uppercase tracking-[0.18em] text-slate-400 bg-slate-50 border border-slate-100 px-2 py-0.5 rounded-md">
          {tag}
        </span>
      </div>

      {/* Value */}
      <div className="mt-1">
        <p className={cn("text-2xl font-black tracking-tight leading-none", color)}>
          {numeric !== null ? counted.toLocaleString() : value}
        </p>
        <p className="text-[10px] font-semibold text-slate-400 mt-1 uppercase tracking-wider">{label}</p>
      </div>

      {/* Sparkline */}
      <div className="opacity-50 group-hover:opacity-100 transition-opacity duration-300 my-1">
        <Sparkline color={sparkColor} />
      </div>

      {/* Footer */}
      <div className="flex items-center gap-1.5 text-slate-300 text-[10px] font-semibold group-hover:text-slate-500 transition-colors">
        View details <ArrowUpRight size={11} strokeWidth={2.5} />
      </div>
    </div>
  );
}

// --- Activity item ---
const ACTIVITY_ITEMS = [
  { label: "New parcel registered", time: "2m ago", dot: "bg-emerald-400" },
  { label: "Station #12 updated", time: "14m ago", dot: "bg-blue-400" },
  { label: "Org limit reached", time: "1h ago", dot: "bg-amber-400" },
  { label: "Report generated", time: "3h ago", dot: "bg-slate-300" },
];

export default function AdminOverviewPage() {
  const { data: reportData, isLoading, refetch, isFetching } = useQuery({
    queryKey: ["reports", "admin", "overview"],
    queryFn: async () => {
      const res = await api.get("/reports/admin/overview");
      return res.data.data || res.data;
    },
  });

  const overview = reportData || {
    totalRevenue: 0,
    totalOrganizations: 0,
    totalStations: 0,
    totalParcel: 0,
  };

  const revenue = useCountUp(overview.totalRevenue, 1400);

  if (isLoading) {
    return (
      <div className="h-full bg-transparent flex items-center justify-center">
        <div className="flex flex-col items-center gap-3">
          <div className="w-8 h-8 border-2 border-slate-100 border-t-emerald-500 rounded-full animate-spin" />
          <p className="text-[11px] font-bold text-slate-400 uppercase tracking-widest">Loading</p>
        </div>
      </div>
    );
  }

  const metrics: MetricCardProps[] = [
    { label: "Organizations", value: overview.totalOrganizations, icon: Building2, color: "text-blue-600", tag: "Orgs", delay: 0 },
    { label: "Stations", value: overview.totalStations, icon: MapPin, color: "text-slate-600", tag: "Locations", delay: 80 },
    { label: "Parcels Handled", value: overview.totalParcel, icon: Package2, color: "text-slate-600", tag: "Parcels", delay: 160 },
    { label: "System Health", value: "98.4%", icon: TrendingUp, color: "text-emerald-600", tag: "Performance", delay: 240 },
  ];

  return (
    <div className="h-full flex flex-col overflow-hidden">
      <div className="max-w-[1520px] mx-auto w-full flex-1 flex flex-col gap-4 min-h-0">

        {/* Page Header */}
        <div className="flex-shrink-0 [&_>_div]:!mb-0">
          <ReportPageHeader
            title="Admin Overview"
            subtitle="Platform-wide performance, activity, and revenue at a glance"
            iconName="Globe"
            hideBackArrow={true}
            action={
              <button
                onClick={() => refetch()}
                disabled={isFetching}
                className="h-9 px-4 flex items-center gap-2 bg-white border border-slate-200 text-slate-600 text-[10px] font-black uppercase tracking-widest rounded-[10px] hover:bg-slate-50 transition-all disabled:opacity-50"
              >
                <RefreshCw size={12} strokeWidth={2.5} className={isFetching ? "animate-spin" : ""} />
                Refresh
              </button>
            }
          />
        </div>

        {/* Revenue Hero Strip */}
        <div className="bg-slate-900 rounded-2xl p-4 lg:p-5 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 overflow-hidden relative flex-shrink-0">
          {/* Ambient glows */}
          <div className="absolute inset-0 pointer-events-none overflow-hidden rounded-2xl">
            <div className="absolute -top-20 -left-20 w-72 h-72 bg-emerald-500/10 rounded-full blur-3xl" />
            <div className="absolute -bottom-20 -right-20 w-72 h-72 bg-blue-500/10 rounded-full blur-3xl" />
          </div>

          {/* Revenue figure */}
          <div className="relative z-10">
            <div className="flex items-center gap-2 mb-1">
              <Globe size={11} className="text-slate-500" />
              <p className="text-[9px] font-bold uppercase tracking-[0.25em] text-slate-500">
                Total Revenue
              </p>
            </div>
            <p className="text-3xl lg:text-4xl font-black text-white tracking-tight tabular-nums">
              {new Intl.NumberFormat("en-TZ", {
                style: "currency",
                currency: "TZS",
                maximumFractionDigits: 0,
              }).format(revenue)}
            </p>
            <div className="flex items-center gap-1.5 mt-2 px-2 py-0.5 bg-emerald-500/15 border border-emerald-500/20 rounded-lg w-fit">
              <Zap size={9} className="text-emerald-400" strokeWidth={3} />
              <span className="text-[9px] font-bold text-emerald-400 uppercase tracking-widest">Live data</span>
            </div>
          </div>

          {/* Stats pills */}
          <div className="relative z-10 flex items-center gap-4 bg-white/5 border border-white/10 rounded-xl px-5 py-3">
            <div className="text-center">
              <p className="text-[8px] font-bold uppercase tracking-[0.2em] text-slate-500 mb-0.5">Active Stations</p>
              <p className="text-xl font-black text-white tabular-nums">{overview.totalStations}</p>
            </div>
            <div className="w-px h-8 bg-white/10" />
            <div className="text-center">
              <p className="text-[8px] font-bold uppercase tracking-[0.2em] text-slate-500 mb-0.5">Parcels</p>
              <p className="text-xl font-black text-white tabular-nums">{overview.totalParcel}</p>
            </div>
            <div className="w-px h-8 bg-white/10" />
            <div className="text-center">
              <p className="text-[8px] font-bold uppercase tracking-[0.2em] text-slate-500 mb-0.5">Orgs</p>
              <p className="text-xl font-black text-white tabular-nums">{overview.totalOrganizations}</p>
            </div>
          </div>
        </div>

        {/* Metrics + Activity Panel */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-4 flex-1 min-h-0">

          {/* Metric Cards 2×2 */}
          <div className="lg:col-span-2 grid grid-cols-1 sm:grid-cols-2 gap-4">
            {metrics.map((m, i) => (
              <MetricCard key={i} {...m} />
            ))}
          </div>

          {/* Activity Panel */}
          <div className="bg-white rounded-2xl border border-slate-100 shadow-sm flex flex-col overflow-hidden h-full">
            {/* Panel header */}
            <div className="px-4 py-3 border-b border-slate-50 flex items-center justify-between flex-shrink-0">
              <div>
                <div className="flex items-center gap-2 mb-0.5">
                  <Activity size={12} className="text-blue-500" strokeWidth={2.5} />
                  <span className="text-[9px] font-bold uppercase tracking-[0.2em] text-slate-400">
                    System Activity
                  </span>
                </div>
                <h3 className="text-[13px] font-black text-slate-900">Platform Activity</h3>
              </div>
              <span className="relative flex h-2 w-2">
                <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75" />
                <span className="relative inline-flex rounded-full h-2 w-2 bg-emerald-500" />
              </span>
            </div>

            {/* Chart placeholder */}
            <div className="p-3 flex-shrink-0">
              <div className="h-[90px] rounded-xl bg-slate-50 border border-slate-100 flex flex-col items-center justify-center gap-1 group cursor-pointer hover:bg-slate-100/80 transition-colors">
                <BarChart3 size={20} className="text-slate-200" strokeWidth={1.5} />
                <p className="text-[9px] font-semibold text-slate-300 uppercase tracking-wider">Chart coming soon</p>
              </div>
            </div>

            {/* Activity feed */}
            <div className="px-4 flex-1 divide-y divide-slate-50 overflow-y-auto min-h-0">
              {ACTIVITY_ITEMS.map((item, i) => (
                <div key={i} className="flex items-center justify-between py-2">
                  <div className="flex items-center gap-2">
                    <span className={cn("w-1.5 h-1.5 rounded-full flex-shrink-0", item.dot)} />
                    <span className="text-[11px] font-semibold text-slate-600">{item.label}</span>
                  </div>
                  <span className="text-[9px] font-bold text-slate-300 uppercase tracking-wider">{item.time}</span>
                </div>
              ))}
            </div>

            {/* Download CTA */}
            <div className="p-3 border-t border-slate-50 flex-shrink-0">
              <button className="w-full flex items-center justify-center gap-2 h-9 bg-slate-900 hover:bg-slate-800 text-white rounded-xl font-black text-[9px] uppercase tracking-widest transition-all active:scale-95">
                <Download size={12} strokeWidth={2.5} />
                Download Report
              </button>
            </div>
          </div>
        </div>

        {/* Security Footer Bar */}
        <div className="bg-white border border-slate-100 rounded-2xl px-5 py-3 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 shadow-sm flex-shrink-0">
          <div className="flex items-center gap-3">
            <div className="w-9 h-9 rounded-xl bg-slate-900 flex items-center justify-center text-white flex-shrink-0">
              <Shield size={16} strokeWidth={2} />
            </div>
            <div>
              <h4 className="text-[13px] font-black text-slate-900">Activity &amp; Security</h4>
              <p className="text-[11px] text-slate-400 font-medium mt-0.5 max-w-md leading-normal">
                View key actions and transactions to keep your operations secure and on track.
              </p>
            </div>
          </div>
          <button className="flex items-center gap-2 h-9 px-4 bg-slate-50 hover:bg-slate-100 border border-slate-100 text-slate-600 rounded-xl font-black text-[9px] uppercase tracking-widest transition-all flex-shrink-0">
            View Logs
            <ChevronRight size={12} strokeWidth={2.5} />
          </button>
        </div>

      </div>
    </div>
  );
}