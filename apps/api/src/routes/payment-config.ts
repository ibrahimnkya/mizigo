import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { logAudit } from "../lib/audit";
import { initiatePushPayment } from "../lib/payment-gateway";

const getPublicCallbackUrl = () => {
  const host = process.env.PUBLIC_URL || "https://api.mizigo.akiliapp.co.tz";
  return `${host}/api/v1/payments/callback`;
};

const router: Router = Router();

// Apply auth and tenant scoping
router.use(authenticate, requireTenantContext);

/**
 * GET /api/v1/payment-config
 * Retrieves payment gateway integrations.
 */
router.get(
  "/",
  requirePermission("integrations:create"),
  async (req: Request, res: Response) => {
    try {
      const where =
        req.user?.role === "SUPER_ADMIN"
          ? { type: "PAYMENT_GATEWAY", deletedAt: null }
          : {
              type: "PAYMENT_GATEWAY",
              deletedAt: null,
              organizationId: req.user?.organizationId || "",
            };

      const configs = await prisma.integration.findMany({
        where,
        orderBy: { createdAt: "desc" },
      });

      return sendSuccess(res, configs);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

/**
 * POST /api/v1/payment-config
 * Creates a new payment gateway configuration.
 */
router.post(
  "/",
  requirePermission("integrations:create"),
  async (req: Request, res: Response) => {
    try {
      const { baseUrl, apiKey, appName, clientId, clientSecret, name, isActive, organizationId } = req.body;

      if (!baseUrl || !name) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "baseUrl and name are required",
          400,
        );
      }

      const targetOrganizationId =
        req.user?.role === "SUPER_ADMIN"
          ? organizationId || null
          : req.user?.organizationId || null;

      const item = await prisma.integration.create({
        data: {
          type: "PAYMENT_GATEWAY",
          name,
          organizationId: targetOrganizationId,
          config: {
            baseUrl,
            apiKey:       apiKey       || "",
            appName:      appName      || "",
            clientId:     clientId     || "",
            clientSecret: clientSecret || "",
          },
          isActive: isActive !== undefined ? Boolean(isActive) : true,
        },
      });

      await logAudit({
        userId: req.user?.id,
        action: "CREATE",
        resource: "payment_gateway_config",
        details: {
          configId: item.id,
          organizationId: targetOrganizationId,
        },
      });

      return sendSuccess(res, item, 201);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

/**
 * PUT /api/v1/payment-config/:id
 * Updates an existing payment gateway configuration.
 */
router.put(
  "/:id",
  requirePermission("integrations:update"),
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      const { baseUrl, apiKey, appName, clientId, clientSecret, name, isActive } = req.body;

      const config = await prisma.integration.findUnique({ where: { id } });
      if (!config || config.deletedAt) {
        return sendError(res, "NOT_FOUND", "Payment configuration not found", 404);
      }

      if (
        req.user?.role !== "SUPER_ADMIN" &&
        config.organizationId !== req.user?.organizationId
      ) {
        return sendError(
          res,
          "FORBIDDEN",
          "Cannot update payment settings outside your organization",
          403,
        );
      }

      const currentConfig = (config.config || {}) as Record<string, any>;
      const updated = await prisma.integration.update({
        where: { id },
        data: {
          name:     name     !== undefined ? name     : config.name,
          isActive: isActive !== undefined ? Boolean(isActive) : config.isActive,
          config: {
            ...currentConfig,
            baseUrl:      baseUrl      !== undefined ? baseUrl      : currentConfig.baseUrl,
            apiKey:       apiKey       !== undefined ? apiKey       : currentConfig.apiKey,
            appName:      appName      !== undefined ? appName      : currentConfig.appName,
            clientId:     clientId     !== undefined ? clientId     : currentConfig.clientId,
            clientSecret: clientSecret !== undefined ? clientSecret : currentConfig.clientSecret,
          },
        },
      });

      await logAudit({
        userId: req.user?.id,
        action: "UPDATE",
        resource: "payment_gateway_config",
        details: { configId: id },
      });

      return sendSuccess(res, updated);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

/**
 * POST /api/v1/payment-config/:id/test
 * Triggers a real push payment test request using the configured gateway.
 */
router.post(
  "/:id/test",
  requirePermission("integrations:update"),
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      const { phoneNumber, amount, paymentChannel = "TIGOPESA" } = req.body;

      if (!phoneNumber || !amount) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "phoneNumber and amount are required",
          400,
        );
      }

      const config = await prisma.integration.findUnique({ where: { id } });
      if (!config || config.deletedAt) {
        return sendError(res, "NOT_FOUND", "Payment configuration not found", 404);
      }

      if (
        req.user?.role !== "SUPER_ADMIN" &&
        config.organizationId !== req.user?.organizationId
      ) {
        return sendError(
          res,
          "FORBIDDEN",
          "Cannot test payment config outside your organization",
          403,
        );
      }

      const configData = (config.config || {}) as Record<string, any>;
      const hasVodacomHeaders = configData.appName && configData.clientId && configData.clientSecret;
      const hasApiKey = !!configData.apiKey;
      if (!configData.baseUrl || (!hasVodacomHeaders && !hasApiKey)) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "Payment gateway credentials (baseUrl and either apiKey or AppName/ClientId/Secret) must be configured before testing",
          400,
        );
      }

      const parsedAmount = parseFloat(amount);
      if (isNaN(parsedAmount) || parsedAmount <= 0) {
        return sendError(res, "VALIDATION_ERROR", "amount must be a positive number", 400);
      }

      const response = await initiatePushPayment({
        paymentChannel: String(paymentChannel),
        phoneNumber: String(phoneNumber),
        amount: parsedAmount,
        reference: `TEST-${Date.now()}`,
        callbackUrl: getPublicCallbackUrl(),
      });

      return sendSuccess(res, {
        message: "Test push payment sent successfully. Check the phone for the STK prompt.",
        transactionId: response.transaction_id,
        gateway: config.name,
        channel: paymentChannel,
      });
    } catch (error: any) {
      return sendError(res, "PAYMENT_GATEWAY_ERROR", error.message, 502);
    }
  },
);

export default router;

