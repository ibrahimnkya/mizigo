import type { NextFunction, Request, Response } from "express";
import crypto from "crypto";
import { sendError } from "../lib/api-response";

const METHODS = new Set(["POST", "PUT", "PATCH", "DELETE"]);
const CLOCK_SKEW_MS = 5 * 60 * 1000;
const NONCE_TTL_MS = 10 * 60 * 1000;
const nonceCache = new Map<string, number>();

const EXCLUDED_PATTERNS: RegExp[] = [
  /^\/api\/v1\/auth\//,
  /^\/api\/v1\/payments\/callback$/,
  /^\/sec\/trc\//,
];

const shouldExcludePath = (path: string) =>
  EXCLUDED_PATTERNS.some((p) => p.test(path));

const stableStringify = (value: unknown): string => {
  if (value === null || value === undefined) return "";
  if (Array.isArray(value))
    return `[${value.map((v) => stableStringify(v)).join(",")}]`;
  if (typeof value === "object") {
    const record = value as Record<string, unknown>;
    const keys = Object.keys(record).sort();
    return `{${keys.map((k) => `${JSON.stringify(k)}:${stableStringify(record[k])}`).join(",")}}`;
  }
  return JSON.stringify(value);
};

const cleanupNonceCache = (now: number) => {
  for (const [k, exp] of nonceCache.entries()) {
    if (exp <= now) nonceCache.delete(k);
  }
};

export const verifyRequestSignature = (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  const signingSecret =
    process.env.REQUEST_SIGNING_SECRET ||
    process.env.API_REQUEST_SIGNING_SECRET;
  const signingEnabled = process.env.REQUIRE_SIGNED_REQUESTS === "true";
  if (!signingEnabled || !signingSecret) return next();
  if (!METHODS.has(req.method)) return next();
  if (shouldExcludePath(req.path)) return next();

  const signature = req.header("x-signature");
  const timestampRaw = req.header("x-signature-timestamp");
  const nonce = req.header("x-signature-nonce");
  if (!signature || !timestampRaw || !nonce) {
    return sendError(
      res,
      "UNAUTHORIZED",
      "Signed request headers are required: x-signature, x-signature-timestamp, x-signature-nonce",
      401,
    );
  }

  const timestampMs = Number(timestampRaw);
  if (!Number.isFinite(timestampMs)) {
    return sendError(
      res,
      "UNAUTHORIZED",
      "Invalid x-signature-timestamp header",
      401,
    );
  }
  const now = Date.now();
  if (Math.abs(now - timestampMs) > CLOCK_SKEW_MS) {
    return sendError(
      res,
      "UNAUTHORIZED",
      "Request timestamp is outside allowed window",
      401,
    );
  }

  cleanupNonceCache(now);
  if (nonceCache.has(nonce)) {
    return sendError(
      res,
      "UNAUTHORIZED",
      "Replay detected: nonce already used",
      401,
    );
  }

  const canonicalBody = stableStringify(req.body || {});
  const bodyHash = crypto
    .createHash("sha256")
    .update(canonicalBody)
    .digest("hex");
  const payload = `${req.method}\n${req.originalUrl}\n${timestampRaw}\n${nonce}\n${bodyHash}`;
  const expected = crypto
    .createHmac("sha256", signingSecret)
    .update(payload)
    .digest("hex");

  const isValid =
    expected.length === signature.length &&
    crypto.timingSafeEqual(Buffer.from(expected), Buffer.from(signature));
  if (!isValid) {
    return sendError(res, "UNAUTHORIZED", "Invalid request signature", 401);
  }

  nonceCache.set(nonce, now + NONCE_TTL_MS);
  return next();
};
