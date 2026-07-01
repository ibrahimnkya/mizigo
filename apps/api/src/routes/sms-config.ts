import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { sendSms } from "../lib/sms";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

router.post(
  "/",
  requirePermission("sms_config:create"),
  async (req: Request, res: Response) => {
    try {
      const {
        apiId,
        apiPassword,
        defaultSenderId,
        apiUrl,
        customSenderIdRequest,
        organizationId,
      } = req.body;
      if (!apiId || !apiPassword || !defaultSenderId || !apiUrl) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "apiId, apiPassword, defaultSenderId and apiUrl are required",
          400,
        );
      }

      const targetOrganizationId =
        req.user?.role === "SUPER_ADMIN"
          ? organizationId || null
          : req.user?.organizationId || null;

      const item = await prisma.integration.create({
        data: {
          type: "SMS_GATEWAY",
          name: targetOrganizationId
            ? "Organization SMS Gateway"
            : "Platform SMS Gateway",
          organizationId: targetOrganizationId,
          config: {
            apiId,
            apiPassword,
            defaultSenderId,
            baseUrl: apiUrl,
            apiUrl,
            customSenderIdRequest: customSenderIdRequest || null,
            customSenderIdApproved: false,
          },
          isActive: true,
        },
      });

      return sendSuccess(res, {
        ...item,
        config: {
          ...(item.config as any),
          apiUrl: (item.config as any).apiUrl || (item.config as any).baseUrl || "",
        },
      }, 201);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.get(
  "/",
  requirePermission("sms_config:read"),
  async (req: Request, res: Response) => {
    try {
      const where =
        req.user?.role === "SUPER_ADMIN"
          ? { type: "SMS_GATEWAY", deletedAt: null }
          : {
              type: "SMS_GATEWAY",
              deletedAt: null,
              organizationId: req.user?.organizationId || "",
            };

      const data = await prisma.integration.findMany({
        where,
        orderBy: { createdAt: "desc" },
      });

      const mappedData = data.map((item) => {
        if (item.config && typeof item.config === "object") {
          const cfg = item.config as any;
          return {
            ...item,
            config: {
              ...cfg,
              apiUrl: cfg.apiUrl || cfg.baseUrl || "",
            },
          };
        }
        return item;
      });

      return sendSuccess(res, mappedData);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.put(
  "/:id/approve-sender",
  requirePermission("sms_config:approve_sender"),
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      const { approvedSenderId } = req.body;
      if (!approvedSenderId)
        return sendError(
          res,
          "VALIDATION_ERROR",
          "approvedSenderId is required",
          400,
        );

      const config = await prisma.integration.findUnique({ where: { id } });
      if (!config || config.deletedAt)
        return sendError(res, "NOT_FOUND", "SMS config not found", 404);

      if (req.user?.role !== "SUPER_ADMIN") {
        return sendError(
          res,
          "FORBIDDEN",
          "Only super admin can approve sender IDs",
          403,
        );
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
  },
);

router.post(
  "/:id/request-sender-id",
  requirePermission("sms_config:update"),
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      const { requestedSenderId, note } = req.body as {
        requestedSenderId?: string;
        note?: string;
      };
      if (!requestedSenderId) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "requestedSenderId is required",
          400,
        );
      }

      const config = await prisma.integration.findUnique({ where: { id } });
      if (!config || config.deletedAt)
        return sendError(res, "NOT_FOUND", "SMS config not found", 404);
      if (
        req.user?.role !== "SUPER_ADMIN" &&
        config.organizationId !== req.user?.organizationId
      ) {
        return sendError(
          res,
          "FORBIDDEN",
          "Cannot request sender ID outside your organization",
          403,
        );
      }

      const current = (config.config || {}) as Record<string, unknown>;
      const updated = await prisma.integration.update({
        where: { id },
        data: {
          config: {
            ...current,
            customSenderIdRequest: requestedSenderId,
            customSenderIdRequestNote: note || null,
            customSenderIdRequestedAt: new Date().toISOString(),
            customSenderIdRequestedBy: req.user?.id || null,
            customSenderIdApproved: false,
          },
        },
      });

      return sendSuccess(res, updated);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.put(
  "/:id",
  requirePermission("sms_config:update"),
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      const { apiId, apiPassword, defaultSenderId, apiUrl, isActive } =
        req.body as {
          apiId?: string;
          apiPassword?: string;
          defaultSenderId?: string;
          apiUrl?: string;
          isActive?: boolean;
        };

      const config = await prisma.integration.findUnique({ where: { id } });
      if (!config || config.deletedAt)
        return sendError(res, "NOT_FOUND", "SMS config not found", 404);

      if (
        req.user?.role !== "SUPER_ADMIN" &&
        config.organizationId !== req.user?.organizationId
      ) {
        return sendError(
          res,
          "FORBIDDEN",
          "Cannot update SMS config outside your organization",
          403,
        );
      }

      const current = (config.config || {}) as Record<string, unknown>;
      const updated = await prisma.integration.update({
        where: { id },
        data: {
          config: {
            ...current,
            apiId: apiId ?? current.apiId,
            apiPassword: apiPassword ?? current.apiPassword,
            defaultSenderId: defaultSenderId ?? current.defaultSenderId,
            baseUrl: apiUrl ?? current.baseUrl,
            apiUrl: apiUrl ?? current.apiUrl ?? current.baseUrl,
          } as any,
          isActive: isActive ?? config.isActive,
        },
      });

      return sendSuccess(res, {
        ...updated,
        config: {
          ...(updated.config as any),
          apiUrl: (updated.config as any).apiUrl || (updated.config as any).baseUrl || "",
        },
      });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

/**
 * POST /api/v1/sms-config/:id/test
 * Sends a test SMS using the specified configuration to verify credentials.
 */
router.post(
  "/:id/test",
  requirePermission("sms_config:update"),
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      const { phoneNumber, message } = req.body;

      if (!phoneNumber || !message) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "phoneNumber and message are required",
          400,
        );
      }

      const config = await prisma.integration.findUnique({ where: { id } });
      if (!config || config.deletedAt) {
        return sendError(res, "NOT_FOUND", "SMS config not found", 404);
      }

      if (
        req.user?.role !== "SUPER_ADMIN" &&
        config.organizationId !== req.user?.organizationId
      ) {
        return sendError(
          res,
          "FORBIDDEN",
          "Cannot test SMS config outside your organization",
          403,
        );
      }

      const { sendSms } = require("../lib/sms");

      const result = await sendSms({
        phoneNumber,
        message,
        organizationId: config.organizationId,
        senderId: (config.config as any)?.defaultSenderId,
      });

      return sendSuccess(res, {
        success: true,
        providerResponse: result,
      });
    } catch (error: any) {
      return sendError(res, "VALIDATION_ERROR", error.message, 400);
    }
  },
);

