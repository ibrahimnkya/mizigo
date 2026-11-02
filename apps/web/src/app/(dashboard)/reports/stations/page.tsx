"use client";

import { useMemo, useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { CheckCircle2, MapPin, Send, Trophy } from "lucide-react";
import api from "@/lib/api/client";
import { DataTable } from "@/components/shared/data-table";
import {
  CustomRange,
  MiniBar,
  RangeKey,
  ReportCard,
  ReportFilters,
  ReportHeader,
  ReportSummary,
  num,
  rangeLabel,
  rangeParams,
  tsh,
} from "@/components/reports/report-kit";

export default function StationsReportPage() {
  const [range, setRange] = useState<RangeKey>("30d");
  const [custom, setCustom] = useState<CustomRange>({ from: "", to: "" });
  const params = rangeParams(range, custom);

  const { data, isLoading } = useQuery({
    queryKey: ["reports", "stations", params],
    queryFn: async () => (await api.get("/reports/stations", { params })).data?.data,
    placeholderData: (prev) => prev,
  });

  const rows: any[] = data?.stations ?? [];
  const s = data?.summary ?? {};
  const maxParcels = useMemo(() => Math.max(0, ...rows.map((r) => r.sent + r.arriving)), [rows]);
  const subtitle = `${rangeLabel(range, custom)} · parcels and revenue for each station`;

  const columns = [
    {
      header: "Station",
      accessor: (r: any) => (
        <div className="flex items-center gap-3">
          <span className="flex h-10 w-10 shrink-0 items-center justify-center rounded-2xl bg-orange-50">
            <MapPin size={17} className="text-orange-500" />
          </span>
          <div>
            <p className="text-[14px] font-semibold text-[#1C1C1E]">{r.name}</p>
            <p className="text-[12px] text-slate-400">{r.code || r.organizationName || ""}</p>
          </div>
        </div>
      ),
    },
    {
      header: "Activity",
      accessor: (r: any) => (
        <div className="flex items-center gap-3">
          <MiniBar value={r.sent + r.arriving} max={maxParcels} />
          <span className="text-[13px] font-semibold tabular-nums text-slate-700">{num(r.sent + r.arriving)}</span>
        </div>
      ),
    },
    { header: "Sent", align: "right" as const, accessor: (r: any) => <span className="tabular-nums">{num(r.sent)}</span> },
    { header: "Arriving", align: "right" as const, accessor: (r: any) => <span className="tabular-nums">{num(r.arriving)}</span> },
    { header: "Delivered", align: "right" as const, accessor: (r: any) => <span className="tabular-nums">{num(r.delivered)}</span> },
    {
      header: "Waiting pickup",
      align: "right" as const,
      accessor: (r: any) => (
        <span className={r.waiting ? "font-semibold text-orange-600 tabular-nums" : "tabular-nums text-slate-400"}>{num(r.waiting)}</span>
      ),
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
        title="Stations"
        subtitle={subtitle}
        exportSpec={{
          title: "Station report",
          subtitle,
          columns: [
            { header: "Station", key: "name" },
            { header: "Sent", key: "sent" },
            { header: "Arriving", key: "arriving" },
            { header: "Delivered", key: "delivered" },
            { header: "Waiting pickup", key: "waiting" },
            { header: "Revenue", key: "revenueText" },
          ],
          rows: rows.map((r) => ({ ...r, revenueText: tsh(r.revenue) })),
        }}
      >
        <ReportFilters range={range} onRange={setRange} custom={custom} onCustom={setCustom} />
        <ReportSummary
          label="Revenue across stations"
          value={tsh(s.totalRevenue)}
          note={s.totalValue ? `${tsh(s.totalValue)} total parcel value` : undefined}
          loading={isLoading}
          chips={[
            { label: "Parcels", value: num(s.totalParcels), icon: Send },
            { label: "Active stations", value: `${num(s.activeStations)} of ${num(s.totalStations)}`, icon: MapPin },
            { label: "Busiest station", value: s.topStation?.name ?? "—", icon: Trophy },
            { label: "Delivered", value: num(rows.reduce((n, r) => n + r.delivered, 0)), icon: CheckCircle2 },
          ]}
        />
      </ReportHeader>
      <ReportCard title="By station" aside={`${rows.length} stations`}>
        <DataTable data={rows} columns={columns as any} isLoading={isLoading} hideActions hideInternalSearch emptyMessage="No stations yet." />
      </ReportCard>
    </div>
  );
}

