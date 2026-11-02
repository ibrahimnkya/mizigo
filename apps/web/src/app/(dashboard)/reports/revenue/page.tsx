"use client";

import { useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { format } from "date-fns";
import { Bar, BarChart, CartesianGrid, ResponsiveContainer, Tooltip, XAxis, YAxis } from "recharts";
import { Package, Receipt, Trophy, Wallet } from "lucide-react";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";
import { DataTable } from "@/components/shared/data-table";
import {
  CustomRange,
  RangeKey,
  FilterField,
  ReportCard,
  ReportFilters,
  Segmented,
  ReportHeader,
  ReportSummary,
  num,
  rangeLabel,
  rangeParams,
  tsh,
  useStations,
} from "@/components/reports/report-kit";

type GroupBy = "day" | "week" | "month";

const periodLabel = (date: string, g: GroupBy) => {
  const d = new Date(date);
  if (g === "month") return format(d, "MMM yyyy");
  if (g === "week") return `Week of ${format(d, "d MMM")}`;
  return format(d, "d MMM");
};

export default function RevenueReportPage() {
  const [range, setRange] = useState<RangeKey>("30d");
  const [custom, setCustom] = useState<CustomRange>({ from: "", to: "" });
  const [stationId, setStationId] = useState("");
  const [groupBy, setGroupBy] = useState<GroupBy>("day");
  const params = { ...rangeParams(range, custom), ...(stationId ? { stationId } : {}), groupBy };
  const { data: stations = [] } = useStations();

  const { data, isLoading } = useQuery({
    queryKey: ["reports", "revenue", params],
    queryFn: async () => (await api.get("/reports/revenue", { params })).data?.data,
    placeholderData: (prev) => prev,
  });

  const series: any[] = (data?.series ?? []).map((b: any) => ({ ...b, label: periodLabel(b.date, groupBy) }));
  const s = data?.summary ?? {};
  const stationName = stations.find((x) => x.id === stationId)?.name;
  const subtitle = `${rangeLabel(range, custom)} · ${stationName ? `Sent from ${stationName}` : "All stations"}`;

  const columns = [
    { header: "Period", accessor: (r: any) => <span className="font-medium text-[#1C1C1E]">{r.label}</span> },
    { header: "Parcels", align: "right" as const, accessor: (r: any) => <span className="tabular-nums">{num(r.parcels)}</span> },
    { header: "Paid", align: "right" as const, accessor: (r: any) => <span className="tabular-nums">{num(r.paid)}</span> },
    {
      header: "Not paid",
      align: "right" as const,
      accessor: (r: any) => <span className={cn("tabular-nums", r.unpaid ? "text-orange-600" : "text-slate-400")}>{num(r.unpaid)}</span>,
    },
    {
      header: "Revenue",
      align: "right" as const,
      accessor: (r: any) => <span className="text-[14px] font-semibold tabular-nums text-[#1C1C1E]">{tsh(r.revenue)}</span>,
    },
  ];

  return (
    <div className="flex flex-col gap-5 pb-4">
      <ReportHeader
        title="Revenue"
        subtitle={subtitle}
        exportSpec={{
          title: "Revenue report",
          subtitle,
          columns: [
            { header: "Period", key: "label" },
            { header: "Parcels", key: "parcels" },
            { header: "Paid", key: "paid" },
            { header: "Not paid", key: "unpaid" },
            { header: "Revenue", key: "revenueText" },
          ],
          rows: series.map((r) => ({ ...r, revenueText: tsh(r.revenue) })),
        }}
      >
        <ReportFilters
          onDark
          range={range}
          onRange={setRange}
          custom={custom}
          onCustom={setCustom}
          stationId={stationId}
          onStation={setStationId}
          extra={
            <FilterField label="Group by" className="w-full sm:w-56">
              <Segmented
                value={groupBy}
                onChange={setGroupBy}
                options={[
                  { value: "day", label: "Day" },
                  { value: "week", label: "Week" },
                  { value: "month", label: "Month" },
                ]}
              />
            </FilterField>
          }
        />
      </ReportHeader>
      <ReportSummary
        label="Revenue collected"
        value={tsh(s.revenue)}
        note={s.outstanding ? `${tsh(s.outstanding)} not yet paid` : undefined}
        loading={isLoading}
        chips={[
          { label: "Parcels", value: num(s.parcels), icon: Package },
          { label: "Paid parcels", value: num(s.paidParcels), icon: Receipt },
          { label: "Average per parcel", value: tsh(s.average), icon: Wallet },
          {
            label: "Best period",
            value: s.bestPeriod ? periodLabel(s.bestPeriod.date, groupBy) : "—",
            icon: Trophy,
          },
        ]}
      />

      <ReportCard title="Revenue over time" aside={`By ${groupBy}`}>
        <div className="h-[280px] px-3 pb-3 pt-5">
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
                <Bar dataKey="revenue" fill="#F78A1F" radius={[8, 8, 0, 0]} maxBarSize={44} />
              </BarChart>
            </ResponsiveContainer>
          )}
        </div>
      </ReportCard>

      <ReportCard title="Breakdown" aside={`${series.length} periods`}>
        <DataTable data={[...series].reverse()} columns={columns as any} isLoading={isLoading} hideActions hideInternalSearch emptyMessage="No parcels in this period." />
      </ReportCard>
    </div>
  );
}
