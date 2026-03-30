import { auth } from "@/auth";
import { prisma } from "@repo/database";
import { OrganizationReportClient } from "./client";
import { redirect } from "next/navigation";
import { getReportStats } from "@/lib/reports";

export default async function OrganizationReportPage({
    searchParams
}: {
    searchParams: { timeframe?: string }
}) {
    const session = await auth();
    if (!session?.user) redirect("/login");

    const timeframe = searchParams.timeframe || 'monthly';
    const organizationId = session.user.organizationId;
    
    if (!organizationId) {
        return (
            <div className="p-8">
                <h1 className="text-2xl font-bold font-black tracking-tight text-slate-900 mb-2">Organization Report</h1>
                <p className="text-slate-500 font-bold">No organization context found for this account.</p>
            </div>
        );
    }

    const organization = await prisma.organization.findUnique({
        where: { id: organizationId },
        include: {
            stations: {
                include: {
                    _count: {
                        select: { users: true }
                    }
                }
            }
        }
    });

    if (!organization) redirect("/dashboard");

    // Fetch real metrics using centralized reporting utility
    const stats = await getReportStats({
        organizationId: organizationId,
        timeframe: timeframe as any
    });

    return (
        <OrganizationReportClient 
            organization={organization} 
            metrics={stats} 
            timeframe={timeframe}
            generatedAt={new Date().toISOString()} 
        />
    );
}
