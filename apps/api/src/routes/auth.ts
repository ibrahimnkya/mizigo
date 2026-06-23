import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import jwt from "jsonwebtoken";
import crypto from "crypto";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate } from "../middleware/auth";
import { rateLimit } from "../middleware/rate-limit";
import { normalizePhoneNumber } from "../lib/phone";
import { sendSms } from "../lib/sms";
import { trackLogin, trackLogout } from "../lib/redis";

const router: Router = Router();
const JWT_SECRET = process.env.JWT_SECRET || "mizigo_super_secret_key_123";
const ACCESS_TOKEN_TTL = process.env.ACCESS_TOKEN_TTL || "15m";
const REFRESH_TOKEN_TTL_DAYS = Number(process.env.REFRESH_TOKEN_TTL_DAYS || 30);
const OTP_RESET_LIMIT_WINDOW_HOURS = Number(
  process.env.OTP_RESET_LIMIT_WINDOW_HOURS || 24,
);
const OTP_RESET_LIMIT_MAX_ATTEMPTS = Number(
  process.env.OTP_RESET_LIMIT_MAX_ATTEMPTS || 3,
);

const hashOtp = (otp: string) => {
  return crypto.createHash("sha256").update(otp).digest("hex");
};

const hashToken = (token: string) =>
  crypto.createHash("sha256").update(token).digest("hex");

const issueSessionTokens = async (params: {
  userId: string;
  deviceId: string;
  claims: Awaited<ReturnType<typeof buildUserClaims>>;
}) => {
  if (!params.claims) throw new Error("Claims are required");

  await prisma.authSession.deleteMany({
    where: { userId: params.userId, deviceId: params.deviceId },
  });

  const expiresAt = new Date(
    Date.now() + REFRESH_TOKEN_TTL_DAYS * 24 * 60 * 60 * 1000,
  );
  const session = await prisma.authSession.create({
    data: {
      userId: params.userId,
      deviceId: params.deviceId,
      refreshTokenHash: "",
      expiresAt,
    },
  });

  const accessToken = jwt.sign(
    { ...params.claims, typ: "access", sessionId: session.id },
    JWT_SECRET,
    { expiresIn: ACCESS_TOKEN_TTL as any },
  );
  const refreshToken = jwt.sign(
    {
      sub: params.userId,
      sid: session.id,
      did: params.deviceId,
      typ: "refresh",
    },
    JWT_SECRET,
    { expiresIn: `${REFRESH_TOKEN_TTL_DAYS}d` },
  );

  await prisma.authSession.update({
    where: { id: session.id },
    data: { refreshTokenHash: hashToken(refreshToken), expiresAt },
  });

  await trackLogin(params.userId, params.deviceId);

  return { accessToken, refreshToken, sessionId: session.id, expiresAt };
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

  const permissions =
    user.role?.permissions.map((rp) => rp.permission.name) ?? [];
  return {
    userId: user.id,
    id: user.id,
    name: user.name,
    email: user.email,
    phone: user.phone,
    role: user.role?.name || user.roleId || "USER",
    permissions,
    organizationId: user.organizationId ?? null,
    stationId: user.stationId ?? null,
    isFirstLogin: user.isFirstLogin,
    assignedStation: user.station
      ? {
          id: user.station.id,
          name: user.station.name,
          code: user.station.code,
        }
      : null,
  };
};

const exceededResetLimit = async (phone?: string, email?: string) => {
  const windowStart = new Date(
    Date.now() - OTP_RESET_LIMIT_WINDOW_HOURS * 60 * 60 * 1000,
  );
  const count = await prisma.passwordReset.count({
    where: {
      createdAt: { gte: windowStart },
      OR: [{ phone: phone || undefined }, { email: email || undefined }],
    },
  });
  return count >= OTP_RESET_LIMIT_MAX_ATTEMPTS;
};

