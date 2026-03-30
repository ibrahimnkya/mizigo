import { SpeedChart } from "@/components/dashboard/speed-chart";
import { Timer, Zap } from "lucide-react";
import { StatPill, ChartCard } from "@/components/dashboard/reports-shared";
import { prisma } from "@repo/database";
import { auth } from "@/auth";
import { redirect } from "next/navigation";

async function getSpeedData() {
    const session = await auth();
    if (!session?.user) return null;

    const userRole = session.user.role;
    if (userRole !== 'ADMIN' && userRole !== 'SUPER_ADMIN') return null;

    const isAdmin = userRole === 'ADMIN';
    const userId = session.user.id;
    const where: any = isAdmin ? { approvedById: userId } : {};

    // Fetch approved requests to calculate speed
    const approvedRequests = await prisma.cargoRequest.findMany({
        where: {
            ...where,
            status: 'APPROVED'
        },
        select: {
            createdAt: true,
            updatedAt: true
        }
    });

    const totalApproved = approvedRequests.length;

    // Calculate Average Time (in minutes)
    const totalTimeMs = approvedRequests.reduce((acc, r) => {
        return acc + (r.updatedAt.getTime() - r.createdAt.getTime());
    }, 0);

    const avgTimeMins = totalApproved > 0 ? Math.round(totalTimeMs / (totalApproved * 1000 * 60)) : 0;

    // SLA Compliance (< 2 hours = 120 mins)
    const compliantCount = approvedRequests.filter(r => {
        const diffMins = (r.updatedAt.getTime() - r.createdAt.getTime()) / (1000 * 60);
        return diffMins <= 120;
    }).length;

    const completionRate = totalApproved > 0 ? Math.round((compliantCount / totalApproved) * 100) : 0;

    // Speed Trend (Last 7 days)
    const last7Days = Array.from({ length: 7 }, (_, i) => {
        const d = new Date();
        d.setDate(d.getDate() - i);
        d.setHours(0, 0, 0, 0);
        return d;
    }).reverse();

    const speedTrend = await Promise.all(last7Days.map(async (date) => {
        const nextDay = new Date(date);
        nextDay.setDate(date.getDate() + 1);

        const dayRequests = await prisma.cargoRequest.findMany({
            where: {
                ...where,
                status: 'APPROVED',
                updatedAt: { gte: date, lt: nextDay }
            },
            select: { createdAt: true, updatedAt: true }
        });

        const dayAvgMs = dayRequests.length > 0
            ? dayRequests.reduce((acc, r) => acc + (r.updatedAt.getTime() - r.createdAt.getTime()), 0) / dayRequests.length
            : 0;

        return {
            name: date.toLocaleDateString('en-US', { weekday: 'short' }),
            speed: Math.round(dayAvgMs / (1000 * 60))
        };
    }));

    // Trend calculation (Current week vs last week avg speed)
    const sevenDaysAgo = new Date(new Date().getTime() - 7 * 24 * 60 * 60 * 1000);
    const fourteenDaysAgo = new Date(new Date().getTime() - 14 * 24 * 60 * 60 * 1000);

    const currentWeekApps = approvedRequests.filter(r => r.updatedAt >= sevenDaysAgo);
    const prevWeekApps = approvedRequests.filter(r => r.updatedAt >= fourteenDaysAgo && r.updatedAt < sevenDaysAgo);

    const getAvg = (apps: any[]) => apps.length === 0 ? 0 : apps.reduce((acc, r) => acc + (r.updatedAt.getTime() - r.createdAt.getTime()), 0) / apps.length;

    const currentAvg = getAvg(currentWeekApps);
    const prevAvg = getAvg(prevWeekApps);

    const perfGap = prevAvg === 0 ? 0 : ((currentAvg - prevAvg) / prevAvg) * 100;

    return {
        performance: {
            avgTime: `${avgTimeMins}m`,
            completionRate: `${completionRate}%`
        },
        speedTrend,
        trends: {
            performance: {
                value: `${perfGap >= 0 ? '+' : '-'}${Math.abs(perfGap).toFixed(1)}%`,
                up: perfGap <= 0 // Lower time is better (up = improvement)
            }
        }
    };
}

export default async function TurnaroundReportPage() {
    const data = await getSpeedData();

    if (!data) {
        redirect("/login");
    }

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                <div>
                    <div className="flex items-center gap-2 mb-2">
                        <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-amber-600 bg-amber-50 px-2.5 py-1 rounded-full">
                            Performance
                        </span>
                    </div>
                    <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Approval Speeds</h1>
                    <p className="text-sm text-slate-400 font-medium mt-0.5">Monitor operational efficiency and turnaround times.</p>
                </div>

                <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                    <StatPill
                        label="Avg. Response"
                        value={data.performance.avgTime}
                        sub={`${data.trends.performance.value} performance shift`}
                        icon={Timer}
                        accent="#10b981"
                        subUp={data.trends.performance.up}
                    />
                    <StatPill label="Completion Rate" value={data.performance.completionRate} sub="Goal: >95%" icon={Zap} accent="#f59e0b" />
                </div>

                <ChartCard title="Response Time Trends" icon={Timer} accent="#f59e0b">
                    <SpeedChart data={data.speedTrend} />
                </ChartCard>
            </div>
        </div>
    )
}
