import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

router.get("/", async (_req: Request, res: Response) => {
  try {
    const roles = await prisma.role.findMany({
      include: {
        permissions: {
          include: {
            permission: true,
          },
        },
      },
      orderBy: { createdAt: "desc" },
    });

    return sendSuccess(res, roles);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/", requirePermission("roles:create"), async (req: Request, res: Response) => {
  try {
    const { name, description } = req.body;
    if (!name) {
      return sendError(res, "VALIDATION_ERROR", "Role name is required", 400);
    }

    const role = await prisma.role.create({
      data: {
        name,
        description: description || null,
      },
    });

    return sendSuccess(res, role, 201);
  } catch (error: any) {
    if (error.code === "P2002") {
      return sendError(res, "CONFLICT", "Role already exists", 409);
    }
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/:id/assign-permissions", requirePermission("roles:assign_permissions"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { permissionIds } = req.body as { permissionIds?: string[] };

    if (!Array.isArray(permissionIds) || permissionIds.length === 0) {
      return sendError(res, "VALIDATION_ERROR", "permissionIds must be a non-empty array", 400);
    }

    const role = await prisma.role.findUnique({ where: { id } });
    if (!role) {
      return sendError(res, "NOT_FOUND", "Role not found", 404);
    }

    await prisma.$transaction([
      prisma.rolePermission.deleteMany({ where: { roleId: id } }),
      prisma.rolePermission.createMany({
        data: permissionIds.map((permissionId) => ({
          roleId: id,
          permissionId,
        })),
        skipDuplicates: true,
      }),
    ]);

    const updated = await prisma.role.findUnique({
      where: { id },
      include: {
        permissions: {
          include: { permission: true },
        },
      },
    });

    return sendSuccess(res, updated);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
