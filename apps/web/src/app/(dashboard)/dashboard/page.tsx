import { auth } from "@/auth";
import { RevenueChart } from "@/components/dashboard/revenue-chart";
import { ActionRequiredPanel } from "@/components/dashboard/quick-approve-panel";
import { SuperAdminWidgets } from "@/components/dashboard/super-admin-widgets";
import { RecentActivity } from "@/components/dashboard/recent-activity";
import { StatCard, Panel } from "@/components/dashboard/dashboard-shell";
import { PageHeader } from "@/components/layout/page-header";
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
    Users
} from "lucide-react";

// ─── Quick Action Card ────────────────────────────────────────────────────────
function QuickActionCard({
    title,
    description,
    href,
    icon: Icon,
    color,
}: {
    title: string;
    description: string;
    href: string;
    icon: React.ElementType;
    color: string;
}) {
    return (
        <a 
            href={href}
            className="group relative bg-white rounded-3xl border border-slate-100 p-6 flex flex-col gap-4 shadow-sm hover:shadow-2xl hover:shadow-slate-200 transition-all duration-300 active:scale-[0.98] overflow-hidden"
        >
            <div 
                className="w-12 h-12 rounded-2xl flex items-center justify-center transition-transform duration-300 group-hover:scale-110"
                style={{ backgroundColor: `${color}15` }}
            >
                <Icon size={20} style={{ color }} strokeWidth={2.5} />
            </div>
            
            <div>
                <h3 className="text-sm font-black text-slate-900 mb-1">{title}</h3>
                <p className="text-[11px] text-slate-400 font-bold leading-none">{description}</p>
            </div>

            {/* Accent Corner Overlay */}
            <div 
                className="absolute top-0 right-0 w-16 h-16 opacity-[0.03] group-hover:opacity-[0.08] transition-opacity"
                style={{ 
                    backgroundColor: color,
                    clipPath: "polygon(100% 0, 0 0, 100% 100%)"
                }}
            />
        </a>
    );
}

// ─────────────────────────────────────────────────────────────────────────────
import { getStats } from "@/lib/stats";
import { RefreshTrigger } from "@/components/utils/refresh-trigger";

// ─────────────────────────────────────────────────────────────────────────────
async function getDashboardData(user: { id: string, role: string }) {
    return getStats(user);
}

type Trend = { value: string; up: boolean } | undefined;

// ─── KPI Card ─────────────────────────────────────────────────────────────────
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
    sub: string;
    icon: React.ElementType;
    accent: string;
    trend?: Trend;
}) {
    return (
        <div className="relative group bg-white rounded-2xl border border-slate-100 p-5 flex flex-col gap-4 shadow-[0_1px_3px_rgba(0,0,0,0.04)] hover:shadow-[0_4px_16px_rgba(0,0,0,0.08)] hover:-translate-y-0.5 transition-all duration-200">
            {/* Top row */}
            <div className="flex items-start justify-between">
                <div
                    className="w-9 h-9 rounded-xl flex items-center justify-center"
                    style={{ backgroundColor: `${accent}15` }}
                >
                    <Icon size={16} style={{ color: accent }} strokeWidth={2.5} />
                </div>
                {trend && (
                    <span
                        className={`inline-flex items-center gap-0.5 text-[10px] font-bold px-1.5 py-0.5 rounded-full ${trend.up
                            ? "bg-emerald-50 text-emerald-600"
                            : "bg-rose-50 text-rose-500"
                            }`}
                    >
                        {trend.up ? (
                            <TrendingUp size={9} strokeWidth={3} />
                        ) : (
                            <TrendingDown size={9} strokeWidth={3} />
                        )}
                        {trend.value}
                    </span>
                )}
            </div>

            {/* Value */}
            <div>
                <p className="text-2xl font-extrabold text-slate-900 tracking-tight leading-none tabular-nums">
                    {value.toLocaleString()}
                </p>
                <p className="text-[11px] font-semibold text-slate-400 mt-1.5 uppercase tracking-wider">
                    {label}
                </p>
            </div>

            {/* Bottom accent line */}
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
        <p className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-slate-400 mb-4">
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
            className={`bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] ${className}`}
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
        <div className="flex items-center justify-between px-6 py-4 border-b border-slate-50">
            <div className="flex items-center gap-2.5">
                <div
                    className="w-7 h-7 rounded-lg flex items-center justify-center"
                    style={{ backgroundColor: `${iconColor}15` }}
                >
                    <Icon size={13} style={{ color: iconColor }} strokeWidth={2.5} />
                </div>
                <span className="text-sm font-bold text-slate-800">{title}</span>
                {badge}
            </div>
            {action && (
                <div className="text-[10px] font-extrabold uppercase tracking-widest text-indigo-500 hover:text-indigo-700 transition-colors cursor-pointer">
                    {action}
                </div>
            )}
        </div>
    );
}

