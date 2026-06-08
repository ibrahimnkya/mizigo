import { auth } from "@/auth";
import { RevenueChart } from "@/components/dashboard/revenue-chart";
import { ActionRequiredPanel } from "@/components/dashboard/quick-approve-panel";
import { SuperAdminWidgets } from "@/components/dashboard/super-admin-widgets";
import { RecentActivity } from "@/components/dashboard/recent-activity";
import { UnifiedDashboardContent } from "@/components/dashboard/unified-dashboard-content";
import {
  Clock,
  CheckCircle2,
  XCircle,
  CreditCard,
  LayoutGrid,
  Activity,
  Zap,
  TrendingUp,
  TrendingDown,
  Truck,
  FileText,
  Users,
  Globe,
} from "lucide-react";

import { getStats } from "@/lib/stats";
import { RefreshTrigger } from "@/components/utils/refresh-trigger";

// ─── KPI Card (Registry Styled) ──────────────────────────────────────────────
function KpiCard({
  label,
  value,
  sub,
  icon: Icon,
  accent,
  trend,
}: {
  label: string;
  value: number;
  sub?: string;
  icon: React.ElementType;
  accent: string;
  trend?: { value: string; up: boolean };
}) {
  return (
    <div className="relative group bg-white rounded-[10px] p-5 flex flex-col gap-4 shadow-[0_1px_3px_rgba(0,0,0,0.04)] hover:shadow-[0_10px_30px_-10px_rgba(0,0,0,0.05)] hover:-translate-y-0.5 transition-all duration-300">
      <div className="flex items-start justify-between">
        <div
          className="w-9 h-9 rounded-[10px] flex items-center justify-center"
          style={{ backgroundColor: `${accent}15` }}
        >
          <Icon size={16} style={{ color: accent }} strokeWidth={2.5} />
        </div>
        {trend && (
          <span
            className={`inline-flex items-center gap-0.5 text-[10px] font-black px-2 py-0.5 rounded-full ${
              trend.up
                ? "bg-emerald-50 text-emerald-600"
                : "bg-rose-50 text-rose-500"
            }`}
          >
            {trend.value}
          </span>
        )}
      </div>

      <div>
        <p className="text-2xl font-black text-slate-900 tracking-tight leading-none tabular-nums">
          {value.toLocaleString()}
        </p>
        <p className="text-[10px] font-black text-slate-400 mt-2 uppercase tracking-widest opacity-60">
          {label}
        </p>
      </div>

      <div
        className="absolute bottom-0 left-4 right-4 h-[2px] rounded-full opacity-0 group-hover:opacity-100 transition-opacity duration-200"
        style={{ backgroundColor: accent }}
      />
    </div>
  );
}

// ─── Section Label ─────────────────────────────────────────────────────────────
function SectionLabel({ children }: { children: React.ReactNode }) {
  return (
    <p className="text-[10px] font-black uppercase tracking-[0.25em] text-slate-400 mb-6">
      {children}
    </p>
  );
}

// ─── Card Shell ────────────────────────────────────────────────────────────────
function Card({
  children,
  className = "",
}: {
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <div
      className={`bg-white rounded-[10px] border border-slate-100 shadow-sm overflow-hidden ${className}`}
    >
      {children}
    </div>
  );
}

// ─── Card Header ───────────────────────────────────────────────────────────────
function CardHeader({
  icon: Icon,
  title,
  iconColor = "#6366f1",
  action,
  badge,
}: {
  icon: React.ElementType;
  title: string;
  iconColor?: string;
  action?: React.ReactNode;
  badge?: React.ReactNode;
}) {
  return (
    <div className="flex items-center justify-between px-8 py-6 border-b border-slate-50">
      <div className="flex items-center gap-3">
        <div
          className="w-8 h-8 rounded-[10px] flex items-center justify-center shadow-sm"
          style={{ backgroundColor: `${iconColor}15` }}
        >
          <Icon size={14} style={{ color: iconColor }} strokeWidth={2.5} />
        </div>
        <span className="text-sm font-black text-slate-800 uppercase tracking-tight">
          {title}
        </span>
        {badge}
      </div>
      {action && (
        <div className="text-[10px] font-black uppercase tracking-widest text-indigo-500 hover:text-indigo-700 transition-colors cursor-pointer">
          {action}
        </div>
      )}
    </div>
  );
}

// ─── Dashboard Integration Logic ──────────────────────────────────────────────
async function getDashboardData(user: { id: string; role: string }) {
  return getStats(user);
}

