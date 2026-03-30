import { RevenueChart } from "@/components/dashboard/revenue-chart";
import { TrendingUp as Trend, DollarSign, Wallet, CreditCard, Activity, BarChart3, ArrowUpRight, TrendingDown } from "lucide-react";
import { ChartCard } from "@/components/dashboard/reports-shared";
import { prisma } from "@repo/database";
import { auth } from "@/auth";
import { redirect } from "next/navigation";

async function getRevenueData() {
    const session = await auth();
    if (!session?.user) return null;

    const userRole = session.user.role;
    if (userRole !== 'SUPER_ADMIN') return null;

    const isAdmin = userRole === 'ADMIN';
    const userId = session.user.id;
    const where: any = isAdmin ? { approvedById: userId } : {};

    // Get payments (joined with cargoRequest for access control)
    const payments = await (prisma as any).payment.findMany({
        where: {
            status: 'SUCCESS',
            ...(isAdmin ? {
                cargoRequest: {
                    approvedById: userId
                }
            } : {})
        }
    });

    const totalRevenue = payments.reduce((acc: number, p: any) => acc + (p.amount || 0), 0);
    const netProfit = totalRevenue * 0.92; // 92% after estimated operational costs/fees
    const avgTransaction = payments.length > 0 ? totalRevenue / payments.length : 0;

    // Trends (This month vs last month)
    const now = new Date();
    const startOfMonth = new Date(now.getFullYear(), now.getMonth(), 1);
    const startOfLastMonth = new Date(now.getFullYear(), now.getMonth() - 1, 1);

    const thisMonthRevenue = payments.filter((p: any) => p.createdAt >= startOfMonth)
        .reduce((acc: number, p: any) => acc + (p.amount || 0), 0);
    const lastMonthRevenue = payments.filter((p: any) => p.createdAt >= startOfLastMonth && p.createdAt < startOfMonth)
        .reduce((acc: number, p: any) => acc + (p.amount || 0), 0);

    const growthRate = lastMonthRevenue === 0 ? (thisMonthRevenue > 0 ? 100 : 0) : ((thisMonthRevenue - lastMonthRevenue) / lastMonthRevenue) * 100;

    const revenueByServiceRaw = await prisma.cargoRequest.groupBy({
        by: ['cargoType'],
        where: {
            ...where,
            payment: {
                status: 'SUCCESS'
            }
        },
        _sum: {
            amount: true
        }
    });

    const revenueByService = revenueByServiceRaw.map((s: any) => ({
        name: s.cargoType || 'General',
        amount: s._sum?.amount || 0
    })).sort((a: any, b: any) => b.amount - a.amount);

    // Build monthly chart data (last 6 months)
    const monthlyMap: Record<string, number> = {};
    for (let i = 5; i >= 0; i--) {
        const d = new Date(now.getFullYear(), now.getMonth() - i, 1);
        const key = d.toLocaleDateString('en-GB', { month: 'short', year: '2-digit' });
        monthlyMap[key] = 0;
    }
    payments.forEach((p: any) => {
        const d = new Date(p.createdAt);
        const key = d.toLocaleDateString('en-GB', { month: 'short', year: '2-digit' });
        if (key in monthlyMap) monthlyMap[key] = (monthlyMap[key] ?? 0) + (p.amount || 0);
    });
    const chartData = Object.entries(monthlyMap).map(([name, total]) => ({ name, total }));

    return {
        stats: [
            { label: "Gross Revenue", value: `TZS ${totalRevenue.toLocaleString()}`, icon: DollarSign, accent: "#10b981", trend: { value: `${growthRate >= 0 ? '+' : ''}${growthRate.toFixed(1)}%`, up: growthRate >= 0 } },
            { label: "Net Profit", value: `TZS ${Math.round(netProfit).toLocaleString()}`, icon: Wallet, accent: "#3b82f6" },
            { label: "Avg. Transaction", value: `TZS ${Math.round(avgTransaction).toLocaleString()}`, icon: CreditCard, accent: "#6366f1" },
            { label: "Growth Rate", value: `${growthRate.toFixed(1)}%`, icon: Trend, accent: "#8b5cf6", trend: { value: `${growthRate >= 0 ? '+' : ''}${growthRate.toFixed(1)}%`, up: growthRate >= 0 } },
        ],
        revenueByService,
        chartData
    };
}

