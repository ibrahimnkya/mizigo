"use client";

import { useMemo, useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { ArrowRight, CheckCircle2, Gauge, Timer, Zap } from "lucide-react";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";
import { DataTable } from "@/components/shared/data-table";
import {
  CustomRange,
  MiniBar,
  RangeKey,
  ReportCard,
  ReportFilters,
  ReportHeader,
  ReportSummary,
  hoursLabel,
  num,
  rangeLabel,
  rangeParams,
  useStations,
} from "@/components/reports/report-kit";

export default function TurnaroundReportPage() {
  const [range, setRange] = useState<RangeKey>("30d");
  const [custom, setCustom] = useState<CustomRange>({ from: "", to: "" });
  const [stationId, setStationId] = useState("");
  const params = { ...rangeParams(range, custom), ...(stationId ? { stationId } : {}) };
  const { data: stations = [] } = useStations();

  const { data, isLoading } = useQuery({
    queryKey: ["reports", "turnaround", params],
    queryFn: async () => (await api.get("/reports/turnaround", { params })).data?.data,
    placeholderData: (prev) => prev,
  });

  const rows: any[] = data?.routes ?? [];
  const s = data?.summary ?? {};
  const slowest = useMemo(() => Math.max(0, ...rows.map((r) => r.averageHours)), [rows]);
  const stationName = stations.find((x) => x.id === stationId)?.name;
  const subtitle = `Delivered ${rangeLabel(range, custom).toLowerCase()} · ${stationName ?? "All stations"}`;

  const columns = [
    {
      header: "Route",
      accessor: (r: any) => (
        <div className="flex items-center gap-2 text-[14px] font-semibold text-[#1C1C1E]">
          <span className="max-w-[140px] truncate">{r.from}</span>
          <ArrowRight size={14} className="shrink-0 text-orange-500" />
          <span className="max-w-[140px] truncate">{r.to}</span>
        </div>
      ),
    },
    { header: "Delivered", align: "right" as const, accessor: (r: any) => <span className="tabular-nums">{num(r.parcels)}</span> },
    {
      header: "Average",
      accessor: (r: any) => (
        <div className="flex items-center gap-3">
          <MiniBar value={r.averageHours} max={slowest} />
          <span className={cn("text-[13px] font-semibold tabular-nums", r.averageHours > 48 ? "text-orange-600" : "text-slate-700")}>
            {hoursLabel(r.averageHours)}
          </span>
        </div>
      ),
    },
    { header: "Fastest", align: "right" as const, accessor: (r: any) => <span className="tabular-nums">{hoursLabel(r.fastestHours)}</span> },
    { header: "Slowest", align: "right" as const, accessor: (r: any) => <span className="tabular-nums">{hoursLabel(r.slowestHours)}</span> },
  ];

  return (
    <div className="flex flex-col gap-5 pb-4">
      <ReportHeader
        title="Turnaround time"
        subtitle={subtitle}
        exportSpec={{
          title: "Turnaround report",
          subtitle,
          columns: [
            { header: "From", key: "from" },
            { header: "To", key: "to" },
            { header: "Delivered", key: "parcels" },
            { header: "Average", key: "avg" },
            { header: "Fastest", key: "fast" },
            { header: "Slowest", key: "slow" },
          ],
          rows: rows.map((r) => ({
            ...r,
            avg: hoursLabel(r.averageHours),
            fast: hoursLabel(r.fastestHours),
            slow: hoursLabel(r.slowestHours),
          })),
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
        />
      </ReportHeader>
      <ReportSummary
        label="Average time to deliver"
        value={hoursLabel(s.averageHours)}
        note="From drop-off at the station to pickup by the receiver"
        loading={isLoading}
        chips={[
          { label: "Delivered", value: num(s.delivered), icon: CheckCircle2 },
          { label: "Typical (median)", value: hoursLabel(s.medianHours), icon: Gauge },
          { label: "Fastest", value: hoursLabel(s.fastestHours), icon: Zap },
          { label: "Within 48 hours", value: s.delivered ? `${s.within48h}%` : "—", icon: Timer },
        ]}
      />
      <ReportCard title="By route" aside={`${rows.length} routes`}>
        <DataTable data={rows} columns={columns as any} isLoading={isLoading} hideActions hideInternalSearch emptyMessage="No deliveries in this period." />
      </ReportCard>
    </div>
  );
}
