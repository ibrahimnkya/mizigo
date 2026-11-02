"use client";

import { useMemo, useState } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import { formatDistanceToNow } from "date-fns";
import { toast } from "sonner";
import { Loader2, Package, Search, ShieldCheck, TrainFront, Wrench, X } from "lucide-react";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";
import { useFleet } from "@/modules/fleet/use-fleet";
import { DataTable } from "@/components/shared/data-table";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { CreateVehicleModal } from "./create-vehicle-modal";

const STATUS: Record<string, { label: string; tone: string; dot: string }> = {
  ACTIVE: { label: "In service", tone: "bg-emerald-50 text-emerald-700", dot: "bg-emerald-500" },
  MAINTENANCE: { label: "Maintenance", tone: "bg-amber-50 text-amber-700", dot: "bg-amber-500" },
  INACTIVE: { label: "Out of service", tone: "bg-slate-100 text-slate-600", dot: "bg-slate-400" },
};
const statusOf = (s?: string) => STATUS[s ?? "ACTIVE"] ?? { label: s ?? "—", tone: "bg-slate-100 text-slate-600", dot: "bg-slate-400" };

/** Trains & wagons page body, shared by the admin and super-admin routes. */
export function FleetView({ showOrganization = false }: { showOrganization?: boolean }) {
  const router = useRouter();
  const searchParams = useSearchParams();
  const tab = (searchParams.get("tab") || "overview").toLowerCase();
  const queryClient = useQueryClient();
  const { data: fleet, isLoading } = useFleet();
  const wagons: any[] = Array.isArray(fleet) ? fleet : fleet?.data || [];
  const [query, setQuery] = useState("");
  const [status, setStatus] = useState("");

  const setWagonStatus = useMutation({
    mutationFn: async ({ id, next }: { id: string; next: string }) => (await api.patch("/fleet", { id, status: next })).data,
    onSuccess: (_d, v) => {
      queryClient.invalidateQueries({ queryKey: ["fleet-registry"] });
      toast.success(v.next === "MAINTENANCE" ? "Marked as in maintenance" : "Back in service");
    },
    onError: (e: any) => toast.error(e?.response?.data?.error?.message || "Couldn't update the wagon"),
  });

  // Stats per wagon type — scales to any fleet size.
  const typeStats = useMemo(() => {
    const m = new Map<string, { type: string; total: number; active: number; maintenance: number; parcels: number; guards: number }>();
    for (const w of wagons) {
      const t = w.type || "Other";
      const r = m.get(t) ?? { type: t, total: 0, active: 0, maintenance: 0, parcels: 0, guards: 0 };
      r.total += 1;
      if ((w.status ?? "ACTIVE") === "ACTIVE") r.active += 1;
      if (w.status === "MAINTENANCE") r.maintenance += 1;
      r.parcels += w._count?.parcels ?? 0;
      r.guards += w._count?.guards ?? 0;
      m.set(t, r);
    }
    return [...m.values()].sort((a, b) => b.total - a.total);
  }, [wagons]);

  const counts = useMemo(() => {
    const byType = new Map<string, number>();
    let active = 0;
    let maintenance = 0;
    let parcels = 0;
    let guards = 0;
    for (const w of wagons) {
      guards += w._count?.guards ?? 0;
      byType.set(w.type || "Other", (byType.get(w.type || "Other") ?? 0) + 1);
      if ((w.status ?? "ACTIVE") === "ACTIVE") active += 1;
      if (w.status === "MAINTENANCE") maintenance += 1;
      parcels += w._count?.parcels ?? 0;
    }
    return { byType: [...byType.entries()].sort((a, b) => b[1] - a[1]), active, maintenance, parcels, guards };
  }, [wagons]);

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    return wagons.filter(
      (w) =>
        (!status || (w.status ?? "ACTIVE") === status) &&
        (!q || [w.plateNumber, w.type, w.class, w.carrier, w.organization?.name].some((v) => String(v ?? "").toLowerCase().includes(q))),
    );
  }, [wagons, query, status]);

  const columns = [
    {
      header: "Wagon",
      accessor: (w: any) => (
        <div className="flex items-center gap-3">
          <span className="flex h-10 w-10 shrink-0 items-center justify-center rounded-2xl bg-orange-50">
            <TrainFront size={18} className="text-orange-500" />
          </span>
          <div>
            <p className="text-[14px] font-semibold tracking-wide text-[#1C1C1E]">{w.plateNumber}</p>
            <p className="text-[12px] text-slate-400">{[w.type, w.class].filter(Boolean).join(" · ") || "Wagon"}</p>
          </div>
        </div>
      ),
    },
    {
      header: showOrganization ? "Organization" : "Carrier",
      accessor: (w: any) => (
        <span className="text-[13px] text-slate-700">{(showOrganization ? w.organization?.name : w.carrier) || "—"}</span>
      ),
    },
    {
      header: "Parcels carried",
      align: "right" as const,
      accessor: (w: any) => <span className="tabular-nums">{(w._count?.parcels ?? 0).toLocaleString("en-US")}</span>,
    },
    {
      header: "Guards",
      align: "right" as const,
      accessor: (w: any) => <span className="tabular-nums">{w._count?.guards ?? 0}</span>,
    },
    {
      header: "Last maintenance",
      accessor: (w: any) => (
        <span className="text-[13px] text-slate-500">
          {w.lastMaintenance ? formatDistanceToNow(new Date(w.lastMaintenance), { addSuffix: true }) : "Not recorded"}
        </span>
      ),
    },
    {
      header: "Status",
      accessor: (w: any) => {
        const s = statusOf(w.status);
        return (
          <span className={cn("inline-flex items-center gap-1.5 rounded-full px-2.5 py-1 text-[12px] font-semibold", s.tone)}>
            <span className={cn("h-1.5 w-1.5 rounded-full", s.dot)} />
            {s.label}
          </span>
        );
      },
    },
    {
      header: "",
      align: "right" as const,
      accessor: (w: any) => {
        const inMaintenance = w.status === "MAINTENANCE";
        const busy = setWagonStatus.isPending && setWagonStatus.variables?.id === w.id;
        return (
          <button
            onClick={() => setWagonStatus.mutate({ id: w.id, next: inMaintenance ? "ACTIVE" : "MAINTENANCE" })}
            disabled={busy}
            className={cn(
              "inline-flex h-9 items-center gap-1.5 rounded-full px-4 text-[13px] font-semibold transition disabled:opacity-60",
              inMaintenance
                ? "bg-[#5C0B19] text-white hover:bg-[#4F0A0C]"
                : "border border-[#E2E2E2] bg-white text-[#5C0B19] hover:border-[#5C0B19]/30 hover:bg-[#FBF1F2]",
            )}
          >
            {busy ? <Loader2 size={14} className="animate-spin" /> : inMaintenance ? <ShieldCheck size={14} /> : <Wrench size={14} />}
            {inMaintenance ? "Back in service" : "Maintenance"}
          </button>
        );
      },
    },
  ];

  return (
    <div className="flex flex-col gap-5 pb-4">
      <ReportPageHeader
        title="Trains & wagons"
        subtitle="Wagons that carry parcels on the SGR"
        iconName="TrainFront"
        hideBackArrow
        action={<CreateVehicleModal />}
        tabs={["Overview", "All wagons"]}
        tabParamName="tab"
        activeTab={tab === "all wagons" ? "All wagons" : "Overview"}
      />

      {tab !== "all wagons" ? (
        <>
          {/* Summary */}
          <section className="bridge-card p-6">
            <div className="flex flex-wrap items-start justify-between gap-4">
              <div>
                <p className="text-[14px] text-white/70">Wagons</p>
                <p className="text-[40px] font-semibold leading-none tabular-nums">{isLoading ? "…" : wagons.length}</p>
                <p className="mt-1.5 text-[13px] text-white/60">
                  {counts.byType.map(([t, n]) => `${t} ${n}`).join(" · ") || "No wagons registered yet"}
                </p>
              </div>
              {counts.maintenance > 0 ? (
                <span className="accent-pill">{counts.maintenance} in maintenance</span>
              ) : wagons.length > 0 ? (
                <span className="inline-flex items-center gap-1.5 rounded-full bg-white/15 px-3 py-1 text-xs font-semibold">
                  <ShieldCheck size={13} /> All in service
                </span>
              ) : null}
            </div>
            <div className="mt-5 grid grid-cols-2 gap-3 md:grid-cols-4">
              {[
                { label: "In service", value: counts.active, icon: ShieldCheck },
                { label: "In maintenance", value: counts.maintenance, icon: Wrench },
                { label: "Parcels carried", value: counts.parcels, icon: Package },
                { label: "Guards assigned", value: counts.guards, icon: TrainFront },
              ].map((c) => (
                <div key={c.label} className="flex items-center gap-3 rounded-2xl border border-white/15 bg-white/10 px-3.5 py-2.5 backdrop-blur-md">
                  <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-white/15">
                    <c.icon size={17} className="text-orange-300" />
                  </span>
                  <div className="min-w-0">
                    <p className="truncate text-[12px] text-white/60">{c.label}</p>
                    <p className="text-[20px] font-semibold leading-tight tabular-nums">{isLoading ? "…" : c.value.toLocaleString("en-US")}</p>
                  </div>
                </div>
              ))}
            </div>
          </section>

          {/* By type */}
          <section className="overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white">
            <div className="flex flex-wrap items-center justify-between gap-3 border-b border-slate-100 px-5 py-4">
              <div>
                <h2 className="text-[17px] font-semibold text-[#1C1C1E]">Fleet by type</h2>
                <p className="text-[13px] text-slate-500">
                  {typeStats.length ? `${typeStats.length} wagon types` : "No wagons registered yet"}
                </p>
              </div>
              <button
                onClick={() => router.push("?tab=all+wagons")}
                className="h-10 rounded-full bg-[#5C0B19] px-4 text-[13px] font-semibold text-white transition hover:bg-[#4F0A0C]"
              >
                All wagons
              </button>
            </div>

            {isLoading ? (
              <div className="grid gap-4 p-5 sm:grid-cols-2 xl:grid-cols-3">
                {[1, 2, 3].map((n) => (
                  <div key={n} className="h-[190px] animate-pulse rounded-[20px] bg-slate-100" />
                ))}
              </div>
            ) : typeStats.length === 0 ? (
              <div className="flex flex-col items-center px-6 py-12 text-center">
                <span className="flex h-16 w-16 items-center justify-center rounded-full bg-orange-50">
                  <TrainFront size={26} className="text-orange-500" />
                </span>
                <p className="mt-4 text-[17px] font-semibold text-[#1C1C1E]">No wagons yet</p>
                <p className="mt-1 text-[14px] text-slate-500">Add a wagon to start loading parcels onto trains.</p>
              </div>
            ) : (
              <div className="grid gap-4 p-5 sm:grid-cols-2 xl:grid-cols-4">
                {typeStats.map((t) => (
                  <button
                    key={t.type}
                    onClick={() => router.push("?tab=all+wagons")}
                    className="group flex flex-col rounded-[24px] border border-[#E2E2E2] bg-white p-5 text-left transition hover:border-orange-300 hover:shadow-premium"
                  >
                    <div className="flex items-start justify-between">
                      <span className="flex h-12 w-12 items-center justify-center rounded-2xl bg-orange-50">
                        <TrainFront size={22} className="text-orange-500" />
                      </span>
                      <span className="rounded-full bg-orange-500 px-2.5 py-0.5 text-[13px] font-semibold tabular-nums text-white">
                        {t.total.toLocaleString("en-US")}
                      </span>
                    </div>
                    <p className="mt-4 text-[16px] font-semibold text-[#1C1C1E]">{t.type}</p>
                    <p className="mt-0.5 text-[13px] text-slate-500">
                      {t.maintenance ? (
                        <>
                          {t.active.toLocaleString("en-US")} in service ·{" "}
                          <span className="font-semibold text-amber-600">{t.maintenance.toLocaleString("en-US")} in maintenance</span>
                        </>
                      ) : (
                        "All in service"
                      )}
                    </p>
                    <p className="mt-3 text-[12px] text-slate-400">
                      {t.parcels ? `${t.parcels.toLocaleString("en-US")} parcels carried` : "No parcels yet"}
                      {t.guards ? ` · ${t.guards} guards` : ""}
                    </p>
                  </button>
                ))}
              </div>
            )}

            {/* Needs attention: capped so it stays short with a large fleet */}
            {counts.maintenance > 0 && (
              <div className="border-t border-slate-100 px-5 py-4">
                <div className="mb-2 flex items-center justify-between">
                  <p className="text-[14px] font-semibold text-[#1C1C1E]">In maintenance</p>
                  {counts.maintenance > 5 && (
                    <button
                      onClick={() => {
                        setStatus("MAINTENANCE");
                        router.push("?tab=all+wagons");
                      }}
                      className="text-[13px] font-semibold text-[#5C0B19] hover:underline"
                    >
                      View all {counts.maintenance}
                    </button>
                  )}
                </div>
                <ul className="divide-y divide-slate-100">
                  {wagons
                    .filter((w) => w.status === "MAINTENANCE")
                    .slice(0, 5)
                    .map((w) => {
                      const busy = setWagonStatus.isPending && setWagonStatus.variables?.id === w.id;
                      return (
                        <li key={w.id} className="flex items-center justify-between gap-3 py-2.5">
                          <div className="flex min-w-0 items-center gap-3">
                            <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-xl bg-amber-50">
                              <Wrench size={16} className="text-amber-600" />
                            </span>
                            <div className="min-w-0">
                              <p className="truncate text-[14px] font-semibold text-[#1C1C1E]">{w.plateNumber}</p>
                              <p className="truncate text-[12px] text-slate-400">{w.type}</p>
                            </div>
                          </div>
                          <button
                            onClick={() => setWagonStatus.mutate({ id: w.id, next: "ACTIVE" })}
                            disabled={busy}
                            className="inline-flex h-8 shrink-0 items-center gap-1.5 rounded-full bg-[#5C0B19] px-3 text-[12px] font-semibold text-white transition hover:bg-[#4F0A0C] disabled:opacity-60"
                          >
                            {busy ? <Loader2 size={13} className="animate-spin" /> : <ShieldCheck size={13} />} Back in service
                          </button>
                        </li>
                      );
                    })}
                </ul>
              </div>
            )}
          </section>
        </>
      ) : (
        <section className="overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white">
          <div className="flex flex-wrap items-center gap-2 border-b border-slate-100 p-4">
            <label className="relative flex h-11 min-w-[240px] flex-1 items-center rounded-2xl border border-[#E2E2E2] bg-white focus-within:border-orange-500">
              <Search size={16} className="pointer-events-none absolute left-3.5 text-slate-400" />
              <input
                value={query}
                onChange={(e) => setQuery(e.target.value)}
                placeholder="Search wagon number, type or carrier"
                className="h-full w-full bg-transparent pl-10 pr-10 text-[14px] text-slate-700 outline-none placeholder:text-slate-400"
              />
              {query && (
                <button onClick={() => setQuery("")} aria-label="Clear" className="absolute right-2.5 rounded-full p-1 text-slate-400 hover:bg-slate-100">
                  <X size={14} />
                </button>
              )}
            </label>
            <div className="flex h-11 gap-1 rounded-2xl bg-slate-100 p-1">
              {[
                ["", "All"],
                ["ACTIVE", "In service"],
                ["MAINTENANCE", "Maintenance"],
              ].map(([v, l]) => (
                <button
                  key={v}
                  onClick={() => setStatus(v!)}
                  className={cn(
                    "rounded-xl px-3.5 text-[13px] font-semibold transition",
                    status === v ? "bg-white text-[#1C1C1E] shadow-sm" : "text-slate-500 hover:text-[#1C1C1E]",
                  )}
                >
                  {l}
                </button>
              ))}
            </div>
          </div>
          <DataTable
            data={filtered}
            columns={columns as any}
            isLoading={isLoading}
            hideActions
            hideInternalSearch
            emptyMessage={wagons.length ? "No wagons match your search." : "No wagons registered yet."}
          />
        </section>
      )}
    </div>
  );
}
