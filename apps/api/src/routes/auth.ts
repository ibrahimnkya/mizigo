import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import jwt from "jsonwebtoken";
import crypto from "crypto";
import { sendError, sendSuccess } from "../lib/api-response";

const router: Router = Router();
const JWT_SECRET = process.env.JWT_SECRET || "mizigo_super_secret_key_123";

const hashPassword = (password: string) => {
  return crypto.createHash("sha256").update(password).digest("hex");
};

router.post("/send-otp", async (req: Request, res: Response) => {
  try {
    const { phone, email } = req.body;

    if (!phone && !email) {
      return sendError(res, "VALIDATION_ERROR", "Phone or email is required", 400);
    }

    const otp = Math.floor(1000 + Math.random() * 9000).toString();
    const expiresAt = new Date(Date.now() + 10 * 60 * 1000);

    await prisma.passwordReset.create({
      data: {
        phone: phone || null,
        email: email || null,
        code: otp,
        expiresAt,
      },
    });

    console.log(`[MOCK] Sent OTP ${otp} to ${phone || email}`);

    return sendSuccess(res, { message: "OTP sent successfully", mockOtp: otp });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/register", async (req: Request, res: Response) => {
  try {
    const { phone, email, otp, firstName, lastName, password } = req.body;

    if ((!phone && !email) || !otp || !firstName || !lastName || !password) {
      return sendError(res, "VALIDATION_ERROR", "Missing required fields", 400);
    }

    const orConditions: any[] = [];
    if (phone) orConditions.push({ phone });
    if (email) orConditions.push({ email });

    const validOtp = await prisma.passwordReset.findFirst({
      where: {
        OR: orConditions,
        code: otp,
        expiresAt: { gt: new Date() },
      },
      orderBy: { createdAt: "desc" },
    });

    if (!validOtp) {
      return sendError(res, "VALIDATION_ERROR", "Invalid or expired OTP", 400);
    }

    const existingUser = await prisma.user.findFirst({
      where: {
        OR: orConditions,
      },
    });

    if (existingUser) {
      return sendError(res, "CONFLICT", "User with this email or phone already exists", 409);
    }

    const fullName = `${firstName} ${lastName}`.trim();

    const user = await prisma.user.create({
      data: {
        name: fullName,
        email: email || `${phone}@mizigo.mock.tz`,
        phone: phone || null,
        passwordHash: hashPassword(password),
      },
    });

    await prisma.passwordReset.deleteMany({
      where: {
        OR: orConditions,
      },
    });

    const token = jwt.sign({ id: user.id, name: user.name, role: user.roleId }, JWT_SECRET, { expiresIn: "30d" });

    return sendSuccess(
      res,
      {
        id: user.id,
        name: user.name,
        email: user.email,
        phone: user.phone,
        token,
      },
      201,
    );
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/login", async (req: Request, res: Response) => {
  try {
    const { phone, email, password } = req.body;

    if ((!phone && !email) || !password) {
      return sendError(res, "VALIDATION_ERROR", "Phone/Email and password are required", 400);
    }

    const orConditions: any[] = [];
    if (phone) orConditions.push({ phone });
    if (email) orConditions.push({ email });

    const user = await prisma.user.findFirst({
      where: {
        OR: orConditions,
      },
    });

    if (!user || user.passwordHash !== hashPassword(password)) {
      return sendError(res, "UNAUTHORIZED", "Invalid credentials", 401);
    }

    const token = jwt.sign({ id: user.id, name: user.name, role: user.roleId }, JWT_SECRET, { expiresIn: "30d" });

    return sendSuccess(res, {
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone,
      token,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
