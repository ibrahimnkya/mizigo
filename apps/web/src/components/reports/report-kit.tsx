"use client";

import Link from "next/link";
import dynamic from "next/dynamic";
import { useQuery } from "@tanstack/react-query";
import { format, startOfMonth, startOfYear, subDays } from "date-fns";
import { ArrowLeft, CalendarDays, ChevronDown, FileSpreadsheet, MapPin, Search, X } from "lucide-react";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";
import { downloadExcel } from "@/lib/export";

const PdfDownloadButton = dynamic(() => import("./pdf-download-button"), { ssr: false });

/* ─── Formatting ─────────────────────────────────────────────────────────── */

export const tsh = (n?: number) => `TSh ${Math.round(n || 0).toLocaleString("en-US")}`;
export const num = (n?: number) => Math.round(n || 0).toLocaleString("en-US");
export const hoursLabel = (h?: number) => {
  if (!h) return "—";
  if (h < 1) return `${Math.round(h * 60)} min`;
  if (h < 48) return `${Math.round(h * 10) / 10} h`;
  return `${Math.round((h / 24) * 10) / 10} days`;
};

/* ─── Date range ─────────────────────────────────────────────────────────── */

export type RangeKey = "today" | "7d" | "30d" | "month" | "year" | "all" | "custom";
export const RANGES: { key: RangeKey; label: string }[] = [
  { key: "today", label: "Today" },
  { key: "7d", label: "7 days" },
  { key: "30d", label: "30 days" },
  { key: "month", label: "This month" },
  { key: "year", label: "This year" },
  { key: "all", label: "All time" },
  { key: "custom", label: "Custom" },
];
export type CustomRange = { from: string; to: string };

export function rangeParams(key: RangeKey, custom: CustomRange) {
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  let from: Date | undefined;
  let to: Date | undefined;
  if (key === "today") from = today;
  if (key === "7d") from = subDays(today, 6);
  if (key === "30d") from = subDays(today, 29);
  if (key === "month") from = startOfMonth(today);
  if (key === "year") from = startOfYear(today);
  if (key === "custom") {
    from = custom.from ? new Date(custom.from) : undefined;
    to = custom.to ? new Date(`${custom.to}T23:59:59`) : undefined;
  }
  return {
    ...(from ? { dateFrom: from.toISOString() } : {}),
    ...(to ? { dateTo: to.toISOString() } : {}),
  };
}

export function rangeLabel(key: RangeKey, custom: CustomRange) {
  if (key !== "custom") return RANGES.find((r) => r.key === key)!.label;
  const parts = [custom.from, custom.to].filter(Boolean).map((d) => format(new Date(d), "d MMM yyyy"));
  return parts.join(" – ") || "Custom dates";
}

/* ─── Stations ───────────────────────────────────────────────────────────── */

export function useStations() {
  return useQuery({
    queryKey: ["stations", "list"],
    queryFn: async () => {
      const { data } = await api.get("/stations");
      const list = data?.data ?? data;
      return (Array.isArray(list) ? list : []) as { id: string; name: string }[];
    },
    staleTime: 5 * 60_000,
  });
}

/* ─── Header ─────────────────────────────────────────────────────────────── */

export type ExportSpec = {
  title: string;
  subtitle: string;
  columns: { header: string; key: string }[];
  rows: Record<string, any>[];
  pdfKeys?: string[];
};

