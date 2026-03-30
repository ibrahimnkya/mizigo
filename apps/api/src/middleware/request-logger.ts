import type { NextFunction, Request, Response } from "express";
import { createRequestLogger } from "../lib/logger";

export const requestLogger = (req: Request, res: Response, next: NextFunction) => {
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
  });

  next();
};
