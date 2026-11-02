import {
  Package,
  Clock,
  CheckCircle,
  XCircle,
  CreditCard,
  Wallet,
} from "lucide-react";
import { cn } from "@/lib/utils";

function StatCard({
  title,
  value,
  icon: Icon,
  color,
  bg,
  trend,
  trendUp,
}: {
  title: string;
  value: number;
  icon: React.ElementType;
  color: string;
  bg: string;
  trend: string;
  trendUp: boolean;
}) {
  return (
    <div className="bg-white border border-[#E2E2E2] rounded-[20px] p-4 flex flex-col gap-3">
      <div className="flex items-center justify-between">
        <p className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">{title}</p>
        <div className={cn("h-7 w-7 rounded-xl flex items-center justify-center shrink-0", bg)}>
          <Icon className={cn("h-3.5 w-3.5", color)} />
        </div>
      </div>
      <div>
        <p className="text-[28px] font-semibold text-slate-900 tabular-nums leading-none">{value}</p>
        <div className="flex items-center gap-2 mt-2">
          <span className={cn(
            "inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border leading-none",
            trendUp
              ? "bg-green-50 text-green-700 border-green-100"
              : "bg-red-50 text-red-700 border-red-100",
          )}>
            {trend}
          </span>
          <span className="text-[10px] text-slate-400">vs last month</span>
        </div>
      </div>
    </div>
  );
}

export function StatsCards({ stats, role }: { stats: any; role: string }) {
  const isAdmin = role === "ADMIN";

  const cards = isAdmin
    ? [
        { title: "Pending Requests",  value: stats.pendingRequests,        icon: Clock,       trend: stats.trends?.pending  || "+0%", trendUp: false, color: "text-amber-600",  bg: "bg-amber-50"  },
        { title: "Approved by Me",    value: stats.approvedRequests,       icon: CheckCircle, trend: stats.trends?.approved || "+0%", trendUp: true,  color: "text-emerald-600", bg: "bg-emerald-50" },
        { title: "Rejected by Me",    value: stats.rejectedRequests,       icon: XCircle,     trend: stats.trends?.rejected || "+0%", trendUp: false, color: "text-rose-600",   bg: "bg-rose-50"   },
        { title: "Paid (My Orders)",  value: stats.paidCount,              icon: CreditCard,  trend: "+0%",                          trendUp: true,  color: "text-blue-600",   bg: "bg-blue-50"   },
        { title: "Awaiting Payment",  value: stats.awaitingPaymentCount,   icon: Wallet,      trend: "+0%",                          trendUp: false, color: "text-indigo-600", bg: "bg-indigo-50" },
      ]
    : [
        { title: "Total Requests", value: stats.totalRequests,    icon: Package,     trend: stats.trends?.total    || "+0%", trendUp: true,  color: "text-blue-600",   bg: "bg-blue-50"   },
        { title: "Pending",        value: stats.pendingRequests,  icon: Clock,       trend: stats.trends?.pending  || "+0%", trendUp: false, color: "text-amber-600",  bg: "bg-amber-50"  },
        { title: "Approved",       value: stats.approvedRequests, icon: CheckCircle, trend: stats.trends?.approved || "+0%", trendUp: true,  color: "text-emerald-600", bg: "bg-emerald-50" },
        { title: "Rejected",       value: stats.rejectedRequests, icon: XCircle,     trend: stats.trends?.rejected || "+0%", trendUp: false, color: "text-rose-600",   bg: "bg-rose-50"   },
      ];

  return (
    <div className={`grid gap-4 w-full ${isAdmin ? "md:grid-cols-3 lg:grid-cols-5" : "md:grid-cols-2 lg:grid-cols-4"}`}>
      {cards.map((card, i) => <StatCard key={i} {...card} />)}
    </div>
  );
}
