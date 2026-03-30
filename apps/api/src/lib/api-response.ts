import type { Response } from "express";

export type ApiErrorCode =
  | "VALIDATION_ERROR"
  | "UNAUTHORIZED"
  | "FORBIDDEN"
  | "NOT_FOUND"
  | "CONFLICT"
  | "INTERNAL_SERVER_ERROR";

export class ApiError extends Error {
  public readonly statusCode: number;
  public readonly code: ApiErrorCode;
  public readonly details?: unknown;

  constructor(statusCode: number, code: ApiErrorCode, message: string, details?: unknown) {
    super(message);
    this.statusCode = statusCode;
    this.code = code;
    this.details = details;
  }
}

export const sendSuccess = <T>(res: Response, data: T, statusCode = 200, meta: Record<string, unknown> = {}) => {
  return res.status(statusCode).json({
    success: true,
    data,
    meta,
    error: null,
  });
};

export const sendError = (
  res: Response,
  code: ApiErrorCode,
  message: string,
  statusCode = 500,
  details?: unknown,
) => {
  return res.status(statusCode).json({
    success: false,
    data: null,
    error: {
      code,
      message,
      details: details ?? [],
    },
  });
};
