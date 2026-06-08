import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";
import { prisma } from "@repo/database";
import { sendError } from "../lib/api-response";

type JwtPayload = {
  id?: string;
  userId?: string;
  role: string;
  typ?: "access" | "refresh";
  sessionId?: string;
  permissions?: string[];
  organizationId?: string | null;
  stationId?: string | null;
  isFirstLogin?: boolean;
  assignedStation?: { id: string; name: string; code: string } | null;
};

const JWT_SECRET = process.env.JWT_SECRET || "mizigo_super_secret_key_123";

export const authenticate = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  const authHeader = req.headers.authorization;
  if (!authHeader) {
    return sendError(res, "UNAUTHORIZED", "No token provided", 401);
  }

  const [scheme, token] = authHeader.split(" ");
  if (scheme !== "Bearer" || !token) {
    return sendError(
      res,
      "UNAUTHORIZED",
      "Invalid authorization header format",
      401,
    );
  }

  try {
    const decoded = jwt.verify(token, JWT_SECRET) as JwtPayload;
    const resolvedUserId = decoded.userId ?? decoded.id;
    if (!resolvedUserId) {
      return sendError(
        res,
        "UNAUTHORIZED",
        "Token is not bound to a user",
        401,
      );
    }
    if (decoded.typ && decoded.typ !== "access") {
      return sendError(res, "UNAUTHORIZED", "Invalid token type", 401);
    }

    if (!decoded.sessionId) {
      return sendError(
        res,
        "UNAUTHORIZED",
        "Session is missing from token",
        401,
      );
    }

    const session = await prisma.authSession.findUnique({
      where: { id: decoded.sessionId },
      select: { id: true, userId: true, revokedAt: true, expiresAt: true },
    });
    if (
      !session ||
      session.userId !== resolvedUserId ||
      session.revokedAt ||
      session.expiresAt <= new Date()
    ) {
      return sendError(
        res,
        "UNAUTHORIZED",
        "Session is invalid or expired",
        401,
      );
    }

    req.user = {
      id: resolvedUserId,
      role: decoded.role,
      permissions: decoded.permissions || [],
      sessionId: decoded.sessionId,
      organizationId: decoded.organizationId ?? null,
      stationId: decoded.stationId ?? null,
      isFirstLogin: decoded.isFirstLogin ?? false,
      assignedStation: decoded.assignedStation ?? null,
    };

    const isSuperAdmin = req.user.role === "SUPER_ADMIN";
    const path = req.originalUrl.toLowerCase();

    // Paths always allowed during first login
    const isAllowedPath =
      path.endsWith("/me") ||
      path.endsWith("/change-otp") ||
      path.endsWith("/logout");

    if (req.user.isFirstLogin && !isSuperAdmin && !isAllowedPath) {
      return sendError(
        res,
        "FORBIDDEN",
        "You must change your OTP on first login before accessing this endpoint",
        403,
      );
    }

    return next();
  } catch (error: any) {
    if (error?.name === "TokenExpiredError") {
      console.warn(
        `[AUTH_WARN] TokenExpiredError: JWT expired at ${error.expiredAt}`,
      );
    } else if (error?.name === "JsonWebTokenError") {
      console.warn(`[AUTH_WARN] JsonWebTokenError: ${error.message}`);
    } else {
      console.error("[AUTH_ERROR]", error);
    }
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
      return sendError(
        res,
        "FORBIDDEN",
        "Forbidden: insufficient permissions",
        403,
      );
    }

    return next();
  };
};
