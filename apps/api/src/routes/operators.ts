import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { hashPassword } from "../lib/security";
import { logAudit } from "../lib/audit";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

const getOperatorRoleId = async () => {
  const role = await prisma.role.findFirst({
    where: {
      OR: [{ name: "OPERATOR" }, { name: "STATION_OPERATOR" }],
    },
  });
  return role?.id;
};

router.post("/", requirePermission("operators:create"), async (req: Request, res: Response) => {
  try {
    const { name, email, phone, password, stationId, organizationId } = req.body;
    if (!name || !email || !password || !stationId) {
      return sendError(res, "VALIDATION_ERROR", "name, email, password, and stationId are required", 400);
    }

    const roleId = await getOperatorRoleId();
    if (!roleId) {
      return sendError(res, "NOT_FOUND", "OPERATOR role not found", 404);
    }

    const station = await prisma.station.findUnique({ where: { id: stationId } });
    if (!station) {
      return sendError(res, "NOT_FOUND", "Station not found", 404);
    }

    const targetOrganizationId =
      req.user?.role === "SUPER_ADMIN" ? (organizationId || station.organizationId) : req.user?.organizationId;

    if (req.user?.role !== "SUPER_ADMIN" && station.organizationId !== req.user?.organizationId) {
      return sendError(res, "FORBIDDEN", "Cannot create operator outside your organization", 403);
    }

    const user = await prisma.user.create({
      data: {
        name,
        email,
        phone: phone || null,
        passwordHash: hashPassword(password),
        roleId,
        organizationId: targetOrganizationId || null,
        stationId,
      },
      include: { role: true, organization: true, station: true },
    });

    await logAudit({
      userId: req.user?.id,
      action: "CREATE",
      resource: "operator",
      details: { targetUserId: user.id, stationId, organizationId: targetOrganizationId },
    });

    return sendSuccess(res, user, 201);
  } catch (error: any) {
    if (error.code === "P2002") {
      return sendError(res, "CONFLICT", "Email or phone already exists", 409);
    }
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/", async (req: Request, res: Response) => {
  try {
    const operatorRoleId = await getOperatorRoleId();
    if (!operatorRoleId) {
      return sendSuccess(res, []);
    }

    const where = req.user?.role === "SUPER_ADMIN"
      ? { roleId: operatorRoleId }
      : { roleId: operatorRoleId, organizationId: req.user?.organizationId ?? "" };

    const operators = await prisma.user.findMany({
      where,
      include: { role: true, organization: true, station: true },
      orderBy: { createdAt: "desc" },
    });

    return sendSuccess(res, operators);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.put("/:id", requirePermission("operators:update"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const existing = await prisma.user.findUnique({ where: { id } });
    if (!existing) {
      return sendError(res, "NOT_FOUND", "Operator not found", 404);
    }
    if (req.user?.role !== "SUPER_ADMIN" && existing.organizationId !== req.user?.organizationId) {
      return sendError(res, "FORBIDDEN", "Cannot update operator from another organization", 403);
    }

    const updated = await prisma.user.update({
      where: { id },
      data: {
        name: req.body.name,
        phone: req.body.phone,
        stationId: req.body.stationId,
        isActive: req.body.isActive,
      },
      include: { role: true, organization: true, station: true },
    });

    await logAudit({
      userId: req.user?.id,
      action: "UPDATE",
      resource: "operator",
      details: { targetUserId: id },
    });

    return sendSuccess(res, updated);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.delete("/:id", requirePermission("operators:delete"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const existing = await prisma.user.findUnique({ where: { id } });
    if (!existing) {
      return sendError(res, "NOT_FOUND", "Operator not found", 404);
    }
    if (req.user?.role !== "SUPER_ADMIN" && existing.organizationId !== req.user?.organizationId) {
      return sendError(res, "FORBIDDEN", "Cannot deactivate operator from another organization", 403);
    }

    const updated = await prisma.user.update({
      where: { id },
      data: { isActive: false },
      include: { role: true, organization: true, station: true },
    });

    await logAudit({
      userId: req.user?.id,
      action: "DEACTIVATE",
      resource: "operator",
      details: { targetUserId: id },
    });

    return sendSuccess(res, updated);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