export function ReportHeader({
  title,
  subtitle,
  exportSpec,
  children,
}: {
  title: string;
  subtitle: string;
  exportSpec?: ExportSpec;
  /** Filters shown inside the maroon header, below the title row. */
  children?: React.ReactNode;
}) {
  const base = `${title.toLowerCase().replace(/\s+/g, "-")}-${format(new Date(), "yyyy-MM-dd")}`;
  const hasRows = !!exportSpec?.rows.length;
  return (
    <div className="page-hero bridge-card px-5 py-5 md:px-6 md:py-6">
    <div className="flex flex-wrap items-center justify-between gap-4">
      <div className="flex items-center gap-3">
        <Link
          href="/reports"
          aria-label="Back to reports"
          className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-white/10 text-white transition hover:bg-white/20"
        >
          <ArrowLeft size={18} />
        </Link>
        <div>
          <h1 className="text-[26px] font-semibold leading-tight text-white">{title}</h1>
          <p className="text-[14px] text-white/70">{subtitle}</p>
        </div>
      </div>
      {exportSpec && (
        <div className="flex items-center gap-2">
          <button
            onClick={() =>
              downloadExcel({
                title: exportSpec.title,
                subtitle: exportSpec.subtitle,
                columns: exportSpec.columns,
                data: exportSpec.rows,
                filename: base,
              })
            }
            disabled={!hasRows}
            className="flex h-10 items-center gap-2 rounded-full bg-white/10 px-4 text-[13px] font-semibold text-white transition hover:bg-white/20 disabled:opacity-40"
          >
            <FileSpreadsheet size={15} className="text-emerald-300" /> Excel
          </button>
          {hasRows && (
            <PdfDownloadButton
              title={exportSpec.title}
              subtitle={exportSpec.subtitle}
              data={exportSpec.rows}
              columns={
                exportSpec.pdfKeys
                  ? exportSpec.columns.filter((c) => exportSpec.pdfKeys!.includes(c.key))
                  : exportSpec.columns
              }
              fileName={`${base}.pdf`}
            />
          )}
        </div>
      )}
    </div>
    {children && <div className="mt-5 border-t border-white/15 pt-5">{children}</div>}
    </div>
  );
}

/* ─── Filters ────────────────────────────────────────────────────────────── */

const fieldBox =
  "relative flex h-11 w-full items-center rounded-2xl border border-[#E2E2E2] bg-white transition focus-within:border-orange-500 focus-within:ring-4 focus-within:ring-orange-500/10";

/** Labelled filter field. */
export function FilterField({ label, children, className }: { label: string; children: React.ReactNode; className?: string }) {
  return (
    <div className={cn("flex min-w-0 flex-col gap-1.5", className)}>
      <span className="text-[12px] font-medium text-slate-500">{label}</span>
      {children}
    </div>
  );
}

export function FilterSelect({
  value,
  onChange,
  options,
  icon: Icon,
}: {
  value: string;
  onChange: (v: string) => void;
  options: { value: string; label: string }[];
  icon?: React.ElementType;
}) {
  return (
    <label className={fieldBox}>
      {Icon && <Icon size={16} className="pointer-events-none absolute left-3.5 text-slate-400" />}
      <select
        value={value}
        onChange={(e) => onChange(e.target.value)}
        className={cn(
          "h-full w-full cursor-pointer appearance-none bg-transparent pr-10 text-[14px] text-slate-700 outline-none",
          Icon ? "pl-10" : "pl-4",
        )}
      >
        {options.map((o) => (
          <option key={o.value} value={o.value}>
            {o.label}
          </option>
        ))}
      </select>
      <ChevronDown size={16} className="pointer-events-none absolute right-3.5 text-slate-400" />
    </label>
  );
}

export function FilterSearch({ value, onChange, placeholder }: { value: string; onChange: (v: string) => void; placeholder: string }) {
  return (
    <label className={fieldBox}>
      <Search size={16} className="pointer-events-none absolute left-3.5 text-slate-400" />
      <input
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        className="h-full w-full bg-transparent pl-10 pr-10 text-[14px] text-slate-700 outline-none placeholder:text-slate-400"
      />
      {value && (
        <button
          type="button"
          onClick={() => onChange("")}
          aria-label="Clear search"
          className="absolute right-2.5 rounded-full p-1 text-slate-400 hover:bg-slate-100 hover:text-slate-600"
        >
          <X size={14} />
        </button>
      )}
    </label>
  );
}

/** Segmented control in the portal style. */
export function Segmented<T extends string>({
  value,
  onChange,
  options,
}: {
  value: T;
  onChange: (v: T) => void;
  options: { value: T; label: string }[];
}) {
  return (
    <div className="flex h-11 w-full gap-1 rounded-2xl bg-slate-100 p-1">
      {options.map((o) => (
        <button
          key={o.value}
          type="button"
          onClick={() => onChange(o.value)}
          className={cn(
            "flex-1 whitespace-nowrap rounded-xl px-3 text-[13px] font-semibold transition",
            value === o.value ? "bg-white text-[#1C1C1E] shadow-sm" : "text-slate-500 hover:text-[#1C1C1E]",
          )}
        >
          {o.label}
        </button>
      ))}
    </div>
  );
}

