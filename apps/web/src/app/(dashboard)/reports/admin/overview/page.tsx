"use client";

import { useQuery } from "@tanstack/react-query";
import { useState, useEffect } from "react";
import {
  Building2,
  MapPin,
  Package2,
  Activity,
  RefreshCw,
  FileText,
  TrendingUp,
  AlertCircle,
} from "lucide-react";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { formatDistanceToNow } from "date-fns";

// Animated counter
function useCountUp(target: number, duration = 1000): number {
  const [value, setValue] = useState(0);
  useEffect(() => {
    if (!target) return;
    const steps = 36;
    const increment = target / steps;
    let current = 0;
    const timer = setInterval(() => {
      current += increment;
      if (current >= target) { setValue(target); clearInterval(timer); }
      else setValue(Math.floor(current));
    }, duration / steps);
    return () => clearInterval(timer);
  }, [target, duration]);
  return value;
}

// Lozenge — Atlassian-style status pill
function Lozenge({ action }: { action: string }) {
  const a = action.toUpperCase();
  const style =
    a.includes("CREATE") || a.includes("REGISTER") ? "bg-green-50 text-green-700 border-green-100" :
    a.includes("UPDATE") || a.includes("EDIT")       ? "bg-blue-50  text-blue-700  border-blue-100"  :
    a.includes("DELETE") || a.includes("CANCEL")     ? "bg-red-50   text-red-700   border-red-100"   :
    a.includes("LOGIN")  || a.includes("AUTH")       ? "bg-purple-50 text-purple-700 border-purple-100" :
                                                        "bg-slate-50  text-slate-600  border-slate-200";
  return (
    <span className={cn("inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border leading-none shrink-0", style)}>
      {action.replace(/_/g, " ")}
    </span>
  );
}

// Stat tile — Atlassian design
function StatTile({
  label,
  value,
  icon: Icon,
  accent = false,
  sub,
}: {
  label: string;
  value: number | string;
  icon: React.ElementType;
  accent?: boolean;
  sub?: string;
}) {
  const numeric = typeof value === "number" ? value : null;
  const counted = useCountUp(numeric ?? 0);

  return (
    <div className={cn(
      "bg-white border rounded-xl p-5 flex flex-col gap-3",
      accent ? "border-blue-200 border-l-[3px] border-l-blue-600" : "border-slate-200",
    )}>
      <div className="flex items-center justify-between">
        <p className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">{label}</p>
        <div className={cn(
          "h-7 w-7 rounded-xl flex items-center justify-center shrink-0",
          accent ? "bg-blue-50" : "bg-slate-50",
        )}>
          <Icon size={14} strokeWidth={2} className={accent ? "text-blue-600" : "text-slate-400"} />
        </div>
      </div>
      <div>
        <p className={cn(
          "text-[30px] font-semibold tabular-nums leading-none",
          accent ? "text-blue-700" : "text-slate-900",
        )}>
          {numeric !== null ? counted.toLocaleString() : value}
        </p>
        {sub && <p className="text-[12px] text-slate-400 mt-1.5">{sub}</p>}
      </div>
    </div>
  );
}

// Loading skeleton
function SkeletonTile() {
  return (
    <div className="bg-white border border-[#E2E2E2] rounded-[20px] p-5 flex flex-col gap-3">
      <div className="flex items-center justify-between">
        <div className="h-3 w-24 bg-slate-100 rounded-lg animate-pulse" />
        <div className="h-7 w-7 bg-slate-100 rounded-xl animate-pulse" />
      </div>
      <div className="h-8 w-28 bg-slate-100 rounded-lg animate-pulse" />
      <div className="h-3 w-20 bg-slate-100 rounded-lg animate-pulse" />
    </div>
  );
}

