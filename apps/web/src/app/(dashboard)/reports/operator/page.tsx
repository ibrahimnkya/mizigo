import { auth } from "@/auth";
import { prisma } from "@repo/database";
import { OperatorReportClient } from "./client";
import { redirect } from "next/navigation";
import { getReportStats, Timeframe } from "@/lib/reports";

export default async function OperatorReportPage({
    searchParams,
}: {
    searchParams: Promise<{ [key: string]: string | string[] | undefined }>;
}) {
    const session = await auth();
    if (!session?.user) redirect("/login");

    const params = await searchParams;
    const timeframe = (params.timeframe as Timeframe) || 'monthly';
    const stationId = session.user.stationId;

    // Fetch operators (AGENT/OPERATOR role) under this station
    const operators = await prisma.user.findMany({
        where: {
            stationId: stationId,
            role: { name: { in: ['AGENT', 'OPERATOR'] } }
        },
        include: {
            station: true
        }
    });

    if (!operators.length) {
        return (
            <div className="p-8">
                <h1 className="text-2xl font-bold">Operator Performance Report</h1>
                <p>No operators found for this station.</p>
            </div>
        );
    }

    // Fetch real metrics
    const stats = await getReportStats({
        stationId: stationId || undefined,
        timeframe: timeframe
    });

    return (
        <OperatorReportClient 
            operators={operators} 
            metrics={stats} 
            generatedAt={new Date().toISOString()} 
            stationName={operators[0]?.station?.name || 'All Stations'}
            timeframe={timeframe}
        />
    );
}
