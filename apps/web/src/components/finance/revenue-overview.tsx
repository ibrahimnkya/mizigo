"use client";

import { useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { format } from "date-fns";
import { Bar, BarChart, CartesianGrid, ResponsiveContainer, Tooltip, XAxis, YAxis } from "recharts";
import { Clock3, FileSpreadsheet, MapPin, Package, Percent, Sparkles, TrainFront } from "lucide-react";
import api from "@/lib/api/client";
import { downloadExcel } from "@/lib/export";
import {
  CustomRange,
  RangeKey,
  ReportFilters,
  ReportSummary,
  rangeLabel,
  rangeParams,
  tsh,
  useStations,
} from "@/components/reports/report-kit";
import { BreakdownCard } from "@/components/shared/overview-kit";

/** Revenue overview for the Finance page: filters, summary, chart, station tiles. */
export function RevenueOverview({
  renderHeader,
}: {
  /** Renders the page header; receives the filters to place inside it. */
  renderHeader: (filters: React.ReactNode) => React.ReactNode;
}) {
  const [range, setRange] = useState<RangeKey>("month");
  const [custom, setCustom] = useState<CustomRange>({ from: "", to: "" });
  const [stationId, setStationId] = useState("");
  const params = { ...rangeParams(range, custom), ...(stationId ? { stationId } : {}) };
  const { data: stations = [] } = useStations();

  const { data, isLoading } = useQuery({
    queryKey: ["finance", "revenue", params],
    queryFn: async () => (await api.get("/finance/revenue", { params })).data?.data,
    placeholderData: (prev) => prev,
  });

  const s = data?.summary ?? {};
  const prev = data?.previous?.revenue;
  const series: any[] = (data?.series ?? []).map((d: any) => ({ ...d, label: format(new Date(d.date), "d MMM") }));
  const byStation: any[] = data?.byStation ?? [];
  const byMethod: { label: string; value: number }[] = data?.byMethod ?? [];
  const stationName = stations.find((x) => x.id === stationId)?.name;
  const subtitle = `${rangeLabel(range, custom)} · ${stationName ?? "All stations"}`;

  const change =
    prev === undefined || prev === null
      ? null
      : prev === 0
        ? s.revenue
          ? "New this period"
          : null
        : `${s.revenue >= prev ? "▲" : "▼"} ${Math.abs(Math.round(((s.revenue - prev) / prev) * 100))}% vs previous period`;

  const exportExcel = () =>
    downloadExcel({
      title: "Revenue",
      subtitle,
      filename: `revenue-${format(new Date(), "yyyy-MM-dd")}`,
      columns: [
        { header: "Station", key: "name" },
        { header: "Parcels", key: "parcels" },
        { header: "Revenue", key: "revenueText" },
      ],
      data: byStation.map((r) => ({ ...r, revenueText: tsh(r.revenue) })),
    });

  return (
    <div className="flex flex-col gap-5">
      {renderHeader(
        <ReportFilters
          onDark
          range={range}
          onRange={setRange}
          custom={custom}
          onCustom={setCustom}
          stationId={stationId}
          onStation={setStationId}
          extra={
            <>
              <button
                onClick={exportExcel}
                style={{ marginLeft: "auto" }}
                disabled={!byStation.length}
                className="flex h-11 items-center gap-2 rounded-full bg-orange-500 px-5 text-[13px] font-semibold text-white transition hover:bg-orange-600 disabled:opacity-40"
              >
                <FileSpreadsheet size={15} /> Export to Excel
              </button>
            </>
          }
        />
      )}

      <ReportSummary
        label={`Revenue · ${subtitle}`}
        value={tsh(s.revenue)}
        note={change ?? (s.outstanding ? `${tsh(s.outstanding)} still to collect` : undefined)}
        loading={isLoading}
        chips={[
          { label: "Transport", value: tsh(s.transportRevenue), icon: TrainFront },
          { label: "Extra services", value: tsh(s.servicesRevenue), icon: Sparkles },
          { label: "Still to collect", value: tsh(s.outstanding), icon: Clock3 },
          { label: "Platform fees", value: tsh(s.platformFees), icon: Percent },
        ]}
      />

      <section className="overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white">
        <div className="flex flex-wrap items-center justify-between gap-3 border-b border-slate-100 px-5 py-4">
          <div>
            <h2 className="text-[17px] font-semibold text-[#1C1C1E]">Daily revenue</h2>
            <p className="text-[13px] text-slate-500">
              {s.paidParcels ?? 0} paid parcels · {tsh(s.averagePerParcel)} on average
            </p>
          </div>
        </div>
        <div className="h-[260px] px-3 pb-3 pt-5">
          {series.length === 0 && !isLoading ? (
            <div className="flex h-full items-center justify-center text-[14px] text-slate-400">No revenue in this period.</div>
          ) : (
            <ResponsiveContainer width="100%" height="100%">
              <BarChart data={series} margin={{ top: 0, right: 8, left: 8, bottom: 0 }}>
                <CartesianGrid vertical={false} stroke="currentColor" strokeOpacity={0.08} />
                <XAxis dataKey="label" tickLine={false} axisLine={false} tick={{ fontSize: 12, fill: "#94a3b8" }} />
                <YAxis
                  tickLine={false}
                  axisLine={false}
                  width={84}
                  tick={{ fontSize: 12, fill: "#94a3b8" }}
                  tickFormatter={(v: number) => Math.round(v).toLocaleString("en-US")}
                />
                <Tooltip
                  cursor={{ fill: "rgba(247,138,31,0.08)" }}
                  contentStyle={{ borderRadius: 14, border: "1px solid #E2E2E2", fontSize: 13 }}
                  formatter={(v: any) => [tsh(Number(v)), "Revenue"]}
                />
                <Bar dataKey="revenue" fill="#F78A1F" radius={[8, 8, 0, 0]} maxBarSize={40} />
              </BarChart>
            </ResponsiveContainer>
          )}
        </div>
      </section>

      <div className="grid gap-5 xl:grid-cols-[minmax(0,1.6fr)_minmax(0,1fr)]">
        <section className="overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white">
          <div className="border-b border-slate-100 px-5 py-4">
            <h2 className="text-[17px] font-semibold text-[#1C1C1E]">By station</h2>
            <p className="text-[13px] text-slate-500">Where the money was collected</p>
          </div>
          {byStation.filter((r) => r.revenue > 0).length === 0 ? (
            <p className="px-6 py-12 text-center text-[14px] text-slate-400">No paid parcels in this period.</p>
          ) : (
            <div className="grid gap-4 p-5 sm:grid-cols-2">
              {byStation
                .filter((r) => r.revenue > 0)
                .slice(0, 6)
                .map((r) => (
                  <div key={r.id} className="flex flex-col rounded-[24px] border border-[#E2E2E2] p-5">
                    <div className="flex items-start justify-between">
                      <span className="flex h-12 w-12 items-center justify-center rounded-2xl bg-orange-50">
                        <MapPin size={22} className="text-orange-500" />
                      </span>
                      <span className="flex items-center gap-1 rounded-full bg-orange-500 px-2.5 py-0.5 text-[13px] font-semibold tabular-nums text-white">
                        <Package size={12} /> {r.parcels}
                      </span>
                    </div>
                    <p className="mt-4 truncate text-[16px] font-semibold text-[#1C1C1E]">{r.name}</p>
                    <p className="mt-0.5 text-[13px] text-slate-500">{tsh(r.revenue)}</p>
                    <p className="mt-3 text-[12px] text-slate-400">
                      {s.revenue ? `${Math.round((r.revenue / s.revenue) * 100)}% of revenue` : ""}
                    </p>
                  </div>
                ))}
            </div>
          )}
        </section>

        <BreakdownCard
          title="By payment type"
          subtitle="How customers paid"
          items={byMethod}
          format={(n) => tsh(n)}
          empty="No paid parcels in this period."
        />
      </div>
    </div>
  );
}