export function ReportFilters({
  range,
  onRange,
  custom,
  onCustom,
  stationId,
  onStation,
  extra,
  activeCount = 0,
  onReset,
  onDark = false,
}: {
  range: RangeKey;
  onRange: (r: RangeKey) => void;
  custom: CustomRange;
  onCustom: (c: CustomRange) => void;
  stationId?: string;
  onStation?: (id: string) => void;
  /** Additional <FilterField>s shown after Station. */
  extra?: React.ReactNode;
  activeCount?: number;
  onReset?: () => void;
  /** Render for the maroon page header (no card, light-on-dark controls). */
  onDark?: boolean;
}) {
  const { data: stations = [] } = useStations();

  // Header (maroon) version: everything on one row, period as a dropdown.
  if (onDark) {
    const dateInput =
      "h-11 w-full rounded-2xl border border-[#E2E2E2] bg-white px-3 text-[14px] text-slate-700 outline-none focus:border-orange-500";
    return (
      <section className="report-filters-dark flex flex-wrap items-end gap-3">
        <FilterField label="Period" className="w-full sm:w-48">
          <FilterSelect
            value={range}
            onChange={(v) => onRange(v as RangeKey)}
            icon={CalendarDays}
            options={RANGES.map((r) => ({ value: r.key, label: r.key === "custom" ? "Custom dates" : r.label }))}
          />
        </FilterField>
        {range === "custom" && (
          <>
            <FilterField label="From" className="w-[calc(50%-6px)] sm:w-40">
              <input
                type="date"
                aria-label="From date"
                value={custom.from}
                max={custom.to || undefined}
                onChange={(e) => onCustom({ ...custom, from: e.target.value })}
                className={dateInput}
              />
            </FilterField>
            <FilterField label="To" className="w-[calc(50%-6px)] sm:w-40">
              <input
                type="date"
                aria-label="To date"
                value={custom.to}
                min={custom.from || undefined}
                onChange={(e) => onCustom({ ...custom, to: e.target.value })}
                className={dateInput}
              />
            </FilterField>
          </>
        )}
        {onStation && (
          <FilterField label="Station" className="w-full sm:w-56">
            <FilterSelect
              value={stationId ?? ""}
              onChange={onStation}
              icon={MapPin}
              options={[{ value: "", label: "All stations" }, ...stations.map((st) => ({ value: st.id, label: st.name }))]}
            />
          </FilterField>
        )}
        {extra}
        {onReset && activeCount > 0 && (
          <button
            type="button"
            onClick={onReset}
            className="flex h-11 items-center gap-1.5 rounded-full px-3 text-[13px] font-semibold text-white/80 transition hover:bg-white/10 hover:text-white"
          >
            <X size={14} /> Clear ({activeCount})
          </button>
        )}
      </section>
    );
  }

  return (
    <section
      className={cn(
        "flex flex-col gap-4",
        onDark ? "report-filters-dark" : "rounded-[24px] border border-[#E2E2E2] bg-white p-4 sm:p-5",
      )}
    >
      <div className="flex flex-wrap items-end justify-between gap-3">
        <FilterField label="Period" className="flex-1">
          <div className="flex flex-wrap items-center gap-2">
            <div className="flex flex-wrap gap-1 rounded-2xl bg-slate-100 p-1">
              {RANGES.map((r) => (
                <button
                  key={r.key}
                  type="button"
                  onClick={() => onRange(r.key)}
                  className={cn(
                    "h-9 rounded-xl px-3.5 text-[13px] font-semibold transition",
                    range === r.key ? "bg-orange-500 text-white shadow-sm" : "text-slate-600 hover:bg-white hover:text-[#1C1C1E]",
                  )}
                >
                  {r.label}
                </button>
              ))}
            </div>
            {range === "custom" && (
              <div className="flex items-center gap-2 text-[13px] text-slate-500">
                <input
                  type="date"
                  aria-label="From date"
                  value={custom.from}
                  max={custom.to || undefined}
                  onChange={(e) => onCustom({ ...custom, from: e.target.value })}
                  className="h-11 rounded-2xl border border-[#E2E2E2] bg-white px-3 text-[14px] text-slate-700 outline-none focus:border-orange-500"
                />
                <span>to</span>
                <input
                  type="date"
                  aria-label="To date"
                  value={custom.to}
                  min={custom.from || undefined}
                  onChange={(e) => onCustom({ ...custom, to: e.target.value })}
                  className="h-11 rounded-2xl border border-[#E2E2E2] bg-white px-3 text-[14px] text-slate-700 outline-none focus:border-orange-500"
                />
              </div>
            )}
          </div>
        </FilterField>
        {onReset && activeCount > 0 && (
          <button
            type="button"
            onClick={onReset}
            className="flex h-9 items-center gap-1.5 rounded-full px-3 text-[13px] font-semibold text-orange-600 transition hover:bg-orange-50"
          >
            <X size={14} /> Clear filters ({activeCount})
          </button>
        )}
      </div>

      {(onStation || extra) && (
        <div className={cn("grid gap-3 sm:grid-cols-2 lg:grid-cols-4", !onDark && "border-t border-slate-100 pt-4")}>
          {onStation && (
            <FilterField label="Station">
              <FilterSelect
                value={stationId ?? ""}
                onChange={onStation}
                icon={MapPin}
                options={[{ value: "", label: "All stations" }, ...stations.map((s) => ({ value: s.id, label: s.name }))]}
              />
            </FilterField>
          )}
          {extra}
        </div>
      )}
    </section>
  );
}

