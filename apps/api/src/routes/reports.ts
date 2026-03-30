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
    const [total, pending, received, inTransit, completed] = await Promise.all([
      prisma.cargoRequest.count({ where }),
      prisma.cargoRequest.count({ where: { ...where, status: "PENDING" } }),
      prisma.cargoRequest.count({ where: { ...where, status: "RECEIVED" } }),
      prisma.cargoRequest.count({ where: { ...where, status: "IN_TRANSIT" } }),
      prisma.cargoRequest.count({ where: { ...where, status: "COMPLETED" } }),
    ]);

    return sendSuccess(res, {
      total,
      statuses: {
        pending,
        received,
        inTransit,
        completed,
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

export default router;
