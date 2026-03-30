import type { NextFunction, Request, Response } from "express";
import { sendError } from "../lib/api-response";

type Entry = { count: number; resetAt: number };

const store = new Map<string, Entry>();

type RateLimitOptions = {
  windowMs: number;
  maxRequests: number;
  keyPrefix?: string;
};

export const rateLimit = ({ windowMs, maxRequests, keyPrefix = "global" }: RateLimitOptions) => {
  return (req: Request, res: Response, next: NextFunction) => {
    const now = Date.now();
    const identity = req.ip || req.headers["x-forwarded-for"] || "unknown";
    const key = `${keyPrefix}:${identity}:${req.path}`;

    const existing = store.get(key);
    if (!existing || existing.resetAt <= now) {
      store.set(key, { count: 1, resetAt: now + windowMs });
      return next();
    }

    existing.count += 1;
    store.set(key, existing);

    if (existing.count > maxRequests) {
      const retryAfterSec = Math.ceil((existing.resetAt - now) / 1000);
      res.setHeader("Retry-After", retryAfterSec.toString());
      return sendError(res, "FORBIDDEN", "Rate limit exceeded. Please try again later.", 429, {
        retryAfterSec,
      });
    }

    return next();
  };
};