/* ─── Summary card ───────────────────────────────────────────────────────── */

export function ReportSummary({
  label,
  value,
  note,
  chips,
  loading,
}: {
  label: string;
  value: string;
  note?: string;
  chips: { label: string; value: string; icon: React.ElementType }[];
  loading?: boolean;
}) {
  return (
    <section className="bridge-card p-5 md:p-6">
      <p className="text-[14px] text-white/70">{label}</p>
      {loading ? (
        <div className="mt-1 h-10 w-48 animate-pulse rounded-xl bg-white/15" />
      ) : (
        <p className="text-[38px] font-semibold leading-none tabular-nums">{value}</p>
      )}
      {note && !loading && <p className="mt-1.5 text-[13px] text-white/60">{note}</p>}
      <div className={cn("mt-5 grid grid-cols-2 gap-3", chips.length >= 4 ? "md:grid-cols-4" : "md:grid-cols-3")}>
        {chips.map((c) => (
          <div key={c.label} className="flex items-center gap-3 rounded-2xl border border-white/15 bg-white/10 px-3.5 py-2.5 backdrop-blur-md">
            <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-white/15">
              <c.icon size={17} className="text-orange-300" />
            </span>
            <div className="min-w-0">
              <p className="truncate text-[12px] text-white/60">{c.label}</p>
              {loading ? (
                <div className="mt-1 h-5 w-12 animate-pulse rounded-lg bg-white/15" />
              ) : (
                <p className="truncate text-[18px] font-semibold leading-tight tabular-nums">{c.value}</p>
              )}
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}

/* ─── Section card ───────────────────────────────────────────────────────── */

export function ReportCard({
  title,
  aside,
  children,
  className,
}: {
  title: string;
  aside?: React.ReactNode;
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <div className={cn("overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white", className)}>
      <div className="flex items-center justify-between gap-3 border-b border-slate-100 px-5 py-3.5">
        <h2 className="text-[16px] font-semibold text-[#1C1C1E]">{title}</h2>
        {aside && <div className="text-[13px] text-slate-500">{aside}</div>}
      </div>
      {children}
    </div>
  );
}

/** Thin horizontal bar used inside table cells to compare rows. */
export function MiniBar({ value, max }: { value: number; max: number }) {
  const pct = max > 0 ? Math.max(4, Math.round((value / max) * 100)) : 0;
  return (
    <div className="h-1.5 w-24 overflow-hidden rounded-full bg-slate-100">
      <div className="h-full rounded-full bg-orange-500" style={{ width: `${value ? pct : 0}%` }} />
    </div>
  );
}
