import { Timer, TrendingUp, CheckCircle2, Zap, BarChart3, ArrowUpRight, Target, Users, MapPin, CreditCard } from "lucide-react"
import { cn } from "@/lib/utils"
import { auth } from "@/auth"
import { prisma } from "@repo/database"

async function getOrgPerformanceData() {
    // 1. Overall Stats
    const totalRequests = await prisma.cargoRequest.count();
    const approvedRequests = await prisma.cargoRequest.count({ where: { status: 'APPROVED' } });
    const pendingRequests = await prisma.cargoRequest.count({ where: { status: 'PENDING' } });
    const rejectedRequests = await prisma.cargoRequest.count({ where: { status: 'REJECTED' } });

    // 2. Average Approval Time (Org-wide)
    const approvals = await prisma.cargoRequest.findMany({
        where: { status: 'APPROVED' },
        select: { createdAt: true, updatedAt: true }
    });

    let totalTimeMs = 0;
    approvals.forEach(req => {
        if (req.updatedAt && req.createdAt) {
            totalTimeMs += req.updatedAt.getTime() - req.createdAt.getTime();
        }
    });
    const avgApprovalTime = approvals.length > 0 ? (totalTimeMs / approvals.length / (1000 * 60)).toFixed(1) : "0";

    // 3. Performance by Station (Volume)
    const volumeByStationRaw = await prisma.cargoRequest.groupBy({
        by: ['fromAddress'],
        _count: { id: true },
        orderBy: { _count: { id: 'desc' } },
        take: 5
    });

    // 4. Team Performance (Top Admins by Approvals)
    const topPerformersRaw = await prisma.user.findMany({
        where: { role: { name: { in: ['ADMIN', 'OPERATOR', 'SUPER_ADMIN'] } } },
        select: {
            id: true,
            name: true,
            role: { select: { name: true } },
            _count: {
                select: { approvedCargo: true }
            }
        },
        orderBy: { approvedCargo: { _count: 'desc' } },
        take: 5
    });

    // 5. Weekly Volume
    const weekAgo = new Date();
    weekAgo.setDate(weekAgo.getDate() - 6);
    weekAgo.setHours(0, 0, 0, 0);

    const weeklyRequests = await prisma.cargoRequest.findMany({
        where: { createdAt: { gte: weekAgo } },
        select: { createdAt: true, status: true }
    });

    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'] as const;
    const weeklyDataMap: Record<string, { total: number; approved: number }> = {};
    const orderedDays: string[] = [];

    for (let i = 0; i < 7; i++) {
        const d = new Date(weekAgo);
        d.setDate(d.getDate() + i);
        const dayOrdinal = d.getDay();
        const dayName = days[dayOrdinal];
        if (dayName) {
            weeklyDataMap[dayName] = { total: 0, approved: 0 };
            orderedDays.push(dayName);
        }
    }

    weeklyRequests.forEach(req => {
        const dayOrdinal = req.createdAt.getDay();
        const dayName = days[dayOrdinal];
        if (dayName && weeklyDataMap[dayName]) {
            weeklyDataMap[dayName]!.total++;
            if (req.status === 'APPROVED') weeklyDataMap[dayName]!.approved++;
        }
    });

    const weeklyVolume = orderedDays.map(day => ({
        day,
        total: weeklyDataMap[day]?.total ?? 0,
        approved: weeklyDataMap[day]?.approved ?? 0
    }));

    return {
        totalRequests,
        approvedRequests,
        pendingRequests,
        rejectedRequests,
        avgApprovalTime: parseFloat(avgApprovalTime),
        volumeByStation: volumeByStationRaw.map(v => ({ name: v.fromAddress, count: v._count.id })),
        topPerformers: topPerformersRaw.map(p => ({
            name: p.name,
            role: p.role?.name || 'Staff',
            approvals: p._count.approvedCargo
        })),
        weeklyVolume
    };
}

