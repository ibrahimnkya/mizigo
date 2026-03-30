import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";
import { sendError } from "../lib/api-response";

type JwtPayload = {
  id: string;
  role: string;
  permissions?: string[];
  organizationId?: string | null;
  stationId?: string | null;
};

const JWT_SECRET = process.env.JWT_SECRET || "mizigo_super_secret_key_123";

export const authenticate = (req: Request, res: Response, next: NextFunction) => {
  const authHeader = req.headers.authorization;
  if (!authHeader) {
    return sendError(res, "UNAUTHORIZED", "No token provided", 401);
  }

  const [scheme, token] = authHeader.split(" ");
  if (scheme !== "Bearer" || !token) {
    return sendError(res, "UNAUTHORIZED", "Invalid authorization header format", 401);
  }

  try {
    const decoded = jwt.verify(token, JWT_SECRET) as JwtPayload;

    req.user = {
      id: decoded.id,
      role: decoded.role,
      permissions: decoded.permissions || [],
      organizationId: decoded.organizationId ?? null,
      stationId: decoded.stationId ?? null,
    };

    return next();
  } catch {
    return sendError(res, "UNAUTHORIZED", "Invalid or expired token", 401);
  }
};

export const requirePermission = (permission: string) => {
  return (req: Request, res: Response, next: NextFunction) => {
    if (!req.user) {
      return sendError(res, "UNAUTHORIZED", "Unauthorized", 401);
    }

    if (req.user.role === "SUPER_ADMIN") {
      return next();
    }

    if (!req.user.permissions.includes(permission)) {
      return sendError(res, "FORBIDDEN", "Forbidden: insufficient permissions", 403);
    }

    return next();
  };
};
