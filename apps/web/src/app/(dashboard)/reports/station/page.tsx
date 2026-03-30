import { auth } from "@/auth";
import { prisma } from "@repo/database";
import { StationReportClient } from "./client";
import { redirect } from "next/navigation";
import { getReportStats } from "@/lib/reports";

export default async function StationReportPage({ searchParams }: { searchParams: Promise<{ timeframe?: string }> }) {
    const session = await auth();
    if (!session?.user) redirect("/login");

    const { timeframe = 'weekly' } = await searchParams;
    let stationId = session.user.stationId;
    
    // Admins usually view their own station, super_admins could pick, but let's stick to their own or global
    if (!stationId) {
        // If SUPER_ADMIN has no station, we might need a station selector. 
        // For now, let's fetch any available station.
        const firstStation = await prisma.station.findFirst();
        stationId = firstStation?.id;
    }

    if (!stationId) {
        return (
            <div className="p-8">
                <h1 className="text-2xl font-bold">Station Performance Report</h1>
                <p>No stations found in the database.</p>
            </div>
        );
    }

    // Fetch station details
    const station = await prisma.station.findUnique({
        where: { id: stationId },
        include: {
            organization: true,
            users: {
                select: { id: true }
            }
        }
    });

    // Fetch actual metrics
    const metrics = await getReportStats({
        stationId,
        timeframe: timeframe as any
    });

    return (
        <StationReportClient 
            station={station} 
            metrics={metrics} 
            generatedAt={new Date().toISOString()} 
            timeframe={timeframe}
        />
    );
}
