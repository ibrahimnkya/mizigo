import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { logAudit } from "../lib/audit";

const router: Router = Router();

// Apply auth and tenant scoping to all fleet endpoints
router.use(authenticate, requireTenantContext);

/**
 * GET /api/v1/fleet
 * Retrieves all active/maintenance vehicles in the organization (or all for SUPER_ADMIN).
 */
router.get("/", async (req: Request, res: Response) => {
  try {
    const where: any = {
      status: { not: "DELETED" },
    };

    if (req.user?.role !== "SUPER_ADMIN") {
      where.organizationId = req.user?.organizationId;
    }

    const fleet = await prisma.vehicle.findMany({
      where,
      include: {
        organization: {
          select: {
            name: true,
          },
        },
      },
      orderBy: { plateNumber: "asc" },
    });

    return sendSuccess(res, fleet);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

/**
 * POST /api/v1/fleet
 * Registers a new rail vehicle (Wagon/Locomotive).
 */
router.post(
  "/",
  requirePermission("fleet:create"),
  async (req: Request, res: Response) => {
    try {
      const { plateNumber, type, class: vehicleClass, carrier, organizationId } = req.body;

      if (!plateNumber || !type) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "plateNumber and type are required",
          400,
        );
      }

      const targetOrganizationId =
        req.user?.role === "SUPER_ADMIN"
          ? organizationId || null
          : req.user?.organizationId;

      if (req.user?.role !== "SUPER_ADMIN" && !targetOrganizationId) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "Organization context is required for registration",
          400,
        );
      }

      const vehicle = await prisma.vehicle.create({
        data: {
          plateNumber,
          type,
          class: vehicleClass || null,
          carrier: carrier || null,
          organizationId: targetOrganizationId,
          status: "ACTIVE",
        },
      });

      await logAudit({
        userId: req.user?.id,
        action: "CREATE",
        resource: "vehicle",
        details: {
          vehicleId: vehicle.id,
          plateNumber: vehicle.plateNumber,
          organizationId: targetOrganizationId,
        },
      });

      return sendSuccess(res, vehicle, 201);
    } catch (error: any) {
      if (error.code === "P2002") {
        return sendError(
          res,
          "CONFLICT",
          "Vehicle serial/plate number already registered",
          409,
        );
      }
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

/**
 * PATCH /api/v1/fleet
 * Updates an existing vehicle's configuration.
 */
router.patch(
  "/",
  requirePermission("fleet:update"),
  async (req: Request, res: Response) => {
    try {
      const { id, plateNumber, type, class: vehicleClass, carrier, status, organizationId } = req.body;

      if (!id) {
        return sendError(res, "VALIDATION_ERROR", "Vehicle ID is required", 400);
      }

      const existing = await prisma.vehicle.findUnique({ where: { id } });
      if (!existing || existing.status === "DELETED") {
        return sendError(res, "NOT_FOUND", "Vehicle not found", 404);
      }

      if (
        req.user?.role !== "SUPER_ADMIN" &&
        existing.organizationId !== req.user?.organizationId
      ) {
        return sendError(res, "FORBIDDEN", "Cannot update vehicle outside organization", 403);
      }

      const updated = await prisma.vehicle.update({
        where: { id },
        data: {
          plateNumber: plateNumber !== undefined ? plateNumber : existing.plateNumber,
          type: type !== undefined ? type : existing.type,
          class: vehicleClass !== undefined ? vehicleClass : existing.class,
          carrier: carrier !== undefined ? carrier : existing.carrier,
          status: status !== undefined ? status : existing.status,
          organizationId: req.user?.role === "SUPER_ADMIN" && organizationId !== undefined
            ? organizationId
            : existing.organizationId,
        },
      });

      await logAudit({
        userId: req.user?.id,
        action: "UPDATE",
        resource: "vehicle",
        details: { vehicleId: id },
      });

      return sendSuccess(res, updated);
    } catch (error: any) {
      if (error.code === "P2002") {
        return sendError(
          res,
          "CONFLICT",
          "Vehicle serial/plate number already registered",
          409,
        );
      }
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

/**
 * DELETE /api/v1/fleet
 * Soft-deletes a vehicle by setting status to DELETED.
 */
router.delete(
  "/",
  requirePermission("fleet:delete"),
  async (req: Request, res: Response) => {
    try {
      const id = req.query.id as string;
      if (!id) {
        return sendError(res, "VALIDATION_ERROR", "id parameter is required", 400);
      }

      const existing = await prisma.vehicle.findUnique({ where: { id } });
      if (!existing || existing.status === "DELETED") {
        return sendError(res, "NOT_FOUND", "Vehicle not found", 404);
      }

      if (
        req.user?.role !== "SUPER_ADMIN" &&
        existing.organizationId !== req.user?.organizationId
      ) {
        return sendError(res, "FORBIDDEN", "Cannot delete vehicle outside organization", 403);
      }

      // Perform a soft delete by marking it DELETED
      const deleted = await prisma.vehicle.update({
        where: { id },
        data: { status: "DELETED" },
      });

      await logAudit({
        userId: req.user?.id,
        action: "SOFT_DELETE",
        resource: "vehicle",
        details: { vehicleId: id },
      });

      return sendSuccess(res, deleted);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

export default router;
