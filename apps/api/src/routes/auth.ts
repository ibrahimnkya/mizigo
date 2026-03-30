import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import jwt from "jsonwebtoken";
import crypto from "crypto";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate } from "../middleware/auth";
import { rateLimit } from "../middleware/rate-limit";

const router: Router = Router();
const JWT_SECRET = process.env.JWT_SECRET || "mizigo_super_secret_key_123";

const hashPassword = (password: string) => {
  return crypto.createHash("sha256").update(password).digest("hex");
};

const buildUserClaims = async (userId: string) => {
  const user = await prisma.user.findUnique({
    where: { id: userId },
    include: {
      station: { select: { id: true, name: true, code: true } },
      role: {
        include: {
          permissions: {
            include: {
              permission: true,
            },
          },
        },
      },
    },
  });

  if (!user) return null;

  const permissions = user.role?.permissions.map((rp) => rp.permission.name) ?? [];
  return {
    id: user.id,
    name: user.name,
    role: user.role?.name || user.roleId || "USER",
    permissions,
    organizationId: user.organizationId ?? null,
    stationId: user.stationId ?? null,
    assignedStation: user.station
      ? { id: user.station.id, name: user.station.name, code: user.station.code }
      : null,
  };
};

const exceededResetLimit = async (phone?: string, email?: string) => {
  const oneWeekAgo = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000);
  const count = await prisma.passwordReset.count({
    where: {
      createdAt: { gte: oneWeekAgo },
      OR: [{ phone: phone || undefined }, { email: email || undefined }],
    },
  });
  return count >= 5;
};

router.post("/send-otp", rateLimit({ windowMs: 15 * 60 * 1000, maxRequests: 5, keyPrefix: "auth-send-otp" }), async (req: Request, res: Response) => {
  return sendError(res, "DEPRECATED_ENDPOINT", "Use /auth/operator/reset-otp for operator OTP flows", 410);
});

router.post("/register", rateLimit({ windowMs: 15 * 60 * 1000, maxRequests: 10, keyPrefix: "auth-register" }), async (req: Request, res: Response) => {
  return sendError(res, "DEPRECATED_ENDPOINT", "Use /admins or /operators endpoints for account creation", 410);
});

router.post("/login", rateLimit({ windowMs: 15 * 60 * 1000, maxRequests: 10, keyPrefix: "auth-login" }), async (req: Request, res: Response) => {
  return sendError(res, "DEPRECATED_ENDPOINT", "Use /auth/admin/login or /auth/operator/login", 410);
});

