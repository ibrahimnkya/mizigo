import { prisma } from '@repo/database';
import { startOfWeek, startOfMonth, startOfQuarter, subDays } from 'date-fns';

export type Timeframe = 'weekly' | 'monthly' | 'quarterly' | 'custom';

export async function getReportStats(params: {
    userId?: string;
    stationId?: string;
    organizationId?: string;
    timeframe: Timeframe;
    startDate?: Date;
    endDate?: Date;
}) {
    const { userId, stationId, organizationId, timeframe, startDate, endDate } = params;

    let dateRange: { gte: Date; lte: Date };

    const now = new Date();
    if (timeframe === 'weekly') {
        dateRange = { gte: startOfWeek(now), lte: now };
    } else if (timeframe === 'monthly') {
        dateRange = { gte: startOfMonth(now), lte: now };
    } else if (timeframe === 'quarterly') {
        dateRange = { gte: startOfQuarter(now), lte: now };
    } else {
        dateRange = { gte: startDate || subDays(now, 30), lte: endDate || now };
    }

    const where: any = {
        createdAt: dateRange
    };

    if (userId) where.userId = userId;
    
    // Station scope
    if (stationId) {
        const usersInStation = await prisma.user.findMany({
            where: { stationId },
            select: { id: true }
        });
        where.userId = { in: usersInStation.map((u: { id: string }) => u.id) };
    }

    // Organization scope
    if (organizationId) {
        const usersInOrg = await prisma.user.findMany({
            where: { organizationId },
            select: { id: true }
        });
        where.userId = { in: usersInOrg.map((u: { id: string }) => u.id) };
    }

    const [received, delivered, sent, atWarehouse] = await Promise.all([
        prisma.cargoRequest.count({ where: { ...where, status: 'RECEIVED' } }),
        prisma.cargoRequest.count({ where: { ...where, status: 'COMPLETED' } }), // COMPLETED is alias for DELIVERED
        prisma.cargoRequest.count({ where: { ...where, status: 'SENT' } }),
        prisma.cargoRequest.count({ where: { ...where, status: 'AT_WAREHOUSE' } }),
    ]);

    // Workforce Analytics (Top Stations/Operators)
    let topStations: any[] = [];
    let topOperators: any[] = [];

    if (organizationId || (!userId && !stationId)) {
        // Find top stations in this org (or global if no orgId)
        const stationCounts = await prisma.user.groupBy({
            by: ['stationId'],
            where: organizationId ? { organizationId } : {},
            _count: { id: true }
        });

        // This is a bit complex with current schema (CargoRequest doesn't have stationId directly)
        // Let's approximate by fromAddress if station names are used there
        const stationVolumes = await prisma.cargoRequest.groupBy({
            by: ['fromAddress'],
            where,
            _count: { id: true },
            orderBy: { _count: { id: 'desc' } },
            take: 5
        });
        topStations = stationVolumes.map((s: { fromAddress: string; _count: { id: number } }) => ({ name: s.fromAddress || 'Unknown', volume: s._count.id }));

        // Top Operators
        const operatorVolumes = await prisma.cargoRequest.groupBy({
            by: ['userId'],
            where,
            _count: { id: true },
            orderBy: { _count: { id: 'desc' } },
            take: 5
        });
        
        const operatorIds = operatorVolumes.map((ov: { userId: string | null }) => ov.userId).filter((id: string | null): id is string => id !== null);
        const operators = await prisma.user.findMany({
            where: { id: { in: operatorIds } },
            select: { id: true, name: true }
        });
        
        topOperators = operatorVolumes.map((ov: { userId: string | null; _count: { id: number } }) => {
            const op = operators.find((o: { id: string }) => o.id === ov.userId);
            return { name: op?.name || 'Unknown Operator', volume: ov._count.id };
        });
    }

    return {
        received,
        delivered,
        sent,
        atWarehouse,
        totalVolume: received + delivered + sent + atWarehouse,
        topStations,
        topOperators,
        timeframe,
        generatedAt: new Date().toISOString()
    };
}
