import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { logAudit } from "../lib/audit";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

router.post("/", requirePermission("stations:create"), async (req: Request, res: Response) => {
  try {
    const { name, code, location, organizationId } = req.body;
    if (!name || !code) {
      return sendError(res, "VALIDATION_ERROR", "Station name and code are required", 400);
    }

    const targetOrganizationId =
      req.user?.role === "SUPER_ADMIN" ? organizationId : req.user?.organizationId;

    if (!targetOrganizationId) {
      return sendError(res, "VALIDATION_ERROR", "organizationId is required", 400);
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
      details: { stationId: station.id, organizationId: targetOrganizationId },
    });

    return sendSuccess(res, station, 201);
  } catch (error: any) {
    if (error.code === "P2002") {
      return sendError(res, "CONFLICT", "Station name/code already exists", 409);
    }
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/", async (req: Request, res: Response) => {
  try {
    const includeInactive = req.query.includeInactive === "true";
    const where = req.user?.role === "SUPER_ADMIN"
      ? { ...(includeInactive ? {} : { isActive: true }) }
      : {
          organizationId: req.user?.organizationId ?? "",
          ...(includeInactive ? {} : { isActive: true }),
        };

    const stations = await prisma.station.findMany({
      where,
      orderBy: { createdAt: "desc" },
    });

    return sendSuccess(res, stations);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.put("/:id", requirePermission("stations:update"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const existing = await prisma.station.findUnique({ where: { id } });
    if (!existing) {
      return sendError(res, "NOT_FOUND", "Station not found", 404);
    }
    if (req.user?.role !== "SUPER_ADMIN" && req.user?.organizationId !== existing.organizationId) {
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
});

router.delete("/:id", requirePermission("stations:delete"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const existing = await prisma.station.findUnique({ where: { id } });
    if (!existing) {
      return sendError(res, "NOT_FOUND", "Station not found", 404);
    }
    if (req.user?.role !== "SUPER_ADMIN" && req.user?.organizationId !== existing.organizationId) {
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
});

router.post("/:id/assign-admin", requirePermission("stations:assign_admin"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { adminId } = req.body;
    if (!adminId) {
      return sendError(res, "VALIDATION_ERROR", "adminId is required", 400);
    }

    const station = await prisma.station.findUnique({ where: { id } });
    if (!station) {
      return sendError(res, "NOT_FOUND", "Station not found", 404);
    }

    const admin = await prisma.user.findUnique({ where: { id: String(adminId) }, include: { role: true } });
    if (!admin) {
      return sendError(res, "NOT_FOUND", "Admin user not found", 404);
    }
    if (req.user?.role !== "SUPER_ADMIN" && station.organizationId !== req.user?.organizationId) {
      return sendError(res, "FORBIDDEN", "Cannot assign admin to another organization station", 403);
    }
    if (admin.organizationId !== station.organizationId) {
      return sendError(res, "CONFLICT", "Admin and station must belong to same organization", 409);
    }

    const updatedUser = await prisma.user.update({
      where: { id: admin.id },
      data: { stationId: station.id },
      include: { role: true, organization: true, station: true },
    });

    await logAudit({
      userId: req.user?.id,
      action: "ASSIGN_ADMIN",
      resource: "station",
      details: { stationId: station.id, adminId: admin.id },
    });

    return sendSuccess(res, updatedUser);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
