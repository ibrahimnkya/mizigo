import { Timer, TrendingUp, CheckCircle2, Zap, BarChart3, ArrowUpRight, Target } from "lucide-react"
import { cn } from "@/lib/utils"
import { auth } from "@/auth"
import { prisma } from "@repo/database"

async function getPerformanceData(userId: string) {
    // 1. Basic Stats
    const approvals = await prisma.cargoRequest.findMany({
        where: {
            approvedById: userId,
            status: { in: ['APPROVED', 'PAYMENT_PENDING', 'PAID', 'COMPLETED'] },
        },
        select: {
            createdAt: true,
            updatedAt: true
        }
    });

    const totalHandled = await prisma.cargoRequest.count({
        where: {
            approvedById: userId,
        }
    });

    const totalRejected = await prisma.cargoRequest.count({
        where: {
            approvedById: userId,
            status: 'REJECTED'
        }
    });

    // 2. Calculations
    const totalApprovals = approvals.length;
    let totalApprovalTimeMins = 0;
    let slaComplianceCount = 0;
    const SLA_THRESHOLD_MINS = 120; // 2 hours

    approvals.forEach(req => {
        if (req.updatedAt && req.createdAt) {
            const diffMs = req.updatedAt.getTime() - req.createdAt.getTime();
            const diffMins = Math.max(0, diffMs / (1000 * 60));
            totalApprovalTimeMins += diffMins;
            if (diffMins <= SLA_THRESHOLD_MINS) {
                slaComplianceCount++;
            }
        }
    });

    const avgApprovalTime = totalApprovals > 0 ? (totalApprovalTimeMins / totalApprovals).toFixed(1) : "0";
    const slaCompliance = totalApprovals > 0 ? ((slaComplianceCount / totalApprovals) * 100).toFixed(1) : "0";
    const rejectionRate = totalHandled > 0 ? ((totalRejected / totalHandled) * 100).toFixed(1) : "0";

    // 3. Weekly Activity (last 7 days)
    const weekAgo = new Date();
    weekAgo.setDate(weekAgo.getDate() - 6);
    weekAgo.setHours(0, 0, 0, 0);

    const weeklyApprovals = await prisma.cargoRequest.findMany({
        where: {
            approvedById: userId,
            status: { in: ['APPROVED', 'PAYMENT_PENDING', 'PAID', 'COMPLETED'] },
            updatedAt: { gte: weekAgo }
        },
        select: {
            updatedAt: true
        }
    });

    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'] as const;
    const weeklyDataMap: Record<string, number> = {};

    // Initialize last 7 days order
    const orderedDays: string[] = [];
    for (let i = 0; i < 7; i++) {
        const d = new Date(weekAgo);
        d.setDate(d.getDate() + i);
        const dayName = days[d.getDay()];
        if (dayName) {
            weeklyDataMap[dayName] = 0;
            orderedDays.push(dayName);
        }
    }

    weeklyApprovals.forEach(req => {
        if (req.updatedAt) {
            const dayName = days[req.updatedAt.getDay()];
            if (dayName && weeklyDataMap[dayName] !== undefined) {
                weeklyDataMap[dayName]++;
            }
        }
    });

    const weeklyActivity = orderedDays.map(day => ({
        day,
        approvals: weeklyDataMap[day] ?? 0,
        target: 10
    }));

    return {
        avgApprovalTime: parseFloat(avgApprovalTime),
        totalApprovals,
        slaCompliance: parseFloat(slaCompliance),
        rejectionRate: parseFloat(rejectionRate),
        totalHandled,
        weeklyActivity
    };
}

