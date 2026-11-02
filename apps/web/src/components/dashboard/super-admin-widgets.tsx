"use client";

import { Card, CardContent, CardHeader, CardTitle } from "@repo/ui/card";
import { Trophy, TrendingUp, AlertTriangle, ArrowUpRight } from "lucide-react";
import { cn } from "@repo/ui/utils";

export function SuperAdminWidgets({
  stats,
  filter = "all",
}: {
  stats: any;
  filter?: string;
}) {
  if (!stats) return null;

  const displayStats = { ...stats };

  return (
    <div className="grid gap-6 md:grid-cols-3">
      <Card className="border-none bg-emerald-600 text-white overflow-hidden relative">
        <div className="absolute top-0 right-0 p-4 opacity-10">
          <TrendingUp className="w-24 h-24 rotate-12" />
        </div>
        <CardHeader className="pb-2 relative z-10">
          <CardTitle className="text-[11px] font-medium text-emerald-100 uppercase tracking-[0.05em]">
            Revenue Today
          </CardTitle>
        </CardHeader>
        <CardContent className="relative z-10">
          <div className="text-[26px] font-semibold">
            TZS {displayStats.revenueToday.toLocaleString()}
          </div>
          <div className="text-xs text-emerald-100 mt-2 flex items-center">
            <ArrowUpRight className="w-3 h-3 mr-1" />
            {filter === "offline" ? "Terminal Inactive" : "+14% from yesterday"}
          </div>
        </CardContent>
      </Card>

      <Card className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden">
        <CardHeader className="pb-2">
          <CardTitle className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
            {filter === "offline"
              ? "Last Active Admin"
              : "Top Performing Admin"}
          </CardTitle>
        </CardHeader>
        <CardContent className="flex items-center gap-4">
          <div className="h-10 w-10 rounded-xl bg-blue-50 flex items-center justify-center text-blue-600">
            <Trophy className="w-5 h-5" />
          </div>
          <div>
            <div className="text-[26px] font-semibold text-slate-900">
              {displayStats.topAdmin?.name || "N/A"}
            </div>
            <div className="text-xs text-slate-500">
              {displayStats.topAdmin?._count?.approvedParcels || 0}{" "}
              {filter === "offline" ? "Total Approvals" : "Approvals this week"}
            </div>
          </div>
        </CardContent>
      </Card>

      <Card className="bg-white border border-[#E2E2E2] rounded-[20px] border-l-4 border-l-rose-500 overflow-hidden">
        <CardHeader className="pb-2">
          <CardTitle className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em] flex items-center justify-between">
            {filter === "offline" ? "Offline Alerts" : "Unpaid Orders Alert"}
            <AlertTriangle
              className={cn(
                "w-4 h-4 text-rose-500",
                filter !== "offline" && "animate-pulse",
              )}
            />
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="text-[26px] font-semibold text-slate-900">
            {displayStats.unpaidOrders}
          </div>
          <div className="text-xs text-slate-500 mt-2">
            {filter === "offline"
              ? "Terminals requiring maintenance"
              : "Requires follow-up by operators"}
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