router.post(
  "/send-otp",
  rateLimit({ windowMs: 15 * 60 * 1000, limit: 5 }),
  async (req: Request, res: Response) => {
    return sendError(
      res,
      "DEPRECATED_ENDPOINT",
      "Use /auth/operator/reset-otp for operator OTP flows",
      410,
    );
  },
);

router.post(
  "/register",
  rateLimit({ windowMs: 15 * 60 * 1000, limit: 10 }),
  async (req: Request, res: Response) => {
    return sendError(
      res,
      "DEPRECATED_ENDPOINT",
      "Use /admins or /operators endpoints for account creation",
      410,
    );
  },
);

router.post(
  "/login",
  rateLimit({ windowMs: 15 * 60 * 1000, limit: 10 }),
  async (req: Request, res: Response) => {
    return sendError(
      res,
      "DEPRECATED_ENDPOINT",
      "Use /auth/admin/login or /auth/operator/login",
      410,
    );
  },
);

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
      isFirstLogin: user.isFirstLogin,
      assignedStation: user.station
        ? {
            id: user.station.id,
            name: user.station.name,
            code: user.station.code,
          }
        : null,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post(
  "/admin/login",
  rateLimit({ windowMs: 15 * 60 * 1000, limit: 100 }),
  async (req: Request, res: Response) => {
    try {
      const { phone, email, otp, deviceId } = req.body;
      const normalizedPhone = normalizePhoneNumber(phone);
      if ((!phone && !email) || !otp || !deviceId) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "phone/email, otp, and deviceId are required",
          400,
        );
      }

      const orConditions: any[] = [];
      if (normalizedPhone) orConditions.push({ phone: normalizedPhone });
      if (phone && normalizedPhone !== phone) orConditions.push({ phone });
      if (email) orConditions.push({ email });

      const user = await prisma.user.findFirst({ where: { OR: orConditions } });
      if (!user) {
        console.error(
          `[AUTH DEBUG] User not found for conditions:`,
          JSON.stringify(orConditions),
        );
        return sendError(res, "UNAUTHORIZED", "Invalid credentials", 401);
      }

      const providedOtpHash = hashOtp(String(otp));
      const loginCodeMatch =
        !!user.loginCode && user.loginCode === providedOtpHash;

      console.log(`[AUTH DEBUG] User found: ${user.email}`);
      console.log(`[AUTH DEBUG] Provided Hash: ${providedOtpHash}`);
      console.log(`[AUTH DEBUG] Database Hash: ${user.loginCode}`);

      if (!loginCodeMatch) {
        console.warn(
          `[AUTH DEBUG] Password/OTP mismatch for user: ${user.email}`,
        );
        return sendError(res, "UNAUTHORIZED", "Invalid credentials", 401);
      }

      const claims = await buildUserClaims(user.id);
      if (!claims) return sendError(res, "NOT_FOUND", "User not found", 404);
      const session = await issueSessionTokens({
        userId: user.id,
        deviceId: String(deviceId),
        claims,
      });
      return sendSuccess(res, {
        ...claims,
        mustChangeOtp: !!claims.isFirstLogin,
        token: session.accessToken,
        refreshToken: session.refreshToken,
      });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.post("/admin/refresh-token", async (req: Request, res: Response) => {
  try {
    const { refreshToken, deviceId } = req.body as {
      refreshToken?: string;
      deviceId?: string;
    };
    if (!refreshToken || !deviceId) {
      return sendError(
        res,
        "VALIDATION_ERROR",
        "refreshToken and deviceId are required",
        400,
      );
    }

    let decoded: jwt.JwtPayload;
    try {
      decoded = jwt.verify(refreshToken, JWT_SECRET) as jwt.JwtPayload;
    } catch {
      return sendError(res, "UNAUTHORIZED", "Invalid refresh token", 401);
    }
    if (decoded.typ !== "refresh" || !decoded.sid || !decoded.sub) {
      return sendError(res, "UNAUTHORIZED", "Invalid refresh token type", 401);
    }

    const existing = await prisma.authSession.findUnique({
      where: { id: String(decoded.sid) },
    });
    if (
      !existing ||
      existing.userId !== String(decoded.sub) ||
      existing.deviceId !== String(deviceId) ||
      existing.expiresAt <= new Date() ||
      existing.revokedAt
    ) {
      return sendError(
        res,
        "UNAUTHORIZED",
        "Session expired or not found",
        401,
      );
    }

    const matches = existing.refreshTokenHash === hashToken(refreshToken);
    if (!matches) {
      await prisma.authSession.updateMany({
        where: { userId: existing.userId, revokedAt: null },
        data: { revokedAt: new Date() },
      });
      return sendError(
        res,
        "UNAUTHORIZED",
        "Refresh token reuse detected",
        401,
      );
    }

    await prisma.authSession.delete({ where: { id: existing.id } });

    const claims = await buildUserClaims(existing.userId);
    if (!claims) return sendError(res, "NOT_FOUND", "User not found", 404);
    const session = await issueSessionTokens({
      userId: existing.userId,
      deviceId: String(deviceId),
      claims,
    });

    return sendSuccess(res, {
      token: session.accessToken,
      refreshToken: session.refreshToken,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/operator/refresh-token", async (req: Request, res: Response) => {
  try {
    const { refreshToken, deviceId } = req.body as {
      refreshToken?: string;
      deviceId?: string;
    };
    if (!refreshToken || !deviceId) {
      return sendError(
        res,
        "VALIDATION_ERROR",
        "refreshToken and deviceId are required",
        400,
      );
    }

    let decoded: jwt.JwtPayload;
    try {
      decoded = jwt.verify(refreshToken, JWT_SECRET) as jwt.JwtPayload;
    } catch {
      return sendError(res, "UNAUTHORIZED", "Invalid refresh token", 401);
    }
    if (decoded.typ !== "refresh" || !decoded.sid || !decoded.sub) {
      return sendError(res, "UNAUTHORIZED", "Invalid refresh token type", 401);
    }

    const existing = await prisma.authSession.findUnique({
      where: { id: String(decoded.sid) },
    });
    if (
      !existing ||
      existing.userId !== String(decoded.sub) ||
      existing.deviceId !== String(deviceId) ||
      existing.expiresAt <= new Date() ||
      existing.revokedAt
    ) {
      return sendError(
        res,
        "UNAUTHORIZED",
        "Session expired or not found",
        401,
      );
    }

    const matches = existing.refreshTokenHash === hashToken(refreshToken);
    if (!matches) {
      await prisma.authSession.updateMany({
        where: { userId: existing.userId, revokedAt: null },
        data: { revokedAt: new Date() },
      });
      return sendError(
        res,
        "UNAUTHORIZED",
        "Refresh token reuse detected",
        401,
      );
    }

    await prisma.authSession.delete({ where: { id: existing.id } });

    const claims = await buildUserClaims(existing.userId);
    if (!claims) return sendError(res, "NOT_FOUND", "User not found", 404);
    const session = await issueSessionTokens({
      userId: existing.userId,
      deviceId: String(deviceId),
      claims,
    });

    return sendSuccess(res, {
      token: session.accessToken,
      refreshToken: session.refreshToken,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/refresh-token", async (req: Request, res: Response) => {
  try {
    const { refreshToken, deviceId } = req.body as {
      refreshToken?: string;
      deviceId?: string;
    };
    if (!refreshToken || !deviceId) {
      return sendError(
        res,
        "VALIDATION_ERROR",
        "refreshToken and deviceId are required",
        400,
      );
    }

    let decoded: jwt.JwtPayload;
    try {
      decoded = jwt.verify(refreshToken, JWT_SECRET) as jwt.JwtPayload;
    } catch {
      return sendError(res, "UNAUTHORIZED", "Invalid refresh token", 401);
    }
    if (decoded.typ !== "refresh" || !decoded.sid || !decoded.sub) {
      return sendError(res, "UNAUTHORIZED", "Invalid refresh token type", 401);
    }

    const existing = await prisma.authSession.findUnique({
      where: { id: String(decoded.sid) },
    });
    if (
      !existing ||
      existing.userId !== String(decoded.sub) ||
      existing.deviceId !== String(deviceId) ||
      existing.expiresAt <= new Date() ||
      existing.revokedAt
    ) {
      return sendError(
        res,
        "UNAUTHORIZED",
        "Session expired or not found",
        401,
      );
    }

    const matches = existing.refreshTokenHash === hashToken(refreshToken);
    if (!matches) {
      await prisma.authSession.updateMany({
        where: { userId: existing.userId, revokedAt: null },
        data: { revokedAt: new Date() },
      });
      return sendError(
        res,
        "UNAUTHORIZED",
        "Refresh token reuse detected",
        401,
      );
    }

    await prisma.authSession.delete({ where: { id: existing.id } });

    const claims = await buildUserClaims(existing.userId);
    if (!claims) return sendError(res, "NOT_FOUND", "User not found", 404);
    const session = await issueSessionTokens({
      userId: existing.userId,
      deviceId: String(deviceId),
      claims,
    });

    return sendSuccess(res, {
      token: session.accessToken,
      refreshToken: session.refreshToken,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post(
  "/admin/logout",
  authenticate,
  async (req: Request, res: Response) => {
    if (req.user?.sessionId) {
      await prisma.authSession.updateMany({
        where: { id: req.user.sessionId, revokedAt: null },
        data: { revokedAt: new Date() },
      });

      // De-track real-time metric
      await trackLogout(req.user.id, req.user.deviceId || "unknown");
    }
    return sendSuccess(res, { message: "Logged out successfully" });
  },
);

router.post(
  "/check-phone",
  rateLimit({ windowMs: 15 * 60 * 1000, limit: 100 }),
  async (req: Request, res: Response) => {
    try {
      const { phone } = req.body;
      const normalizedPhone = normalizePhoneNumber(phone);
      if (!normalizedPhone) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "phone is required",
          400,
        );
      }

      const orConditions: any[] = [];
      orConditions.push({ phone: normalizedPhone });
      if (phone && normalizedPhone !== phone) {
        orConditions.push({ phone });
      }

      const user = await prisma.user.findFirst({
        where: {
          OR: orConditions,
        },
      });

      if (!user) {
        return sendSuccess(res, { available: false, name: null });
      }

      return sendSuccess(res, { available: true, name: user.name });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  }
);

router.post(
  "/operator/login",
  rateLimit({ windowMs: 15 * 60 * 1000, limit: 100 }),
  async (req: Request, res: Response) => {
    try {
      const { phone, email, otp, deviceId } = req.body;
      const normalizedPhone = normalizePhoneNumber(phone);
      if ((!phone && !email) || !otp || !deviceId) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "phone/email, otp, and deviceId are required",
          400,
        );
      }

      const orConditions: any[] = [];
      if (normalizedPhone) orConditions.push({ phone: normalizedPhone });
      if (phone && normalizedPhone !== phone) orConditions.push({ phone });
      if (email) orConditions.push({ email });

      const user = await prisma.user.findFirst({ where: { OR: orConditions } });
      if (!user) {
        return sendError(res, "UNAUTHORIZED", "Invalid or expired OTP", 401);
      }

      let otpIsValid = false;

      // 1. Check permanent loginCode
      if (user.loginCode && user.loginCode === hashOtp(String(otp))) {
        otpIsValid = true;
      }

      // 2. Check temporary PasswordReset OTP
      if (!otpIsValid) {
        const orConditionsReset: any[] = [];
        if (normalizedPhone) orConditionsReset.push({ phone: normalizedPhone });
        if (phone && normalizedPhone !== phone) orConditionsReset.push({ phone });
        if (email) orConditionsReset.push({ email });

        const resetRecord = await prisma.passwordReset.findFirst({
          where: {
            OR: orConditionsReset,
            code: String(otp),
          },
          orderBy: {
            createdAt: "desc",
          },
        });

        if (resetRecord && resetRecord.expiresAt >= new Date()) {
          otpIsValid = true;

          // Consume the reset record
          await prisma.passwordReset.delete({
            where: { id: resetRecord.id },
          });

          // Mark user as needing to change password/OTP
          await prisma.user.update({
            where: { id: user.id },
            data: { isFirstLogin: true },
          });
        }
      }

      if (!otpIsValid) {
        return sendError(res, "UNAUTHORIZED", "Invalid or expired OTP", 401);
      }

      const claims = await buildUserClaims(user.id);
      if (!claims)
        return sendError(res, "NOT_FOUND", "Operator claims not found", 404);

      const session = await issueSessionTokens({
        userId: user.id,
        deviceId: String(deviceId),
        claims,
      });
      return sendSuccess(res, {
        ...claims,
        mustChangeOtp: !!claims.isFirstLogin,
        token: session.accessToken,
        refreshToken: session.refreshToken,
      });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.post(
  "/operator/reset-otp",
  rateLimit({ windowMs: 60 * 60 * 1000, limit: 5 }),
  async (req: Request, res: Response) => {
    try {
      const { phone, email } = req.body;
      const normalizedPhone = normalizePhoneNumber(phone);
      if (!normalizedPhone && !email)
        return sendError(
          res,
          "VALIDATION_ERROR",
          "phone or email is required",
          400,
        );

      const orConditions: any[] = [];
      if (normalizedPhone) orConditions.push({ phone: normalizedPhone });
      if (phone && normalizedPhone !== phone) orConditions.push({ phone });
      if (email) orConditions.push({ email });

      const user = await prisma.user.findFirst({
        where: {
          OR: orConditions,
        },
      });

      if (!user) {
        return sendError(
          res,
          "NOT_FOUND",
          "Account not found. Please contact an administrator.",
          404,
        );
      }

      if (await exceededResetLimit(normalizedPhone || undefined, email)) {
        return sendError(
          res,
          "FORBIDDEN",
          `OTP reset limit exceeded (max ${OTP_RESET_LIMIT_MAX_ATTEMPTS} in ${OTP_RESET_LIMIT_WINDOW_HOURS}h)`,
          403,
        );
      }

      const otp = Math.floor(100000 + Math.random() * 900000).toString();
      const expiresAt = new Date(Date.now() + 5 * 60 * 1000);
      await prisma.passwordReset.create({
        data: {
          phone: normalizedPhone || null,
          email: email || null,
          code: otp,
          expiresAt,
        },
      });

      // Send Real SMS
      if (normalizedPhone) {
        await sendSms({
          phoneNumber: normalizedPhone,
          message: `Your Mizigo Safety PIN is ${otp}. Valid for 5 minutes. Do not share.`,
          organizationId: null, // Global or fallback handle
        }).catch((e) => console.error("OTP SMS fail", e));
      }

      return sendSuccess(res, {
        message: "Security code dispatched to your registered device",
      });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.post(
  "/operator/change-otp",
  authenticate,
  async (req: Request, res: Response) => {
    try {
      const { newOtp } = req.body;
      if (!newOtp || String(newOtp).length !== 6) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "newOtp must be a 6-digit value",
          400,
        );
      }
      if (!req.user) return sendError(res, "UNAUTHORIZED", "Unauthorized", 401);

      await prisma.user.update({
        where: { id: req.user.id },
        data: { loginCode: hashOtp(String(newOtp)), isFirstLogin: false },
      });
      return sendSuccess(res, { message: "OTP changed successfully" });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.post(
  "/change-otp",
  authenticate,
  async (req: Request, res: Response) => {
    try {
      const { newOtp } = req.body;
      if (!newOtp || String(newOtp).length !== 6) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "newOtp must be a 6-digit value",
          400,
        );
      }
      if (!req.user) return sendError(res, "UNAUTHORIZED", "Unauthorized", 401);

      await prisma.user.update({
        where: { id: req.user.id },
        data: { loginCode: hashOtp(String(newOtp)), isFirstLogin: false },
      });
      return sendSuccess(res, { message: "OTP changed successfully" });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

export default router;
