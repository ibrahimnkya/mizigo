import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

router.get("/summary", async (req: Request, res: Response) => {
  try {
    const where =
      req.user?.role === "SUPER_ADMIN"
        ? {}
        : { organizationId: req.user?.organizationId || "" };

    const now = new Date();
    const thirtyDaysAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000);
    const sixtyDaysAgo = new Date(now.getTime() - 60 * 24 * 60 * 60 * 1000);

    const [totalCount, successCount, failedCount, totalAmount, currentPeriodRevenue, previousPeriodRevenue] =
      await Promise.all([
        prisma.payment.count({ where }),
        prisma.payment.count({ where: { ...where, status: "SUCCESS" } }),
        prisma.payment.count({ where: { ...where, status: "FAILED" } }),
        prisma.payment.aggregate({
          where: { ...where, status: "SUCCESS" },
          _sum: { amount: true, commission: true },
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
      ]);

    const currentRev = currentPeriodRevenue._sum.amount || 0;
    const prevRev = previousPeriodRevenue._sum.amount || 0;
    let growth = 0;
    if (prevRev > 0) {
      growth = ((currentRev - prevRev) / prevRev) * 100;
    } else if (currentRev > 0) {
      growth = 100;
    }

    return sendSuccess(res, {
      totalTransactions: totalCount,
      successfulTransactions: successCount,
      failedTransactions: failedCount,
      totalRevenue: totalAmount._sum.amount || 0,
      platformCommission: totalAmount._sum.commission || 0,
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
