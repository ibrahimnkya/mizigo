import type { NextFunction, Request, Response } from "express";
import { ApiError, sendError } from "../lib/api-response";

export const notFoundHandler = (req: Request, res: Response) => {
  return sendError(
    res,
    "NOT_FOUND",
    `Route not found: ${req.method} ${req.originalUrl}`,
    404,
  );
};

export const globalErrorHandler = (
  error: unknown,
  req: Request,
  res: Response,
  _next: NextFunction,
) => {
  if (error instanceof ApiError) {
    return sendError(res, error.code, error.message, error.statusCode, error.details);
  }

  console.error("Unhandled API error", {
    requestId: req.requestId,
    path: req.originalUrl,
    error,
  });

  return sendError(
    res,
    "INTERNAL_SERVER_ERROR",
    "An unexpected error occurred",
    500,
  );
};
