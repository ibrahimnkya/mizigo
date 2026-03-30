
import { Card, CardContent, CardHeader, CardTitle } from "@repo/ui/card";
import { Package, Clock, CheckCircle, XCircle, CreditCard, Wallet } from "lucide-react";

export function StatsCards({ stats, role }: { stats: any, role: string }) {
    const isAdmin = role === 'ADMIN';

    const cards = isAdmin ? [
        {
            title: "Pending Requests",
            value: stats.pendingRequests,
            icon: Clock,
            trend: stats.trends?.pending || "+0%",
            trendUp: false,
            color: "text-amber-600",
            bg: "bg-amber-50",
        },
        {
            title: "Approved by Me",
            value: stats.approvedRequests,
            icon: CheckCircle,
            trend: stats.trends?.approved || "+0%",
            trendUp: true,
            color: "text-emerald-600",
            bg: "bg-emerald-50",
        },
        {
            title: "Rejected by Me",
            value: stats.rejectedRequests,
            icon: XCircle,
            trend: stats.trends?.rejected || "+0%",
            trendUp: false,
            color: "text-rose-600",
            bg: "bg-rose-50",
        },
        {
            title: "Paid (My Orders)",
            value: stats.paidCount,
            icon: CreditCard,
            trend: "+0%",
            trendUp: true,
            color: "text-blue-600",
            bg: "bg-blue-50",
        },
        {
            title: "Awaiting Payment",
            value: stats.awaitingPaymentCount,
            icon: Wallet,
            trend: "+0%",
            trendUp: false,
            color: "text-indigo-600",
            bg: "bg-indigo-50",
        },
    ] : [
        {
            title: "Total Requests",
            value: stats.totalRequests,
            icon: Package,
            trend: stats.trends?.total || "+0%",
            trendUp: true,
            color: "text-blue-600",
            bg: "bg-blue-50",
        },
        {
            title: "Pending",
            value: stats.pendingRequests,
            icon: Clock,
            trend: stats.trends?.pending || "+0%",
            trendUp: false,
            color: "text-amber-600",
            bg: "bg-amber-50",
        },
        {
            title: "Approved",
            value: stats.approvedRequests,
            icon: CheckCircle,
            trend: stats.trends?.approved || "+0%",
            trendUp: true,
            color: "text-emerald-600",
            bg: "bg-emerald-50",
        },
        {
            title: "Rejected",
            value: stats.rejectedRequests,
            icon: XCircle,
            trend: stats.trends?.rejected || "+0%",
            trendUp: false,
            color: "text-rose-600",
            bg: "bg-rose-50",
        },
    ]

    return (
        <div className={`grid gap-6 w-full ${isAdmin ? 'md:grid-cols-3 lg:grid-cols-5' : 'md:grid-cols-2 lg:grid-cols-4'}`}>
            {cards.map((card, index) => (
                <Card key={index} className="border-none shadow-sm bg-white/50 backdrop-blur-md hover:shadow-xl hover:-translate-y-1 transition-all duration-300 rounded-lg overflow-hidden group">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-semibold text-slate-500 tracking-tight">
                            {card.title}
                        </CardTitle>
                        <div className={`h-10 w-10 rounded-lg ${card.bg} flex items-center justify-center group-hover:scale-110 transition-transform duration-300`}>
                            <card.icon className={`h-5 w-5 ${card.color}`} />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-4xl font-black text-slate-900 tracking-tighter">{card.value}</div>
                        <div className="flex items-center gap-2 mt-2">
                            <span className={`px-2 py-0.5 rounded-full text-[10px] font-bold ${card.trendUp ? "bg-emerald-50 text-emerald-600" : "bg-rose-50 text-rose-600"}`}>
                                {card.trend}
                            </span>
                            <span className="text-[10px] text-slate-400 font-medium tracking-wide uppercase">vs Last Month</span>
                        </div>
                    </CardContent>
                </Card>
            ))}
        </div>
    );
}
