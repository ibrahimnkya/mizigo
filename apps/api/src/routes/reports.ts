import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

const VALID_STATUSES = [
  "PENDING",
  "APPROVED",
  "REJECTED",
  "PAYMENT_PENDING",
  "PAID",
  "RECEIVED",
  "SENT",
  "DISPATCHED",
  "OFFLOADED",
  "AT_STATION",
  "IN_TRANSIT",
  "DELAYED",
  "DELIVERED",
  "CANCELED",
  "LOST"
];

const mapParcelStatus = (status: any): string | null => {
  if (!status) return null;
  let mapped = String(status).toUpperCase().replace(/\s+/g, "_");
  if (mapped === "CANCELLED") {
    mapped = "CANCELED";
  }
  return VALID_STATUSES.includes(mapped) ? mapped : null;
};

const buildParcelWhere = (req: Request) => {
  const { status, dateFrom, dateTo, operatorId } = req.query;
  const where: any = {};

  if (status) {
    const mapped = mapParcelStatus(status);
    if (mapped) where.status = mapped;
  }
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

router.get("/parcel", async (req: Request, res: Response) => {
  try {
    const { status } = req.query;
    if (status) {
      const mapped = mapParcelStatus(status);
      if (!mapped) {
        return sendError(res, "VALIDATION_ERROR", `Invalid status value: ${status}`, 400);
      }
    }
    const where = buildParcelWhere(req);
    const [parcels, total, pending, inTransit, delivered, cancelled, revenue] =
      await Promise.all([
        (prisma as any).parcel.findMany({
          where,
          take: 50,
          orderBy: { createdAt: "desc" },
          include: {
            origin: true,
            destination: true,
          },
        }),
        (prisma as any).parcel.count({ where }),
        (prisma as any).parcel.count({
          where: { ...where, status: "PENDING" },
        }),
        (prisma as any).parcel.count({
          where: { ...where, status: "IN_TRANSIT" },
        }),
        (prisma as any).parcel.count({
          where: { ...where, status: "DELIVERED" },
        }),
        (prisma as any).parcel.count({
          where: { ...where, status: "CANCELLED" },
        }),
        (prisma as any).parcel.aggregate({
          where: { ...where, paymentStatus: "PAID" },
          _sum: { totalPrice: true },
        }),
      ]);

    return sendSuccess(res, {
      parcels,
      stats: {
        totalItems: total,
        totalWeight: 0, // Placeholder if weight is not in parcel yet
        totalRevenue: revenue._sum?.totalPrice || 0,
        pendingCount: pending,
      },
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/stations", async (req: Request, res: Response) => {
  try {
    const where =
      req.user?.role === "SUPER_ADMIN"
        ? {}
        : { organizationId: req.user?.organizationId ?? "" };

    const [stations, parcelCounts, allPayments] = await Promise.all([
      prisma.station.findMany({
        where,
        orderBy: { createdAt: "desc" },
        include: {
          organization: { select: { name: true } },
        },
      }),
      (prisma as any).parcel.groupBy({
        by: ["fromAddress"],
        where: {
          status: { in: ["RECEIVED", "AT_STATION", "IN_TRANSIT", "DELIVERED"] },
        },
        _count: { _all: true },
      }),
      (prisma as any).payment.findMany({
        where: { status: "SUCCESS" },
        include: {
          parcel: { select: { fromAddress: true } },
        },
      }),
    ]);

    const stationList = stations.map((s) => {
      const counts = (parcelCounts as any[]).find(
        (c) => c.fromAddress === s.id || c.fromAddress === s.code,
      );
      const revenue = (allPayments as any[])
        .filter(
          (p) =>
            p.parcel?.fromAddress === s.id || p.parcel?.fromAddress === s.code,
        )
        .reduce((sum, p) => sum + p.amount, 0);

      return {
        id: s.id,
        name: s.name,
        organizationName: s.organization?.name,
        parcelCount: counts?._count._all || 0,
        totalRevenue: revenue,
        isActive: true,
      };
    });

    const totalRevenue = stationList.reduce(
      (acc, curr) => acc + (curr.totalRevenue || 0),
      0,
    );

    return sendSuccess(res, {
      stations: stationList,
      summary: {
        totalStations: stationList.length,
        activeNodes: stationList.length,
        totalNetworkRevenue: totalRevenue,
        avgThroughput: "14h",
      },
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/stations/:id", async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { timeframe } = req.query;

    const station = await prisma.station.findUnique({
      where: { id },
      include: {
        organization: { select: { name: true } },
      },
    });

    if (!station) {
      return sendError(res, "NOT_FOUND", "Station not found", 404);
    }

    if (
      req.user?.role !== "SUPER_ADMIN" &&
      req.user?.organizationId !== station.organizationId
    ) {
      return sendError(res, "FORBIDDEN", "Access denied", 403);
    }

    const stationIdentifiers = [station.id, station.code];

    const dateFilter: any = {};
    if (timeframe === "daily") {
      dateFilter.gte = new Date(Date.now() - 24 * 60 * 60 * 1000);
    } else if (timeframe === "weekly") {
      dateFilter.gte = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000);
    } else if (timeframe === "monthly") {
      dateFilter.gte = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000);
    } else if (timeframe === "quarterly") {
      dateFilter.gte = new Date(Date.now() - 90 * 24 * 60 * 60 * 1000);
    } else if (timeframe === "custom" || req.query.dateFrom || req.query.dateTo) {
      if (req.query.dateFrom) dateFilter.gte = new Date(String(req.query.dateFrom));
      if (req.query.dateTo) dateFilter.lte = new Date(String(req.query.dateTo));
    }

    const whereBase = {
      fromAddress: { in: stationIdentifiers },
      ...(Object.keys(dateFilter).length > 0 ? { createdAt: dateFilter } : {}),
    };

    const [received, delivered, sent, atWarehouse] = await Promise.all([
      (prisma as any).parcel.count({
        where: {
          ...whereBase,
          status: "RECEIVED",
        },
      }),
      (prisma as any).parcel.count({
        where: {
          ...whereBase,
          status: "DELIVERED",
        },
      }),
      (prisma as any).parcel.count({
        where: {
          ...whereBase,
          status: "SENT",
        },
      }),
      (prisma as any).parcel.count({
        where: {
          ...whereBase,
          status: "AT_STATION",
        },
      }),
    ]);

    return sendSuccess(res, {
      station,
      metrics: {
        received,
        delivered,
        sent,
        atWarehouse,
      },
      generatedAt: new Date().toISOString(),
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/operators", async (req: Request, res: Response) => {
  try {
    const where: any = {
      role: {
        name: {
          in: ["OPERATOR", "STATION_OPERATOR", "AGENT", "CLERK"],
        },
      },
    };
    if (req.user?.role !== "SUPER_ADMIN") {
      where.organizationId = req.user?.organizationId ?? "";
    }

    const operators = await prisma.user.findMany({
      where,
      orderBy: { createdAt: "desc" },
      include: {
        _count: {
          select: {
            parcelRequests: true,
          },
        },
        station: true,
      },
    });

    const operatorList = operators.map((o) => ({
      id: o.id,
      name: o.name,
      email: o.email,
      createdAt: o.createdAt,
      stationName: o.station?.name,
      parcelCount: (o._count as any).parcelRequests || 0,
      avgTime: "12m",
      isActive: true,
    }));

    return sendSuccess(res, {
      operators: operatorList,
      summary: {
        totalOperators: operatorList.length,
        avgProcessingTime: "12m",
        totalOperations: operatorList.reduce(
          (acc, curr) => acc + curr.parcelCount,
          0,
        ),
        topPerformer: operatorList[0]?.name || "N/A",
      },
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/admin/overview", async (req: Request, res: Response) => {
  try {
    const where =
      req.user?.role === "SUPER_ADMIN"
        ? {}
        : { organizationId: req.user?.organizationId || "" };
    const [organizations, stations, users, parcel, revenue] = await Promise.all(
      [
        prisma.organization.count({
          where:
            req.user?.role === "SUPER_ADMIN"
              ? {}
              : { id: req.user?.organizationId || "" },
        }),
        prisma.station.count({ where }),
        prisma.user.count({
          where:
            req.user?.role === "SUPER_ADMIN"
              ? {}
              : { organizationId: req.user?.organizationId || "" },
        }),
        (prisma as any).parcel.count({
          where:
            req.user?.role === "SUPER_ADMIN"
              ? {}
              : { user: { organizationId: req.user?.organizationId || "" } },
        }),
        (prisma as any).payment.aggregate({
          where: { ...where, status: "SUCCESS" },
          _sum: { amount: true },
        }),
      ],
    );

    return sendSuccess(res, {
      totalRevenue: revenue._sum.amount || 0,
      totalOrganizations: organizations,
      totalStations: stations,
      totalParcel: parcel,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/operator/overview", async (req: Request, res: Response) => {
  try {
    let stationId = req.user?.stationId;
    if (!stationId) {
      if (req.user?.organizationId) {
        const firstStation = await prisma.station.findFirst({
          where: { organizationId: req.user.organizationId, isActive: true, deletedAt: null },
          select: { id: true },
        });
        if (firstStation) {
          stationId = firstStation.id;
        }
      }
      if (!stationId) {
        const firstStation = await prisma.station.findFirst({
          where: { isActive: true, deletedAt: null },
          select: { id: true },
        });
        if (firstStation) {
          stationId = firstStation.id;
        }
      }
    }

    if (!stationId) {
      return sendSuccess(res, {
        stationName: "LOGISTICS HUB",
        totalHandled: 0,
        pendingRelease: 0,
        revenueGenerated: 0,
      });
    }

    const [station, atStation, inTransit, delivered, revenue] =
      await Promise.all([
        prisma.station.findUnique({ where: { id: stationId } }),
        (prisma as any).parcel.count({
          where: { fromAddress: stationId, status: "RECEIVED" },
        }),
        (prisma as any).parcel.count({
          where: { fromAddress: stationId, status: "IN_TRANSIT" },
        }),
        (prisma as any).parcel.count({
          where: { fromAddress: stationId, status: "DELIVERED" },
        }),
        (prisma as any).payment.aggregate({
          where: { parcel: { fromAddress: stationId }, status: "SUCCESS" },
          _sum: { amount: true },
        }),
      ]);

    return sendSuccess(res, {
      stationName: station?.name || "LOGISTICS HUB",
      totalHandled: atStation + inTransit + delivered,
      pendingRelease: atStation,
      revenueGenerated: revenue._sum?.amount || 0,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/revenue", async (req: Request, res: Response) => {
  try {
    const where: any = {};
    if (req.user?.role !== "SUPER_ADMIN" && req.user?.organizationId) {
      where.organizationId = req.user.organizationId;
    }
    where.status = "SUCCESS";

    const payments = await prisma.payment.findMany({
      where,
      orderBy: { createdAt: "asc" },
    });

    const groups: { [key: string]: number } = {};
    payments.forEach((p) => {
      const date = new Date(p.createdAt);
      const period = date.toLocaleString("en-US", {
        month: "long",
        year: "numeric",
      });
      groups[period] = (groups[period] || 0) + p.amount;
    });

    const chartData = Object.entries(groups).map(([name, total]) => ({
      name,
      total,
    }));

    // If no data exists, return a dummy placeholder for chart rendering
    if (chartData.length === 0) {
      const currentPeriod = new Date().toLocaleString("en-US", {
        month: "long",
        year: "numeric",
      });
      chartData.push({ name: currentPeriod, total: 0 });
    }

    return sendSuccess(res, { chartData });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/operator/reports/history", async (req: Request, res: Response) => {
  try {
    return sendSuccess(res, []);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/operator/reports/generate", async (req: Request, res: Response) => {
  try {
    return sendSuccess(res, { success: true });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
