import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

const buildCargoWhere = (req: Request) => {
  const { status, dateFrom, dateTo, operatorId } = req.query;
  const where: any = {};

  if (status) where.status = String(status);
  if (operatorId) where.userId = String(operatorId);
  if (dateFrom || dateTo) {
    where.createdAt = {};
    if (dateFrom) where.createdAt.gte = new Date(String(dateFrom));
    if (dateTo) where.createdAt.lte = new Date(String(dateTo));
  }

  if (req.user?.role !== "SUPER_ADMIN" && req.user?.organizationId) {
    where.user = { organizationId: req.user.organizationId };
  }

  return where;
};

router.get("/cargo", async (req: Request, res: Response) => {
  try {
    const where = buildCargoWhere(req);
    const [total, pending, received, inTransit, delivered] = await Promise.all([
      prisma.cargoRequest.count({ where }),
      prisma.cargoRequest.count({ where: { ...where, status: "PENDING" } }),
      prisma.cargoRequest.count({ where: { ...where, status: "RECEIVED" } }),
      prisma.cargoRequest.count({ where: { ...where, status: "IN_TRANSIT" } }),
      prisma.cargoRequest.count({ where: { ...where, status: "DELIVERED" } }),
    ]);

    return sendSuccess(res, {
      total,
      statuses: {
        pending,
        received,
        inTransit,
        delivered,
      },
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/stations", async (req: Request, res: Response) => {
  try {
    const where =
      req.user?.role === "SUPER_ADMIN" ? {} : { organizationId: req.user?.organizationId ?? "" };

    const stations = await prisma.station.findMany({
      where,
      orderBy: { createdAt: "desc" },
      include: {
        _count: {
          select: {
            users: true,
          },
        },
      },
    });

    return sendSuccess(res, stations);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/operators", async (req: Request, res: Response) => {
  try {
    const role = await prisma.role.findFirst({
      where: {
        OR: [{ name: "OPERATOR" }, { name: "STATION_OPERATOR" }],
      },
    });

    if (!role) {
      return sendSuccess(res, []);
    }

    const where =
      req.user?.role === "SUPER_ADMIN"
        ? { roleId: role.id }
        : { roleId: role.id, organizationId: req.user?.organizationId ?? "" };

    const operators = await prisma.user.findMany({
      where,
      orderBy: { createdAt: "desc" },
      include: {
        _count: {
          select: {
            cargoRequests: true,
          },
        },
        station: true,
      },
    });

    return sendSuccess(res, operators);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/admin/overview", async (req: Request, res: Response) => {
  try {
    if (!req.user) return sendError(res, "UNAUTHORIZED", "Unauthorized", 401);
    if (!["SUPER_ADMIN", "ADMIN"].includes(req.user.role)) {
      return sendError(res, "FORBIDDEN", "Admin role required", 403);
    }

    const where = req.user.role === "SUPER_ADMIN" ? {} : { organizationId: req.user.organizationId || "" };
    const [organizations, stations, operators, successfulPayments] = await Promise.all([
      prisma.organization.count({ where: req.user.role === "SUPER_ADMIN" ? {} : { id: req.user.organizationId || "" } }),
      prisma.station.count({ where }),
      prisma.user.count({ where: req.user.role === "SUPER_ADMIN" ? {} : { organizationId: req.user.organizationId || "" } }),
      prisma.payment.aggregate({ where: { ...where, status: "SUCCESS" }, _sum: { amount: true } }),
    ]);

    return sendSuccess(res, {
      organizations,
      stations,
      users: operators,
      revenue: successfulPayments._sum.amount || 0,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/operator/overview", async (req: Request, res: Response) => {
  try {
    if (!req.user) return sendError(res, "UNAUTHORIZED", "Unauthorized", 401);
    if (!["SUPER_ADMIN", "OPERATOR", "STATION_OPERATOR"].includes(req.user.role)) {
      return sendError(res, "FORBIDDEN", "Operator role required", 403);
    }

    const stationId = req.user.stationId || req.query.stationId;
    if (!stationId) {
      return sendError(res, "VALIDATION_ERROR", "stationId is required", 400);
    }

    const [atStation, inTransit, delivered] = await Promise.all([
      prisma.cargoRequest.count({ where: { fromAddress: String(stationId), status: "RECEIVED" } }),
      prisma.cargoRequest.count({ where: { fromAddress: String(stationId), status: "IN_TRANSIT" } }),
      prisma.cargoRequest.count({ where: { fromAddress: String(stationId), status: "DELIVERED" } }),
    ]);

    return sendSuccess(res, {
      stationId,
      atStation,
      inTransit,
      delivered,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