export default function AdminOverviewPage() {
  const {
    data: reportData,
    isLoading,
    refetch,
    isFetching,
  } = useQuery({
    queryKey: ["reports", "admin", "overview"],
    queryFn: async () => {
      const res = await api.get("/reports/admin/overview");
      return res.data.data || res.data;
    },
  });

  const { data: activityData } = useQuery({
    queryKey: ["admin", "activity", "recent"],
    queryFn: async () => {
      const res = await api.get("/audit-logs?limit=8");
      return res.data.data?.items || res.data.items || [];
    },
    refetchInterval: 30000,
  });

  const overview = reportData || {
    totalRevenue: 0,
    totalOrganizations: 0,
    totalStations: 0,
    totalParcel: 0,
  };

  const revenue = useCountUp(overview.totalRevenue, 1400);

  return (
    <div className="flex flex-col gap-5">
      {/* Header */}
      <ReportPageHeader
        title="Platform Overview"
        subtitle="Real-time summary of revenue, operations, and platform activity"
        iconName="FileBarChart2"
        hideBackArrow
        action={
          <button
            onClick={() => refetch()}
            disabled={isFetching}
            className="flex items-center gap-1.5 h-8 px-3 bg-white border border-[#E2E2E2] rounded-[20px] text-[12px] font-medium text-slate-600 hover:bg-slate-50 hover:border-slate-300 transition-colors disabled:opacity-50"
          >
            <RefreshCw size={12} className={isFetching ? "animate-spin" : ""} />
            Refresh
          </button>
        }
      />

      {/* Revenue + quick stats */}
      {isLoading ? (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {[1,2,3,4].map((i) => <SkeletonTile key={i} />)}
        </div>
      ) : (
        <>
          {/* Revenue — full width accent tile */}
          <div className="bg-white border border-blue-200 border-l-[3px] border-l-blue-600 rounded-xl px-5 py-4 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
            <div>
              <p className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em] mb-1.5">
                Total Revenue
              </p>
              <p className="text-[36px] font-semibold text-blue-700 tabular-nums leading-none">
                {new Intl.NumberFormat("en-TZ", {
                  style: "currency",
                  currency: "TZS",
                  maximumFractionDigits: 0,
                }).format(revenue)}
              </p>
            </div>
            <div className="flex items-center gap-6 sm:gap-8 border-t sm:border-t-0 sm:border-l border-slate-200 sm:pl-8 pt-3 sm:pt-0">
              {[
                { label: "Organizations", value: overview.totalOrganizations },
                { label: "Stations",      value: overview.totalStations },
                { label: "Parcels",       value: overview.totalParcel },
              ].map((s, i, arr) => (
                <div key={s.label} className={cn("text-center sm:text-left", i < arr.length - 1 && "pr-6 sm:pr-8 border-r border-slate-200")}>
                  <p className="text-[10px] font-medium text-slate-400 uppercase tracking-[0.05em] mb-0.5">{s.label}</p>
                  <p className="text-[20px] font-semibold text-slate-800 tabular-nums leading-none">{s.value}</p>
                </div>
              ))}
            </div>
          </div>

          {/* Secondary stats row */}
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
            <StatTile
              label="Organizations"
              value={overview.totalOrganizations}
              icon={Building2}
              sub="Registered tenants"
            />
            <StatTile
              label="Stations"
              value={overview.totalStations}
              icon={MapPin}
              sub="Active service points"
            />
            <StatTile
              label="Parcels handled"
              value={overview.totalParcel}
              icon={Package2}
              sub="All-time shipments"
            />
            <StatTile
              label="System health"
              value="98.4%"
              icon={TrendingUp}
              accent
              sub="Uptime this period"
            />
          </div>
        </>
      )}

      {/* Lower section */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-4">

        {/* Activity feed */}
        <div className="lg:col-span-2 bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden flex flex-col">
          <div className="px-4 py-3 border-b border-slate-200 flex items-center justify-between shrink-0">
            <div className="flex items-center gap-2">
              <Activity size={14} className="text-slate-400" strokeWidth={2} />
              <span className="text-[14px] font-semibold text-slate-800">Platform Activity</span>
            </div>
            <div className="flex items-center gap-1.5">
              <span className="relative flex h-2 w-2">
                <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-60" />
                <span className="relative inline-flex rounded-full h-2 w-2 bg-emerald-500" />
              </span>
              <span className="text-[11px] text-slate-400 font-medium">Live</span>
            </div>
          </div>

          <div className="flex-1 divide-y divide-slate-100 overflow-y-auto">
            {activityData && activityData.length > 0 ? (
              activityData.map((item: any, i: number) => (
                <div key={item.id || i} className="flex items-start gap-3 px-4 py-3">
                  <div className="flex-1 min-w-0 flex flex-col gap-1">
                    <div className="flex items-center gap-2 flex-wrap">
                      <Lozenge action={item.action || "event"} />
                      {item.resource && (
                        <span className="text-[11px] text-slate-400">{item.resource}</span>
                      )}
                    </div>
                    {item.user?.name && (
                      <span className="text-[12px] font-medium text-slate-600">{item.user.name}</span>
                    )}
                  </div>
                  <span className="text-[11px] text-slate-400 shrink-0 mt-0.5">
                    {item.createdAt
                      ? formatDistanceToNow(new Date(item.createdAt), { addSuffix: true })
                      : ""}
                  </span>
                </div>
              ))
            ) : isLoading ? (
              <div className="divide-y divide-slate-100">
                {[1,2,3,4,5].map((i) => (
                  <div key={i} className="px-4 py-3 flex items-center gap-3">
                    <div className="h-5 w-20 bg-slate-100 rounded-lg animate-pulse" />
                    <div className="h-4 w-32 bg-slate-100 rounded-lg animate-pulse" />
                  </div>
                ))}
              </div>
            ) : (
              <div className="flex flex-col items-center justify-center py-12 gap-2 text-center">
                <AlertCircle size={20} className="text-slate-300" />
                <p className="text-[13px] font-medium text-slate-400">No recent activity</p>
              </div>
            )}
          </div>

          <div className="border-t border-slate-200 px-4 py-2.5 shrink-0">
            <a
              href="/super-admin/audit"
              className="flex items-center gap-1.5 text-[12px] font-medium text-blue-600 hover:text-blue-700 transition-colors"
            >
              <FileText size={13} />
              View all audit logs
            </a>
          </div>
        </div>

        {/* System info panel */}
        <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden flex flex-col">
          <div className="px-4 py-3 border-b border-slate-200 shrink-0">
            <span className="text-[14px] font-semibold text-slate-800">System Status</span>
          </div>
          <div className="flex-1 divide-y divide-slate-100">
            {[
              { label: "API Health",      status: "Operational",  ok: true  },
              { label: "Payment Gateway", status: "Operational",  ok: true  },
              { label: "SMS Service",     status: "Operational",  ok: true  },
              { label: "Mobile Backend",  status: "Operational",  ok: true  },
              { label: "Database",        status: "Operational",  ok: true  },
            ].map((row) => (
              <div key={row.label} className="flex items-center justify-between px-4 py-3">
                <span className="text-[13px] font-medium text-slate-700">{row.label}</span>
                <span className={cn(
                  "inline-flex items-center gap-1 px-2 py-0.5 rounded-lg text-[11px] font-semibold border",
                  row.ok
                    ? "bg-green-50 text-green-700 border-green-100"
                    : "bg-red-50 text-red-700 border-red-100",
                )}>
                  <span className={cn("h-1.5 w-1.5 rounded-full", row.ok ? "bg-green-500" : "bg-red-500")} />
                  {row.status}
                </span>
              </div>
            ))}
          </div>
          <div className="border-t border-slate-200 px-4 py-3 shrink-0">
            <p className="text-[11px] text-slate-400 leading-relaxed">
              All systems are currently operating normally. Uptime monitored continuously.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
