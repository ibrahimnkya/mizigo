import { RevenueChart } from "@/components/dashboard/revenue-chart";
import { auth } from "@/auth";
import { CreditCard, Wallet, Banknote, Landmark, TrendingUp, ArrowUpRight, TrendingDown } from "lucide-react";
import { cn } from "@/lib/utils";

async function getStats() {
    const res = await fetch("http://localhost:3000/api/stats", { cache: "no-store" });
    if (!res.ok) return null;
    return res.json();
}


function KpiCard({ label, value, sub, icon: Icon, accent, trend }: {
    label: string; value: string; sub: string;
    icon: React.ElementType; accent: string;
    trend?: { value: string; up: boolean }
}) {
    return (
        <div className="relative group bg-white rounded-2xl border border-slate-100 p-5 shadow-[0_1px_3px_rgba(0,0,0,0.04)] hover:shadow-[0_4px_16px_rgba(0,0,0,0.08)] hover:-translate-y-0.5 transition-all duration-200 flex flex-col gap-3">
            <div className="flex items-center justify-between">
                <div className="w-9 h-9 rounded-xl flex items-center justify-center" style={{ backgroundColor: `${accent}18` }}>
                    <Icon size={16} style={{ color: accent }} strokeWidth={2.5} />
                </div>
                {trend && (
                    <span className={cn(
                        "inline-flex items-center gap-0.5 text-[10px] font-bold px-1.5 py-0.5 rounded-full",
                        trend.up ? "bg-emerald-50 text-emerald-600" : "bg-rose-50 text-rose-500"
                    )}>
                        {trend.up ? <ArrowUpRight size={9} /> : <TrendingDown size={9} />}
                        {trend.value}
                    </span>
                )}
            </div>
            <div>
                <p className="text-xl font-extrabold text-slate-900 tracking-tight tabular-nums">{value}</p>
                <p className="text-[10px] font-extrabold uppercase tracking-wider text-slate-400 mt-1">{label}</p>
                <p className="text-[11px] text-slate-400 font-medium mt-0.5">{sub}</p>
            </div>
            <div
                className="absolute bottom-0 left-4 right-4 h-[2px] rounded-full opacity-0 group-hover:opacity-100 transition-opacity duration-200"
                style={{ backgroundColor: accent }}
            />
        </div>
    )
}

function ChartCard({ title, icon: Icon, accent = "#6366f1", action, children }: {
    title: string; icon: React.ElementType; accent?: string; action?: React.ReactNode; children: React.ReactNode
}) {
    return (
        <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden h-full">
            <div className="flex items-center justify-between px-6 py-4 border-b border-slate-50">
                <div className="flex items-center gap-2.5">
                    <div className="w-7 h-7 rounded-lg flex items-center justify-center" style={{ backgroundColor: `${accent}15` }}>
                        <Icon size={13} style={{ color: accent }} strokeWidth={2.5} />
                    </div>
                    <span className="text-[14px] font-extrabold text-slate-800">{title}</span>
                </div>
                {action}
            </div>
            <div className="p-6">{children}</div>
        </div>
    )
}

export default async function RevenueSummaryPage({
    searchParams
}: {
    searchParams: Promise<{ [key: string]: string | string[] | undefined }>
}) {
    const params = await searchParams;
    const stats = await getStats();
    const chartRange = (params.range as string) || "monthly";

    if (!stats) return (
        <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
            <p className="text-sm font-semibold text-slate-400">Failed to load stats</p>
        </div>
    );

    const f = stats.financialKpis || { totalRevenue: 0, netProfit: 0, channelTotals: {} };
    const t = stats.trends || {};

    const kpis = [
        {
            label: "Gross Revenue",
            value: `TZS ${f.totalRevenue.toLocaleString()}`,
            sub: "Total volume processed",
            icon: CreditCard,
            accent: "#6366f1",
            trend: t.paidCount
        },
        {
            label: "Net Profit (Est.)",
            value: `TZS ${Math.round(f.netProfit).toLocaleString()}`,
            sub: "Est. after terminal fees",
            icon: Wallet,
            accent: "#10b981",
            trend: t.paidCount
        },
        {
            label: "M-Pesa Collections",
            value: `TZS ${(f.channelTotals["M-Pesa"] || 0).toLocaleString()}`,
            sub: "Mobile money channel",
            icon: Banknote,
            accent: "#22c55e",
            trend: t.paidCount
        },
        {
            label: "Bank Transfers",
            value: `TZS ${(f.channelTotals["Bank"] || 0).toLocaleString()}`,
            sub: "Direct settlement",
            icon: Landmark,
            accent: "#3b82f6",
            trend: t.paidCount
        },
    ]

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
                    <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Revenue Summary</h1>
                    <p className="text-sm text-slate-400 font-medium mt-0.5">Global financial performance and transaction overview.</p>
                </div>

                {/* KPI row */}
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                    {kpis.map((k) => <KpiCard key={k.label} {...k} />)}
                </div>

                {/* Charts */}
                <div className="grid gap-5 lg:grid-cols-12">

                    {/* Trend chart */}
                    <div className="lg:col-span-8">
                        <ChartCard title="Revenue Trend" icon={TrendingUp} accent="#6366f1">
                            <RevenueChart data={stats.chartData} />
                        </ChartCard>
                    </div>

                    {/* Channel breakdown */}
                    <div className="lg:col-span-4">
                        <ChartCard title="Channel Breakdown" icon={ArrowUpRight} accent="#10b981">
                            <div className="flex flex-col gap-5">
                                {(stats.revenueByChannel || []).map((ch: any) => {
                                    const channelConfig: any = {
                                        "M-Pesa": { color: "#10b981", barBg: "bg-emerald-500" },
                                        "Credit Card": { color: "#3b82f6", barBg: "bg-blue-500" },
                                        "Bank": { color: "#6366f1", barBg: "bg-indigo-500" },
                                        "Other": { color: "#94a3b8", barBg: "bg-slate-400" }
                                    };
                                    const config = channelConfig[ch.name] || channelConfig["Other"];

                                    return (
                                        <div key={ch.name} className="flex flex-col gap-2">
                                            <div className="flex items-end justify-between">
                                                <div>
                                                    <p className="text-[9px] font-extrabold uppercase tracking-[0.12em] text-slate-400">{ch.name}</p>
                                                    <p className="text-[13px] font-extrabold text-slate-800 tabular-nums mt-0.5">{ch.raw}</p>
                                                </div>
                                                <span className="text-[13px] font-extrabold text-slate-900 tabular-nums">{ch.value}%</span>
                                            </div>
                                            <div className="h-1.5 w-full bg-slate-100 rounded-full overflow-hidden">
                                                <div
                                                    className={cn("h-full rounded-full transition-all duration-700", config.barBg)}
                                                    style={{ width: `${ch.value}%` }}
                                                />
                                            </div>
                                        </div>
                                    );
                                })}

                                <div className="pt-4 border-t border-slate-50">
                                    <p className="text-[10px] text-slate-400 font-medium leading-relaxed">
                                        Aggregated across all active terminals in real-time.
                                    </p>
                                </div>
                            </div>
                        </ChartCard>
                    </div>

                </div>
            </div>
        </div>
    );
}