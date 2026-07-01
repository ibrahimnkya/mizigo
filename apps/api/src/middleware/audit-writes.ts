import type { NextFunction, Request, Response } from "express";
import { logAudit } from "../lib/audit";

export const auditWrites = (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  // Prevent infinite loop by not logging fetches to the audit logs endpoint
  if (req.originalUrl.includes("/audit-logs")) {
    return next();
  }

  res.on("finish", () => {
    void logAudit({
      userId: req.user?.id,
      action: req.method,
      resource: req.originalUrl,
      details: {
        requestId: req.requestId,
        statusCode: res.statusCode,
        ip: req.ip || req.socket.remoteAddress,
        userAgent: req.get("User-Agent") || "Unknown",
        query: req.query,
      },
    }).catch((error) => {
      console.error("Failed to persist audit log", {
        requestId: req.requestId,
        path: req.originalUrl,
        error,
      });
    });
  });

  return next();
};
