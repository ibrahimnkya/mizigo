"use client";

import { useQuery } from "@tanstack/react-query";
import Link from "next/link";
import { useSession } from "next-auth/react";
import { useState, useEffect } from "react";
import { Activity, ArrowRight, Building2, MapPin, Package, RefreshCw, TriangleAlert, Users } from "lucide-react";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";
import { trackingNote } from "@/lib/tracking-note";
import { ParcelDetailSheet } from "@/components/parcel/parcel-detail-sheet";
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

type Period = "today" | "week" | "month" | "year" | "all";
const PERIODS: { key: Period; label: string; compare: string }[] = [
  { key: "today", label: "Today", compare: "yesterday" },
  { key: "week", label: "This week", compare: "last week" },
  { key: "month", label: "This month", compare: "last month" },
  { key: "year", label: "This year", compare: "last year" },
  { key: "all", label: "All time", compare: "" },
];

function periodStart(p: Period): Date | null {
  const d = new Date();
  d.setHours(0, 0, 0, 0);
  if (p === "today") return d;
  if (p === "week") {
    d.setDate(d.getDate() - ((d.getDay() + 6) % 7)); // Monday
    return d;
  }
  if (p === "month") return new Date(d.getFullYear(), d.getMonth(), 1);
  if (p === "year") return new Date(d.getFullYear(), 0, 1);
  return null;
}

function Trend({ now, before }: { now: number; before: number | undefined }) {
  if (before === undefined) return null;
  if (!before) return now ? <span className="text-[12px] text-white/70">New this period</span> : null;
  const pct = Math.round(((now - before) / before) * 100);
  return (
    <span className={cn("rounded-full px-2 py-0.5 text-[12px] font-semibold", pct >= 0 ? "bg-white/15" : "bg-black/20")}>
      {pct >= 0 ? "▲" : "▼"} {Math.abs(pct)}%
    </span>
  );
}

