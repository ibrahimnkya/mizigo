import fs from "fs";
import path from "path";
import type { Request } from "express";

type LogLevel = "debug" | "info" | "warn" | "error";

const LOG_LEVELS: Record<LogLevel, number> = { debug: 10, info: 20, warn: 30, error: 40 };
const CURRENT_LEVEL = (process.env.LOG_LEVEL as LogLevel) || "info";

export const filterNullValues = (obj: unknown): Record<string, unknown> => {
  if (!obj || typeof obj !== "object") return {};
  return Object.entries(obj as Record<string, unknown>)
    .filter(([, value]) => value !== null && value !== undefined && value !== "")
    .reduce<Record<string, unknown>>((result, [key, value]) => {
      result[key] = value;
      return result;
    }, {});
};

const logsDir = "logs";
if (!fs.existsSync(logsDir)) fs.mkdirSync(logsDir, { recursive: true });

const formatLine = (level: LogLevel, message: string, meta: Record<string, unknown> = {}) => {
  const timestamp = new Date().toISOString().replace("T", " ").slice(0, 19);
  const service = String(meta.service || "mizigo-api");
  const requestId = meta.requestId ? ` [REQ:${meta.requestId}]` : "";
  const userId = meta.userId ? ` [USER:${meta.userId}]` : "";
  const username = meta.username ? ` [${meta.username}]` : "";

  const filteredMeta = filterNullValues(meta);
  delete filteredMeta.service;
  delete filteredMeta.requestId;
  delete filteredMeta.userId;
  delete filteredMeta.username;

  const suffix = Object.keys(filteredMeta).length > 0 ? ` | ${JSON.stringify(filteredMeta)}` : "";
  return `${timestamp} [${level.toUpperCase().padEnd(5)}] [${service}]${requestId}${userId}${username}: ${message}${suffix}`;
};

const writeLine = (line: string, level: LogLevel) => {
  const file = level === "error" ? "error.log" : "combined.log";
  fs.appendFileSync(path.join(logsDir, file), `${line}\n`);
  fs.appendFileSync(path.join(logsDir, "app.log"), `${line}\n`);

  if (process.env.NODE_ENV !== "production") {
    const method = level === "error" ? console.error : level === "warn" ? console.warn : console.log;
    method(line);
  }
};

const makeLogger = (baseMeta: Record<string, unknown> = {}) => {
  const log = (level: LogLevel, message: string, meta: Record<string, unknown> = {}) => {
    if (LOG_LEVELS[level] < LOG_LEVELS[CURRENT_LEVEL]) return;
    const line = formatLine(level, message, { ...baseMeta, ...meta });
    writeLine(line, level);
  };

  return {
    defaultMeta: baseMeta,
    child: (context: Record<string, unknown>) => makeLogger({ ...baseMeta, ...context }),
    debug: (message: string, meta: Record<string, unknown> = {}) => log("debug", message, meta),
    info: (message: string, meta: Record<string, unknown> = {}) => log("info", message, meta),
    warn: (message: string, meta: Record<string, unknown> = {}) => log("warn", message, meta),
    error: (message: string, meta: Record<string, unknown> = {}) => log("error", message, meta),
  };
};

export const logger = makeLogger({ service: "mizigo-api" });

export const stream = {
  write: (message: string) => logger.info(message.trim()),
};

export const createRequestLogger = (req: Request) => {
  const requestId = (req.headers["x-request-id"] as string) || req.requestId || Math.random().toString(36).substring(7);
  const userId = req.user?.id;
  const context = filterNullValues({
    requestId,
    userId,
    method: req.method,
    url: req.originalUrl || req.url,
    userAgent: req.get("User-Agent"),
  });
  return logger.child(context);
};

export const createUserLogger = (userId: string, username?: string | null) => {
  return logger.child(filterNullValues({ userId, username: username || undefined }));
};

export const createServiceLogger = (service?: string) => {
  if (!service) return logger;
  return logger.child({ service: `mizigo-api:${service}` });
};

export const logWithContext = {
  info: (message: string, meta: Record<string, unknown> = {}) => logger.info(message, filterNullValues(meta)),
  warn: (message: string, meta: Record<string, unknown> = {}) => logger.warn(message, filterNullValues(meta)),
  error: (message: string, error: unknown = null, meta: Record<string, unknown> = {}) => {
    const errorMeta = { ...meta } as Record<string, unknown>;
    if (error instanceof Error) {
      errorMeta.error = error.message;
      errorMeta.stack = error.stack;
    } else if (typeof error === "string") {
      errorMeta.error = error;
    } else if (error) {
      errorMeta.error = String(error);
    }
    logger.error(message, filterNullValues(errorMeta));
  },
  debug: (message: string, meta: Record<string, unknown> = {}) => logger.debug(message, filterNullValues(meta)),
};
