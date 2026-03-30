import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import jwt from "jsonwebtoken";
// Using crypto for a simple hash or assuming plain passwords for MVP? 
// The db has `passwordHash`. We should hash it, but without bcrypt in package.json, we might need to use Node `crypto` or `bcryptjs`. Let's use `crypto` for basic hashing if no bcrypt is available. 
import crypto from "crypto";

const router: Router = Router();
const JWT_SECRET = process.env.JWT_SECRET || "mizigo_super_secret_key_123";

// Helper function to hash password
const hashPassword = (password: string) => {
    return crypto.createHash("sha256").update(password).digest("hex");
};

// 1. Send OTP
router.post("/send-otp", async (req: Request, res: Response) => {
    try {
        const { phone, email } = req.body;

        if (!phone && !email) {
            return res.status(400).json({ success: false, error: "Phone or email is required" });
        }

        // Generate 4 digit OTP
        const otp = Math.floor(1000 + Math.random() * 9000).toString();
        const expiresAt = new Date(Date.now() + 10 * 60 * 1000); // 10 minutes

        // Using PasswordReset model as a generic OTP store
        await prisma.passwordReset.create({
            data: {
                phone: phone || null,
                email: email || null,
                code: otp,
                expiresAt
            }
        });

        // In a real app, send the SMS or Email here.
        console.log(`[MOCK] Sent OTP ${otp} to ${phone || email}`);

        res.json({ success: true, message: "OTP sent successfully", mockOtp: otp });
    } catch (error: any) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// 2. Register User
router.post("/register", async (req: Request, res: Response) => {
    try {
        const { phone, email, otp, firstName, lastName, password } = req.body;

        if ((!phone && !email) || !otp || !firstName || !lastName || !password) {
            return res.status(400).json({ success: false, error: "Missing required fields" });
        }

        const orConditions: any[] = [];
        if (phone) orConditions.push({ phone });
        if (email) orConditions.push({ email });

        // Verify OTP
        const validOtp = await prisma.passwordReset.findFirst({
            where: {
                OR: orConditions,
                code: otp,
                expiresAt: { gt: new Date() }
            },
            orderBy: { createdAt: 'desc' }
        });

        if (!validOtp) {
            return res.status(400).json({ success: false, error: "Invalid or expired OTP" });
        }

        // Check if user exists
        const existingUser = await prisma.user.findFirst({
            where: {
                OR: orConditions
            }
        });

        if (existingUser) {
            return res.status(400).json({ success: false, error: "User with this email or phone already exists" });
        }

        const fullName = `${firstName} ${lastName}`.trim();

        // Create user
        const user = await prisma.user.create({
            data: {
                name: fullName,
                email: email || `${phone}@mizigo.mock.tz`, // email is required in DB schema
                phone: phone || null,
                passwordHash: hashPassword(password),
                // roleId could be set to a default generic "RIDER" / "CUSTOMER" role if roles exist
            }
        });

        // Delete used DB otp
        await prisma.passwordReset.deleteMany({
            where: {
                OR: orConditions
            }
        });

        const token = jwt.sign({ id: user.id, name: user.name, role: user.roleId }, JWT_SECRET, { expiresIn: "30d" });

        res.status(201).json({
            success: true,
            data: {
                id: user.id,
                name: user.name,
                email: user.email,
                phone: user.phone,
                token
            }
        });
    } catch (error: any) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// 3. Login
router.post("/login", async (req: Request, res: Response) => {
    try {
        const { phone, email, password } = req.body;

        if ((!phone && !email) || !password) {
            return res.status(400).json({ success: false, error: "Phone/Email and password are required" });
        }

        const orConditions: any[] = [];
        if (phone) orConditions.push({ phone });
        if (email) orConditions.push({ email });

        const user = await prisma.user.findFirst({
            where: {
                OR: orConditions
            }
        });

        if (!user || user.passwordHash !== hashPassword(password)) {
            return res.status(401).json({ success: false, error: "Invalid credentials" });
        }

        const token = jwt.sign({ id: user.id, name: user.name, role: user.roleId }, JWT_SECRET, { expiresIn: "30d" });

        res.json({
            success: true,
            data: {
                id: user.id,
                name: user.name,
                email: user.email,
                phone: user.phone,
                token
            }
        });
    } catch (error: any) {
        res.status(500).json({ success: false, error: error.message });
    }
});

export default router;