// ─── Page ─────────────────────────────────────────────────────────────────────
export default async function Page({
    searchParams,
}: {
    searchParams: Promise<{ [key: string]: string | string[] | undefined }>;
}) {
    const params = await searchParams;
    const session = await auth();
    const role = session?.user?.role || "USER";
    const isSuperAdmin = role === "SUPER_ADMIN";
    const isAdmin = role === "ADMIN";
    const isOperator = role === "OPERATOR";
    const isAgent = role === "AGENT";

    const terminalFilter = (params.terminal as string) || "all";
    const chartRange = (params.range as string) || "monthly";

    const dashboardData = await getDashboardData(session.user) || {
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
    const trends = (d.trends || {}) as Record<string, Trend>;

    const kpis = isOperator ? [
        {
            label: "Received",
            value: d.received || 0,
            sub: "In processing",
            icon: Zap,
            accent: "#2563eb",
        },
        {
            label: "Delivered",
            value: d.delivered || 0,
            sub: "Customer handover",
            icon: CheckCircle2,
            accent: "#10b981",
        },
        {
            label: "Sent",
            value: d.sent || 0,
            sub: "En route",
            icon: Truck,
            accent: "#8b5cf6",
        },
        {
            label: "At Warehouse",
            value: d.atWarehouse || 0,
            sub: "Stored",
            icon: LayoutGrid,
            accent: "#f59e0b",
        },
        {
            label: "Total Volume",
            value: (d.received || 0) + (d.delivered || 0) + (d.sent || 0) + (d.atWarehouse || 0),
            sub: "All movements",
            icon: Activity,
            accent: "#6366f1",
        },
        {
            label: "Pending Approvals",
            value: d.pendingRequests,
            sub: "Action required",
            icon: Clock,
            accent: "#f43f5e",
        },
    ] : [
        {
            label: "Total Requests",
            value: d.totalRequests,
            sub: "All time",
            icon: LayoutGrid,
            accent: "#6366f1",
            trend: trends.totalRequests,
        },
        {
            label: "Pending",
            value: d.pendingRequests,
            sub: "Awaiting action",
            icon: Clock,
            accent: "#f59e0b",
            trend: trends.pendingRequests,
        },
        {
            label: "Approved",
            value: d.approvedRequests,
            sub: "Processed",
            icon: CheckCircle2,
            accent: "#10b981",
            trend: trends.approvedRequests,
        },
        {
            label: "Rejected",
            value: d.rejectedRequests,
            sub: "Did not pass review",
            icon: XCircle,
            accent: "#f43f5e",
            trend: trends.rejectedRequests,
        },
        {
            label: "Paid",
            value: d.paidCount,
            sub: "Payments received",
            icon: CreditCard,
            accent: "#0ea5e9",
            trend: trends.paidCount,
        },
        {
            label: "Awaiting Payment",
            value: d.awaitingPaymentCount,
            sub: "Pending settlement",
            icon: Activity,
            accent: "#8b5cf6",
            trend: trends.awaitingPaymentCount,
        },
    ];

    const userName = session?.user?.name || "Operator";
    const today = new Date().toLocaleDateString("en-GB", {
        weekday: "long",
        day: "2-digit",
        month: "long",
        year: "numeric",
    });

    const getGreeting = () => {
        const hour = new Date().getHours();
        if (hour < 12) return "Good morning";
        if (hour < 17) return "Good afternoon";
        return "Good evening";
    };

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <RefreshTrigger interval={30000} />
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                {/* ── HEADER ── */}
                <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                    <div>
                        <div className="flex items-center gap-2 mb-1">
                            <span className="inline-flex items-center gap-1.5 text-[10px] font-extrabold uppercase tracking-[0.18em] text-indigo-500 bg-indigo-50 px-2.5 py-1 rounded-full">
                                <span className="w-1.5 h-1.5 rounded-full bg-indigo-500 animate-pulse" />
                                Live
                            </span>
                        </div>
                        <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">
                            {isSuperAdmin ? "Operations Hub" : `${getGreeting()}, ${userName.split(" ")[0]}`}
                        </h1>
                        <p className="text-sm text-slate-400 font-medium mt-0.5">
                            {isSuperAdmin && "Global oversight · terminals · financial performance"}
                            {isAdmin && "Branch performance · your approvals · pending tasks"}
                            {isOperator && "Daily operations · queue management · rapid approvals"}
                            {isAgent && "Cargo reception · your submissions · transaction tracking"}
                            {!['SUPER_ADMIN', 'ADMIN', 'OPERATOR', 'AGENT'].includes(role) && "Here's your operations snapshot for today"}
                        </p>
                    </div>

                    <div className="flex items-center gap-3">
                        {/* Admin Performance */}
                        {isAdmin && d.adminPerformance && (
                            <div className="flex items-center divide-x divide-slate-100 bg-white border border-slate-100 rounded-xl shadow-[0_1px_4px_rgba(0,0,0,0.05)] overflow-hidden">
                                <div className="px-4 py-3">
                                    <p className="text-[9px] font-extrabold uppercase tracking-widest text-slate-400">Approvals</p>
                                    <p className="text-lg font-extrabold text-slate-900 leading-none mt-0.5">{d.adminPerformance.approvalCount}</p>
                                </div>
                                <div className="px-4 py-3">
                                    <p className="text-[9px] font-extrabold uppercase tracking-widest text-slate-400">Success</p>
                                    <p className="text-lg font-extrabold text-indigo-600 leading-none mt-0.5">{d.adminPerformance.completionRate}</p>
                                </div>
                            </div>
                        )}

                        {/* Date */}
                        <div className="hidden md:flex flex-col justify-center bg-slate-900 text-white px-5 py-3 rounded-xl shadow-[0_4px_12px_rgba(15,23,42,0.15)]">
                            <p className="text-[8px] font-extrabold uppercase tracking-[0.2em] text-slate-400">Today</p>
                            <p className="text-xs font-bold mt-0.5 whitespace-nowrap">{today}</p>
                        </div>
                    </div>
                </div>

                {/* ── SUPER ADMIN TERMINAL PANEL ── */}
                {isSuperAdmin && (
                    <div>
                        <SectionLabel>Terminal Performance</SectionLabel>
                        <Card>
                            <CardHeader icon={LayoutGrid} title="Terminal Overview" />
                            <div className="p-6">
                                <SuperAdminWidgets stats={d.superAdminStats} filter={terminalFilter} />
                            </div>
                        </Card>
                    </div>
                )}

                {/* ── KPI CARDS ── */}
                <div>
                    <SectionLabel>Key Metrics</SectionLabel>
                    <div className="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-6 gap-4">
                        {kpis.map((k) => (
                            <KpiCard key={k.label} {...k} />
                        ))}
                    </div>
                </div>

                {/* ── ANALYTICS GRID ── */}
                <div className="flex flex-col gap-5">
                    <div>
                        <SectionLabel>Analytics</SectionLabel>
                        <div className="grid gap-5 lg:grid-cols-12">
                            {/* Left Column - Now taking more space or 12 cols if needed */}
                            <div className="lg:col-span-12 flex flex-col gap-5">
                                {/* Chart */}
                                <Card>
                                    <CardHeader
                                        icon={Activity}
                                        title="Operation Volume"
                                        iconColor="#6366f1"
                                        action="Export"
                                    />
                                    <div className="p-6">
                                        <RevenueChart data={dashboardData.chartData} />
                                    </div>
                                </Card>

                                 {isOperator && (
                                     <div className="mb-8">
                                         <SectionLabel>Operator Command Center</SectionLabel>
                                         <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">
                                             <QuickActionCard 
                                                 title="Receive Cargo" 
                                                 description="Process incoming parcel"
                                                 href="/cargo/receive"
                                                 icon={Zap}
                                                 color="#2563eb"
                                             />
                                             <QuickActionCard 
                                                 title="Send Cargo" 
                                                 description="Dispatch to destination"
                                                 href="/cargo/send"
                                                 icon={Truck}
                                                 color="#8b5cf6"
                                             />
                                             <QuickActionCard 
                                                 title="Deliver Cargo" 
                                                 description="Customer handover"
                                                 href="/cargo/deliver"
                                                 icon={CheckCircle2}
                                                 color="#10b981"
                                             />
                                             <QuickActionCard 
                                                 title="Track Cargo" 
                                                 description="Real-time locator"
                                                 href="/cargo/track"
                                                 icon={Activity}
                                                 color="#f59e0b"
                                             />
                                             <QuickActionCard 
                                                 title="Get Reports" 
                                                 description="Performance analytics"
                                                 href="/reports"
                                                 icon={FileText}
                                                 color="#f43f5e"
                                             />
                                         </div>
                                     </div>
                                 )}

                                 {d.pendingList?.length > 0 && (
                                     <ActionRequiredPanel requests={d.pendingList} role={session.user.role} />
                                 )}

                                 {isAgent && (
                                    <div className="bg-indigo-600 rounded-3xl p-8 text-white relative overflow-hidden shadow-2xl shadow-indigo-200">
                                        <div className="relative z-10">
                                            <h3 className="text-xl font-black mb-2">New Cargo Reception?</h3>
                                            <p className="text-indigo-100 text-sm mb-6 max-w-sm">Capture new cargo details and generate invoices instantly to keep operations moving fast.</p>
                                            <a href="/cargo/receive" className="inline-flex items-center gap-2 bg-white text-indigo-600 px-6 py-3 rounded-xl font-bold text-sm hover:scale-105 transition-transform shadow-xl">
                                                <Zap size={16} fill="currentColor" />
                                                Receive Cargo Now
                                            </a>
                                        </div>
                                        <div className="absolute -right-10 -bottom-10 opacity-20 transform rotate-12">
                                            <Truck size={240} strokeWidth={1} />
                                        </div>
                                    </div>
                                )}

                                {(isAdmin || isSuperAdmin) && (
                                    <div className="grid gap-5 lg:grid-cols-2 mt-5">
                                        {/* Top Stations */}
                                        <Card>
                                            <CardHeader icon={LayoutGrid} title="Top Stations" iconColor="#2563eb" />
                                            <div className="p-6">
                                                <div className="space-y-4">
                                                    {(d.volumeByStation || []).slice(0, 5).map((station: any, i: number) => (
                                                        <div key={i} className="flex items-center justify-between">
                                                            <div className="flex items-center gap-3">
                                                                <div className="w-8 h-8 rounded-lg bg-blue-50 flex items-center justify-center text-[10px] font-black text-blue-600">
                                                                    {i + 1}
                                                                </div>
                                                                <span className="text-xs font-bold text-slate-700">{station.name || "Main Terminal"}</span>
                                                            </div>
                                                            <span className="text-xs font-black text-slate-900 tabular-nums">{station.volume} cmds</span>
                                                        </div>
                                                    ))}
                                                    {(!d.volumeByStation || d.volumeByStation.length === 0) && (
                                                        <p className="text-center py-4 text-xs text-slate-400 font-medium">No station data available yet</p>
                                                    )}
                                                </div>
                                            </div>
                                        </Card>

                                        {/* Top Operators */}
                                        <Card>
                                            <CardHeader icon={Users} title="Top Operators" iconColor="#10b981" />
                                            <div className="p-6">
                                                <div className="space-y-4">
                                                    {(d.topOperators || []).slice(0, 5).map((op: any, i: number) => (
                                                        <div key={i} className="flex items-center justify-between">
                                                            <div className="flex items-center gap-3">
                                                                <div className="w-8 h-8 rounded-lg bg-emerald-50 flex items-center justify-center text-[10px] font-black text-emerald-600">
                                                                    {i + 1}
                                                                </div>
                                                                <span className="text-xs font-bold text-slate-700">{op.name}</span>
                                                            </div>
                                                            <div className="flex items-center gap-2">
                                                                <div className="h-1.5 w-16 bg-slate-100 rounded-full overflow-hidden hidden sm:block">
                                                                    <div 
                                                                        className="h-full bg-emerald-400" 
                                                                        style={{ width: `${Math.min(100, (op.volume / Math.max(1, (d.topOperators[0]?.volume || 1))) * 100)}%` }} 
                                                                    />
                                                                </div>
                                                                <span className="text-xs font-black text-slate-900 tabular-nums">{op.volume} unit</span>
                                                            </div>
                                                        </div>
                                                    ))}
                                                    {(!d.topOperators || d.topOperators.length === 0) && (
                                                        <p className="text-center py-4 text-xs text-slate-400 font-medium">No operator data available yet</p>
                                                    )}
                                                </div>
                                            </div>
                                        </Card>
                                    </div>
                                )}
                            </div>
                        </div>
                    </div>

                    {/* Full Width Activity Feed */}
                    {/* <div>
                        <SectionLabel>Recent Activity</SectionLabel>
                        <Card className="w-full">
                            <CardHeader
                                icon={Clock}
                                title="System Logs"
                                iconColor="#8b5cf6"
                                action="View all history"
                            />
                            <div className="p-6">
                                <RecentActivity activities={d.recentActivity} />
                            </div>
                        </Card>
                    </div> */}
                </div>

                {/* ── FOOTER ── */}
                <div className="flex items-center justify-between pt-2 border-t border-slate-200/60 pb-4">
                    <p className="text-[9px] text-slate-300 font-extrabold uppercase tracking-[0.22em]">
                        Mizigo · v2.4
                    </p>
                    <div className="flex items-center gap-2">
                        <span className="w-1.5 h-1.5 rounded-full bg-emerald-400" />
                        <span className="text-[9px] font-bold text-slate-300 uppercase tracking-wider">All systems operational</span>
                    </div>
                </div>

            </div>
        </div>
    );
}