export default function AdminOverviewPage() {
  const [period, setPeriod] = useState<Period>("month");
  const [openParcel, setOpenParcel] = useState<any | null>(null);
  const {
    data: reportData,
    isLoading,
    refetch,
    isFetching,
  } = useQuery({
    queryKey: ["reports", "admin", "overview", period],
    queryFn: async () => {
      const start = periodStart(period);
      const params = start ? `?from=${start.toISOString()}&to=${new Date().toISOString()}` : "";
      const res = await api.get(`/reports/admin/overview${params}`);
      return res.data.data || res.data;
    },
  });
  const periodMeta = PERIODS.find((p) => p.key === period)!;

  const { data: activityData, isLoading: activityLoading } = useQuery({
    queryKey: ["dashboard", "parcel-activity"],
    queryFn: async () => {
      const res = await api.get("/reports/parcel-activity?limit=12");
      const body = res.data?.data ?? res.data;
      return Array.isArray(body) ? body : [];
    },
    refetchInterval: 30000,
  });

  const overview = reportData || {
    totalRevenue: 0,
    totalOrganizations: 0,
    totalStations: 0,
    totalParcel: 0,
    totalUsers: 0,
    statusCounts: {},
    previous: null,
  } as any;

  const revenue = useCountUp(overview.totalRevenue, 1400);

  const { data: session } = useSession();
  const firstName = ((session?.user as any)?.name || "").split(" ")[0];
  const isSuperAdmin = (session?.user as any)?.role === "SUPER_ADMIN";
  const hour = new Date().getHours();
  const greeting = hour < 12 ? "Good morning" : hour < 17 ? "Good afternoon" : "Good evening";
  const fmt = (n: number) => Number(n || 0).toLocaleString("en-US");

  const stats = [
    { label: period === "all" ? "Parcels" : `Parcels · ${periodMeta.label.toLowerCase()}`, value: overview.totalParcel, icon: Package },
    { label: "Stations", value: overview.totalStations, icon: MapPin },
    { label: "Organizations", value: overview.totalOrganizations, icon: Building2 },
    { label: "Active users", value: overview.totalUsers ?? 0, icon: Users },
  ];

  // Status breakdown comes from /reports/admin/overview. Older API versions
  // don't send it — show "—" then rather than misleading zeros.
  const hasBreakdown = !!reportData?.statusCounts;
  const sc: Record<string, number> = overview.statusCounts ?? {};
  const pipeline = [
    { label: "Received", value: (sc.RECEIVED ?? 0) + (sc.PENDING ?? 0) + (sc.APPROVED ?? 0) + (sc.PAID ?? 0), image: "/brand/staff_receive.png", href: "/parcel/received" },
    { label: "On the way", value: (sc.DISPATCHED ?? 0) + (sc.IN_TRANSIT ?? 0), image: "/brand/staff_parcel.png", href: "/parcel/dispatched" },
    { label: "Waiting for pickup", value: (sc.OFFLOADED ?? 0) + (sc.AT_STATION ?? 0), image: "/brand/staff_parcel.png", href: "/parcel/offloaded" },
    { label: "Delivered", value: sc.DELIVERED ?? 0, image: "/brand/staff_deliver.png", href: "/parcel/delivered" },
    { label: "Problems", value: (sc.LOST ?? 0) + (sc.DELAYED ?? 0) + (sc.CANCELED ?? 0), image: "", href: "/parcel/lost" },
  ];

  const actions = [
    { title: "Parcels", text: "Every parcel by status", href: "/parcel", image: "/brand/staff_parcel.png" },
    { title: "Reports", text: "Detailed business reports", href: "/reports", image: "/brand/staff_reports.png" },
    { title: "Payments", text: "All transactions", href: "/admin/payments", image: "/brand/staff_receive.png" },
    { title: "Stations", text: "Stations and service points", href: isSuperAdmin ? "/super-admin/stations" : "/admin/stations", image: "/brand/staff_deliver.png" },
  ];

  const STATUS_TONE: Record<string, { label: string; tone: string }> = {
    PENDING: { label: "Requested", tone: "bg-slate-100 text-slate-600" },
    RECEIVED: { label: "Received", tone: "bg-[#FBF1F2] text-[#5C0B19]" },
    DISPATCHED: { label: "Dispatched", tone: "bg-orange-50 text-orange-700" },
    IN_TRANSIT: { label: "On the way", tone: "bg-orange-50 text-orange-700" },
    OFFLOADED: { label: "Offloaded", tone: "bg-amber-50 text-amber-700" },
    AT_STATION: { label: "At station", tone: "bg-amber-50 text-amber-700" },
    DELIVERED: { label: "Delivered", tone: "bg-emerald-50 text-emerald-700" },
    CANCELED: { label: "Cancelled", tone: "bg-slate-100 text-slate-600" },
    LOST: { label: "Lost", tone: "bg-rose-50 text-rose-700" },
    DELAYED: { label: "Delayed", tone: "bg-rose-50 text-rose-700" },
  };

  return (
    <div className="flex flex-col gap-4 lg:h-full lg:min-h-0">
      {/* Hero */}
      <section className="bridge-card shrink-0 p-5 md:px-7 md:py-6">
        <div className="flex flex-wrap items-start justify-between gap-4">
          <div>
            <p className="text-[14px] text-white/70">
              {greeting}
              {firstName ? `, ${firstName}` : ""} · Revenue {periodMeta.label.toLowerCase()}
            </p>
            {isLoading ? (
              <div className="mt-2 h-10 w-60 animate-pulse rounded-xl bg-white/15" />
            ) : (
              <div className="mt-1 flex flex-wrap items-center gap-3">
                <p className="text-[30px] sm:text-[38px] font-semibold leading-none tabular-nums">TSh {fmt(revenue)}</p>
                <Trend now={overview.totalRevenue} before={overview.previous?.totalRevenue} />
              </div>
            )}
            {overview.previous && (
              <p className="mt-1.5 text-[13px] text-white/55">
                vs TSh {fmt(overview.previous.totalRevenue)} {periodMeta.compare}
              </p>
            )}
          </div>
          <div className="flex flex-wrap items-center gap-2">
            <div className="flex flex-wrap gap-1 rounded-full bg-white/10 p-1">
              {PERIODS.map((p) => (
                <button
                  key={p.key}
                  onClick={() => setPeriod(p.key)}
                  className={cn(
                    "rounded-full px-3.5 py-1.5 text-[13px] font-semibold transition",
                    period === p.key ? "bg-orange-500 text-white" : "text-white/70 hover:text-white",
                  )}
                >
                  {p.label}
                </button>
              ))}
            </div>
            <button
              onClick={() => refetch()}
              disabled={isFetching}
              aria-label="Refresh"
              className="flex h-10 w-10 items-center justify-center rounded-full bg-white/10 transition hover:bg-white/20 disabled:opacity-60"
            >
              <RefreshCw size={15} className={isFetching ? "animate-spin" : ""} />
            </button>
          </div>
        </div>

        <div className="mt-5 grid grid-cols-2 gap-3 md:grid-cols-4">
          {stats.map((st) => (
            <div
              key={st.label}
              className="flex items-center gap-3 rounded-2xl border border-white/15 bg-white/10 px-3.5 py-2.5 backdrop-blur-md"
            >
              <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-white/15">
                <st.icon size={17} className="text-orange-300" />
              </span>
              <div className="min-w-0">
                <p className="truncate text-[12px] text-white/60">{st.label}</p>
                {isLoading ? (
                  <div className="mt-1 h-5 w-12 animate-pulse rounded-lg bg-white/15" />
                ) : (
                  <p className="text-[20px] font-semibold leading-tight tabular-nums">{fmt(st.value)}</p>
                )}
              </div>
            </div>
          ))}
        </div>
      </section>

      {/* Parcels in the period, by where they are now */}
      <div className="grid shrink-0 grid-cols-2 gap-3 md:grid-cols-5">
        {pipeline.map((p) => (
          <Link
            key={p.label}
            href={p.href}
            className="flex items-center gap-3 rounded-[20px] border border-[#E2E2E2] bg-white p-3.5 transition hover:-translate-y-0.5 hover:shadow-premium"
          >
            <span className={cn("flex h-11 w-11 shrink-0 items-center justify-center rounded-2xl", p.image ? "bg-orange-50" : "bg-rose-50")}>
              {p.image ? (
                // eslint-disable-next-line @next/next/no-img-element
                <img src={p.image} alt="" className="h-8 w-8 object-contain" />
              ) : (
                <TriangleAlert size={20} className="text-rose-500" />
              )}
            </span>
            <span className="min-w-0">
              <span className="block truncate text-[12px] text-slate-500">{p.label}</span>
              {isLoading ? (
                <span className="mt-1 block h-6 w-10 animate-pulse rounded-lg bg-slate-100" />
              ) : !hasBreakdown ? (
                <span className="block text-[22px] font-semibold leading-tight text-slate-300">—</span>
              ) : p.value === 0 ? (
                <span className="block text-[15px] font-medium text-slate-400">None</span>
              ) : (
                <span className="block text-[22px] font-semibold leading-tight tabular-nums text-[#1C1C1E]">{fmt(p.value)}</span>
              )}
            </span>
          </Link>
        ))}
      </div>

      <div className="grid gap-4 lg:min-h-0 lg:flex-1 lg:grid-cols-[minmax(0,1fr)_400px]">
        {/* Quick actions */}
        <div className="grid grid-cols-1 gap-3 sm:grid-cols-2 lg:grid-rows-2">
          {actions.map((a) => (
            <Link
              key={a.title}
              href={a.href}
              className="group flex items-center gap-4 rounded-[24px] border border-[#E2E2E2] bg-white p-5 transition hover:-translate-y-0.5 hover:shadow-premium"
            >
              <span className="flex h-14 w-14 shrink-0 items-center justify-center rounded-2xl bg-orange-50">
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img src={a.image} alt="" className="h-10 w-10 object-contain transition-transform group-hover:scale-110" />
              </span>
              <span className="min-w-0 flex-1">
                <span className="block text-[16px] font-semibold text-[#1C1C1E]">{a.title}</span>
                <span className="block text-[13px] text-slate-500">{a.text}</span>
              </span>
              <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-slate-100 text-slate-500 transition group-hover:bg-orange-500 group-hover:text-white">
                <ArrowRight size={16} />
              </span>
            </Link>
          ))}
        </div>

        {/* Recent parcel activity */}
        <div className="flex min-h-[320px] flex-col overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white lg:min-h-0">
          <div className="flex shrink-0 items-center justify-between border-b border-slate-100 px-5 py-3.5">
            <h2 className="text-[16px] font-semibold text-[#1C1C1E]">Recent parcel activity</h2>
            <Link href="/parcel" className="text-[13px] font-semibold text-orange-600 hover:text-orange-700">
              All parcels
            </Link>
          </div>
          <div className="min-h-0 flex-1 overflow-y-auto">
            {activityLoading ? (
              <div className="space-y-3 p-5">
                {[1, 2, 3, 4].map((n) => (
                  <div key={n} className="h-12 animate-pulse rounded-2xl bg-slate-100" />
                ))}
              </div>
            ) : activityData && activityData.length > 0 ? (
              <ul className="divide-y divide-slate-100">
                {activityData.map((e: any) => {
                  const tone = STATUS_TONE[e.status] ?? { label: e.status, tone: "bg-slate-100 text-slate-600" };
                  const note = trackingNote(e);
                  return (
                    <li key={e.id}>
                      <button
                        type="button"
                        onClick={() => e.parcel?.id && setOpenParcel({ id: e.parcel.id, trackingNumber: e.parcel.trackingNumber })}
                        className="flex w-full items-start gap-3 px-5 py-3 text-left transition hover:bg-slate-50"
                      >
                        <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-xl bg-orange-50">
                          {/* eslint-disable-next-line @next/next/no-img-element */}
                          <img src="/brand/staff_parcel.png" alt="" className="h-6 w-6 object-contain" />
                        </span>
                        <span className="min-w-0 flex-1">
                          <span className="flex items-center gap-2">
                            <span className="text-[14px] font-semibold tracking-wide text-[#1C1C1E]">
                              {e.parcel?.trackingNumber ?? "Parcel"}
                            </span>
                            <span className={cn("rounded-full px-2 py-0.5 text-[11px] font-semibold", tone.tone)}>
                              {tone.label}
                            </span>
                          </span>
                          <span className="block truncate text-[13px] text-slate-500">
                            {note || [e.parcel?.from, e.parcel?.to].filter(Boolean).join(" → ")}
                          </span>
                        </span>
                        <span className="shrink-0 text-[12px] text-slate-400">
                          {e.timestamp ? formatDistanceToNow(new Date(e.timestamp), { addSuffix: true }) : ""}
                        </span>
                      </button>
                    </li>
                  );
                })}
              </ul>
            ) : (
              <div className="flex h-full flex-col items-center justify-center px-6 py-10 text-center">
                <span className="flex h-14 w-14 items-center justify-center rounded-full bg-orange-50">
                  <Activity size={24} className="text-orange-500" />
                </span>
                <p className="mt-3 text-[15px] font-semibold text-[#1C1C1E]">No parcel activity yet</p>
                <p className="mt-1 text-[13px] text-slate-500">Received, dispatched and delivered parcels will show here.</p>
              </div>
            )}
          </div>
        </div>
      </div>
      <ParcelDetailSheet parcel={openParcel} onClose={() => setOpenParcel(null)} />
    </div>
  );
}