export default async function PerformancePage() {
    const session = await auth();
    if (!session?.user?.id) return null;

    const data = await getPerformanceData(session.user.id);

    const kpis = [
        {
            label: "Avg. Approval Time",
            value: `${data.avgApprovalTime.toFixed(1)} min`,
            sub: "Admin Threshold: 120m",
            icon: Timer,
            accent: "#10b981",
            subUp: true,
        },
        {
            label: "Total Approvals",
            value: data.totalApprovals.toString(),
            sub: "Total actions taken",
            icon: CheckCircle2,
            accent: "#6366f1",
            subUp: true,
        },
        {
            label: "SLA Compliance",
            value: `${data.slaCompliance.toFixed(1)}%`,
            sub: "Goal: >95%",
            icon: Target,
            accent: "#f59e0b",
            subUp: data.slaCompliance >= 95,
        },
        {
            label: "Rejection Rate",
            value: `${data.rejectionRate.toFixed(1)}%`,
            sub: "Of total Handled",
            icon: Zap,
            accent: "#8b5cf6",
            subUp: false,
        },
    ]

    const maxVal = Math.max(...data.weeklyActivity.map(d => d.approvals), 10)

    const todayApprovals = data.weeklyActivity[data.weeklyActivity.length - 1]?.approvals ?? 0;

    const goals = [
        { label: "Daily Approvals", current: todayApprovals, target: 15, accent: "#6366f1", bg: "bg-indigo-500" },
        { label: "SLA Adherence", current: data.slaCompliance, target: 100, accent: "#10b981", bg: "bg-emerald-500", suffix: "%" },
        { label: "Accuracy Rate", current: 100 - data.rejectionRate, target: 100, accent: "#f59e0b", bg: "bg-amber-500", suffix: "%" },
    ]

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                {/* Header */}
                <div>
                    <div className="flex items-center gap-2 mb-2">
                        <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-indigo-600 bg-indigo-50 px-2.5 py-1 rounded-full">
                            Workforce Analytics
                        </span>
                    </div>
                    <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">My Performance</h1>
                    <p className="text-sm text-slate-400 font-medium mt-0.5">Track your approval speed, transaction volume, and personal goals.</p>
                </div>

                {/* KPI row */}
                <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
                    {kpis.map((k) => (
                        <div
                            key={k.label}
                            className="relative group bg-white rounded-2xl border border-slate-100 p-5 shadow-[0_1px_3px_rgba(0,0,0,0.04)] hover:shadow-[0_4px_16px_rgba(0,0,0,0.08)] hover:-translate-y-0.5 transition-all duration-200 flex flex-col gap-3"
                        >
                            <div className="flex items-center justify-between">
                                <div className="w-9 h-9 rounded-xl flex items-center justify-center" style={{ backgroundColor: `${k.accent}18` }}>
                                    <k.icon size={16} style={{ color: k.accent }} strokeWidth={2.5} />
                                </div>
                            </div>
                            <div>
                                <p className="text-xl font-extrabold text-slate-900 tracking-tight tabular-nums">{k.value}</p>
                                <p className="text-[10px] font-extrabold uppercase tracking-wider text-slate-400 mt-1">{k.label}</p>
                                <p className="text-[11px] text-emerald-600 font-semibold mt-0.5">{k.sub}</p>
                            </div>
                            <div
                                className="absolute bottom-0 left-4 right-4 h-[2px] rounded-full opacity-0 group-hover:opacity-100 transition-opacity duration-200"
                                style={{ backgroundColor: k.accent }}
                            />
                        </div>
                    ))}
                </div>

                {/* Charts row */}
                <div className="grid gap-5 lg:grid-cols-12">

                    {/* Weekly bar chart */}
                    <div className="lg:col-span-8 bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden">
                        <div className="flex items-center justify-between px-6 py-4 border-b border-slate-50">
                            <div className="flex items-center gap-2.5">
                                <div className="w-7 h-7 bg-indigo-50 rounded-lg flex items-center justify-center">
                                    <BarChart3 size={13} className="text-indigo-500" strokeWidth={2.5} />
                                </div>
                                <span className="text-[14px] font-extrabold text-slate-800">Weekly Approvals</span>
                            </div>
                            <div className="flex items-center gap-3 text-[10px] font-bold text-slate-400">
                                <span className="flex items-center gap-1.5">
                                    <span className="w-2.5 h-2.5 rounded-sm bg-indigo-500 opacity-90" /> Actual
                                </span>
                                <span className="flex items-center gap-1.5">
                                    <span className="w-2.5 h-2.5 rounded-sm bg-slate-200" /> Target
                                </span>
                            </div>
                        </div>
                        <div className="px-6 py-6">
                            <div className="flex items-end justify-between gap-3 h-40">
                                {data.weeklyActivity.map((d) => {
                                    const pct = (d.approvals / maxVal) * 100
                                    const targetPct = (d.target / maxVal) * 100
                                    const isAbove = d.approvals >= d.target
                                    return (
                                        <div key={d.day} className="flex-1 flex flex-col items-center gap-2 group/bar">
                                            <span className="text-[10px] font-extrabold text-slate-400 tabular-nums opacity-0 group-hover/bar:opacity-100 transition-opacity">
                                                {d.approvals}
                                            </span>
                                            <div className="w-full flex flex-col justify-end h-32 gap-0.5 relative">
                                                {/* Target line */}
                                                <div
                                                    className="absolute w-full border-t-2 border-dashed border-slate-200 pointer-events-none"
                                                    style={{ bottom: `${targetPct}%` }}
                                                />
                                                {/* Bar */}
                                                <div
                                                    className={cn(
                                                        "w-full rounded-lg transition-all duration-500 group-hover/bar:opacity-90",
                                                        isAbove ? "bg-indigo-500" : "bg-amber-400"
                                                    )}
                                                    style={{ height: `${pct}%` }}
                                                />
                                            </div>
                                            <span className="text-[10px] font-bold text-slate-400">{d.day}</span>
                                        </div>
                                    )
                                })}
                            </div>
                        </div>
                    </div>

                    {/* Goals panel */}
                    <div className="lg:col-span-4 bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden">
                        <div className="flex items-center gap-2.5 px-6 py-4 border-b border-slate-50">
                            <div className="w-7 h-7 bg-amber-50 rounded-lg flex items-center justify-center">
                                <Target size={13} className="text-amber-500" strokeWidth={2.5} />
                            </div>
                            <span className="text-[14px] font-extrabold text-slate-800">Goals Progress</span>
                        </div>
                        <div className="px-6 py-5 flex flex-col gap-5">
                            {goals.map((g) => {
                                const pct = Math.min(100, Math.round((g.current / g.target) * 100))
                                return (
                                    <div key={g.label} className="flex flex-col gap-2">
                                        <div className="flex items-end justify-between">
                                            <div>
                                                <p className="text-[9px] font-extrabold uppercase tracking-[0.12em] text-slate-400">{g.label}</p>
                                                <p className="text-[13px] font-extrabold text-slate-800 tabular-nums mt-0.5">
                                                    {g.current.toFixed(0)}{g.suffix ?? ""} <span className="text-[10px] text-slate-300 font-medium">/ {g.target}{g.suffix ?? ""}</span>
                                                </p>
                                            </div>
                                            <span className="text-[12px] font-extrabold tabular-nums" style={{ color: g.accent }}>{pct}%</span>
                                        </div>
                                        <div className="h-1.5 w-full bg-slate-100 rounded-full overflow-hidden">
                                            <div
                                                className={cn("h-full rounded-full transition-all duration-700", g.bg)}
                                                style={{ width: `${pct}%` }}
                                            />
                                        </div>
                                    </div>
                                )
                            })}

                            <div className="pt-3 border-t border-slate-50">
                                <p className="text-[10px] text-slate-400 font-medium leading-relaxed">
                                    Goals reset weekly every Monday at 00:00 EAT.
                                </p>
                            </div>
                        </div>
                    </div>

                </div>

                {/* Trends placeholder */}
                <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden">
                    <div className="flex items-center gap-2.5 px-6 py-4 border-b border-slate-50">
                        <div className="w-7 h-7 bg-violet-50 rounded-lg flex items-center justify-center">
                            <TrendingUp size={13} className="text-violet-500" strokeWidth={2.5} />
                        </div>
                        <span className="text-[14px] font-extrabold text-slate-800">Performance Trends</span>
                    </div>
                    <div className="flex flex-col items-center justify-center py-20 gap-3 text-slate-300">
                        <div className="w-12 h-12 bg-slate-50 rounded-2xl flex items-center justify-center">
                            <TrendingUp size={22} strokeWidth={1.5} className="text-slate-200" />
                        </div>
                        <div className="text-center">
                            <p className="text-sm font-semibold text-slate-400">Coming soon</p>
                            <p className="text-[12px] mt-0.5">Personal productivity metrics and historical trends</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    )
}