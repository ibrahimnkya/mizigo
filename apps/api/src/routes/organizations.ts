import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { logAudit } from "../lib/audit";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

router.post("/", requirePermission("organizations:create"), async (req: Request, res: Response) => {
  try {
    const { name, description, commissionRate, commissionNotes } = req.body;
    if (!name) {
      return sendError(res, "VALIDATION_ERROR", "Organization name is required", 400);
    }
    if (commissionRate !== undefined && (Number(commissionRate) < 0 || Number(commissionRate) > 1)) {
      return sendError(res, "VALIDATION_ERROR", "commissionRate must be between 0 and 1", 400);
    }

    const organization = await prisma.organization.create({
      data: {
        name,
        description: description || null,
        commissionRate: commissionRate === undefined ? null : Number(commissionRate),
        commissionNotes: commissionNotes || null,
      },
    });

    await logAudit({
      userId: req.user?.id,
      action: "CREATE",
      resource: "organization",
      details: { organizationId: organization.id },
    });

    return sendSuccess(res, organization, 201);
  } catch (error: any) {
    if (error.code === "P2002") {
      return sendError(res, "CONFLICT", "Organization name already exists", 409);
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
          id: req.user?.organizationId ?? "",
          ...(includeInactive ? {} : { isActive: true }),
        };

    const organizations = await prisma.organization.findMany({
      where,
      orderBy: { createdAt: "desc" },
    });

    return sendSuccess(res, organizations);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/:id", async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    if (req.user?.role !== "SUPER_ADMIN" && req.user?.organizationId !== id) {
      return sendError(res, "FORBIDDEN", "Cannot access this organization", 403);
    }

    const organization = await prisma.organization.findUnique({ where: { id } });
    if (!organization) {
      return sendError(res, "NOT_FOUND", "Organization not found", 404);
    }

    return sendSuccess(res, organization);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.put("/:id", requirePermission("organizations:update"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    if (req.user?.role !== "SUPER_ADMIN" && req.user?.organizationId !== id) {
      return sendError(res, "FORBIDDEN", "Cannot update this organization", 403);
    }

    if (req.body.commissionRate !== undefined && (Number(req.body.commissionRate) < 0 || Number(req.body.commissionRate) > 1)) {
      return sendError(res, "VALIDATION_ERROR", "commissionRate must be between 0 and 1", 400);
    }

    const organization = await prisma.organization.update({
      where: { id },
      data: {
        name: req.body.name,
        description: req.body.description,
        commissionRate: req.body.commissionRate === undefined ? undefined : Number(req.body.commissionRate),
        commissionNotes: req.body.commissionNotes,
        isActive: req.body.isActive,
      },
    });

    await logAudit({
      userId: req.user?.id,
      action: "UPDATE",
      resource: "organization",
      details: { organizationId: id },
    });

    return sendSuccess(res, organization);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.delete("/:id", requirePermission("organizations:delete"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    if (req.user?.role !== "SUPER_ADMIN" && req.user?.organizationId !== id) {
      return sendError(res, "FORBIDDEN", "Cannot delete this organization", 403);
    }

    const organization = await prisma.organization.update({
      where: { id },
      data: { isActive: false },
    });

    await logAudit({
      userId: req.user?.id,
      action: "SOFT_DELETE",
      resource: "organization",
      details: { organizationId: id },
    });

    return sendSuccess(res, organization);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
