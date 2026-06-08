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
      header: "Action Node",
      accessor: (log: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-10 w-10 rounded-[10px] flex items-center justify-center shadow-lg transition-all duration-300",
              log.action.includes("CREATE")
                ? "bg-slate-900 shadow-slate-100"
                : log.action.includes("DELETE")
                  ? "bg-rose-600 shadow-rose-100"
                  : "bg-blue-600 shadow-blue-100",
            )}
          >
            <Terminal className="h-5 w-5 text-white" />
          </div>
          <div className="flex flex-col">
            <span className="font-black text-slate-900 text-[14px] tracking-tight group-hover:text-blue-600 transition-colors uppercase">
              {log.action}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest leading-none mt-1">
              {log.resource} Trace · {log.id?.slice(0, 8)}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "System Protocol",
      accessor: (log: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1.5 px-2.5 py-1 bg-blue-50 border border-blue-100 rounded-[10px] w-fit">
            <ShieldCheck size={12} className="text-blue-600" />
            <span className="text-[10px] font-black text-blue-700 uppercase tracking-widest">
              Authenticated
            </span>
          </div>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest pl-1">
            V.PROTO: 2.1
          </span>
        </div>
      ),
    },
    {
      header: "Trace Status",
      accessor: (log: any) => (
        <div className="flex items-center gap-2">
          <div className="w-1.5 h-1.5 rounded-full bg-emerald-500 shadow-[0_0_8px_rgba(16,185,129,0.5)]" />
          <span className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em]">
            Verified Trace
          </span>
        </div>
      ),
    },
    {
      header: "Initiator Node",
      accessor: (log: any) => (
        <div className="flex flex-col">
          <div className="flex items-center gap-2 text-slate-900">
            <UserCircle className="w-4 h-4 text-slate-400" />
            <span className="text-[13px] font-black tracking-tight">
              {log.user?.name || "SYSTEM AUTO"}
            </span>
          </div>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest mt-1">
            {log.user?.role || "CORE PROCESS"}
          </span>
        </div>
      ),
    },
    {
      header: "Timestamp",
      accessor: (log: any) => (
        <div className="flex flex-col text-right pr-4">
          <span className="text-[12px] font-black text-slate-900">
            {format(new Date(log.createdAt || Date.now()), "HH:mm:ss")}
          </span>
          <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest leading-none mt-1">
            {format(new Date(log.createdAt || Date.now()), "MMM dd, yyyy")}
          </span>
        </div>
      ),
    },
  ];

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
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
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
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
                    className="flex flex-col p-6 bg-white border border-slate-100 rounded-[10px] shadow-sm group hover:border-slate-300 transition-all hover:shadow-xl hover:shadow-slate-100/50"
                  >
                    <div className="flex items-center justify-between mb-4">
                      <div className={cn("p-2.5 rounded-[10px]", stat.bg)}>
                        <stat.icon className={cn("w-5 h-5", stat.color)} />
                      </div>
                      <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest leading-none">
                        {stat.label}
                      </span>
                    </div>
                    <div className="flex items-baseline gap-2">
                      <span className="text-3xl font-black text-slate-900 tabular-nums">
                        {stat.count}
                      </span>
                    </div>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-slate-900 rounded-[10px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[400px]">
                  <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-rose-500/10 rounded-full blur-[100px]" />

                  <div className="relative z-10">
                    <div className="h-12 w-12 rounded-[10px] bg-white/10 flex items-center justify-center mb-8 border border-white/10 backdrop-blur-md shadow-2xl shadow-rose-500/10">
                      <Fingerprint
                        className="h-6 w-6 text-rose-400"
                        strokeWidth={2.5}
                      />
                    </div>
                    <h3 className="text-[24px] font-black tracking-tight leading-none mb-3">
                      Audit Trails
                    </h3>
                    <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-80 mb-6">
                      Every state change, authentication event, and secure
                      protocol invocation is immutably logged for strict
                      compliance monitoring.
                    </p>
                  </div>

                  <div className="relative z-10 space-y-3">
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          Trace Count
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          Total Logs
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-emerald-400 tabular-nums">
                        {totalLogs}
                      </span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-16 h-16 rounded-full bg-blue-50 flex items-center justify-center mb-4">
                    <Activity className="w-8 h-8 text-blue-500" />
                  </div>
                  <h4 className="text-[16px] font-black text-slate-900 mb-2">
                    Audit Event Frequency
                  </h4>
                  <p className="text-[13px] text-slate-400 max-w-md">
                    Detailed graphical analysis of system load and event action
                    velocity will be populated here.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all" && (
            <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden p-1">
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
    </div>
  );
}

export default function AuditLogsPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">
          Loading audit data...
        </div>
      }
    >
      <AuditLogsPageInner />
    </Suspense>
  );
}
