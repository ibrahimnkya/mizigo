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
    where.organizationId = req.user.organizationId;
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
    const [rawParcels, total, pending, inTransit, delivered] = await Promise.all([
      (prisma as any).parcel.findMany({
        where,
        take: 100,
        orderBy: { createdAt: "desc" },
        include: {
          origin: { select: { name: true, code: true } },
          destination: { select: { name: true, code: true } },
          user: { select: { name: true, phone: true } },
          payment: { select: { status: true, amount: true, paymentMethod: true } },
        },
      }),
      (prisma as any).parcel.count({ where }),
      (prisma as any).parcel.count({ where: { ...where, status: "PENDING" } }),
      (prisma as any).parcel.count({ where: { ...where, status: "IN_TRANSIT" } }),
      (prisma as any).parcel.count({ where: { ...where, status: "DELIVERED" } }),
    ]);

    // Normalize field names for the frontend
    const parcel = rawParcels.map((p: any) => ({
      ...p,
      trackingId: p.trackingNumber,
      senderName: p.user?.name || "Unknown",
      senderPhone: p.user?.phone || "",
      fromStation: p.origin?.name || p.fromAddress || "",
      toStation: p.destination?.name || p.toAddress || "",
      totalPrice: p.amount || p.payment?.amount || 0,
      paymentStatus: p.payment?.status || "UNPAID",
    }));

    const totalRevenue = rawParcels.reduce((sum: number, p: any) =>
      p.payment?.status === "SUCCESS" ? sum + (p.payment.amount || 0) : sum, 0);

    return sendSuccess(res, {
      parcel,
      stats: {
        totalItems: total,
        totalWeight: rawParcels.reduce((s: number, p: any) => s + (p.weight || 0), 0),
        totalRevenue,
        pendingCount: pending,
        inTransitCount: inTransit,
        deliveredCount: delivered,
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
    // Show all active staff — don't filter by role.name since names vary per org.
    // For SUPER_ADMIN show everyone; for others scope to their org.
    const where: any = {
      isActive: true,
      deletedAt: null,
    };
    if (req.user?.role !== "SUPER_ADMIN" && req.user?.organizationId) {
      where.organizationId = req.user.organizationId;
    }

    const operators = await prisma.user.findMany({
      where,
      orderBy: { createdAt: "desc" },
      include: {
        _count: {
          select: { parcelRequests: true },
        },
        station: { select: { name: true } },
        role: { select: { name: true } },
      },
    });

    const operatorList = operators.map((o) => ({
      id: o.id,
      name: o.name,
      email: o.email,
      phone: o.phone,
      createdAt: o.createdAt,
      stationName: (o as any).station?.name,
      roleName: (o as any).role?.name,
      parcelCount: (o._count as any).parcelRequests || 0,
      avgTime: "12m",
      isActive: o.isActive,
    }));

    // Sort by parcel count to determine top performer
    const sorted = [...operatorList].sort((a, b) => b.parcelCount - a.parcelCount);

    return sendSuccess(res, {
      operators: operatorList,
      summary: {
        totalOperators: operatorList.length,
        avgProcessingTime: "12m",
        totalOperations: operatorList.reduce((acc, curr) => acc + curr.parcelCount, 0),
        topPerformer: sorted[0]?.name || "N/A",
      },
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/admin/overview", async (req: Request, res: Response) => {
  try {
    const isSuperAdmin = req.user?.role === "SUPER_ADMIN";
    const orgId = req.user?.organizationId;

    // Build scoped where clauses per entity (payment.organizationId is often null —
    // fall back to filtering via parcel.organizationId relation instead).
    const stationWhere = isSuperAdmin ? {} : { organizationId: orgId || "" };
    const userWhere = isSuperAdmin ? {} : { organizationId: orgId || "" };
    const parcelWhere = isSuperAdmin ? {} : { organizationId: orgId || "" };
    const paymentWhere: any = { status: "SUCCESS" };
    if (!isSuperAdmin && orgId) {
      paymentWhere.OR = [
        { organizationId: orgId },
        { parcel: { organizationId: orgId } },
      ];
    }

    const [organizations, stations, users, parcel, revenue] = await Promise.all([
      prisma.organization.count({
        where: isSuperAdmin ? {} : { id: orgId || "" },
      }),
      prisma.station.count({ where: stationWhere }),
      prisma.user.count({ where: { ...userWhere, isActive: true, deletedAt: null } }),
      (prisma as any).parcel.count({ where: parcelWhere }),
      (prisma as any).payment.aggregate({
        where: paymentWhere,
        _sum: { amount: true },
      }),
    ]);

    return sendSuccess(res, {
      totalRevenue: revenue._sum?.amount || 0,
      totalOrganizations: organizations,
      totalStations: stations,
      totalParcel: parcel,
      totalUsers: users,
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
    // payment.organizationId is often null — filter via parcel.organizationId instead.
    const where: any = { status: "SUCCESS" };
    if (req.user?.role !== "SUPER_ADMIN" && req.user?.organizationId) {
      where.OR = [
        { organizationId: req.user.organizationId },
        { parcel: { organizationId: req.user.organizationId } },
      ];
    }

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
