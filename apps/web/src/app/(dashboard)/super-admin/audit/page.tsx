"use client";

import { useSearchParams } from "next/navigation";
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
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-6">
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                {[
                  {
                    label: "Total Events",
                    count: totalLogs,
                    icon: History,
                    color: "text-blue-600",
                    bg: "bg-blue-50",
                  },
                  {
                    label: "System Actions",
                    count: systemLogs,
                    icon: Database,
                    color: "text-emerald-600",
                    bg: "bg-emerald-50",
                  },
                  {
                    label: "User Actions",
                    count: userLogs,
                    icon: UserCircle,
                    color: "text-indigo-600",
                    bg: "bg-indigo-50",
                  },
                  {
                    label: "Security Alerts",
                    count: "0",
                    icon: ShieldAlert,
                    color: "text-rose-600",
                    bg: "bg-rose-50",
                  },
                ].map((stat, i) => (
                  <div
                    key={i}
                    className="flex flex-col p-5 bg-white border border-[#E2E2E2] rounded-[20px]"
                  >
                    <div className="flex items-center justify-between mb-3">
                      <div className={cn("p-2 rounded-xl", stat.bg)}>
                        <stat.icon className={cn("w-4 h-4", stat.color)} />
                      </div>
                      <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                        {stat.label}
                      </span>
                    </div>
                    <span className="text-[26px] font-semibold text-slate-900 tabular-nums">
                      {stat.count}
                    </span>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-white border border-[#E2E2E2] rounded-[20px] flex flex-col min-h-[360px]">
                  <div className="px-5 py-4 border-b border-slate-200 flex items-center gap-2">
                    <Fingerprint className="h-4 w-4 text-slate-500" strokeWidth={2.5} />
                    <h3 className="text-[14px] font-semibold text-slate-800">
                      Audit Trails
                    </h3>
                  </div>
                  <div className="p-5 flex flex-col flex-1">
                    <p className="text-[13px] text-slate-500 leading-relaxed mb-5">
                      Every state change, authentication event, and secure
                      protocol invocation is immutably logged for strict
                      compliance monitoring.
                    </p>
                    <div className="space-y-2 mt-auto">
                      <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Trace Count
                        </span>
                        <span className="text-[14px] font-semibold text-emerald-600 tabular-nums">
                          {totalLogs}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[20px] border border-[#E2E2E2] p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-12 h-12 rounded-xl bg-blue-50 flex items-center justify-center mb-4">
                    <Activity className="w-6 h-6 text-blue-600" />
                  </div>
                  <h4 className="text-[14px] font-semibold text-slate-800 mb-2">
                    Audit Event Frequency
                  </h4>
                  <p className="text-[13px] text-slate-500 max-w-md">
                    Detailed graphical analysis of system load and event action
                    velocity will be populated here.
                  </p>
                </div>
              </div>
            </div>
          )}

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
