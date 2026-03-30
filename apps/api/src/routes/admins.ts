import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { hashPassword } from "../lib/security";
import { logAudit } from "../lib/audit";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

const getAdminRoleId = async () => {
  const role = await prisma.role.findFirst({
    where: {
      OR: [{ name: "ADMIN" }, { name: "ORG_ADMIN" }],
    },
  });
  return role?.id;
};

router.post("/", requirePermission("admins:create"), async (req: Request, res: Response) => {
  try {
    const { name, email, phone, password, organizationId } = req.body;
    if (!name || !email || !password) {
      return sendError(res, "VALIDATION_ERROR", "name, email, and password are required", 400);
    }

    const roleId = await getAdminRoleId();
    if (!roleId) {
      return sendError(res, "NOT_FOUND", "ADMIN role not found", 404);
    }

    const targetOrganizationId =
      req.user?.role === "SUPER_ADMIN" ? organizationId : req.user?.organizationId;

    const user = await prisma.user.create({
      data: {
        name,
        email,
        phone: phone || null,
        passwordHash: hashPassword(password),
        roleId,
        organizationId: targetOrganizationId || null,
      },
      include: { role: true },
    });

    await logAudit({
      userId: req.user?.id,
      action: "CREATE",
      resource: "admin",
      details: { targetUserId: user.id, organizationId: user.organizationId },
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
    const adminRoleId = await getAdminRoleId();
    if (!adminRoleId) {
      return sendSuccess(res, []);
    }

    const where = req.user?.role === "SUPER_ADMIN"
      ? { roleId: adminRoleId }
      : { roleId: adminRoleId, organizationId: req.user?.organizationId ?? "" };

    const admins = await prisma.user.findMany({
      where,
      include: { role: true, organization: true, station: true },
      orderBy: { createdAt: "desc" },
    });

    return sendSuccess(res, admins);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.put("/:id", requirePermission("admins:update"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const existing = await prisma.user.findUnique({ where: { id } });
    if (!existing) {
      return sendError(res, "NOT_FOUND", "Admin not found", 404);
    }
    if (req.user?.role !== "SUPER_ADMIN" && existing.organizationId !== req.user?.organizationId) {
      return sendError(res, "FORBIDDEN", "Cannot update admin from another organization", 403);
    }

    const updated = await prisma.user.update({
      where: { id },
      data: {
        name: req.body.name,
        phone: req.body.phone,
        isActive: req.body.isActive,
      },
      include: { role: true, organization: true, station: true },
    });

    await logAudit({
      userId: req.user?.id,
      action: "UPDATE",
      resource: "admin",
      details: { targetUserId: id },
    });

    return sendSuccess(res, updated);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.delete("/:id", requirePermission("admins:delete"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const existing = await prisma.user.findUnique({ where: { id } });
    if (!existing) {
      return sendError(res, "NOT_FOUND", "Admin not found", 404);
    }
    if (req.user?.role !== "SUPER_ADMIN" && existing.organizationId !== req.user?.organizationId) {
      return sendError(res, "FORBIDDEN", "Cannot deactivate admin from another organization", 403);
    }

    const updated = await prisma.user.update({
      where: { id },
      data: { isActive: false },
      include: { role: true, organization: true, station: true },
    });

    await logAudit({
      userId: req.user?.id,
      action: "DEACTIVATE",
      resource: "admin",
      details: { targetUserId: id },
    });

    return sendSuccess(res, updated);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
