"use client";
import { ReportSummary } from "@/components/reports/report-kit";
import { BreakdownCard, PrimaryPill } from "@/components/shared/overview-kit";
import { CalendarCheck, CalendarRange, Cpu, UserRound } from "lucide-react";

import { useRouter, useSearchParams } from "next/navigation";
import { useState, Suspense } from "react";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { DataTable } from "@/components/shared/data-table";
import { AuditDetailsModal } from "@/components/audit/audit-details-modal";
import { format } from "date-fns";
import {
  ClipboardList,
  UserCircle,
  ShieldAlert,
  History,
  Terminal,
  Search,
  Fingerprint,
  Info,
  ShieldCheck,
  Zap,
  Activity,
  Globe,
  ArrowUpRight,
  Database,
} from "lucide-react";
import { cn } from "@/lib/utils";

function AuditLogsPageInner() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";
  const [selectedLog, setSelectedLog] = useState<any>(null);
  const [detailsOpen, setDetailsOpen] = useState(false);

  const { data: reportData, isLoading } = useQuery({
    queryKey: ["audit-logs"],
    queryFn: async () => {
      const res = await api.get("/audit-logs");
      return res.data.data || res.data;
    },
  });

  const logs = Array.isArray(reportData) ? reportData : reportData?.items || [];

  const totalLogs = logs.length;
  const systemLogs = logs.filter((l: any) => !l.user).length;
  const userLogs = totalLogs - systemLogs;

  const columns = [
    {
      header: "Action",
      accessor: (log: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-8 w-8 rounded-xl flex items-center justify-center",
              log.action.includes("CREATE")
                ? "bg-blue-600"
                : log.action.includes("DELETE")
                  ? "bg-rose-600"
                  : "bg-blue-600",
            )}
          >
            <Terminal className="h-4 w-4 text-white" />
          </div>
          <div className="flex flex-col">
            <span className="font-semibold text-[14px] text-slate-800">
              {log.action}
            </span>
            <span className="text-[11px] font-medium text-slate-400 uppercase tracking-[0.05em] mt-0.5">
              {log.resource} · {log.id?.slice(0, 8)}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Protocol",
      accessor: (log: any) => (
        <span className="inline-flex items-center gap-1 px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border border-blue-200 bg-blue-50 text-blue-700">
          <ShieldCheck size={10} />
          Authenticated
        </span>
      ),
    },
    {
      header: "Status",
      accessor: (log: any) => (
        <span className="inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border border-emerald-200 bg-emerald-50 text-emerald-700">
          Verified
        </span>
      ),
    },
    {
      header: "Initiator",
      accessor: (log: any) => (
        <div className="flex flex-col">
          <div className="flex items-center gap-1.5">
            <UserCircle className="w-3.5 h-3.5 text-slate-400" />
            <span className="text-[13px] font-medium text-slate-700">
              {log.user?.name || "SYSTEM"}
            </span>
          </div>
          <span className="text-[11px] text-slate-400 mt-0.5">
            {log.user?.role || "Core Process"}
          </span>
        </div>
      ),
    },
    {
      header: "Timestamp",
      accessor: (log: any) => (
        <div className="flex flex-col text-right pr-4">
          <span className="text-[13px] font-medium text-slate-700">
            {format(new Date(log.createdAt || Date.now()), "HH:mm:ss")}
          </span>
          <span className="text-[11px] text-slate-400 mt-0.5">
            {format(new Date(log.createdAt || Date.now()), "MMM dd, yyyy")}
          </span>
        </div>
      ),
    },
  ];

  return (
    <>
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Compliance & Audit"
          subtitle="Monitor all platform activities and trace records"
          iconName="ShieldAlert"
          tabs={["Overview", "All"]}
          tabParamName="tab"
          activeTab={tab}
          hideBackArrow={true}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          {tab.toLowerCase() === "overview" && (() => {
            const now = Date.now();
            const startToday = new Date();
            startToday.setHours(0, 0, 0, 0);
            const today = logs.filter((l: any) => new Date(l.createdAt) >= startToday).length;
            const week = logs.filter((l: any) => now - new Date(l.createdAt).getTime() < 7 * 86_400_000).length;
            const tally = (key: (l: any) => string | undefined) => {
              const m = new Map<string, number>();
              logs.forEach((l: any) => {
                const k = key(l);
                if (k) m.set(k, (m.get(k) ?? 0) + 1);
              });
              return [...m.entries()].map(([label, value]) => ({ label, value }));
            };
            const actions = tally((l) => String(l.action ?? "").replace(/_/g, " ").toLowerCase().replace(/^\w/, (c) => c.toUpperCase()));
            const people = tally((l) => l.user?.name);
            return (
              <div className="flex flex-col gap-5">
                <ReportSummary
                  label="Recorded activity"
                  value={isLoading ? "…" : logs.length.toLocaleString("en-US")}
                  note="Every sign-in, approval and change on the platform"
                  loading={isLoading}
                  chips={[
                    { label: "Today", value: today.toLocaleString("en-US"), icon: CalendarCheck },
                    { label: "Last 7 days", value: week.toLocaleString("en-US"), icon: CalendarRange },
                    { label: "People involved", value: String(people.length), icon: UserRound },
                    { label: "By the system", value: logs.filter((l: any) => !l.user).length.toLocaleString("en-US"), icon: Cpu },
                  ]}
                />
                <div className="grid gap-5 lg:grid-cols-2">
                  <BreakdownCard
                    title="Most common actions"
                    subtitle="What happens most often"
                    items={actions.sort((a, b) => b.value - a.value).slice(0, 8)}
                    empty="No activity recorded yet."
                    action={<PrimaryPill onClick={() => router.push("?tab=all")}>Full log</PrimaryPill>}
                  />
                  <BreakdownCard
                    title="Most active people"
                    subtitle="Who made the most changes"
                    items={people.sort((a, b) => b.value - a.value).slice(0, 8)}
                    empty="No one has made changes yet."
                  />
                </div>
              </div>
            );
          })()}

          {tab.toLowerCase() === "all" && (
            <div className="bg-white rounded-[20px] border border-[#E2E2E2] overflow-hidden">
              <DataTable
                title="Entity Audit Log"
                data={logs || []}
                columns={columns}
                isLoading={isLoading}
                hideInternalSearch={true}
                hideActions={true}
                onRowClick={(log) => {
                  setSelectedLog(log);
                  setDetailsOpen(true);
                }}
              />
            </div>
          )}
        </div>
      </div>

    <AuditDetailsModal
      log={selectedLog}
      open={detailsOpen}
      onOpenChange={setDetailsOpen}
    />
    </>
  );
}

export default function AuditLogsPage() {
  return (
    <Suspense
      fallback={
        <div className="flex items-center justify-center min-h-[300px]">
          Loading audit data...
        </div>
      }
    >
      <AuditLogsPageInner />
    </Suspense>
  );
}
