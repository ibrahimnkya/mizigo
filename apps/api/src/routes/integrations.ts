import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

const reqNotAllowed = (item: { organizationId: string | null }, req: Request) =>
  req.user?.role !== "SUPER_ADMIN" &&
  item.organizationId !== req.user?.organizationId;

router.post(
  "/",
  requirePermission("integrations:create"),
  async (req: Request, res: Response) => {
    const {
      type,
      name,
      config = {},
      isActive = true,
      organizationId,
    } = req.body;
    if (!type || !name) {
      return sendError(
        res,
        "VALIDATION_ERROR",
        "type and name are required",
        400,
      );
    }

    const targetOrgId =
      req.user?.role === "SUPER_ADMIN"
        ? organizationId || null
        : req.user?.organizationId || null;

    const item = await prisma.integration.create({
      data: {
        type,
        name,
        organizationId: targetOrgId,
        config,
        isActive: Boolean(isActive),
      },
    });
    return sendSuccess(res, item, 201);
  },
);

router.get("/", async (req: Request, res: Response) => {
  const list =
    req.user?.role === "SUPER_ADMIN"
      ? await prisma.integration.findMany({
          where: { deletedAt: null },
          orderBy: { createdAt: "desc" },
        })
      : await prisma.integration.findMany({
          where: {
            deletedAt: null,
            organizationId: req.user?.organizationId || "",
          },
          orderBy: { createdAt: "desc" },
        });
  return sendSuccess(res, list);
});

router.put(
  "/:id",
  requirePermission("integrations:update"),
  async (req: Request, res: Response) => {
    const item = await prisma.integration.findUnique({
      where: { id: req.params.id },
    });
    if (!item || item.deletedAt)
      return sendError(res, "NOT_FOUND", "Integration not found", 404);
    if (reqNotAllowed(item, req))
      return sendError(res, "FORBIDDEN", "Cannot update integration", 403);

    const updated = await prisma.integration.update({
      where: { id: item.id },
      data: {
        name: req.body.name,
        type: req.body.type,
        config: req.body.config,
        isActive: req.body.isActive,
      },
    });
    return sendSuccess(res, updated);
  },
);

/**
 * PATCH /api/v1/integrations/payment-gateway/url
 * Specialized endpoint to update the base URL of the active payment gateway.
 */
router.patch(
  "/payment-gateway/url",
  requirePermission("integrations:update"),
  async (req: Request, res: Response) => {
    try {
      const { baseUrl } = req.body;
      if (!baseUrl) {
        return sendError(res, "VALIDATION_ERROR", "baseUrl is required", 400);
      }

      // Find the latest active payment gateway integration
      const integration = await prisma.integration.findFirst({
        where: { type: "PAYMENT_GATEWAY", isActive: true, deletedAt: null },
        orderBy: { updatedAt: "desc" },
      });

      if (!integration) {
        return sendError(
          res,
          "NOT_FOUND",
          "No active payment gateway integration found to update",
          404,
        );
      }

      const currentConfig = (integration.config || {}) as Record<string, any>;
      const updatedConfig = { ...currentConfig, baseUrl };

      const updated = await prisma.integration.update({
        where: { id: integration.id },
        data: {
          config: updatedConfig,
          updatedAt: new Date(),
        },
      });

      return sendSuccess(res, {
        message: "Payment gateway URL updated",
        baseUrl: updatedConfig.baseUrl,
        integration: updated,
      });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

export default router;
