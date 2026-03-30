import type { NextFunction, Request, Response } from "express";
import { sendError } from "../lib/api-response";

type StoredResponse = {
  statusCode: number;
  payload: unknown;
  expiresAt: number;
};

const CACHE_TTL_MS = 10 * 60 * 1000;
const cache = new Map<string, StoredResponse>();
const METHODS = new Set(["POST", "PATCH", "PUT", "DELETE"]);

export const idempotency = (req: Request, res: Response, next: NextFunction) => {
  if (!METHODS.has(req.method)) return next();

  const key = req.headers["idempotency-key"];
  if (!key || typeof key !== "string") return next();

  const cacheKey = `${req.method}:${req.originalUrl}:${key}`;
  const now = Date.now();
  const cached = cache.get(cacheKey);
  if (cached && cached.expiresAt > now) {
    return res.status(cached.statusCode).json(cached.payload);
  }

  const originalJson = res.json.bind(res);
  res.json = ((payload: unknown) => {
    cache.set(cacheKey, {
      statusCode: res.statusCode,
      payload,
      expiresAt: now + CACHE_TTL_MS,
    });
    return originalJson(payload);
  }) as Response["json"];

  return next();
};

export const requireIdempotencyKey = (req: Request, res: Response, next: NextFunction) => {
  if (!METHODS.has(req.method)) return next();
  if (req.path.includes("/callback") || req.path.includes("/bulk-status")) {
    const key = req.headers["idempotency-key"];
    if (!key || typeof key !== "string") {
      return sendError(res, "VALIDATION_ERROR", "Idempotency-Key header is required for this endpoint", 400);
    }
  }
  return next();
};
