"use client";

import { useMemo, useState } from "react";
import Link from "next/link";
import { useQuery } from "@tanstack/react-query";
import { format } from "date-fns";
import { ArrowRight } from "lucide-react";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";
import { DataTable } from "@/components/shared/data-table";
import { ParcelDetailSheet } from "@/components/parcel/parcel-detail-sheet";
import {
  CustomRange,
  FilterField,
  FilterSearch,
  FilterSelect,
  RangeKey,
  ReportFilters,
  ReportHeader,
  Segmented,
  rangeLabel,
  rangeParams,
  tsh,
  useStations,
} from "@/components/reports/report-kit";

const STATUS: Record<string, { label: string; tone: string }> = {
  PENDING: { label: "Requested", tone: "bg-slate-100 text-slate-600" },
  RECEIVED: { label: "Received", tone: "bg-[#FBF1F2] text-[#5C0B19]" },
  DISPATCHED: { label: "Dispatched", tone: "bg-orange-50 text-orange-700" },
  IN_TRANSIT: { label: "On the way", tone: "bg-orange-50 text-orange-700" },
  OFFLOADED: { label: "Offloaded", tone: "bg-amber-50 text-amber-700" },
  AT_STATION: { label: "At station", tone: "bg-amber-50 text-amber-700" },
  DELIVERED: { label: "Delivered", tone: "bg-emerald-50 text-emerald-700" },
  CANCELED: { label: "Cancelled", tone: "bg-slate-100 text-slate-600" },
  REJECTED: { label: "Rejected", tone: "bg-slate-100 text-slate-600" },
  DELAYED: { label: "Delayed", tone: "bg-rose-50 text-rose-700" },
  LOST: { label: "Lost", tone: "bg-rose-50 text-rose-700" },
};

const STATUS_FILTERS = [
  { value: "", label: "All statuses" },
  { value: "RECEIVED", label: "Received" },
  { value: "DISPATCHED", label: "Dispatched" },
  { value: "OFFLOADED", label: "Offloaded" },
  { value: "DELIVERED", label: "Delivered" },
  { value: "DELAYED", label: "Delayed" },
  { value: "LOST", label: "Lost" },
  { value: "CANCELED", label: "Cancelled" },
];

