"use client";

import Link from "next/link";
import { useQuery } from "@tanstack/react-query";
import { startOfMonth } from "date-fns";
import { MapPin, PauseCircle, Send, Trophy } from "lucide-react";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";

const num = (n?: number) => Math.round(n || 0).toLocaleString("en-US");

/** Stations overview: network summary + one card per station with this month's activity. */
export function StationsOverview({ stations: stationsProp, onViewAll }: { stations: any[]; onViewAll?: () => void }) {
  const monthStart = startOfMonth(new Date()).toISOString();

  const { data, isLoading: reportLoading } = useQuery({
    queryKey: ["reports", "stations", "overview-month"],
    queryFn: async () => (await api.get("/reports/stations", { params: { dateFrom: monthStart } })).data?.data,
  });

  // Newer API: per-station sent/arriving/waiting/revenue. Older builds only
  // return totals matched by address, so fall back to counting this month's
  // parcels by their origin/destination station.
  const hasActivity = Array.isArray(data?.stations) && data.stations.some((r: any) => "sent" in r);
  const { data: monthParcels, isLoading: parcelsLoading } = useQuery({
    queryKey: ["reports", "parcel", "overview-month-fallback"],
    queryFn: async () =>
      ((await api.get("/reports/parcel", { params: { dateFrom: monthStart, limit: 2000 } })).data?.data?.parcel ?? []) as any[],
    enabled: !!data && !hasActivity,
  });
  const isLoading = reportLoading || (!hasActivity && parcelsLoading);

  const activity = new Map<string, any>();
  if (hasActivity) {
    for (const r of data.stations) activity.set(r.id, r);
  } else {
    const row = (id: string, name: string) => {
      const r = activity.get(id) ?? { id, name, sent: 0, arriving: 0, waiting: 0, revenue: 0 };
      activity.set(id, r);
      return r;
    };
    for (const p of monthParcels ?? []) {
      const meta = p.additionalServices && typeof p.additionalServices === "object" ? p.additionalServices : {};
      const isPaid = p.payment?.status === "SUCCESS" || meta.paymentStatus === "PAID" || p.paymentStatus === "PAID";
      // Older builds return origin/destination without an id — match by name.
      const fromKey = p.origin?.id ?? p.origin?.name ?? p.fromStation;
      const toKey = p.destination?.id ?? p.destination?.name ?? p.toStation;
      if (fromKey) {
        const r = row(fromKey, p.origin?.name ?? p.fromStation);
        r.sent += 1;
        if (isPaid) r.revenue += p.amount || p.totalPrice || 0;
      }
      if (toKey) {
        const r = row(toKey, p.destination?.name ?? p.toStation);
        r.arriving += 1;
        if (p.status === "OFFLOADED" || p.status === "AT_STATION") r.waiting += 1;
      }
    }
  }

  // Station list: the page's list, else the report's own list, else what the parcels touched.
  const stations: any[] = stationsProp.length
    ? stationsProp
    : (data?.stations ?? []).length
      ? data.stations.map((r: any) => ({ id: r.id, name: r.name, code: r.code, isActive: r.isActive ?? true }))
      : [...activity.values()].map((r) => ({ id: r.id, name: r.name, isActive: true }));

  const total = stations.length;
  const active = stations.filter((s) => s.isActive !== false).length;
  const totalParcels = hasActivity ? data?.summary?.totalParcels ?? 0 : (monthParcels ?? []).length;
  const totalRevenue = [...activity.values()].reduce((n, r) => n + (r.revenue || 0), 0);

  // Only stations that moved parcels this month, busiest first.
  const actOf = (st: any) => activity.get(st.id) ?? activity.get(st.name);
  const moved = (st: any) => {
    const a = actOf(st);
    return a ? (a.sent || 0) + (a.arriving || 0) : 0;
  };
  const cards = stations.filter((st) => moved(st) > 0).sort((a, b) => moved(b) - moved(a));
  const busiest = cards[0] ? { name: cards[0].name } : null;
  const quiet = stations.length - cards.length;

  return (
    <div className="flex flex-col gap-5">
      <section className="bridge-card p-6">
        <div className="flex flex-wrap items-start justify-between gap-4">
          <div>
            <p className="text-[14px] text-white/70">Stations</p>
            <p className="text-[30px] sm:text-[40px] font-semibold leading-none tabular-nums">{num(total)}</p>
            <p className="mt-1.5 text-[13px] text-white/60">
              {num(active)} open · {num(total - active)} closed
            </p>
          </div>
          {busiest && <span className="accent-pill">Busiest this month: {busiest.name}</span>}
        </div>
        <div className="mt-5 grid grid-cols-2 gap-3 md:grid-cols-4">
          {[
            { label: "Open", value: num(active), icon: MapPin },
            { label: "Closed", value: num(total - active), icon: PauseCircle },
            { label: "Parcels this month", value: isLoading ? "…" : num(totalParcels), icon: Send },
            { label: "Revenue this month", value: isLoading ? "…" : `TSh ${num(totalRevenue)}`, icon: Trophy },
          ].map((c) => (
            <div key={c.label} className="flex items-center gap-3 rounded-2xl border border-white/15 bg-white/10 px-3.5 py-2.5 backdrop-blur-md">
              <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-white/15">
                <c.icon size={17} className="text-orange-300" />
              </span>
              <div className="min-w-0">
                <p className="truncate text-[12px] text-white/60">{c.label}</p>
                <p className="truncate text-[18px] font-semibold leading-tight tabular-nums">{c.value}</p>
              </div>
            </div>
          ))}
        </div>
      </section>

      <section className="overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white">
        <div className="flex flex-wrap items-center justify-between gap-3 border-b border-slate-100 px-5 py-4">
          <div>
            <h2 className="text-[17px] font-semibold text-[#1C1C1E]">Station activity this month</h2>
            <p className="text-[13px] text-slate-500">
              {isLoading
                ? "Loading…"
                : cards.length
                  ? `${cards.length} with parcel movement${quiet ? ` · ${quiet} quiet` : ""}`
                  : "No parcel movement yet this month"}
            </p>
          </div>
          <div className="flex items-center gap-2">
            {onViewAll && (
              <button
                onClick={onViewAll}
                className="h-10 rounded-full border border-[#E2E2E2] bg-white px-4 text-[13px] font-semibold text-[#5C0B19] transition hover:border-[#5C0B19]/30 hover:bg-[#FBF1F2]"
              >
                Manage stations
              </button>
            )}
            <Link
              href="/reports/stations"
              className="flex h-10 items-center rounded-full bg-[#5C0B19] px-4 text-[13px] font-semibold text-white transition hover:bg-[#4F0A0C]"
            >
              Full report
            </Link>
          </div>
        </div>

        {isLoading ? (
          <div className="grid gap-5 p-5 lg:grid-cols-2">
            <div className="h-64 animate-pulse rounded-[20px] bg-slate-100" />
            <div className="h-64 animate-pulse rounded-[20px] bg-slate-100" />
          </div>
        ) : cards.length === 0 ? (
          <div className="flex flex-col items-center px-6 py-12 text-center">
            <span className="flex h-16 w-16 items-center justify-center rounded-full bg-orange-50">
              <MapPin size={26} className="text-orange-500" />
            </span>
            <p className="mt-4 text-[17px] font-semibold text-[#1C1C1E]">No parcel movement yet</p>
            <p className="mt-1 text-[14px] text-slate-500">Stations appear here once they send or receive parcels this month.</p>
          </div>
        ) : (
          <>
            <div className="grid gap-4 p-5 sm:grid-cols-2 xl:grid-cols-4">
              {cards.slice(0, 8).map((st) => {
                const a = actOf(st);
                const waiting = a?.waiting ?? 0;
                return (
                  <Link
                    key={st.id}
                    href="/reports/stations"
                    className="group flex flex-col rounded-[24px] border border-[#E2E2E2] bg-white p-5 text-left transition hover:border-orange-300 hover:shadow-premium"
                  >
                    <div className="flex items-start justify-between">
                      <span className="flex h-12 w-12 items-center justify-center rounded-2xl bg-orange-50">
                        <MapPin size={22} className="text-orange-500" />
                      </span>
                      <span className="rounded-full bg-orange-500 px-2.5 py-0.5 text-[13px] font-semibold tabular-nums text-white">
                        {num(moved(st))}
                      </span>
                    </div>
                    <p className="mt-4 truncate text-[16px] font-semibold text-[#1C1C1E]">{st.name}</p>
                    <p className="mt-0.5 text-[13px] text-slate-500">
                      {num(a?.sent)} sent · {num(a?.arriving)} arriving
                      {waiting > 0 && (
                        <>
                          {" · "}
                          <span className="font-semibold text-amber-600">{num(waiting)} waiting</span>
                        </>
                      )}
                    </p>
                    <p className="mt-3 text-[12px] text-slate-400">
                      {a?.revenue ? `TSh ${num(a.revenue)} this month` : "No revenue yet"}
                      {!st.isActive ? " · Closed" : ""}
                    </p>
                  </Link>
                );
              })}
            </div>
            {cards.length > 8 && (
              <div className="border-t border-slate-100 px-5 py-3.5">
                <Link href="/reports/stations" className="text-[13px] font-semibold text-[#5C0B19] hover:underline">
                  See all {cards.length} active stations
                </Link>
              </div>
            )}
          </>
        )}
      </section>
    </div>
  );
}

export default StationsOverview;
