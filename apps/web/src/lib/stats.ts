import { prisma } from '@repo/database'

export async function getStats(user: { id: string, role: string }) {
    try {
        const isAdmin = user.role === 'ADMIN' || user.role === 'SUPER_ADMIN';
        const isOperator = user.role === 'OPERATOR';
        const isAgent = user.role === 'AGENT';
        const userId = user.id;

        let where: any = {};
        if (isAgent) {
            where = { userId: userId };
        }

        const totalRequests = await prisma.cargoRequest.count({ where })
        
        const pendingWhere = (isAdmin || isOperator) ? { status: 'PENDING' } : { ...where, status: 'PENDING' };
        
        const pendingRequests = await prisma.cargoRequest.count({
            where: pendingWhere,
        })
        const approvedRequests = await prisma.cargoRequest.count({
            where: { ...where, status: 'APPROVED' },
        })
        const rejectedRequests = await prisma.cargoRequest.count({
            where: { ...where, status: 'REJECTED' },
        })

        // Operational Metrics (for Operator/Admin Command Center)
        const [received, delivered, sent, atWarehouse] = await Promise.all([
            prisma.cargoRequest.count({ where: { ...where, status: 'RECEIVED' } }),
            prisma.cargoRequest.count({ where: { ...where, status: 'COMPLETED' } }), // COMPLETED is Delivered
            prisma.cargoRequest.count({ where: { ...where, status: 'SENT' } }),
            prisma.cargoRequest.count({ where: { ...where, status: 'AT_WAREHOUSE' } }),
        ]);

        const recentActivity = await prisma.cargoRequest.findMany({
            where,
            take: 5,
            orderBy: { createdAt: 'desc' },
            select: {
                id: true,
                fromAddress: true,
                toAddress: true,
                status: true,
                createdAt: true,
            }
        })

        // Determine what goes in the "Action Required" list
        const pendingListWhere: any = (isAdmin || isOperator) 
            ? { status: 'PENDING' } 
            : { userId, status: { in: ['PENDING', 'PAYMENT_PENDING', 'REJECTED'] } };

        const pendingList = await prisma.cargoRequest.findMany({
            where: pendingListWhere,
            take: 10,
            orderBy: { createdAt: 'desc' },
            select: {
                id: true,
                fromAddress: true,
                toAddress: true,
                cargoType: true,
                createdAt: true,
                receiverName: true,
                status: true,
            }
        });

        let superAdminStats = null;
        if (user.role === 'SUPER_ADMIN') {
            const revenueToday = await (prisma as any).payment.aggregate({
                where: {
                    status: 'SUCCESS',
                    createdAt: { gte: new Date(new Date().setHours(0, 0, 0, 0)) }
                },
                _sum: { amount: true }
            });

            const topAdmins = await prisma.user.findMany({
                where: { role: { name: 'ADMIN' } },
                select: {
                    id: true,
                    name: true,
                    _count: {
                        select: { approvedCargo: true }
                    }
                },
                orderBy: { approvedCargo: { _count: 'desc' } },
                take: 1
            });

            superAdminStats = {
                revenueToday: revenueToday._sum.amount || 0,
                topAdmin: topAdmins[0] || null,
                unpaidOrders: await (prisma as any).payment.count({ where: { status: 'PENDING' } })
            };
        }

        let adminPerformance = null;
        if (isAdmin) {
            const myRequests = await prisma.cargoRequest.findMany({
                where: { approvedById: userId },
                select: { status: true, createdAt: true, updatedAt: true }
            });

            const totalMyRequests = myRequests.length;
            const approvedMyRequests = myRequests.filter((r: any) => r.status === 'APPROVED').length;
            const completionRate = totalMyRequests > 0 ? Math.round((approvedMyRequests / totalMyRequests) * 100) : 0;

            const approvedWithTime = myRequests.filter((r: any) => r.status === 'APPROVED');
            const avgTimeMs = approvedWithTime.length > 0
                ? approvedWithTime.reduce((acc: number, r: any) => acc + (r.updatedAt.getTime() - r.createdAt.getTime()), 0) / approvedWithTime.length
                : 0;
            const avgTimeMins = Math.round(avgTimeMs / (1000 * 60));

            adminPerformance = {
                approvalCount: approvedMyRequests,
                completionRate: `${completionRate}%`,
                avgTime: `${avgTimeMins}m`
            };
        }

        const paidCount = await (prisma as any).payment.count({
            where: { ...where, status: 'SUCCESS' }
        });
        const awaitingPaymentCount = await (prisma as any).payment.count({
            where: { ...where, status: 'PENDING' }
        });

        const last7Days = Array.from({ length: 7 }, (_, i) => {
            const d = new Date();
            d.setDate(d.getDate() - i);
            d.setHours(0, 0, 0, 0);
            return d;
        }).reverse();

        const chartData = await Promise.all(last7Days.map(async (date) => {
            const nextDay = new Date(date);
            nextDay.setDate(date.getDate() + 1);

            const count = await prisma.cargoRequest.count({
                where: {
                    ...where,
                    createdAt: {
                        gte: date,
                        lt: nextDay
                    }
                }
            });

            return {
                name: date.toLocaleDateString('en-US', { weekday: 'short' }),
                total: count
            };
        }));

        const now = new Date();
        const sevenDaysAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
        const fourteenDaysAgo = new Date(now.getTime() - 14 * 24 * 60 * 60 * 1000);

        const currentWeekCount = await prisma.cargoRequest.count({ where: { ...where, createdAt: { gte: sevenDaysAgo } } });
        const previousWeekCount = await prisma.cargoRequest.count({ where: { ...where, createdAt: { gte: fourteenDaysAgo, lt: sevenDaysAgo } } });

        const currentWeekPending = await prisma.cargoRequest.count({ where: { ...where, status: 'PENDING', createdAt: { gte: sevenDaysAgo } } });
        const previousWeekPending = await prisma.cargoRequest.count({ where: { ...where, status: 'PENDING', createdAt: { gte: fourteenDaysAgo, lt: sevenDaysAgo } } });

        const currentWeekApproved = await prisma.cargoRequest.count({ where: { ...where, status: 'APPROVED', createdAt: { gte: sevenDaysAgo } } });
        const previousWeekApproved = await prisma.cargoRequest.count({ where: { ...where, status: 'APPROVED', createdAt: { gte: fourteenDaysAgo, lt: sevenDaysAgo } } });

        const currentWeekRejected = await prisma.cargoRequest.count({ where: { ...where, status: 'REJECTED', createdAt: { gte: sevenDaysAgo } } });
        const previousWeekRejected = await prisma.cargoRequest.count({ where: { ...where, status: 'REJECTED', createdAt: { gte: fourteenDaysAgo, lt: sevenDaysAgo } } });

        const currentWeekPaid = await (prisma as any).payment.count({ where: { ...where, status: 'SUCCESS', createdAt: { gte: sevenDaysAgo } } });
        const previousWeekPaid = await (prisma as any).payment.count({ where: { ...where, status: 'SUCCESS', createdAt: { gte: fourteenDaysAgo, lt: sevenDaysAgo } } });

        const currentWeekAwaiting = await (prisma as any).payment.count({ where: { ...where, status: 'PENDING', createdAt: { gte: sevenDaysAgo } } });
        const previousWeekAwaiting = await (prisma as any).payment.count({ where: { ...where, status: 'PENDING', createdAt: { gte: fourteenDaysAgo, lt: sevenDaysAgo } } });

        const calculateTrend = (current: number, previous: number) => {
            if (previous === 0) return current > 0 ? "+100%" : "0%";
            const diff = ((current - previous) / previous) * 100;
            return `${diff >= 0 ? '+' : ''}${diff.toFixed(1)}%`;
        };

        const trends = {
            totalRequests: { value: calculateTrend(currentWeekCount, previousWeekCount), up: currentWeekCount >= previousWeekCount },
            pendingRequests: { value: calculateTrend(currentWeekPending, previousWeekPending), up: currentWeekPending >= previousWeekPending },
            approvedRequests: { value: calculateTrend(currentWeekApproved, previousWeekApproved), up: currentWeekApproved >= previousWeekApproved },
            rejectedRequests: { value: calculateTrend(currentWeekRejected, previousWeekRejected), up: currentWeekRejected >= previousWeekRejected },
            paidCount: { value: calculateTrend(currentWeekPaid, previousWeekPaid), up: currentWeekPaid >= previousWeekPaid },
            awaitingPaymentCount: { value: calculateTrend(currentWeekAwaiting, previousWeekAwaiting), up: currentWeekAwaiting >= previousWeekAwaiting },
        };

        const revenueBreakdown = await (prisma as any).payment.groupBy({
            by: ['paymentMethod'],
            where: { ...where, status: 'SUCCESS' },
            _sum: { amount: true }
        });

        const totalRev = await (prisma as any).payment.aggregate({
            where: { ...where, status: 'SUCCESS' },
            _sum: { amount: true }
        }).then((res: any) => res._sum.amount || 0);

        const revenueByChannel = revenueBreakdown.map((rb: any) => ({
            name: rb.paymentMethod || 'Other',
            value: totalRev > 0 ? Math.round(((rb._sum.amount || 0) / totalRev) * 100) : 0,
            amount: rb._sum.amount || 0,
            raw: `TZS ${((rb._sum.amount || 0) / 1000).toLocaleString()}K`
        })).sort((a: any, b: any) => b.amount - a.amount);

        const volumeByStationRaw = await prisma.cargoRequest.groupBy({
            by: ['fromAddress'],
            where,
            _count: { id: true }
        });
        const volumeByStation = volumeByStationRaw.map((v: any) => ({
            name: v.fromAddress,
            volume: v._count?.id || 0
        }));

        // Top Operators
        const operatorVolumes = await prisma.cargoRequest.groupBy({
            by: ['userId'],
            where,
            _count: { id: true },
            orderBy: { _count: { id: 'desc' } },
            take: 5
        });
        
        const operatorIds = operatorVolumes.map((ov: any) => ov.userId).filter((id: string | null): id is string => id !== null);
        const operators = await prisma.user.findMany({
            where: { id: { in: operatorIds } },
            select: { id: true, name: true }
        });
        
        const topOperators = operatorVolumes.map((ov: any) => {
            const op = operators.find((o: any) => o.id === ov.userId);
            return { name: op?.name || 'Unknown Operator', volume: ov._count?.id || 0 };
        });

        return {
            totalRequests,
            pendingRequests,
            approvedRequests,
            rejectedRequests,
            received,
            delivered,
            sent,
            atWarehouse,
            recentActivity: recentActivity.map((a: any) => ({ ...a, createdAt: a.createdAt.toISOString() })),
            chartData,
            paidCount,
            awaitingPaymentCount,
            revenueByChannel,
            pendingList: pendingList.map((p: any) => ({ ...p, createdAt: p.createdAt.toISOString() })),
            superAdminStats,
            adminPerformance,
            trends,
            volumeByStation,
            topOperators,
            totalRevenue: totalRev
        }
    } catch (error) {
        console.error('Error in getStats:', error)
        return null;
    }
}
