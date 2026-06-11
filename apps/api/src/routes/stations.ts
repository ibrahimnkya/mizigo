import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { logAudit } from "../lib/audit";
import { fetchSgrStations } from "../lib/sgr-client";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

router.post(
  "/",
  requirePermission("stations:create"),
  async (req: Request, res: Response) => {
    try {
      const { name, code, location, organizationId } = req.body;
      if (!name || !code) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "Station name and code are required",
          400,
        );
      }

      const targetOrganizationId =
        req.user?.role === "SUPER_ADMIN"
          ? organizationId
          : req.user?.organizationId;

      if (!targetOrganizationId) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "organizationId is required",
          400,
        );
      }

      const station = await prisma.station.create({
        data: {
          name,
          code,
          location: location || null,
          organizationId: targetOrganizationId,
        },
      });

      await logAudit({
        userId: req.user?.id,
        action: "CREATE",
        resource: "station",
        details: {
          stationId: station.id,
          organizationId: targetOrganizationId,
        },
      });

      return sendSuccess(res, station, 201);
    } catch (error: any) {
      if (error.code === "P2002") {
        return sendError(
          res,
          "CONFLICT",
          "Station name/code already exists",
          409,
        );
      }
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.get("/", async (req: Request, res: Response) => {
  try {
    const includeInactive = req.query.includeInactive === "true";

    // 1) Sync from external SGR API
    try {
      const sgrStations = await fetchSgrStations();

      let trcOrg = await prisma.organization.findFirst({
        where: { name: "Tanzania Railways Corporation" },
      });

      if (!trcOrg) {
        trcOrg = await prisma.organization.create({
          data: {
            name: "Tanzania Railways Corporation",
            description: "National rail logistics provider",
          },
        });
      }

      for (const s of sgrStations) {
        // Find if code is already taken by a different ID
        const existingByCode = await prisma.station.findUnique({
          where: { code: s.code },
        });

        if (existingByCode && existingByCode.id !== s.id) {
          // Delete conflicting record to allow upserting with correct ID
          await prisma.station.delete({
            where: { id: existingByCode.id },
          });
        }

        // Find if name is already taken by a different ID
        const existingByName = await prisma.station.findUnique({
          where: { name: s.name },
        });

        if (existingByName && existingByName.id !== s.id) {
          // Delete conflicting record to allow upserting with correct ID
          await prisma.station.delete({
            where: { id: existingByName.id },
          });
        }

        await prisma.station.upsert({
          where: { id: s.id },
          update: {
            code: s.code,
            name: s.name,
            isActive: s.isActive !== false,
            organizationId: trcOrg.id,
          },
          create: {
            id: s.id,
            code: s.code,
            name: s.name,
            isActive: s.isActive !== false,
            organizationId: trcOrg.id,
          },
        });
      }
    } catch (sgrError: any) {
      console.error(
        "[Stations Sync] SGR sync failed, using local database:",
        sgrError.message,
      );
    }

    // 2) Load from local DB
    // SGR train stations are shared infrastructure — all authenticated users
    // need to see them regardless of their own organization. Super admins can
    // additionally request inactive stations via ?includeInactive=true.
    const where = includeInactive ? {} : { isActive: true };

    const stations = await prisma.station.findMany({
      where,
      orderBy: { name: "asc" },
    });

    return sendSuccess(res, stations);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/:id", async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const station = await prisma.station.findUnique({
      where: { id },
      include: { organization: true },
    });

    if (!station || station.deletedAt) {
      return sendError(res, "NOT_FOUND", "Station not found", 404);
    }

    if (
      req.user?.role !== "SUPER_ADMIN" &&
      req.user?.organizationId !== station.organizationId &&
      !station.isActive
    ) {
      return sendError(res, "FORBIDDEN", "Cannot view this station", 403);
    }

    const dispatchedCount = await prisma.parcel.count({
      where: { originId: id },
    });

    const receivedCount = await prisma.parcel.count({
      where: { destinationId: id },
    });

    const totalHandled = await prisma.parcel.count({
      where: {
        OR: [{ originId: id }, { destinationId: id }],
      },
    });

    const parcels = await prisma.parcel.findMany({
      where: {
        OR: [{ originId: id }, { destinationId: id }],
      },
      include: {
        origin: { select: { name: true, code: true } },
        destination: { select: { name: true, code: true } },
      },
      orderBy: { createdAt: "desc" },
      take: 50,
    });

    const totalStaff = await prisma.user.count({
      where: { stationId: id, deletedAt: null },
    });

    const activeStaff = await prisma.user.count({
      where: { stationId: id, isActive: true, deletedAt: null },
    });

    const staff = await prisma.user.findMany({
      where: { stationId: id, deletedAt: null },
      include: {
        role: {
          select: { name: true },
        },
      },
      orderBy: { name: "asc" },
    });

    return sendSuccess(res, {
      ...station,
      metrics: {
        dispatched: dispatchedCount,
        received: receivedCount,
        totalHandled,
        totalStaff,
        activeStaff,
      },
      parcels,
      staff,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.put(
  "/:id",
  requirePermission("stations:update"),
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      const existing = await prisma.station.findUnique({ where: { id } });
      if (!existing) {
        return sendError(res, "NOT_FOUND", "Station not found", 404);
      }
      if (
        req.user?.role !== "SUPER_ADMIN" &&
        req.user?.organizationId !== existing.organizationId
      ) {
        return sendError(res, "FORBIDDEN", "Cannot update this station", 403);
      }

      const station = await prisma.station.update({
        where: { id },
        data: {
          name: req.body.name,
          code: req.body.code,
          location: req.body.location,
          isActive: req.body.isActive,
        },
      });

      await logAudit({
        userId: req.user?.id,
        action: "UPDATE",
        resource: "station",
        details: { stationId: id },
      });

      return sendSuccess(res, station);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.delete(
  "/:id",
  requirePermission("stations:delete"),
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      const existing = await prisma.station.findUnique({ where: { id } });
      if (!existing) {
        return sendError(res, "NOT_FOUND", "Station not found", 404);
      }
      if (
        req.user?.role !== "SUPER_ADMIN" &&
        req.user?.organizationId !== existing.organizationId
      ) {
        return sendError(res, "FORBIDDEN", "Cannot delete this station", 403);
      }

      const station = await prisma.station.update({
        where: { id },
        data: { isActive: false },
      });

      await logAudit({
        userId: req.user?.id,
        action: "SOFT_DELETE",
        resource: "station",
        details: { stationId: id },
      });

      return sendSuccess(res, station);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

export default router;
