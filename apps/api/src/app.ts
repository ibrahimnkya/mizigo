import express from "express";
import type { Express } from "express";
import cors from "cors";
import cargoRouter from "./routes/cargo";
import authRouter from "./routes/auth";
import rolesRouter from "./routes/roles";
import permissionsRouter from "./routes/permissions";
import organizationsRouter from "./routes/organizations";
import stationsRouter from "./routes/stations";
import adminsRouter from "./routes/admins";
import operatorsRouter from "./routes/operators";
import reportsRouter from "./routes/reports";
import auditLogsRouter from "./routes/audit-logs";
import paymentsRouter from "./routes/payments";
import pricingRouter from "./routes/pricing";
import appVersionsRouter from "./routes/app-versions";
import integrationsRouter from "./routes/integrations";
import financeRouter from "./routes/finance";
import smsConfigRouter from "./routes/sms-config";
import { requestContext } from "./middleware/request-context";
import { requestLogger } from "./middleware/request-logger";
import { auditWrites } from "./middleware/audit-writes";
import { validateBody } from "./middleware/validate-body";
import { idempotency, requireIdempotencyKey } from "./middleware/idempotency";
import { globalErrorHandler, notFoundHandler } from "./middleware/error-handler";
import { sendSuccess } from "./lib/api-response";

export const API_PREFIX = "/api/v1";

export const createApp = (): Express => {
  const app = express();
  const skipDbRoutes = process.env.SKIP_DB_ROUTES === "true";

  app.use(cors());
  app.use(express.json());
  app.use(requestContext);
  app.use(requestLogger);
  app.use(validateBody);
  app.use(requireIdempotencyKey);
  app.use(idempotency);
  app.use(auditWrites);

  app.get("/", (_req, res) => {
    return sendSuccess(res, {
      service: "mizigo-api",
      version: "v1",
      status: "ok",
    });
  });

  app.get(`${API_PREFIX}/health`, (_req, res) => {
    return sendSuccess(res, {
      status: "ok",
      service: "mizigo-api",
      version: "v1",
    });
  });

  if (!skipDbRoutes) {
    app.use(`${API_PREFIX}/cargo`, cargoRouter);
    app.use(`${API_PREFIX}/auth`, authRouter);
    app.use(`${API_PREFIX}/roles`, rolesRouter);
    app.use(`${API_PREFIX}/permissions`, permissionsRouter);
    app.use(`${API_PREFIX}/organizations`, organizationsRouter);
    app.use(`${API_PREFIX}/stations`, stationsRouter);
    app.use(`${API_PREFIX}/admins`, adminsRouter);
    app.use(`${API_PREFIX}/operators`, operatorsRouter);
    app.use(`${API_PREFIX}/reports`, reportsRouter);
    app.use(`${API_PREFIX}/audit-logs`, auditLogsRouter);
    app.use(`${API_PREFIX}/payments`, paymentsRouter);
    app.use(`${API_PREFIX}/pricing`, pricingRouter);
    app.use(`${API_PREFIX}/app-versions`, appVersionsRouter);
    app.use(`${API_PREFIX}/integrations`, integrationsRouter);
    app.use(`${API_PREFIX}/finance`, financeRouter);
    app.use(`${API_PREFIX}/sms-config`, smsConfigRouter);
  }

  app.use(notFoundHandler);
  app.use(globalErrorHandler);

  return app;
};