router.get("/me", authenticate, async (req: Request, res: Response) => {
  try {
    if (!req.user) {
      return sendError(res, "UNAUTHORIZED", "Unauthorized", 401);
    }

    const user = await prisma.user.findUnique({
      where: { id: req.user.id },
      include: {
        station: { select: { id: true, name: true, code: true } },
        role: {
          include: {
            permissions: {
              include: { permission: true },
            },
          },
        },
      },
    });

    if (!user) {
      return sendError(res, "NOT_FOUND", "User not found", 404);
    }

    return sendSuccess(res, {
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone,
      role: user.role?.name || user.roleId || "USER",
      permissions: user.role?.permissions.map((rp) => rp.permission.name) ?? [],
      organizationId: user.organizationId ?? null,
      stationId: user.stationId ?? null,
      assignedStation: user.station
        ? { id: user.station.id, name: user.station.name, code: user.station.code }
        : null,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// Admin flow aliases (separate contract).
router.post("/admin/login", rateLimit({ windowMs: 15 * 60 * 1000, maxRequests: 10, keyPrefix: "auth-admin-login" }), async (req: Request, res: Response) => {
  try {
    const { phone, email, password } = req.body;
    if ((!phone && !email) || !password) {
      return sendError(res, "VALIDATION_ERROR", "Phone/Email and password are required", 400);
    }

    const orConditions: any[] = [];
    if (phone) orConditions.push({ phone });
    if (email) orConditions.push({ email });

    const user = await prisma.user.findFirst({ where: { OR: orConditions } });
    if (!user || user.passwordHash !== hashPassword(password)) {
      return sendError(res, "UNAUTHORIZED", "Invalid credentials", 401);
    }

    const claims = await buildUserClaims(user.id);
    if (!claims) return sendError(res, "NOT_FOUND", "User not found", 404);
    const token = jwt.sign(claims, JWT_SECRET, { expiresIn: "30d" });
    return sendSuccess(res, { ...claims, token });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/admin/refresh-token", authenticate, async (req: Request, res: Response) => {
  try {
    if (!req.user) return sendError(res, "UNAUTHORIZED", "Unauthorized", 401);
    const claims = await buildUserClaims(req.user.id);
    if (!claims) return sendError(res, "NOT_FOUND", "User not found", 404);
    const token = jwt.sign(claims, JWT_SECRET, { expiresIn: "30d" });
    return sendSuccess(res, { token });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/admin/logout", authenticate, (_req: Request, res: Response) => {
  return sendSuccess(res, { message: "Logged out successfully" });
});

// Operator flow aliases (separate contract).
router.post("/operator/login", rateLimit({ windowMs: 15 * 60 * 1000, maxRequests: 10, keyPrefix: "auth-operator-login" }), async (req: Request, res: Response) => {
  try {
    const { phone, otp } = req.body;
    if (!phone || !otp) return sendError(res, "VALIDATION_ERROR", "phone and otp are required", 400);

    const otpRecord = await prisma.passwordReset.findFirst({
      where: { phone, code: String(otp), expiresAt: { gt: new Date() } },
      orderBy: { createdAt: "desc" },
    });
    if (!otpRecord) return sendError(res, "UNAUTHORIZED", "Invalid or expired OTP", 401);

    const user = await prisma.user.findFirst({ where: { phone } });
    if (!user) return sendError(res, "NOT_FOUND", "Operator not found", 404);

    const claims = await buildUserClaims(user.id);
    if (!claims) return sendError(res, "NOT_FOUND", "Operator claims not found", 404);

    const token = jwt.sign(claims, JWT_SECRET, { expiresIn: "30d" });
    await prisma.passwordReset.deleteMany({
      where: { phone, code: String(otp) },
    });
    return sendSuccess(res, { ...claims, token });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/operator/reset-otp", rateLimit({ windowMs: 60 * 60 * 1000, maxRequests: 5, keyPrefix: "auth-operator-reset-otp" }), async (req: Request, res: Response) => {
  try {
    const { phone, email } = req.body;
    if (!phone && !email) return sendError(res, "VALIDATION_ERROR", "phone or email is required", 400);
    if (await exceededResetLimit(phone, email)) {
      return sendError(res, "FORBIDDEN", "OTP reset limit exceeded (max 5/week)", 403);
    }

    const otp = Math.floor(100000 + Math.random() * 900000).toString();
    const expiresAt = new Date(Date.now() + 5 * 60 * 1000);
    await prisma.passwordReset.create({ data: { phone: phone || null, email: email || null, code: otp, expiresAt } });
    return sendSuccess(res, { message: "OTP reset code sent", mockOtp: otp });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/operator/change-otp", authenticate, async (req: Request, res: Response) => {
  try {
    const { newOtp } = req.body;
    if (!newOtp || String(newOtp).length !== 6) {
      return sendError(res, "VALIDATION_ERROR", "newOtp must be a 6-digit value", 400);
    }
    if (!req.user) return sendError(res, "UNAUTHORIZED", "Unauthorized", 401);

    await prisma.user.update({
      where: { id: req.user.id },
      data: { loginCode: crypto.createHash("sha256").update(String(newOtp)).digest("hex"), isFirstLogin: false },
    });
    return sendSuccess(res, { message: "OTP changed successfully" });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
