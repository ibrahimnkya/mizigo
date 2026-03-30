import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

router.post("/", requirePermission("sms_config:create"), async (req: Request, res: Response) => {
  try {
    const { apiId, apiPassword, defaultSenderId, customSenderIdRequest, organizationId } = req.body;
    if (!apiId || !apiPassword || !defaultSenderId) {
      return sendError(res, "VALIDATION_ERROR", "apiId, apiPassword and defaultSenderId are required", 400);
    }

    const targetOrganizationId =
      req.user?.role === "SUPER_ADMIN" ? (organizationId || null) : (req.user?.organizationId || null);

    const item = await prisma.integration.create({
      data: {
        type: "SMS_GATEWAY",
        name: targetOrganizationId ? "Organization SMS Gateway" : "Platform SMS Gateway",
        organizationId: targetOrganizationId,
        config: {
          apiId,
          apiPassword,
          defaultSenderId,
          customSenderIdRequest: customSenderIdRequest || null,
          customSenderIdApproved: false,
        },
        isActive: true,
      },
    });

    return sendSuccess(res, item, 201);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/", requirePermission("sms_config:read"), async (req: Request, res: Response) => {
  try {
    const where = req.user?.role === "SUPER_ADMIN"
      ? { type: "SMS_GATEWAY" }
      : { type: "SMS_GATEWAY", organizationId: req.user?.organizationId || "" };

    const data = await prisma.integration.findMany({ where, orderBy: { createdAt: "desc" } });
    return sendSuccess(res, data);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.put("/:id/approve-sender", requirePermission("sms_config:approve_sender"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { approvedSenderId } = req.body;
    if (!approvedSenderId) return sendError(res, "VALIDATION_ERROR", "approvedSenderId is required", 400);

    const config = await prisma.integration.findUnique({ where: { id } });
    if (!config) return sendError(res, "NOT_FOUND", "SMS config not found", 404);

    if (req.user?.role !== "SUPER_ADMIN") {
      return sendError(res, "FORBIDDEN", "Only super admin can approve sender IDs", 403);
    }

    const current = (config.config || {}) as Record<string, unknown>;
    const updated = await prisma.integration.update({
      where: { id },
      data: {
        config: {
          ...current,
          defaultSenderId: approvedSenderId,
          customSenderIdApproved: true,
          customSenderIdApprovedAt: new Date().toISOString(),
        },
      },
    });

    return sendSuccess(res, updated);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