export default async function Page({
  searchParams,
}: {
  searchParams: Promise<{ [key: string]: string | string[] | undefined }>;
}) {
  const params = await searchParams;
  const session = await auth();
  if (!session?.user) return null;

  const role = session.user.role;
  const isSuperAdmin = role === "SUPER_ADMIN";
  const isAdmin = role === "ADMIN";
  const isOperator = role === "OPERATOR";
  const isAgent = role === "AGENT";

  const terminalFilter = (params.terminal as string) || "all";
  const dashboardData = (await getDashboardData(session.user)) || {
    chartData: [],
    recentActivity: [],
    totalRequests: 0,
    pendingRequests: 0,
    approvedRequests: 0,
    rejectedRequests: 0,
    received: 0,
    delivered: 0,
    sent: 0,
    atWarehouse: 0,
    paidCount: 0,
    awaitingPaymentCount: 0,
    pendingList: [],
    superAdminStats: null,
    adminPerformance: null,
    trends: {},
    volumeByStation: [],
    topOperators: [],
  };

  const d = dashboardData;
  const userName = session.user.name || "Administrator";
  const trends = (d.trends || {}) as any;

  // KPI Data Construction
  const kpis = [
    {
      label: "Total Requests",
      value: d.totalRequests,
      icon: LayoutGrid,
      accent: "#6366f1",
      trend: trends.totalRequests,
    },
    {
      label: "Pending Node",
      value: d.pendingRequests,
      icon: Clock,
      accent: "#f59e0b",
      trend: trends.pendingRequests,
    },
    {
      label: "Approved System",
      value: d.approvedRequests,
      icon: CheckCircle2,
      accent: "#10b981",
      trend: trends.approvedRequests,
    },
    {
      label: "Settled Paid",
      value: d.paidCount,
      icon: CreditCard,
      accent: "#0ea5e9",
      trend: trends.paidCount,
    },
    {
      label: "Total Volume",
      value: (d.received || 0) + (d.delivered || 0) + (d.sent || 0),
      icon: Activity,
      accent: "#8b5cf6",
    },
    {
      label: "Security Trace",
      value: d.rejectedRequests,
      icon: XCircle,
      accent: "#f43f5e",
      trend: trends.rejectedRequests,
    },
  ];

  return (
    <div className="flex flex-col gap-2 p-2 min-h-screen bg-[#f8f9fb] animate-in fade-in duration-700">
      <RefreshTrigger interval={30000} />
      <div className="space-y-12 py-8 px-4 max-w-[1520px] mx-auto w-full">
        {/* ── HEADER ── */}
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-6 px-2">
          <div className="space-y-1">
            <div className="flex items-center gap-2">
              <span className="inline-flex items-center gap-1.5 text-[9px] font-black uppercase tracking-[0.3em] text-indigo-500 bg-indigo-50 px-3 py-1 rounded-full border border-indigo-100">
                <span className="w-1 h-1 rounded-full bg-indigo-500 animate-pulse" />
                Operational Protocol Active
              </span>
            </div>
            <h1 className="text-3xl font-black text-slate-900 tracking-tighter uppercase leading-none">
              {isSuperAdmin
                ? "Control Center: Global Registry"
                : "Operational Dashboard"}
            </h1>
            <p className="text-sm font-bold text-slate-400 tracking-tight opacity-70">
              Welcome, {userName}. Authorized administrative session active.
            </p>
          </div>

          <div className="hidden lg:flex flex-col items-end pr-6 border-r border-slate-100">
            <span className="text-[10px] font-black text-slate-300 uppercase tracking-widest leading-none mb-1">
              System Load
            </span>
            <span className="text-xl font-black text-slate-900 tabular-nums uppercase">
              Operational
            </span>
          </div>
        </div>

        {/* ── 1. OPERATIONAL HERO: PURSUIT MODE ── */}
        <UnifiedDashboardContent role={role} userName={userName} />

        {/* ── 2. NETWORK INTELLIGENCE GRID ── */}
        <section>
          <SectionLabel>Global Network Intelligence Matrix</SectionLabel>
          <div className="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-6 gap-4">
            {kpis.map((k) => (
              <KpiCard key={k.label} {...k} />
            ))}
          </div>
        </section>

        {/* ── 3. ANALYTICS & REGISTRY SEGMENT ── */}
        <div className="grid gap-12 lg:grid-cols-12">
          {/* LEFT PANEL: RECENT MANIFEST & APPROVALS */}
          <div className="lg:col-span-8 space-y-12">
            {/* RECENT MANIFEST */}
            <div>
              <SectionLabel>Real-Time Operations Manifest</SectionLabel>
              <div className="bg-white rounded-[10px] border border-slate-100 shadow-[0_20px_50px_-20px_rgba(0,0,0,0.06)] overflow-hidden p-2">
                <RecentActivity activities={d.recentActivity} />
              </div>
            </div>

            {/* PENDING APPROVALS */}
            {d.pendingList?.length > 0 && (
              <ActionRequiredPanel requests={d.pendingList} role={role} />
            )}

            {/* PERFORMANCE CHART */}
            {(isAdmin || isSuperAdmin) && (
              <div>
                <SectionLabel>Logistics Throughput Velocity</SectionLabel>
                <Card className="rounded-[10px]">
                  <CardHeader
                    icon={Activity}
                    title="Throughput Analytics"
                    iconColor="#6366f1"
                    action="Node Export"
                  />
                  <div className="p-8">
                    <RevenueChart data={d.chartData} />
                  </div>
                </Card>
              </div>
            )}
          </div>

          {/* RIGHT PANEL: NODE INSIGHTS */}
          <div className="lg:col-span-4 space-y-12">
            {/* TERMINAL OVERVIEW (SUPER ADMIN ONLY) */}
            {isSuperAdmin && (
              <div>
                <SectionLabel>Global Node Performance</SectionLabel>
                <Card className="rounded-[10px]">
                  <CardHeader
                    icon={Globe}
                    title="Regional Terminal Nodes"
                    iconColor="#6366f1"
                  />
                  <div className="p-6">
                    <SuperAdminWidgets
                      stats={d.superAdminStats}
                      filter={terminalFilter}
                    />
                  </div>
                </Card>
              </div>
            )}

            {/* TOP STATIONS (ADMIN) */}
            {(isAdmin || isSuperAdmin) && (
              <div>
                <SectionLabel>Station Volume Hierarchy</SectionLabel>
                <Card className="rounded-[10px]">
                  <CardHeader
                    icon={LayoutGrid}
                    title="Node Priority Matrix"
                    iconColor="#2563eb"
                  />
                  <div className="p-6">
                    <div className="space-y-4">
                      {(d.volumeByStation || [])
                        .slice(0, 5)
                        .map((station: any, i: number) => (
                          <div
                            key={i}
                            className="flex items-center justify-between group cursor-default"
                          >
                            <div className="flex items-center gap-3">
                              <div className="w-8 h-8 rounded-[10px] bg-blue-50 flex items-center justify-center text-[10px] font-black text-blue-600 group-hover:bg-blue-600 group-hover:text-white transition-colors">
                                {i + 1}
                              </div>
                              <span className="text-xs font-bold text-slate-700 uppercase tracking-tighter tabular-nums">
                                {station.name || "Node Terminal"}
                              </span>
                            </div>
                            <span className="text-[11px] font-black text-slate-900 tabular-nums">
                              {station.volume} OPS
                            </span>
                          </div>
                        ))}
                    </div>
                  </div>
                </Card>
              </div>
            )}

            {/* TOP OPERATORS (ADMIN) */}
            {(isAdmin || isSuperAdmin) && (
              <div>
                <SectionLabel>Operational Excellence Grid</SectionLabel>
                <Card className="rounded-[10px]">
                  <CardHeader
                    icon={Users}
                    title="Top Execution Nodes"
                    iconColor="#10b981"
                  />
                  <div className="p-6">
                    <div className="space-y-5">
                      {(d.topOperators || [])
                        .slice(0, 5)
                        .map((op: any, i: number) => (
                          <div key={i} className="flex flex-col gap-2">
                            <div className="flex items-center justify-between">
                              <span className="text-[11px] font-black text-slate-700 uppercase tracking-tight">
                                {op.name}
                              </span>
                              <span className="text-[11px] font-black text-slate-900 tabular-nums">
                                {op.volume} U/P
                              </span>
                            </div>
                            <div className="h-1.5 w-full bg-slate-50 rounded-full overflow-hidden">
                              <div
                                className="h-full bg-emerald-400 group-hover:bg-emerald-500 transition-all rounded-full"
                                style={{
                                  width: `${Math.min(100, (op.volume / Math.max(1, d.topOperators[0]?.volume || 1)) * 100)}%`,
                                }}
                              />
                            </div>
                          </div>
                        ))}
                    </div>
                  </div>
                </Card>
              </div>
            )}
          </div>
        </div>

        {/* ── FOOTER ── */}
        <div className="flex items-center justify-between pt-8 border-t border-slate-100">
          <p className="text-[10px] text-slate-300 font-extrabold uppercase tracking-[0.25em]">
            Mizigo Protocol Hub · v2.4.0
          </p>
          <div className="flex items-center gap-2">
            <span className="w-1.5 h-1.5 rounded-full bg-emerald-400" />
            <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest">
              All System Nodes Operational
            </span>
          </div>
        </div>
      </div>
    </div>
  );
}
