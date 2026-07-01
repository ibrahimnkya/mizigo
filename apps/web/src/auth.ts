import NextAuth from "next-auth";
import { authConfig } from "./auth.config";
import Credentials from "next-auth/providers/credentials";
import { z } from "zod";
import { prisma } from "@repo/database";
import bcrypt from "bcryptjs";

async function getUserByEmail(email: string) {
  try {
    const user = await prisma.user.findUnique({
      where: { email },
      include: {
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
    return user;
  } catch (error) {
    console.error("Failed to fetch user by email:", error);
    return null;
  }
}

async function getUserByPhone(phone: string) {
  try {
    const user = await prisma.user.findUnique({
      where: { phone },
      include: {
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
    return user;
  } catch (error) {
    console.error("Failed to fetch user by phone:", error);
    return null;
  }
}

export const { auth, signIn, signOut, handlers } = NextAuth({
  ...authConfig,
  providers: [
    Credentials({
      credentials: {
        email: { label: "Email", type: "text" },
        otp: { label: "OTP", type: "password" },
        deviceId: { label: "Device ID", type: "text" },
      },
      async authorize(credentials) {
        const identifier = credentials?.email as string; // Standard name for email field in NextAuth
        const otp = credentials?.otp as string;
        const deviceId = (credentials?.deviceId ||
          "web-portal-default") as string;

        if (!identifier || !otp) return null;

        // Detect if identifier is Email or Phone Number
        const isEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(identifier);
        const isPhone = /^\d+$/.test(identifier.replace(/\D/g, ""));

        let loginUrl = "/auth/admin/login";
        let payload: any = { otp, deviceId };

        if (isEmail) {
          loginUrl = "/auth/admin/login";
          payload.email = identifier;
        } else if (isPhone) {
          loginUrl = "/auth/operator/login";
          payload.phone = identifier;
        } else {
          // Default to Admin if ambiguous, or handle as error
          payload.email = identifier;
        }

        try {
          // Server-side auth must bypass nginx to avoid POST→GET redirect.
          // NEXT_PUBLIC_API_URL is the public domain (goes through nginx);
          // API_INTERNAL_URL should be http://localhost:3002/api/v1 on the server.
          const baseUrl =
            process.env.API_INTERNAL_URL ||
            process.env.NEXT_PUBLIC_API_URL ||
            "http://localhost:3002/api/v1";
          const url = `${baseUrl}${loginUrl}`;

          console.log(
            `[AUTH] Attempting ${isEmail ? "Admin" : "Operator"} Login at ${url}`,
          );

          const response = await fetch(url, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(payload),
          });

          const result = await response.json();

          if (!response.ok || !result.success) {
            console.warn(
              `[AUTH] Login Failed. Status: ${response.status}`,
              result.message || result.error,
            );
            return null;
          }

          if (result.success && result.data) {
            console.log(`[AUTH] Login Successful for: ${identifier}`);
            const user = result.data;
            return {
              id: user.userId || user.id,
              name: user.name || (isPhone ? "Operator User" : "Admin User"),
              email: user.email || identifier,
              role: user.role,
              token: user.token,
              refreshToken: user.refreshToken,
              deviceId: deviceId,
              permissions: user.permissions || [],
              organizationId: user.organizationId,
              stationId: user.stationId,
              isFirstLogin:
                user.isFirstLogin === true || user.mustChangeOtp === true,
              createdAt: new Date().toISOString(),
            };
          }
          return null;
        } catch (error) {
          console.error("Multi-Role Login Exception:", error);
          return null;
        }
      },
    }),
  ],
}) as any;
