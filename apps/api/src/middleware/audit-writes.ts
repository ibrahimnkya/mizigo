import type { NextFunction, Request, Response } from "express";
import { logAudit } from "../lib/audit";

const WRITE_METHODS = new Set(["POST", "PUT", "PATCH", "DELETE"]);

export const auditWrites = (req: Request, res: Response, next: NextFunction) => {
  if (!WRITE_METHODS.has(req.method)) {
    return next();
  }

  res.on("finish", () => {
    if (res.statusCode >= 400) return;

    void logAudit({
      userId: req.user?.id,
      action: req.method,
      resource: req.originalUrl,
      details: {
        requestId: req.requestId,
        statusCode: res.statusCode,
      },
    }).catch((error) => {
      console.error("Failed to persist audit write log", {
        requestId: req.requestId,
        path: req.originalUrl,
        error,
      });
    });
  });

  return next();
};
