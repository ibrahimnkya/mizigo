import type { NextFunction, Request, Response } from "express";
import { sendError } from "../lib/api-response";

const METHODS_REQUIRING_BODY = new Set(["POST", "PUT", "PATCH"]);

export const validateBody = (req: Request, res: Response, next: NextFunction) => {
  if (!METHODS_REQUIRING_BODY.has(req.method)) return next();

  const contentType = req.headers["content-type"] || "";
  if (!String(contentType).includes("application/json")) {
    return sendError(res, "VALIDATION_ERROR", "Content-Type must be application/json", 400);
  }

  if (req.body === undefined || req.body === null || typeof req.body !== "object") {
    return sendError(res, "VALIDATION_ERROR", "Request body must be a JSON object", 400);
  }

  return next();
};
