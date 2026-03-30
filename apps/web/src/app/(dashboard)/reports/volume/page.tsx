import { VolumeChart } from "@/components/dashboard/volume-chart";
import { Package2, Truck } from "lucide-react";
import { StatPill, ChartCard } from "@/components/dashboard/reports-shared";
import { prisma } from "@repo/database";
import { auth } from "@/auth";
import { redirect } from "next/navigation";

async function getVolumeData() {
    const session = await auth();
    if (!session?.user) return null;

    const userRole = session.user.role;
    if (userRole !== 'ADMIN' && userRole !== 'SUPER_ADMIN') return null;

    const isAdmin = userRole === 'ADMIN';
    const userId = session.user.id;
    const where: any = isAdmin ? { approvedById: userId } : {};

    // 1. Total Shipments
    const totalRequests = await prisma.cargoRequest.count({ where });

    // 2. Volume by Station (From Address)
    const volumeByStationRaw = await prisma.cargoRequest.groupBy({
        by: ['fromAddress'],
        where,
        _count: { id: true }
    });

    const volumeByStation = volumeByStationRaw.map((v: any) => ({
        name: v.fromAddress,
        volume: v._count?.id || 0
    })).sort((a, b) => b.volume - a.volume);

    // 3. Trends (Current week vs last week)
    const now = new Date();
    const sevenDaysAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
    const fourteenDaysAgo = new Date(now.getTime() - 14 * 24 * 60 * 60 * 1000);

    const currentWeekCount = await prisma.cargoRequest.count({
        where: { ...where, createdAt: { gte: sevenDaysAgo } }
    });
    const previousWeekCount = await prisma.cargoRequest.count({
        where: { ...where, createdAt: { gte: fourteenDaysAgo, lt: sevenDaysAgo } }
    });

    const diff = previousWeekCount === 0 ? (currentWeekCount > 0 ? 100 : 0) : ((currentWeekCount - previousWeekCount) / previousWeekCount) * 100;

    return {
        totalRequests,
        volumeByStation,
        trends: {
            totalRequests: {
                value: `${diff >= 0 ? '+' : ''}${diff.toFixed(1)}%`,
                up: diff >= 0
            }
        }
    };
}

export default async function CargoVolumeReportPage() {
    const data = await getVolumeData();

    if (!data) {
        redirect("/login");
    }

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                <div>
                    <div className="flex items-center gap-2 mb-2">
                        <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-blue-600 bg-blue-50 px-2.5 py-1 rounded-full">
                            Operations
                        </span>
                    </div>
                    <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Cargo Volume</h1>
                    <p className="text-sm text-slate-400 font-medium mt-0.5">Analysis of shipment quantities and station distribution.</p>
                </div>

                <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                    <StatPill
                        label="Total Shipments"
                        value={data.totalRequests.toLocaleString()}
                        sub={`${data.trends.totalRequests.value} from last week`}
                        icon={Package2}
                        accent="#3b82f6"
                        subUp={data.trends.totalRequests.up}
                    />
                    <StatPill label="Stations Active" value={data.volumeByStation.length.toString()} sub="Network coverage" icon={Truck} accent="#8b5cf6" />
                </div>

                <ChartCard title="Volume by Station" icon={Package2} accent="#3b82f6">
                    <VolumeChart data={data.volumeByStation} />
                </ChartCard>
            </div>
        </div>
    )
}