export default async function OrgPerformancePage() {
    const session = await auth();
    const role = session?.user?.role;

    if (role !== 'ADMIN' && role !== 'SUPER_ADMIN') {
        return (
            <div className="flex items-center justify-center min-h-[60vh]">
                <div className="text-center">
                    <h2 className="text-xl font-bold text-slate-800">Access Denied</h2>
                    <p className="text-slate-500 mt-2">You do not have permission to view organization performance.</p>
                </div>
            </div>
        );
    }

    const data = await getOrgPerformanceData();

    const stats = [
        { label: "Org Avg. Approval", value: `${data.avgApprovalTime}m`, sub: "Target: <60m", icon: Timer, accent: "#10b981" },
        { label: "Platform Volume", value: data.totalRequests.toLocaleString(), sub: "Total cargo handled", icon: BarChart3, accent: "#6366f1" },
        { label: "Approval Rate", value: `${data.totalRequests > 0 ? ((data.approvedRequests / data.totalRequests) * 100).toFixed(1) : 0}%`, sub: "Efficiency ratio", icon: Target, accent: "#f59e0b" },
        { label: "Pending Review", value: data.pendingRequests.toString(), sub: "Needs attention", icon: Zap, accent: "#f43f5e" },
    ];

    const maxWeekly = Math.max(...data.weeklyVolume.map(d => d.total), 1);

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                {/* Header */}
                <div className="flex flex-col md:flex-row md:items-end justify-between gap-4">
                    <div>
                        <div className="flex items-center gap-2 mb-2">
                            <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-indigo-600 bg-indigo-50 px-2.5 py-1 rounded-full">
                                Organisation Performance
                            </span>
                        </div>
                        <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Platform Operations Snapshot</h1>
                        <p className="text-sm text-slate-400 font-medium mt-0.5">Global metrics, station volume, and team productivity scores.</p>
                    </div>
                    <div className="flex items-center gap-3">
                        <div className="bg-white border border-slate-100 rounded-xl px-4 py-2 shadow-sm">
                            <p className="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Live Accuracy</p>
                            <p className="text-lg font-black text-slate-900 leading-none mt-1">98.2%</p>
                        </div>
                    </div>
                </div>

                {/* KPI row */}
                <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
                    {stats.map((s) => (
                        <div key={s.label} className="bg-white rounded-2xl border border-slate-100 p-5 shadow-[0_1px_3px_rgba(0,0,0,0.04)] flex flex-col gap-4">
                            <div className="w-9 h-9 rounded-xl flex items-center justify-center" style={{ backgroundColor: `${s.accent}15` }}>
                                <s.icon size={16} style={{ color: s.accent }} strokeWidth={2.5} />
                            </div>
                            <div>
                                <p className="text-2xl font-extrabold text-slate-900 tracking-tight tabular-nums">{s.value}</p>
                                <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mt-1">{s.label}</p>
                                <p className="text-[11px] text-slate-400 font-medium mt-1">{s.sub}</p>
                            </div>
                        </div>
                    ))}
                </div>

                <div className="grid gap-6 lg:grid-cols-12">
                    
                    {/* Weekly Performance Bar Chart */}
                    <div className="lg:col-span-8 bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden">
                        <div className="px-6 py-4 border-b border-slate-50 flex items-center justify-between">
                            <div className="flex items-center gap-2.5">
                                <div className="w-7 h-7 bg-indigo-50 rounded-lg flex items-center justify-center">
                                    <TrendingUp size={13} className="text-indigo-500" strokeWidth={2.5} />
                                </div>
                                <span className="text-sm font-bold text-slate-800">Weekly System Load</span>
                            </div>
                        </div>
                        <div className="p-8">
                            <div className="flex items-end justify-between h-48 gap-4">
                                {data.weeklyVolume.map((d) => {
                                    const totalHeight = (d.total / maxWeekly) * 100;
                                    const approvedHeight = (d.approved / Math.max(d.total, 1)) * 100;
                                    return (
                                        <div key={d.day} className="flex-1 flex flex-col items-center gap-3 group/bar">
                                            <div className="w-full flex flex-col justify-end h-full relative">
                                                {/* Total Bar */}
                                                <div className="w-full bg-slate-50 rounded-t-lg relative overflow-hidden flex flex-col justify-end" style={{ height: `${totalHeight}%` }}>
                                                    {/* Approved Part */}
                                                    <div className="w-full bg-indigo-500/90 rounded-t-lg transition-all duration-500" style={{ height: `${approvedHeight}%` }} />
                                                    
                                                    {/* Tooltip on hover */}
                                                    <div className="absolute -top-10 left-1/2 -translate-x-1/2 bg-slate-900 text-white text-[10px] py-1 px-2 rounded opacity-0 group-hover/bar:opacity-100 whitespace-nowrap z-10 transition-opacity">
                                                        {d.approved} approved of {d.total}
                                                    </div>
                                                </div>
                                            </div>
                                            <span className="text-[10px] font-bold text-slate-400 uppercase">{d.day}</span>
                                        </div>
                                    )
                                })}
                            </div>
                        </div>
                    </div>

                    {/* Top Stations List */}
                    <div className="lg:col-span-4 flex flex-col gap-6">
                        <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden">
                            <div className="px-6 py-4 border-b border-slate-50 flex items-center gap-2.5">
                                <div className="w-7 h-7 bg-amber-50 rounded-lg flex items-center justify-center">
                                    <MapPin size={13} className="text-amber-500" strokeWidth={2.5} />
                                </div>
                                <span className="text-sm font-bold text-slate-800">Top Stations</span>
                            </div>
                            <div className="p-6 flex flex-col gap-4">
                                {data.volumeByStation.map((s, idx) => (
                                    <div key={s.name} className="flex items-center justify-between">
                                        <div className="flex items-center gap-3">
                                            <span className="text-[10px] font-black text-slate-300 w-4">0{idx + 1}</span>
                                            <span className="text-[13px] font-bold text-slate-700">{s.name}</span>
                                        </div>
                                        <div className="flex items-center gap-2">
                                            <div className="h-1.5 w-16 bg-slate-50 rounded-full overflow-hidden">
                                                <div className="h-full bg-amber-400" style={{ width: `${(s.count / data.totalRequests) * 100}%` }} />
                                            </div>
                                            <span className="text-[11px] font-black tabular-nums text-slate-900">{s.count}</span>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </div>

                        {/* Top Performers */}
                        <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden">
                            <div className="px-6 py-4 border-b border-slate-50 flex items-center gap-2.5">
                                <div className="w-7 h-7 bg-emerald-50 rounded-lg flex items-center justify-center">
                                    <Users size={13} className="text-emerald-500" strokeWidth={2.5} />
                                </div>
                                <span className="text-sm font-bold text-slate-800">Team Leaders</span>
                            </div>
                            <div className="p-6 flex flex-col gap-4">
                                {data.topPerformers.map((p) => (
                                    <div key={p.name} className="flex items-center justify-between">
                                        <div>
                                            <p className="text-[13px] font-bold text-slate-800">{p.name}</p>
                                            <p className="text-[9px] font-bold text-slate-400 uppercase tracking-widest">{p.role}</p>
                                        </div>
                                        <div className="text-right">
                                            <p className="text-[14px] font-black text-emerald-600 tabular-nums">{p.approvals}</p>
                                            <p className="text-[9px] font-bold text-slate-300 uppercase">Approvals</p>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    );
}
