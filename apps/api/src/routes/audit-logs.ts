import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

router.get("/", async (req: Request, res: Response) => {
  try {
    const { userId, action, resource, dateFrom, dateTo, page = "1", limit = "20" } = req.query;

    const where: any = {};
    if (userId) where.userId = String(userId);
    if (action) where.action = String(action);
    if (resource) where.resource = String(resource);
    if (dateFrom || dateTo) {
      where.createdAt = {};
      if (dateFrom) where.createdAt.gte = new Date(String(dateFrom));
      if (dateTo) where.createdAt.lte = new Date(String(dateTo));
    }

    if (req.user?.role !== "SUPER_ADMIN" && req.user?.organizationId) {
      where.OR = [
        { details: { path: ["organizationId"], equals: req.user.organizationId } },
        { details: { path: ["targetOrganizationId"], equals: req.user.organizationId } },
      ];
    }

    const pageNumber = Math.max(1, Number(page) || 1);
    const pageSize = Math.min(100, Math.max(1, Number(limit) || 20));
    const skip = (pageNumber - 1) * pageSize;

    const [items, total] = await Promise.all([
      prisma.auditLog.findMany({
        where,
        orderBy: { createdAt: "desc" },
        skip,
        take: pageSize,
      }),
      prisma.auditLog.count({ where }),
    ]);

    return sendSuccess(res, items, 200, {
      page: pageNumber,
      limit: pageSize,
      total,
      totalPages: Math.ceil(total / pageSize),
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