export default function ParcelReportPage() {
  const [stationId, setStationId] = useState("");
  const [direction, setDirection] = useState<"any" | "from" | "to">("any");
  const [status, setStatus] = useState("");
  const [range, setRange] = useState<RangeKey>("30d");
  const [custom, setCustom] = useState<CustomRange>({ from: "", to: "" });
  const [query, setQuery] = useState("");
  const [selected, setSelected] = useState<any | null>(null);

  const { data: stations = [] } = useStations();

  const params = {
    ...(stationId ? { stationId, direction } : {}),
    ...(status ? { status } : {}),
    ...rangeParams(range, custom),
  };

  const { data, isLoading, isFetching } = useQuery({
    queryKey: ["reports", "parcel", params],
    queryFn: async () => {
      const res = await api.get("/reports/parcel", { params });
      return res.data?.data ?? res.data;
    },
    placeholderData: (prev) => prev,
  });

  const parcels: any[] = useMemo(
    () =>
      (data?.parcel ?? []).map((p: any) => {
        const m = p.additionalServices && typeof p.additionalServices === "object" && !Array.isArray(p.additionalServices) ? p.additionalServices : {};
        // Sender is the customer entered at the counter, not the staff account
        // that logged the parcel (older API builds returned the latter).
        return { ...p, senderName: m.senderName ?? null, senderPhone: m.senderPhone ?? null, receivedBy: p.receivedBy ?? p.user?.name ?? null };
      }),
    [data],
  );
  // Older API builds don't send totalValue/statusCounts; work them out from the
  // parcels already loaded so the summary never shows a misleading 0.
  const stats = useMemo(() => {
    const raw = data?.stats ?? {};
    const fromRows = (pick: (p: any) => number) => parcels.reduce((n, p) => n + (pick(p) || 0), 0);
    const counts: Record<string, number> = {};
    parcels.forEach((p) => (counts[p.status] = (counts[p.status] ?? 0) + 1));
    return {
      ...raw,
      totalValue: raw.totalValue ?? fromRows((p) => p.totalPrice ?? p.amount),
      totalWeight: raw.totalWeight || fromRows((p) => p.weight),
      totalRevenue:
        raw.statusCounts !== undefined
          ? raw.totalRevenue
          : fromRows((p) =>
              p.paymentStatus === "PAID" || p.paymentStatus === "SUCCESS" || p.additionalServices?.paymentStatus === "PAID"
                ? p.totalPrice ?? p.amount
                : 0,
            ),
      statusCounts: raw.statusCounts ?? (parcels.length ? counts : undefined),
    };
  }, [data, parcels]);
  const sc: Record<string, number> = stats.statusCounts ?? {};

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    if (!q) return parcels;
    return parcels.filter((p) =>
      [p.trackingId, p.senderName, p.senderPhone, p.receiverName, p.receiverPhone, p.fromStation, p.toStation]
        .some((v) => String(v ?? "").toLowerCase().includes(q)),
    );
  }, [parcels, query]);

  const stationName = stations.find((s) => s.id === stationId)?.name;
  const subtitle = [
    rangeLabel(range, custom),
    stationName ? `${direction === "from" ? "From" : direction === "to" ? "To" : "At"} ${stationName}` : "All stations",
    status ? STATUS[status]?.label : null,
  ]
    .filter(Boolean)
    .join(" · ");

  const exportRows = filtered.map((p) => ({
    tracking: p.trackingId,
    date: p.createdAt ? format(new Date(p.createdAt), "d MMM yyyy HH:mm") : "",
    from: p.fromStation,
    to: p.toStation,
    sender: p.senderName || "",
    receiver: p.receiverName,
    status: STATUS[p.status]?.label ?? p.status,
    weight: p.weight ? `${p.weight} kg` : "",
    amount: tsh(p.totalPrice),
    payment: p.paymentStatus === "PAID" ? "Paid" : "Not paid",
  }));
  const exportColumns = [
    { header: "Tracking", key: "tracking" },
    { header: "Date", key: "date" },
    { header: "From", key: "from" },
    { header: "To", key: "to" },
    { header: "Sender", key: "sender" },
    { header: "Receiver", key: "receiver" },
    { header: "Status", key: "status" },
    { header: "Weight", key: "weight" },
    { header: "Amount", key: "amount" },
    { header: "Payment", key: "payment" },
  ];

  const summary = [
    { label: "Received", value: (sc.RECEIVED ?? 0) + (sc.PENDING ?? 0) },
    { label: "On the way", value: (sc.DISPATCHED ?? 0) + (sc.IN_TRANSIT ?? 0) },
    { label: "At station", value: (sc.OFFLOADED ?? 0) + (sc.AT_STATION ?? 0) },
    { label: "Delivered", value: sc.DELIVERED ?? 0 },
    { label: "Problems", value: (sc.LOST ?? 0) + (sc.DELAYED ?? 0) + (sc.CANCELED ?? 0) },
  ];

  const columns = [
    {
      header: "Parcel",
      accessor: (p: any) => (
        <div className="flex items-center gap-3">
          <span className="flex h-10 w-10 shrink-0 items-center justify-center rounded-2xl bg-orange-50">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src="/brand/staff_parcel.png" alt="" className="h-7 w-7 object-contain" />
          </span>
          <div>
            <p className="text-[14px] font-semibold tracking-wide text-[#1C1C1E]">{p.trackingId}</p>
            <p className="text-[12px] text-slate-400">{p.createdAt ? format(new Date(p.createdAt), "d MMM yyyy · HH:mm") : ""}</p>
          </div>
        </div>
      ),
    },
    {
      header: "Route",
      accessor: (p: any) => (
        <div className="flex items-center gap-2 text-[13px] font-medium text-slate-700">
          <span className="max-w-[120px] truncate">{p.fromStation || "—"}</span>
          <ArrowRight size={13} className="shrink-0 text-orange-500" />
          <span className="max-w-[120px] truncate">{p.toStation || "—"}</span>
        </div>
      ),
    },
    {
      header: "Sender → Receiver",
      accessor: (p: any) => (
        <div className="text-[13px]">
          <p className="font-medium text-[#1C1C1E]">{p.senderName || "Sender not recorded"}</p>
          <p className="text-slate-500">to {p.receiverName || "—"}</p>
        </div>
      ),
    },
    {
      header: "Status",
      accessor: (p: any) => {
        const s = STATUS[p.status] ?? { label: p.status, tone: "bg-slate-100 text-slate-600" };
        return <span className={cn("rounded-full px-2.5 py-1 text-[12px] font-semibold", s.tone)}>{s.label}</span>;
      },
    },
    {
      header: "Amount",
      align: "right" as const,
      accessor: (p: any) => (
        <div className="text-right">
          <p className="text-[14px] font-semibold tabular-nums text-[#1C1C1E]">{tsh(p.totalPrice)}</p>
          <p className={cn("text-[12px]", p.paymentStatus === "PAID" ? "text-emerald-600" : "text-slate-400")}>
            {p.paymentStatus === "PAID" ? "Paid" : "Not paid"}
          </p>
        </div>
      ),
    },
    {
      header: "",
      align: "right" as const,
      accessor: (p: any) => (
        <button
          onClick={(e) => {
            e.stopPropagation();
            setSelected(p);
          }}
          className="inline-flex h-9 items-center gap-1.5 rounded-full bg-[#5C0B19] px-4 text-[13px] font-semibold text-white transition hover:bg-[#4F0A0C]"
        >
          View <ArrowRight size={14} />
        </button>
      ),
    },
  ];

  const activeFilters = [stationId, status, range !== "30d" ? range : "", query].filter(Boolean).length;
  const reset = () => {
    setStationId("");
    setDirection("any");
    setStatus("");
    setRange("30d");
    setCustom({ from: "", to: "" });
    setQuery("");
  };

  return (
    <div className="flex flex-col gap-5 pb-4">
      <ReportHeader
        title="Parcel report"
        subtitle={subtitle}
        exportSpec={{
          title: "Parcel report",
          subtitle,
          columns: exportColumns,
          rows: exportRows,
          pdfKeys: ["tracking", "date", "from", "to", "status", "amount"],
        }}
      >
        <ReportFilters
          onDark
          range={range}
          onRange={setRange}
          custom={custom}
          onCustom={setCustom}
          stationId={stationId}
          onStation={(id) => {
            setStationId(id);
            if (!id) setDirection("any");
          }}
          activeCount={activeFilters}
          onReset={reset}
          extra={
            <>
              {stationId && (
                <FilterField label="Direction" className="w-full sm:w-40">
                  <FilterSelect
                    value={direction}
                    onChange={(v) => setDirection(v as "any" | "from" | "to")}
                    options={[
                      { value: "any", label: "Sent or received" },
                      { value: "from", label: "Sent from" },
                      { value: "to", label: "Going to" },
                    ]}
                  />
                </FilterField>
              )}
              <FilterField label="Status" className="w-full sm:w-44">
                <FilterSelect value={status} onChange={setStatus} options={STATUS_FILTERS} />
              </FilterField>
              <FilterField label="Search" className="w-full sm:w-64">
                <FilterSearch value={query} onChange={setQuery} placeholder="Tracking number, name or phone" />
              </FilterField>
            </>
          }
        />
      </ReportHeader>

      
      {/* Summary */}
      <section className="bridge-card p-5 md:p-6">
        <div className="flex flex-wrap items-end justify-between gap-4">
          <div>
            <p className="text-[14px] text-white/70">Parcels</p>
            {isLoading ? (
              <div className="mt-1 h-10 w-24 animate-pulse rounded-xl bg-white/15" />
            ) : (
              <p className="text-[30px] sm:text-[40px] font-semibold leading-none tabular-nums">{(stats.totalItems ?? 0).toLocaleString("en-US")}</p>
            )}
          </div>
          <div className="flex flex-wrap gap-6 text-right">
            <div>
              <p className="text-[12px] text-white/60">Total value</p>
              <p className="text-[20px] font-semibold tabular-nums">{tsh(stats.totalValue)}</p>
            </div>
            <div>
              <p className="text-[12px] text-white/60">Paid</p>
              <p className="text-[20px] font-semibold tabular-nums">{tsh(stats.totalRevenue)}</p>
            </div>
            <div>
              <p className="text-[12px] text-white/60">Weight</p>
              <p className="text-[20px] font-semibold tabular-nums">{Math.round(stats.totalWeight ?? 0).toLocaleString("en-US")} kg</p>
            </div>
          </div>
        </div>
        <div className="mt-5 grid grid-cols-2 gap-3 sm:grid-cols-5">
          {summary.map((s) => (
            <div key={s.label} className="rounded-2xl border border-white/15 bg-white/10 px-4 py-3 backdrop-blur-md">
              <p className="text-[12px] text-white/60">{s.label}</p>
              <p className="text-[22px] font-semibold tabular-nums">{stats.statusCounts ? s.value.toLocaleString("en-US") : "—"}</p>
            </div>
          ))}
        </div>
      </section>

      {/* Table */}
      <div className={cn("overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white transition-opacity", isFetching && "opacity-70")}>
        <div className="flex items-center justify-between border-b border-slate-100 px-5 py-3.5">
          <h2 className="text-[16px] font-semibold text-[#1C1C1E]">Parcels</h2>
          <p className="text-[13px] text-slate-500">
            Showing {filtered.length.toLocaleString("en-US")}
            {stats.totalItems > (stats.shown ?? parcels.length) ? ` of the latest ${stats.shown}` : ""}
          </p>
        </div>
        <DataTable
          data={filtered}
          columns={columns as any}
          isLoading={isLoading}
          hideActions
          hideInternalSearch
          emptyMessage={parcels.length ? "No parcels match your search." : "No parcels for these filters."}
          onRowClick={(p: any) => setSelected(p)}
        />
      </div>
      <ParcelDetailSheet parcel={selected} onClose={() => setSelected(null)} />
    </div>
  );
}