/**
 * GET /api/v1/sms-config/logs
 * Retrieves sent SMS logs (using auditLog table with action = "SMS_STATUS").
 * Super Admin sees all or filters by org. Org Admin only sees their own org's logs.
 */
router.get(
  "/logs",
  async (req: Request, res: Response) => {
    try {
      const { page = "1", limit = "20", status, phoneNumber, organizationId } = req.query;

      const pageNumber = Math.max(1, Number(page) || 1);
      const pageSize = Math.min(100, Math.max(1, Number(limit) || 20));
      const skip = (pageNumber - 1) * pageSize;

      const where: any = {
        action: "SMS_STATUS",
        resource: "sms",
      };

      // Scope by organizationId
      if (req.user?.role !== "SUPER_ADMIN") {
        where.organizationId = req.user?.organizationId || "";
      } else if (organizationId) {
        where.organizationId = String(organizationId);
      }

      // Handle JSON fields queries in Prisma
      const andFilters: any[] = [];
      if (phoneNumber) {
        andFilters.push({
          details: {
            path: ["phoneNumber"],
            string_contains: String(phoneNumber),
          },
        });
      }
      if (status) {
        andFilters.push({
          details: {
            path: ["status"],
            equals: String(status),
          },
        });
      }

      if (andFilters.length > 0) {
        where.AND = andFilters;
      }

      const [items, total] = await Promise.all([
        prisma.auditLog.findMany({
          where,
          orderBy: { createdAt: "desc" },
          skip,
          take: pageSize,
        }),
        prisma.auditLog.count({ where }),
      ]);

      return sendSuccess(res, items, 200, {
        page: pageNumber,
        limit: pageSize,
        total,
        totalPages: Math.ceil(total / pageSize),
      });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  }
);

/**
 * POST /api/v1/sms-config/logs/:id/resend
 * Resends a previously logged SMS by AuditLog ID.
 */
router.post(
  "/logs/:id/resend",
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;

      const log = await prisma.auditLog.findUnique({
        where: { id },
      });

      if (!log || log.action !== "SMS_STATUS" || !log.details) {
        return sendError(res, "NOT_FOUND", "SMS log not found", 404);
      }

      // Scope check
      if (req.user?.role !== "SUPER_ADMIN" && log.organizationId !== req.user?.organizationId) {
        return sendError(res, "FORBIDDEN", "Cannot resend SMS logs of another organization", 403);
      }

      const details = log.details as any;
      const phoneNumber = details.phoneNumber;
      const message = details.message;

      if (!phoneNumber || !message) {
        return sendError(res, "VALIDATION_ERROR", "Invalid SMS log entry", 400);
      }

      const result = await sendSms({
        phoneNumber,
        message,
        organizationId: log.organizationId,
      });

      return sendSuccess(res, { success: true, result });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  }
);

export default router;
