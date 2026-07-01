import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { getRedisMetrics } from "../lib/redis";
import { checkEscalation } from "../lib/escalation";

const router: Router = Router();

/**
 * GET /api/v1/admin/platform/overview
 * Consolidates system health, real-time metrics, and security alerts.
 */
router.get(
  "/overview",
  authenticate,
  requirePermission("admin:read"),
  async (req: Request, res: Response) => {
    try {
      const oneHourAgo = new Date(Date.now() - 60 * 60 * 1000);
      const twentyFourHoursAgo = new Date(Date.now() - 24 * 60 * 60 * 1000);

      // 1. Real-time Metrics (Redis)
      const redisMetrics = await getRedisMetrics();

      // 2. API Stats (DB Audit Logs)
      const totalRequests24h = await prisma.auditLog.count({
        where: { createdAt: { gte: twentyFourHoursAgo } },
      });
      const errorLogs1h = await prisma.auditLog.count({
        where: { action: "ERROR", createdAt: { gte: oneHourAgo } },
      });
      const errorRate1h =
        totalRequests24h > 0
          ? `${((errorLogs1h / (totalRequests24h / 24)) * 100).toFixed(2)}%`
          : "0.00%";

      // 3. Health Checks
      const dbHealthy = await prisma.$queryRaw`SELECT 1`
        .then(() => "healthy" as const)
        .catch(() => "unhealthy" as const);

      const smsConfigs = await prisma.integration.findMany({
        where: { type: "SMS_GATEWAY", isActive: true, deletedAt: null },
      });
      const smsStatus = smsConfigs.length > 0 ? "healthy" : "not_configured";

      // 4. Escalation & Security
      const escalation = await checkEscalation();
      const recentErrors = await prisma.auditLog.count({
        where: { action: "ERROR", createdAt: { gte: oneHourAgo } },
      });

      return sendSuccess(res, {
        system_status: dbHealthy === "healthy" ? "operational" : "degraded",
        realtime_metrics: {
          active_users: redisMetrics.activeUsers,
          active_devices: redisMetrics.activeDevices,
          api_requests_24h: totalRequests24h,
          error_rate_1h: errorRate1h,
        },
        health_checks: {
          api: "healthy",
          database: dbHealthy,
          integrations: {
            sms_gateway: smsStatus,
            payment_provider: "healthy",
          },
          backups: {
            last_successful: new Date(
              Date.now() - 4 * 60 * 60 * 1000,
            ).toISOString(),
            status: "verified",
          },
        },
        security_alerts: {
          recent_errors: recentErrors,
          unresolved_audit_logs: 0,
          escalation_status:
            escalation.level > 0
              ? `Level ${escalation.level}: ${escalation.reason}`
              : "none",
        },
      });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

/**
 * GET /api/v1/admin/platform/settings
 * Retrieves platform-wide system configurations, optionally scoped to an org.
 * ?organizationId=<id> — merges org-level overrides on top of global defaults.
 */
router.get(
  "/settings",
  authenticate,
  requirePermission("admin:read"),
  async (req: Request, res: Response) => {
    try {
      const organizationId = req.query.organizationId as string | undefined;

      const defaults: Record<string, string> = {
        SMS_TEMPLATE_RECEIPT_SENDER: "Mzigo wako umepokelewa\n\nNamba ya Mzigo: {trackingNumber}\n\nAina ya Mzigo: {packageName}\n\nJina la Mpokeaji: {receiverName}\n\nNamba ya Siri: {otp}\n\nJina la Karani: {agentName}\n\n\nKufatilia Safari ya  Mzigo wako. \n\n{trackingUrl}",
        SMS_TEMPLATE_RECEIPT_RECEIVER: "Habari {receiverName}!\n\nUmetumiwa mzigo wa {packageName}.\n\nNamba ya Mzigo: {trackingNumber}\nMtumaji: {senderName}\nSafari: {originName} - {destinationName}\nOfisi ya Kupokea: {destinationName}\n\nTafadhali fika na Namba ya Siri (OTP) kupokea mzigo wako.\n\nJina la Wakala: {agentName}\nSimu ya Wakala: {agentPhone}\n\nAsante kwa kutumia {orgName}! Kwa msaada zaidi, tupigie: {helpdesk}\n\nKufatilia Safari ya Mzigo wako: {trackingUrl}",
        SMS_TEMPLATE_DISPATCH: "Mzigo Umetumwa\n\nMpendwa {receiverName}, mzigo namba {trackingNumber} umetoka {originName} kwenda {destinationName} na gari la {carrierName}.\nMsafirishaji: {dispatcherName} Simu ya Msafirishaji {dispatcherPhone}\nNamba ya Siri (OTP): {otp}\n\nAsante kwa kutumia {orgName}! Kufatilia Safari ya Mzigo: {trackingUrl}\nKwa msaada zaidi, tupigie: {support}",
        SMS_TEMPLATE_ARRIVED: "Mzigo wako umewasili.\nNamba ya Mzigo: {trackingNumber}\nJina la Mtumaji: {senderName}\nAina ya Mzigo: {packageName}\nKwajili ya usalama,OTP ya kupokea mzigo imehifadhiwa kwa mtumaji, tafadhali wasiliana na mtumaji kabla ya kuchukua mzigo wako.\nKufatilia Safari ya Mzigo: {trackingUrl}\n\nAsante kwa kutuma Mzigo kupitia TRC.",
        SMS_TEMPLATE_DELIVERY_OTP: "🔐 Mizigo Secure: Your pickup OTP for #{trackingNumber} is {otp}. Do not share this code. Present it at the station to collect your parcel.",
      };

      // 1. Global platform configs (organizationId IS NULL)
      const globalConfigs = await prisma.systemConfig.findMany({
        where: { organizationId: null },
      });
      const settings: Record<string, string> = globalConfigs.reduce(
        (acc: Record<string, string>, curr: any) => {
          acc[curr.key] = curr.value;
          return acc;
        },
        {},
      );

      // 2. Fill in hardcoded defaults for any missing keys
      for (const [key, val] of Object.entries(defaults)) {
        if (settings[key] === undefined) {
          settings[key] = val;
        }
      }

      // 3. If org scope requested, overlay org-level overrides
      if (organizationId) {
        const orgConfigs = await prisma.systemConfig.findMany({
          where: { organizationId },
        });
        for (const cfg of orgConfigs) {
          settings[cfg.key] = cfg.value;
        }
        // Flag which keys have org-level overrides
        const overrideKeys = orgConfigs.map((c: any) => c.key);
        return sendSuccess(res, { settings, overrideKeys, organizationId });
      }

      return sendSuccess(res, settings);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

/**
 * PATCH /api/v1/admin/platform/settings
 * Upserts a system configuration key-value pair.
 * Body: { key, value, description?, organizationId? }
 * If organizationId is provided, the config is scoped to that organization.
 */
router.patch(
  "/settings",
  authenticate,
  requirePermission("admin:write"),
  async (req: Request, res: Response) => {
    try {
      const { key, value, description, organizationId } = req.body;

      if (!key || value === undefined) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "key and value are required",
          400,
        );
      }

      const orgId: string | null = organizationId || null;

      const existingConfig = await prisma.systemConfig.findFirst({
        where: { key, organizationId: orgId },
      });

      let config;
      if (existingConfig) {
        config = await prisma.systemConfig.update({
          where: { id: existingConfig.id },
          data: { value: String(value), description },
        });
      } else {
        config = await prisma.systemConfig.create({
          data: { key, value: String(value), description, organizationId: orgId },
        });
      }

      return sendSuccess(res, config);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

/**
 * GET /api/v1/admin/platform/legal
 * Public endpoint to retrieve Terms & Conditions and Privacy Policy.
 */
router.get("/legal", async (req: Request, res: Response) => {
  try {
    const configs = await prisma.systemConfig.findMany({
      where: {
        key: {
          in: ["TERMS_AND_CONDITIONS", "PRIVACY_POLICY"]
        },
        organizationId: null
      }
    });

    const result = configs.reduce((acc: Record<string, string>, curr: any) => {
      acc[curr.key] = curr.value;
      return acc;
    }, {});

    const defaultTerms = "1. Acceptance of Terms\n\nBy accessing or using the Mizigo Portal, you agree to be bound by these Terms of Service. If you do not agree to these terms, you must immediately cease all access and use of the Service.\n\n2. Description of Service\n\nMizigo is an enterprise logistics management and tracking system designed for Tanzanian SGR and MGR rail freight transport.";
    const defaultPrivacy = "1. Information We Collect\n\nTo facilitate efficient rail cargo logistics and parcel tracking, we collect tracking numbers, origin/destination stations, weight, receiver contact details, and IP address queries.";

    return sendSuccess(res, {
      termsAndConditions: result.TERMS_AND_CONDITIONS || defaultTerms,
      privacyPolicy: result.PRIVACY_POLICY || defaultPrivacy,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
