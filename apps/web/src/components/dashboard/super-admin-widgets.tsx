"use client"

import { Card, CardContent, CardHeader, CardTitle } from "@repo/ui/card"
import { Trophy, TrendingUp, AlertTriangle, ArrowUpRight } from "lucide-react"
import { cn } from "@repo/ui/utils"

export function SuperAdminWidgets({ stats, filter = "all" }: { stats: any, filter?: string }) {
    if (!stats) return null;

    const displayStats = { ...stats };

    return (
        <div className="grid gap-6 md:grid-cols-3">
            <Card className="border-none shadow-md bg-emerald-600 text-white overflow-hidden relative group">
                <div className="absolute top-0 right-0 p-4 opacity-10 group-hover:scale-110 transition-transform">
                    <TrendingUp className="w-24 h-24 rotate-12" />
                </div>
                <CardHeader className="pb-2 relative z-10">
                    <CardTitle className="text-sm font-medium text-emerald-100 uppercase tracking-wider">
                        Revenue Today
                    </CardTitle>
                </CardHeader>
                <CardContent className="relative z-10">
                    <div className="text-3xl font-bold">TZS {displayStats.revenueToday.toLocaleString()}</div>
                    <div className="text-xs text-emerald-100 mt-2 flex items-center">
                        <ArrowUpRight className="w-3 h-3 mr-1" />
                        {filter === 'offline' ? 'Terminal Inactive' : '+14% from yesterday'}
                    </div>
                </CardContent>
            </Card>

            <Card className="border-none shadow-md bg-white overflow-hidden relative group">
                <CardHeader className="pb-2">
                    <CardTitle className="text-sm font-medium text-slate-500 uppercase tracking-wider">
                        {filter === 'offline' ? 'Last Active Admin' : 'Top Performing Admin'}
                    </CardTitle>
                </CardHeader>
                <CardContent className="flex items-center gap-4">
                    <div className="h-12 w-12 rounded-full bg-blue-50 flex items-center justify-center text-blue-600 shadow-inner">
                        <Trophy className="w-6 h-6" />
                    </div>
                    <div>
                        <div className="text-xl font-bold text-slate-900">{displayStats.topAdmin?.name || 'N/A'}</div>
                        <div className="text-xs text-slate-500">
                            {displayStats.topAdmin?._count?.approvedCargo || 0} {filter === 'offline' ? 'Total Approvals' : 'Approvals this week'}
                        </div>
                    </div>
                </CardContent>
            </Card>

            <Card className="border-none shadow-md bg-white border-l-4 border-l-rose-500 overflow-hidden group">
                <CardHeader className="pb-2">
                    <CardTitle className="text-sm font-medium text-slate-500 uppercase tracking-wider flex items-center justify-between">
                        {filter === 'offline' ? 'Offline Alerts' : 'Unpaid Orders Alert'}
                        <AlertTriangle className={cn("w-4 h-4 text-rose-500", filter !== 'offline' && "animate-pulse")} />
                    </CardTitle>
                </CardHeader>
                <CardContent>
                    <div className="text-3xl font-bold text-slate-900">{displayStats.unpaidOrders}</div>
                    <div className="text-xs text-slate-500 mt-2">
                        {filter === 'offline' ? 'Terminals requiring maintenance' : 'Requires follow-up by operators'}
                    </div>
                </CardContent>
            </Card>
        </div>
    )
}
