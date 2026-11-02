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
  const { status, dateFrom, dateTo, operatorId, stationId, direction } = req.query;
  const where: any = {};

  // Station filter: parcels sent from it, going to it, or either (default).
  if (stationId) {
    const id = String(stationId);
    if (direction === "from") where.originId = id;
    else if (direction === "to") where.destinationId = id;
    else where.OR = [{ originId: id }, { destinationId: id }];
  }

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
    const limit = Math.min(Math.max(Number(req.query.limit) || 500, 1), 2000);
    const where = buildParcelWhere(req);
    const [rawParcels, total, byStatus, totals] = await Promise.all([
      (prisma as any).parcel.findMany({
        where,
        take: limit,
        orderBy: { createdAt: "desc" },
        include: {
          origin: { select: { id: true, name: true, code: true } },
          destination: { select: { id: true, name: true, code: true } },
          user: { select: { name: true, phone: true } },
          payment: { select: { status: true, amount: true, paymentMethod: true } },
        },
      }),
      (prisma as any).parcel.count({ where }),
      (prisma as any).parcel.groupBy({ by: ["status"], where, _count: true }),
      (prisma as any).parcel.aggregate({ where, _sum: { amount: true, weight: true } }),
    ]);

    const meta = (p: any) =>
      p.additionalServices && typeof p.additionalServices === "object" && !Array.isArray(p.additionalServices)
        ? p.additionalServices
        : {};
    const isPaid = (p: any) => p.payment?.status === "SUCCESS" || meta(p).paymentStatus === "PAID";

    // Normalize field names for the frontend. The sender is the customer typed
    // in at the counter (meta), not the staff user who received the parcel.
    const parcel = rawParcels.map((p: any) => ({
      ...p,
      trackingId: p.trackingNumber,
      // The customer entered at the counter — never the staff account.
      senderName: meta(p).senderName || null,
      senderPhone: meta(p).senderPhone || null,
      receivedBy: p.user?.name || null,
      fromStation: p.origin?.name || p.fromAddress || "",
      toStation: p.destination?.name || p.toAddress || "",
      totalPrice: p.amount || p.payment?.amount || 0,
      paymentStatus: isPaid(p) ? "PAID" : p.payment?.status || "UNPAID",
    }));

    const statusCounts: Record<string, number> = {};
    for (const row of byStatus as { status: string; _count: number }[]) statusCounts[row.status] = row._count;

    return sendSuccess(res, {
      parcel,
      stats: {
        totalItems: total,
        shown: parcel.length,
        totalWeight: totals._sum?.weight || 0,
        totalValue: totals._sum?.amount || 0,
        totalRevenue: parcel.filter(isPaid).reduce((sum: number, p: any) => sum + (p.totalPrice || 0), 0),
        statusCounts,
        pendingCount: (statusCounts.PENDING || 0) + (statusCounts.RECEIVED || 0),
        inTransitCount: (statusCounts.DISPATCHED || 0) + (statusCounts.IN_TRANSIT || 0),
        deliveredCount: statusCounts.DELIVERED || 0,
      },
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// ── Shared helpers for the report endpoints ────────────────────────────────────

/** ?dateFrom/?dateTo (ISO) → { gte, lte } or undefined. */
const dateRange = (req: Request) => {
  const from = req.query.dateFrom ? new Date(String(req.query.dateFrom)) : null;
  const to = req.query.dateTo ? new Date(String(req.query.dateTo)) : null;
  const r: any = {};
  if (from && !isNaN(from.getTime())) r.gte = from;
  if (to && !isNaN(to.getTime())) r.lte = to;
  return Object.keys(r).length ? r : undefined;
};

/** Parcels the caller may see (organization scope). */
const orgScope = (req: Request): any =>
  req.user?.role === "SUPER_ADMIN" ? {} : { organizationId: req.user?.organizationId ?? "" };

const parcelMeta = (p: any) =>
  p?.additionalServices && typeof p.additionalServices === "object" && !Array.isArray(p.additionalServices)
    ? p.additionalServices
    : {};
const parcelIsPaid = (p: any) => p?.payment?.status === "SUCCESS" || parcelMeta(p).paymentStatus === "PAID";

/**
 * GET /reports/stations?dateFrom&dateTo
 * Per station: parcels sent from it, parcels going to it, delivered there,
 * value sent and paid revenue — counted by station ID.
 */
router.get("/stations", async (req: Request, res: Response) => {
  try {
    const scope = orgScope(req);
    const created = dateRange(req);
    const parcelWhere: any = { ...scope, ...(created ? { createdAt: created } : {}) };

    const [stations, parcels] = await Promise.all([
      prisma.station.findMany({
        where: { ...scope, deletedAt: null },
        orderBy: { name: "asc" },
        select: { id: true, name: true, code: true, isActive: true, organization: { select: { name: true } } },
      }),
      (prisma as any).parcel.findMany({
        where: parcelWhere,
        select: {
          originId: true,
          destinationId: true,
          status: true,
          amount: true,
          additionalServices: true,
          payment: { select: { status: true } },
        },
      }),
    ]);

    const rows = new Map<string, any>();
    for (const st of stations as any[]) {
      rows.set(st.id, {
        id: st.id,
        name: st.name,
        code: st.code,
        organizationName: st.organization?.name ?? null,
        isActive: st.isActive,
        sent: 0,
        arriving: 0,
        delivered: 0,
        waiting: 0,
        value: 0,
        revenue: 0,
      });
    }
    for (const p of parcels as any[]) {
      const from = p.originId && rows.get(p.originId);
      const to = p.destinationId && rows.get(p.destinationId);
      if (from) {
        from.sent += 1;
        from.value += p.amount || 0;
        if (parcelIsPaid(p)) from.revenue += p.amount || 0;
      }
      if (to) {
        to.arriving += 1;
        if (p.status === "DELIVERED") to.delivered += 1;
        if (p.status === "OFFLOADED" || p.status === "AT_STATION") to.waiting += 1;
      }
    }
    const list = [...rows.values()].sort((a, b) => b.sent + b.arriving - (a.sent + a.arriving));
    const top = list.find((r) => r.sent + r.arriving > 0);

    return sendSuccess(res, {
      stations: list,
      summary: {
        totalStations: list.length,
        activeStations: list.filter((r) => r.sent + r.arriving > 0).length,
        totalParcels: parcels.length,
        totalRevenue: list.reduce((n, r) => n + r.revenue, 0),
        totalValue: list.reduce((n, r) => n + r.value, 0),
        topStation: top ? { id: top.id, name: top.name, parcels: top.sent + top.arriving } : null,
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

/**
 * GET /reports/operators?dateFrom&dateTo&stationId
 * Work done by each staff member in the period: parcels received, dispatched,
 * offloaded and delivered (from the parcel's staff fields).
 */
router.get("/operators", async (req: Request, res: Response) => {
  try {
    const scope = orgScope(req);
    const range = dateRange(req);
    const userWhere: any = { ...scope, isActive: true, deletedAt: null };
    if (req.query.stationId) userWhere.stationId = String(req.query.stationId);

    const users = await prisma.user.findMany({
      where: userWhere,
      orderBy: { name: "asc" },
      select: {
        id: true,
        name: true,
        email: true,
        phone: true,
        station: { select: { name: true } },
        role: { select: { name: true } },
      },
    });
    const ids = users.map((u) => u.id);

    const count = async (field: "userId" | "dispatcherId" | "offloaderId" | "delivererId", dateField: "createdAt" | "updatedAt") => {
      const rows = await (prisma as any).parcel.groupBy({
        by: [field],
        where: { ...scope, [field]: { in: ids }, ...(range ? { [dateField]: range } : {}) },
        _count: true,
      });
      return new Map<string, number>(rows.map((r: any) => [r[field], r._count]));
    };
    const [received, dispatched, offloaded, delivered] = await Promise.all([
      count("userId", "createdAt"),
      count("dispatcherId", "updatedAt"),
      count("offloaderId", "updatedAt"),
      count("delivererId", "updatedAt"),
    ]);

    const operators = users
      .map((u: any) => {
        const r = received.get(u.id) ?? 0;
        const d = dispatched.get(u.id) ?? 0;
        const o = offloaded.get(u.id) ?? 0;
        const v = delivered.get(u.id) ?? 0;
        return {
          id: u.id,
          name: u.name,
          email: u.email,
          phone: u.phone,
          stationName: u.station?.name ?? null,
          roleName: u.role?.name ?? null,
          received: r,
          dispatched: d,
          offloaded: o,
          delivered: v,
          total: r + d + o + v,
        };
      })
      .sort((a, b) => b.total - a.total);

    return sendSuccess(res, {
      operators,
      summary: {
        totalStaff: operators.length,
        activeStaff: operators.filter((o) => o.total > 0).length,
        totalActions: operators.reduce((n, o) => n + o.total, 0),
        topPerformer: operators[0]?.total ? { name: operators[0].name, total: operators[0].total } : null,
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

    // Optional period (?from=ISO&to=ISO). Parcels and revenue are counted in the
    // period; the previous period of equal length is returned for comparison.
    const from = req.query.from ? new Date(String(req.query.from)) : null;
    const to = req.query.to ? new Date(String(req.query.to)) : null;
    const hasPeriod = !!from && !isNaN(from.getTime());
    const end = to && !isNaN(to.getTime()) ? to : new Date();
    const range = (start: Date | null, stop: Date) => (start ? { createdAt: { gte: start, lte: stop } } : {});
    const prevFrom = hasPeriod ? new Date(from!.getTime() - (end.getTime() - from!.getTime())) : null;

    const periodParcels = { ...parcelWhere, ...range(hasPeriod ? from : null, end) };
    const periodPayments = { ...paymentWhere, ...range(hasPeriod ? from : null, end) };

    const [organizations, stations, users, parcel, revenue, byStatus, prevParcels, prevRevenue] = await Promise.all([
      prisma.organization.count({
        where: isSuperAdmin ? {} : { id: orgId || "" },
      }),
      prisma.station.count({ where: stationWhere }),
      prisma.user.count({ where: { ...userWhere, isActive: true, deletedAt: null } }),
      (prisma as any).parcel.count({ where: periodParcels }),
      (prisma as any).payment.aggregate({ where: periodPayments, _sum: { amount: true } }),
      (prisma as any).parcel.groupBy({ by: ["status"], where: periodParcels, _count: true }),
      hasPeriod
        ? (prisma as any).parcel.count({ where: { ...parcelWhere, createdAt: { gte: prevFrom, lt: from } } })
        : Promise.resolve(null),
      hasPeriod
        ? (prisma as any).payment.aggregate({
            where: { ...paymentWhere, createdAt: { gte: prevFrom, lt: from } },
            _sum: { amount: true },
          })
        : Promise.resolve(null),
    ]);

    const statusCounts: Record<string, number> = {};
    for (const row of byStatus as { status: string; _count: number }[]) statusCounts[row.status] = row._count;

    return sendSuccess(res, {
      totalRevenue: revenue._sum?.amount || 0,
      totalOrganizations: organizations,
      totalStations: stations,
      totalParcel: parcel,
      totalUsers: users,
      statusCounts,
      period: hasPeriod ? { from: from!.toISOString(), to: end.toISOString() } : null,
      previous: hasPeriod
        ? { totalParcel: prevParcels ?? 0, totalRevenue: (prevRevenue as any)?._sum?.amount || 0 }
        : null,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

/**
 * GET /reports/parcel-activity?limit=8
 * Latest parcel journey events (received, dispatched, delivered, …) for the
 * caller's organization — what the dashboard's "Recent activity" shows.
 */
router.get("/parcel-activity", async (req: Request, res: Response) => {
  try {
    const limit = Math.min(Math.max(Number(req.query.limit) || 8, 1), 50);
    const where: any =
      req.user?.role === "SUPER_ADMIN" ? {} : { parcel: { organizationId: req.user?.organizationId || "" } };
    const events = await (prisma as any).parcelTracking.findMany({
      where,
      orderBy: { timestamp: "desc" },
      take: limit,
      include: {
        parcel: {
          select: {
            id: true,
            trackingNumber: true,
            origin: { select: { name: true } },
            destination: { select: { name: true } },
          },
        },
      },
    });
    return sendSuccess(
      res,
      events.map((e: any) => ({
        id: e.id,
        status: e.status,
        description: e.description,
        location: e.location,
        timestamp: e.timestamp,
        parcel: {
          id: e.parcel?.id,
          trackingNumber: e.parcel?.trackingNumber,
          from: e.parcel?.origin?.name ?? null,
          to: e.parcel?.destination?.name ?? null,
        },
      })),
    );
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

/**
 * GET /reports/revenue?dateFrom&dateTo&stationId&groupBy=day|week|month
 * Paid parcel revenue (counter cash marked paid + successful online payments),
 * grouped by period, with parcel counts. stationId filters by origin station.
 */
router.get("/revenue", async (req: Request, res: Response) => {
  try {
    const created = dateRange(req);
    const where: any = { ...orgScope(req), ...(created ? { createdAt: created } : {}) };
    if (req.query.stationId) where.originId = String(req.query.stationId);
    const groupBy = ["day", "week", "month"].includes(String(req.query.groupBy)) ? String(req.query.groupBy) : "day";

    const parcels = await (prisma as any).parcel.findMany({
      where,
      orderBy: { createdAt: "asc" },
      select: {
        createdAt: true,
        amount: true,
        additionalServices: true,
        payment: { select: { status: true } },
      },
    });

    const keyOf = (d: Date) => {
      const x = new Date(d);
      if (groupBy === "month") return `${x.getFullYear()}-${String(x.getMonth() + 1).padStart(2, "0")}-01`;
      if (groupBy === "week") x.setDate(x.getDate() - ((x.getDay() + 6) % 7));
      return x.toISOString().slice(0, 10);
    };

    const buckets = new Map<string, { date: string; revenue: number; parcels: number; paid: number; unpaid: number }>();
    let revenue = 0;
    let unpaid = 0;
    for (const p of parcels as any[]) {
      const key = keyOf(p.createdAt);
      const b = buckets.get(key) ?? { date: key, revenue: 0, parcels: 0, paid: 0, unpaid: 0 };
      b.parcels += 1;
      if (parcelIsPaid(p)) {
        b.revenue += p.amount || 0;
        b.paid += 1;
        revenue += p.amount || 0;
      } else {
        b.unpaid += 1;
        unpaid += p.amount || 0;
      }
      buckets.set(key, b);
    }
    const series = [...buckets.values()];
    const best = series.reduce<any>((m, b) => (!m || b.revenue > m.revenue ? b : m), null);
    const paidCount = series.reduce((n, b) => n + b.paid, 0);

    return sendSuccess(res, {
      groupBy,
      series,
      summary: {
        revenue,
        outstanding: unpaid,
        parcels: parcels.length,
        paidParcels: paidCount,
        average: paidCount ? Math.round(revenue / paidCount) : 0,
        bestPeriod: best && best.revenue > 0 ? { date: best.date, revenue: best.revenue } : null,
      },
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

/**
 * GET /reports/turnaround?dateFrom&dateTo&stationId
 * Time from drop-off (created) to delivery, for parcels delivered in the period.
 * Uses the DELIVERED tracking event when present, otherwise the last update.
 */
router.get("/turnaround", async (req: Request, res: Response) => {
  try {
    const delivered = dateRange(req);
    const where: any = { ...orgScope(req), status: "DELIVERED", ...(delivered ? { updatedAt: delivered } : {}) };
    if (req.query.stationId) {
      const id = String(req.query.stationId);
      where.OR = [{ originId: id }, { destinationId: id }];
    }
    const parcels = await (prisma as any).parcel.findMany({
      where,
      select: {
        id: true,
        trackingNumber: true,
        createdAt: true,
        updatedAt: true,
        origin: { select: { name: true } },
        destination: { select: { name: true } },
        tracking: { where: { status: "DELIVERED" }, select: { timestamp: true }, take: 1 },
      },
    });

    const hours = (p: any) => {
      const end = p.tracking?.[0]?.timestamp ?? p.updatedAt;
      return Math.max(0, (new Date(end).getTime() - new Date(p.createdAt).getTime()) / 3_600_000);
    };
    const durations = (parcels as any[]).map(hours).sort((a, b) => a - b);
    const avg = durations.length ? durations.reduce((n, h) => n + h, 0) / durations.length : 0;
    const median = durations.length ? durations[Math.floor(durations.length / 2)] : 0;

    const routes = new Map<string, { route: string; from: string; to: string; parcels: number; total: number; fastest: number; slowest: number }>();
    for (const p of parcels as any[]) {
      const from = p.origin?.name ?? "—";
      const to = p.destination?.name ?? "—";
      const key = `${from}→${to}`;
      const h = hours(p);
      const r = routes.get(key) ?? { route: key, from, to, parcels: 0, total: 0, fastest: Infinity, slowest: 0 };
      r.parcels += 1;
      r.total += h;
      r.fastest = Math.min(r.fastest, h);
      r.slowest = Math.max(r.slowest, h);
      routes.set(key, r);
    }

    return sendSuccess(res, {
      summary: {
        delivered: durations.length,
        averageHours: Math.round(avg * 10) / 10,
        medianHours: Math.round(median * 10) / 10,
        fastestHours: durations.length ? Math.round(durations[0] * 10) / 10 : 0,
        within48h: durations.length ? Math.round((durations.filter((h) => h <= 48).length / durations.length) * 100) : 0,
      },
      routes: [...routes.values()]
        .map((r) => ({
          route: r.route,
          from: r.from,
          to: r.to,
          parcels: r.parcels,
          averageHours: Math.round((r.total / r.parcels) * 10) / 10,
          fastestHours: Math.round(r.fastest * 10) / 10,
          slowestHours: Math.round(r.slowest * 10) / 10,
        }))
        .sort((a, b) => b.parcels - a.parcels),
    });
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
