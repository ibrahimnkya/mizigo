"use client";

import { useMemo, useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { Activity, Trophy, Users } from "lucide-react";
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
  useStations,
} from "@/components/reports/report-kit";

const ROLE_LABELS: Record<string, string> = {
  CLERK: "Clerk",
  STATION_MASTER: "Station master",
  TRAIN_GUARD: "Train guard",
  AGENT: "Agent",
  ADMIN: "Admin",
  SUPER_ADMIN: "Super admin",
};

export default function StaffReportPage() {
  const [range, setRange] = useState<RangeKey>("30d");
  const [custom, setCustom] = useState<CustomRange>({ from: "", to: "" });
  const [stationId, setStationId] = useState("");
  const params = { ...rangeParams(range, custom), ...(stationId ? { stationId } : {}) };
  const { data: stations = [] } = useStations();

  const { data, isLoading } = useQuery({
    queryKey: ["reports", "operators", params],
    queryFn: async () => (await api.get("/reports/operators", { params })).data?.data,
    placeholderData: (prev) => prev,
  });

  const rows: any[] = data?.operators ?? [];
  const s = data?.summary ?? {};
  const max = useMemo(() => Math.max(0, ...rows.map((r) => r.total)), [rows]);
  const stationName = stations.find((x) => x.id === stationId)?.name;
  const subtitle = `${rangeLabel(range, custom)} · ${stationName ?? "All stations"}`;

  const columns = [
    {
      header: "Staff member",
      accessor: (r: any) => (
        <div className="flex items-center gap-3">
          <span className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-[#5C0B19] text-[14px] font-semibold text-white">
            {(r.name || "?").charAt(0).toUpperCase()}
          </span>
          <div>
            <p className="text-[14px] font-semibold text-[#1C1C1E]">{r.name}</p>
            <p className="text-[12px] text-slate-400">
              {[ROLE_LABELS[r.roleName] ?? r.roleName, r.stationName].filter(Boolean).join(" · ")}
            </p>
          </div>
        </div>
      ),
    },
    {
      header: "Workload",
      accessor: (r: any) => (
        <div className="flex items-center gap-3">
          <MiniBar value={r.total} max={max} />
          <span className="text-[13px] font-semibold tabular-nums text-slate-700">{num(r.total)}</span>
        </div>
      ),
    },
    { header: "Received", align: "right" as const, accessor: (r: any) => <span className="tabular-nums">{num(r.received)}</span> },
    { header: "Dispatched", align: "right" as const, accessor: (r: any) => <span className="tabular-nums">{num(r.dispatched)}</span> },
    { header: "Offloaded", align: "right" as const, accessor: (r: any) => <span className="tabular-nums">{num(r.offloaded)}</span> },
    { header: "Delivered", align: "right" as const, accessor: (r: any) => <span className="tabular-nums">{num(r.delivered)}</span> },
  ];

  return (
    <div className="flex flex-col gap-5 pb-4">
      <ReportHeader
        title="Staff"
        subtitle={subtitle}
        exportSpec={{
          title: "Staff report",
          subtitle,
          columns: [
            { header: "Name", key: "name" },
            { header: "Station", key: "stationName" },
            { header: "Received", key: "received" },
            { header: "Dispatched", key: "dispatched" },
            { header: "Offloaded", key: "offloaded" },
            { header: "Delivered", key: "delivered" },
            { header: "Total", key: "total" },
          ],
          rows,
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
        label="Parcel actions by staff"
        value={num(s.totalActions)}
        note="Parcels received, dispatched, offloaded and delivered"
        loading={isLoading}
        chips={[
          { label: "Staff", value: num(s.totalStaff), icon: Users },
          { label: "Active in period", value: num(s.activeStaff), icon: Activity },
          { label: "Top performer", value: s.topPerformer ? `${s.topPerformer.name} (${num(s.topPerformer.total)})` : "—", icon: Trophy },
        ]}
      />
      <ReportCard title="By staff member" aside={`${rows.length} people`}>
        <DataTable data={rows} columns={columns as any} isLoading={isLoading} hideActions hideInternalSearch emptyMessage="No staff found for these filters." />
      </ReportCard>
    </div>
  );
}
