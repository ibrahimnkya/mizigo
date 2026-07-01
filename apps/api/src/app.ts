import express from "express";
import type { Express } from "express";
import cors from "cors";
import parcelRouter from "./routes/parcel";
import authRouter from "./routes/auth";
import rolesRouter from "./routes/roles";
import permissionsRouter from "./routes/permissions";
import organizationsRouter from "./routes/organizations";
import stationsRouter from "./routes/stations";
import adminsRouter from "./routes/admins";
import operatorsRouter from "./routes/operators";
import usersRouter from "./routes/users";
import reportsRouter from "./routes/reports";
import auditLogsRouter from "./routes/audit-logs";
import paymentsRouter from "./routes/payments";
import pricingRouter from "./routes/pricing";
import appVersionsRouter from "./routes/app-versions";
import integrationsRouter from "./routes/integrations";
import financeRouter from "./routes/finance";
import smsConfigRouter from "./routes/sms-config";
import platformRouter from "./routes/platform";
import sgrIntegrationRouter from "./routes/sgr-integration";
import fleetRouter from "./routes/fleet";
import paymentConfigRouter from "./routes/payment-config";
import serviceTypesRouter from "./routes/service-types";
import platformAgentsRouter from "./routes/platform-agents";
import agentCommissionsRouter from "./routes/agent-commissions";
import { requestContext } from "./middleware/request-context";
import { requestLogger } from "./middleware/request-logger";
import { auditWrites } from "./middleware/audit-writes";
import { validateBody } from "./middleware/validate-body";
import { idempotency, requireIdempotencyKey } from "./middleware/idempotency";
import { verifyRequestSignature } from "./middleware/request-signature";
import {
  globalErrorHandler,
  notFoundHandler,
} from "./middleware/error-handler";
import { rateLimit, authLimit } from "./middleware/rate-limit";
import { sendSuccess } from "./lib/api-response";
import { prisma } from "@repo/database";

export const API_PREFIX = "/api/v1";

export const createApp = (): Express => {
  const app = express();
  const skipDbRoutes = process.env.SKIP_DB_ROUTES === "true";

  app.use(cors());
  app.use(express.json());
  app.use(requestContext);
  app.use(requestLogger);
  app.use(validateBody);
  app.use(verifyRequestSignature);
  app.use(requireIdempotencyKey);
  app.use(idempotency);
  app.use(auditWrites);
  app.use(rateLimit()); // Default 100/15min for general API

  app.get("/", (_req, res) => {
    return sendSuccess(res, {
      service: "mizigo-api",
      version: "v1",
      status: "ok",
    });
  });

  app.get(`${API_PREFIX}/health`, async (_req, res) => {
    if (skipDbRoutes) {
      return sendSuccess(res, {
        status: "ok",
        service: "mizigo-api",
        version: "v1",
        integrations: { dbRoutes: "skipped" },
        security: {
          signedRequests: process.env.REQUIRE_SIGNED_REQUESTS === "true",
        },
      });
    }

    const smsConfigs = await prisma.integration.findMany({
      where: { type: "SMS_GATEWAY", deletedAt: null, isActive: true },
      orderBy: { updatedAt: "desc" },
      take: 10,
    });

    const smsStatus = smsConfigs.map((c) => {
      const cfg = (c.config || {}) as Record<string, unknown>;
      const apiId = String(cfg.apiId || "");
      const apiPassword = String(cfg.apiPassword || "");
      const baseUrl = String(cfg.baseUrl || "");
      const configured = !!apiId && !!apiPassword && !!baseUrl;
      return {
        id: c.id,
        organizationId: c.organizationId ?? null,
        isActive: c.isActive,
        configured,
        updatedAt: c.updatedAt,
      };
    });

    return sendSuccess(res, {
      status: "ok",
      service: "mizigo-api",
      version: "v1",
      integrations: {
        smsGateway: {
          activeCount: smsConfigs.length,
          configs: smsStatus,
        },
      },
      security: {
        signedRequests: process.env.REQUIRE_SIGNED_REQUESTS === "true",
      },
    });
  });

  if (!skipDbRoutes) {
    app.use(`${API_PREFIX}/parcel`, parcelRouter);
    app.use(`${API_PREFIX}/parcel`, parcelRouter); // Backward compatibility
    app.use(`${API_PREFIX}/auth`, authLimit, authRouter);
    app.use(`${API_PREFIX}/roles`, rolesRouter);
    app.use(`${API_PREFIX}/permissions`, permissionsRouter);
    app.use(`${API_PREFIX}/organizations`, organizationsRouter);
    app.use(`${API_PREFIX}/stations`, stationsRouter);
    app.use(`${API_PREFIX}/admins`, adminsRouter);
    app.use(`${API_PREFIX}/operators`, operatorsRouter);
    app.use(`${API_PREFIX}/users`, usersRouter);
    app.use(`${API_PREFIX}/reports`, reportsRouter);
    app.use(`${API_PREFIX}/audit-logs`, auditLogsRouter);
    app.use(`${API_PREFIX}/payments`, paymentsRouter);
    app.use(`${API_PREFIX}/pricing`, pricingRouter);
    app.use(`${API_PREFIX}/app-versions`, appVersionsRouter);
    app.use(`${API_PREFIX}/integrations`, integrationsRouter);
    app.use(`${API_PREFIX}/finance`, financeRouter);
    app.use(`${API_PREFIX}/sms-config`, smsConfigRouter);
    app.use(`${API_PREFIX}/admin/platform`, platformRouter);
    app.use(`${API_PREFIX}/fleet`, fleetRouter);
    app.use(`${API_PREFIX}/payment-config`, paymentConfigRouter);
    app.use(`${API_PREFIX}/service-types`, serviceTypesRouter);
    app.use(`${API_PREFIX}/platform-agents`, platformAgentsRouter);
    app.use(`${API_PREFIX}/agent-commissions`, agentCommissionsRouter);
    app.use("/sec/trc", sgrIntegrationRouter);
  }

  app.use(notFoundHandler);
  app.use(globalErrorHandler);

  return app;
};
