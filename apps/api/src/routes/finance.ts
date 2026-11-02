import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

// Default extra-service prices (same as the receive flow in parcel.ts).
const SERVICE_FEES: Record<string, number> = { insurance: 3000, packaging: 2000, fragile: 2500 };

/**
 * GET /finance/revenue?dateFrom&dateTo&stationId
 * Parcel-based revenue for a period: money from paid parcels (counter cash
 * marked paid + successful online payments), split into transport and extra
 * services, with outstanding amounts, platform fees, a daily series and
 * breakdowns by station and payment type. Also returns the previous period
 * of the same length for comparison.
 */
router.get("/revenue", async (req: Request, res: Response) => {
  try {
    const scope: any = req.user?.role === "SUPER_ADMIN" ? {} : { organizationId: req.user?.organizationId || "" };
    if (req.query.stationId) scope.originId = String(req.query.stationId);
    const from = req.query.dateFrom ? new Date(String(req.query.dateFrom)) : null;
    const to = req.query.dateTo ? new Date(String(req.query.dateTo)) : new Date();
    const hasFrom = !!from && !isNaN(from.getTime());
    const range = (a: Date | null, b: Date) => (a ? { gte: a, lte: b } : { lte: b });

    const select = {
      createdAt: true,
      amount: true,
      additionalServices: true,
      origin: { select: { id: true, name: true } },
      payment: { select: { status: true, paymentMethod: true, commission: true, systemFee: true } },
    };
    const [parcels, previous] = await Promise.all([
      (prisma as any).parcel.findMany({ where: { ...scope, createdAt: range(hasFrom ? from : null, to) }, select, orderBy: { createdAt: "asc" } }),
      hasFrom
        ? (prisma as any).parcel.findMany({
            where: { ...scope, createdAt: { gte: new Date(from!.getTime() - (to.getTime() - from!.getTime())), lt: from } },
            select,
          })
        : Promise.resolve([]),
    ]);

    const meta = (p: any) =>
      p.additionalServices && typeof p.additionalServices === "object" && !Array.isArray(p.additionalServices) ? p.additionalServices : {};
    const paid = (p: any) => p.payment?.status === "SUCCESS" || meta(p).paymentStatus === "PAID";
    const services = (p: any) => {
      const list = Array.isArray(meta(p).services) ? meta(p).services : [];
      return list.reduce((n: number, id: string) => n + (SERVICE_FEES[id] ?? 0), 0);
    };
    const method = (p: any) => {
      const m = p.payment?.paymentMethod;
      if (m) return String(m);
      const mode = String(meta(p).paymentMode || "");
      return mode === "TO_PAY" ? "Receiver pays" : "Cash at counter";
    };

    let revenue = 0;
    let servicesRevenue = 0;
    let outstanding = 0;
    let paidCount = 0;
    let platformFees = 0;
    const days = new Map<string, { date: string; revenue: number; parcels: number }>();
    const stations = new Map<string, { id: string; name: string; revenue: number; parcels: number }>();
    const methods = new Map<string, number>();

    for (const p of parcels as any[]) {
      const amount = p.amount || 0;
      const day = new Date(p.createdAt).toISOString().slice(0, 10);
      const d = days.get(day) ?? { date: day, revenue: 0, parcels: 0 };
      d.parcels += 1;
      const st = p.origin ? stations.get(p.origin.id) ?? { id: p.origin.id, name: p.origin.name, revenue: 0, parcels: 0 } : null;
      if (st) st.parcels += 1;
      if (paid(p)) {
        revenue += amount;
        servicesRevenue += Math.min(services(p), amount);
        paidCount += 1;
        d.revenue += amount;
        if (st) st.revenue += amount;
        methods.set(method(p), (methods.get(method(p)) ?? 0) + amount);
        platformFees += (p.payment?.commission || 0) + (p.payment?.systemFee || 0);
      } else {
        outstanding += amount;
      }
      days.set(day, d);
      if (st) stations.set(st.id, st);
    }

    const prevRevenue = (previous as any[]).filter(paid).reduce((n, p) => n + (p.amount || 0), 0);

    return sendSuccess(res, {
      summary: {
        revenue,
        transportRevenue: revenue - servicesRevenue,
        servicesRevenue,
        outstanding,
        platformFees,
        netRevenue: revenue - platformFees,
        parcels: parcels.length,
        paidParcels: paidCount,
        averagePerParcel: paidCount ? Math.round(revenue / paidCount) : 0,
      },
      previous: hasFrom ? { revenue: prevRevenue } : null,
      series: [...days.values()],
      byStation: [...stations.values()].sort((a, b) => b.revenue - a.revenue),
      byMethod: [...methods.entries()].map(([label, value]) => ({ label, value })).sort((a, b) => b.value - a.value),
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/summary", async (req: Request, res: Response) => {
  try {
    const isSuperAdmin = req.user?.role === "SUPER_ADMIN";
    const where = isSuperAdmin
      ? {}
      : { organizationId: req.user?.organizationId || "" };

    const now = new Date();
    const thirtyDaysAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000);
    const sixtyDaysAgo = new Date(now.getTime() - 60 * 24 * 60 * 60 * 1000);

    const [totalCount, successCount, failedCount, totalAmount, currentPeriodRevenue, previousPeriodRevenue, payments] =
      await Promise.all([
        prisma.payment.count({ where }),
        prisma.payment.count({ where: { ...where, status: "SUCCESS" } }),
        prisma.payment.count({ where: { ...where, status: "FAILED" } }),
        prisma.payment.aggregate({
          where: { ...where, status: "SUCCESS" },
          _sum: { amount: true, commission: true, systemFee: true },
        }),
        prisma.payment.aggregate({
          _sum: { amount: true },
          where: {
            ...where,
            status: "SUCCESS",
            createdAt: { gte: thirtyDaysAgo },
          },
        }),
        prisma.payment.aggregate({
          _sum: { amount: true },
          where: {
            ...where,
            status: "SUCCESS",
            createdAt: {
              gte: sixtyDaysAgo,
              lt: thirtyDaysAgo,
            },
          },
        }),
        prisma.payment.findMany({
          where: { ...where, status: "SUCCESS" },
          include: {
            parcel: {
              select: {
                additionalServices: true,
              },
            },
          },
        }),
      ]);

    const currentRev = currentPeriodRevenue._sum.amount || 0;
    const prevRev = previousPeriodRevenue._sum.amount || 0;
    let growth = 0;
    if (prevRev > 0) {
      growth = ((currentRev - prevRev) / prevRev) * 100;
    } else if (currentRev > 0) {
      growth = 100;
    }

    // Compute additional services revenue from parcel details
    let additionalServicesRevenue = 0;
    for (const p of payments) {
      const services = p.parcel?.additionalServices;
      if (Array.isArray(services)) {
        for (const s of services) {
          const serviceName = String(s).toLowerCase();
          if (serviceName.includes("insurance")) {
            additionalServicesRevenue += 3000;
          } else if (serviceName.includes("packaging")) {
            additionalServicesRevenue += 2000;
          } else if (serviceName.includes("handling") || serviceName.includes("fragile")) {
            additionalServicesRevenue += 2500;
          }
        }
      }
    }

    const grossRevenue = totalAmount._sum.amount || 0;
    const platformCommission = totalAmount._sum.commission || 0;
    const systemFeeRevenue = totalAmount._sum.systemFee || 0;
    // What's left for the requester's own scope after platform fees/commission
    // are taken out — this is what an Organization Admin actually keeps.
    const netRevenue = grossRevenue - platformCommission - systemFeeRevenue;

    return sendSuccess(res, {
      totalTransactions: totalCount,
      successfulTransactions: successCount,
      failedTransactions: failedCount,
      totalRevenue: grossRevenue,
      platformCommission,
      additionalServicesRevenue,
      systemFeeRevenue,
      netRevenue,
      // Only meaningful when `where` spans every organization (Super Admin);
      // for an org-scoped request this would just be "platform's cut of MY
      // org's transactions" mislabeled as "platform earnings", so it's
      // omitted rather than shipped under a misleading name.
      ...(isSuperAdmin
        ? {
            totalPlatformEarnings:
              platformCommission + additionalServicesRevenue + systemFeeRevenue,
          }
        : {}),
      revenueGrowth: growth,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/transactions", async (req: Request, res: Response) => {
  try {
    const page = Math.max(1, Number(req.query.page || 1));
    const limit = Math.min(100, Math.max(1, Number(req.query.limit || 20)));

    const where =
      req.user?.role === "SUPER_ADMIN"
        ? {}
        : { organizationId: req.user?.organizationId || "" };

    const data = await prisma.payment.findMany({
      where,
      orderBy: { createdAt: "desc" },
      skip: (page - 1) * limit,
      take: limit,
      include: {
        parcel: {
          select: {
            id: true,
            reason: true,
            fromAddress: true,
            toAddress: true,
            status: true,
          },
        },
      },
    });

    return sendSuccess(res, data, 200, { page, limit });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/commissions", async (req: Request, res: Response) => {
  try {
    if (req.user?.role !== "SUPER_ADMIN") {
      return sendError(
        res,
        "FORBIDDEN",
        "Only super admin can access platform commissions",
        403,
      );
    }

    const organizations = await prisma.organization.findMany({
      where: { isActive: true, deletedAt: null },
    });

    const rows = await Promise.all(
      organizations.map(async (organization) => {
        const rate = organization.commissionRate || 0;
        const result = await prisma.payment.aggregate({
          where: { organizationId: organization.id, status: "SUCCESS" },
          _sum: { amount: true },
        });

        const gross = result._sum.amount || 0;
        const commissionAmount = gross * rate;

        return {
          organizationId: organization.id,
          organizationName: organization.name,
          commissionRate: rate,
          grossRevenue: gross,
          platformCommission: commissionAmount,
          netToOrganization: gross - commissionAmount,
        };
      }),
    );

    return sendSuccess(res, rows);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
