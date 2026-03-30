import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

router.post("/", requirePermission("pricing:create"), async (req: Request, res: Response) => {
  try {
    const { name, type, value, condition, isActive = true } = req.body;
    if (!name || !type || value === undefined) {
      return sendError(res, "VALIDATION_ERROR", "name, type and value are required", 400);
    }

    const rule = await prisma.pricingRule.create({
      data: {
        name,
        type,
        value: Number(value),
        condition: condition || null,
        isActive: Boolean(isActive),
      },
    });

    return sendSuccess(res, rule, 201);
  } catch (error: any) {
    if (error.code === "P2002") {
      return sendError(res, "CONFLICT", "Pricing rule already exists", 409);
    }
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.put("/:id", requirePermission("pricing:update"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const rule = await prisma.pricingRule.update({
      where: { id },
      data: {
        name: req.body.name,
        type: req.body.type,
        value: req.body.value === undefined ? undefined : Number(req.body.value),
        condition: req.body.condition,
        isActive: req.body.isActive,
      },
    });
    return sendSuccess(res, rule);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/", async (_req: Request, res: Response) => {
  try {
    const rules = await prisma.pricingRule.findMany({
      orderBy: { createdAt: "desc" },
    });
    return sendSuccess(res, rules);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
