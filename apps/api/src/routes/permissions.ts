import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

router.get("/", async (_req: Request, res: Response) => {
  try {
    const permissions = await prisma.permission.findMany({
      orderBy: { createdAt: "desc" },
    });
    return sendSuccess(res, permissions);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/", requirePermission("permissions:create"), async (req: Request, res: Response) => {
  try {
    const { name, description } = req.body;
    if (!name) {
      return sendError(res, "VALIDATION_ERROR", "Permission name is required", 400);
    }

    const permission = await prisma.permission.create({
      data: {
        name,
        description: description || null,
      },
    });
    return sendSuccess(res, permission, 201);
  } catch (error: any) {
    if (error.code === "P2002") {
      return sendError(res, "CONFLICT", "Permission already exists", 409);
    }
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
