import type { NextFunction, Request, Response } from "express";
import { createRequestLogger } from "../lib/logger";

const sanitizeBody = (body: any): any => {
  if (!body || typeof body !== "object") return body;
  const sanitized = { ...body };
  const sensitiveKeys = [
    "password",
    "apiPassword",
    "passwordHash",
    "loginCode",
    "newOtp",
    "newPassword",
    "currentPassword",
    "api_password",
    "token",
    "refreshToken",
  ];
  for (const key of Object.keys(sanitized)) {
    if (sensitiveKeys.includes(key)) {
      sanitized[key] = "******";
    } else if (typeof sanitized[key] === "object") {
      sanitized[key] = sanitizeBody(sanitized[key]);
    }
  }
  return sanitized;
};

export const requestLogger = (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  const start = Date.now();
  const reqLogger = createRequestLogger(req);

  res.on("finish", () => {
    const durationMs = Date.now() - start;
    reqLogger.info("request_complete", {
      requestId: req.requestId,
      method: req.method,
      path: req.originalUrl,
      statusCode: res.statusCode,
      durationMs,
    });

    const sanitizedBody = sanitizeBody(req.body);
    const bodyStr =
      sanitizedBody && Object.keys(sanitizedBody).length > 0
        ? ` | Body: ${JSON.stringify(sanitizedBody)}`
        : "";

    console.log(
      `[API INTERACTION] [${new Date().toISOString()}] ${req.method} ${req.originalUrl} | Status: ${res.statusCode} | Duration: ${durationMs}ms | IP: ${req.ip || req.socket.remoteAddress} | UA: ${req.get("User-Agent") || "Unknown"}${bodyStr}`,
    );
  });

  next();
};
