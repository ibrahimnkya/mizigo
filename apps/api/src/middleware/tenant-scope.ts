import type { NextFunction, Request, Response } from "express";
import { sendError } from "../lib/api-response";

const isSuperAdmin = (role?: string) => role === "SUPER_ADMIN";

export const requireTenantContext = (req: Request, res: Response, next: NextFunction) => {
  if (!req.user) {
    return sendError(res, "UNAUTHORIZED", "Unauthorized", 401);
  }

  if (isSuperAdmin(req.user.role)) {
    return next();
  }

  if (!req.user.organizationId) {
    return sendError(res, "FORBIDDEN", "Missing organization scope for authenticated user", 403);
  }

  return next();
};

export const requireStationContext = (req: Request, res: Response, next: NextFunction) => {
  if (!req.user) {
    return sendError(res, "UNAUTHORIZED", "Unauthorized", 401);
  }

  if (isSuperAdmin(req.user.role)) {
    return next();
  }

  if (!req.user.organizationId || !req.user.stationId) {
    return sendError(res, "FORBIDDEN", "Missing station scope for authenticated user", 403);
  }

  return next();
};