export default async function RevenueReportPage() {
    const data = await getRevenueData();

    if (!data) {
        redirect("/login");
    }

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                {/* Header */}
                <div>
                    <div className="flex items-center gap-2 mb-2">
                        <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-emerald-600 bg-emerald-50 px-2.5 py-1 rounded-full">
                            Financial
                        </span>
                    </div>
                    <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Revenue Analytics</h1>
                    <p className="text-sm text-slate-400 font-medium mt-0.5">In-depth financial analysis and monthly projections across all terminals.</p>
                </div>

                {/* KPI row */}
                <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                    {data.stats.map((s) => (
                        <div
                            key={s.label}
                            className="relative group bg-white rounded-2xl border border-slate-100 p-5 shadow-[0_1px_3px_rgba(0,0,0,0.04)] hover:shadow-[0_4px_16px_rgba(0,0,0,0.08)] hover:-translate-y-0.5 transition-all duration-200 flex flex-col gap-3"
                        >
                            <div className="flex items-center justify-between">
                                <div className="w-9 h-9 rounded-xl flex items-center justify-center" style={{ backgroundColor: `${s.accent}15` }}>
                                    <s.icon size={16} style={{ color: s.accent }} strokeWidth={2.5} />
                                </div>
                                {s.trend && (
                                    <span className={`inline-flex items-center gap-0.5 text-[10px] font-bold px-1.5 py-0.5 rounded-full ${s.trend.up ? "bg-emerald-50 text-emerald-600" : "bg-rose-50 text-rose-500"}`}>
                                        {s.trend.up ? <ArrowUpRight size={9} /> : <TrendingDown size={9} />}
                                        {s.trend.value}
                                    </span>
                                )}
                            </div>
                            <div>
                                <p className="text-xl font-extrabold text-slate-900 tracking-tight tabular-nums">{s.value}</p>
                                <p className="text-[10px] font-extrabold uppercase tracking-wider text-slate-400 mt-1">{s.label}</p>
                            </div>
                            <div className="absolute bottom-0 left-4 right-4 h-[2px] rounded-full opacity-0 group-hover:opacity-100 transition-opacity duration-200" style={{ backgroundColor: s.accent }} />
                        </div>
                    ))}
                </div>

                {/* Main chart */}
                <ChartCard title="Revenue Trends" icon={Activity} accent="#10b981">
                    <div className="h-[400px]">
                        <RevenueChart data={data.chartData} />
                    </div>
                </ChartCard>

                {/* Secondary panels */}
                <div className="grid gap-5 lg:grid-cols-2">
                    <ChartCard title="Revenue by Service" icon={Trend} accent="#6366f1">
                        <div className="p-4 space-y-4">
                            {data.revenueByService.map((item: { name: string; amount: number }) => (
                                <div key={item.name} className="flex items-center justify-between">
                                    <span className="text-sm font-semibold text-slate-600">{item.name}</span>
                                    <span className="text-sm font-extrabold text-slate-900">TZS {item.amount.toLocaleString()}</span>
                                </div>
                            ))}
                            {data.revenueByService.length === 0 && (
                                <div className="text-center py-10 text-slate-400 text-sm">No revenue data found</div>
                            )}
                        </div>
                    </ChartCard>
                    <ChartCard title="Performance Status" icon={Activity} accent="#8b5cf6">
                        <div className="h-[280px] flex flex-col items-center justify-center gap-3 text-slate-300">
                            <BarChart3 size={32} strokeWidth={1.5} />
                            <div className="text-center">
                                <p className="text-sm font-semibold text-slate-400">Analysis active</p>
                                <p className="text-[12px] text-slate-300 mt-0.5">Tracking real-time throughput</p>
                            </div>
                        </div>
                    </ChartCard>
                </div>
            </div>
        </div>
    )
}