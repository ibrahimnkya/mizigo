import type { NextAuthConfig } from "next-auth";
import { headers } from "next/headers";

function decodeJwt(token: string): any {
  try {
    const parts = token.split(".");
    if (parts.length !== 3) return null;
    const payload = parts[1];
    if (!payload) return null;
    const base64 = payload.replace(/-/g, "+").replace(/_/g, "/");
    return JSON.parse(globalThis.atob(base64));
  } catch {
    return null;
  }
}

export const authConfig: NextAuthConfig = {
  trustHost: true,
  pages: {
    signIn: "/login",
  },
  callbacks: {
    async redirect({ url, baseUrl }) {
      let currentOrigin = baseUrl;
      try {
        const reqHeaders = await headers();
        const host = reqHeaders.get("host");
        const protocol = reqHeaders.get("x-forwarded-proto") || "http";
        if (host) {
          currentOrigin = `${protocol}://${host}`;
        }
      } catch (_) {}

      if (url.startsWith("/")) {
        return `${currentOrigin}${url}`;
      }
      try {
        const urlObj = new URL(url);
        if (urlObj.origin === currentOrigin || urlObj.origin === baseUrl) {
          return url;
        }
      } catch (_) {}
      return currentOrigin;
    },
    authorized({ auth, request: { nextUrl } }) {
      const isLoggedIn = !!auth?.user;
      const pathname = nextUrl.pathname;

      // Define public routes that don't require authentication
      const isPublicRoute =
        pathname === "/" ||
        pathname.startsWith("/track") ||
        pathname.startsWith("/login") ||
        pathname.startsWith("/terms") ||
        pathname.startsWith("/privacy") ||
        pathname.startsWith("/api/public"); // For any public API calls if needed

      const isLoginPage = pathname.startsWith("/login");
      const isChangeOtpPage = pathname.startsWith("/change-otp");
      const userRole = auth?.user?.role;
      const isFirstLogin = !!(auth?.user as any)?.isFirstLogin;

      if (isPublicRoute) {
        if (isLoggedIn && isLoginPage) {
          if (isFirstLogin)
            return Response.redirect(new URL("/change-otp", nextUrl));
          return Response.redirect(new URL("/dashboard", nextUrl));
        }
        return true;
      }

      // Protect all other routes
      if (!isLoggedIn) return false;

      if (
        isFirstLogin &&
        !isChangeOtpPage &&
        !nextUrl.pathname.startsWith("/api")
      ) {
        return Response.redirect(new URL("/change-otp", nextUrl));
      }

      if (!isFirstLogin && isChangeOtpPage) {
        return Response.redirect(new URL("/dashboard", nextUrl));
      }

      // Role-based authorization
      if (pathname === "/dashboard") {
        if (userRole === "SUPER_ADMIN" || userRole === "ADMIN") {
          return Response.redirect(new URL("/reports/admin/overview", nextUrl));
        } else if (userRole === "OPERATOR") {
          return Response.redirect(new URL("/operator", nextUrl));
        }
      }

      // SUPER_ADMIN only routes
      const superAdminRoutes = [
        "/payments",
        "/admins",
        "/reports",
        "/settings",
        "/audit",
        "/users",
        "/vehicles",
        "/stations",
      ];
      if (
        superAdminRoutes.some((route) => pathname.startsWith(route)) &&
        userRole !== "SUPER_ADMIN"
      ) {
        // Special check for pages shared with ADMIN and OPERATOR
        const isSharedReport = pathname.startsWith("/reports");
        if (
          isSharedReport &&
          (userRole === "ADMIN" ||
            userRole === "SUPER_ADMIN" ||
            userRole === "OPERATOR")
        )
          return true;

        const sharedRoutes = ["/notifications", "/users", "/profile"];
        if (
          sharedRoutes.some((route) => pathname.startsWith(route)) &&
          (userRole === "ADMIN" ||
            userRole === "SUPER_ADMIN" ||
            userRole === "OPERATOR")
        )
          return true;

        // If it's a shared child route like /parcel or /dashboard, we handle it separately
        if (pathname.startsWith("/parcel") || pathname.startsWith("/dashboard"))
          return true;

        return Response.redirect(new URL("/dashboard", nextUrl));
      }

      // ADMIN only routes
      const adminOnlyRoutes = [
        "/my-payments",
        "/performance",
        "/admin/stations",
        "/admin/fleet",
      ];
      if (
        adminOnlyRoutes.some((route) => pathname.startsWith(route)) &&
        userRole !== "ADMIN" &&
        userRole !== "SUPER_ADMIN"
      ) {
        return Response.redirect(new URL("/dashboard", nextUrl));
      }

      return true;
    },
    async jwt({ token, user, trigger }) {
      if (trigger === "update") {
        token.isFirstLogin = false;
      }

      // Initial sign in: Populate the token and return it immediately
      if (user) {
        token.id = user.id;
        token.role = user.role;
        token.createdAt = (user as any).createdAt;
        token.permissions = (user as any).permissions;
        token.isFirstLogin = (user as any).isFirstLogin;
        token.stationId = (user as any).stationId;
        token.organizationId = (user as any).organizationId;
        token.accessToken = (user as any).token; // Map the initial backend JWT
        token.refreshToken = (user as any).refreshToken;
        token.deviceId = (user as any).deviceId;

        return token;
      }

      // If token already has an error, do not attempt to refresh
      if (token.error) {
        return token;
      }

      // If we don't have a refresh token, we can't refresh anyway
      if (!token.refreshToken) {
        return token;
      }

      // Decode the access token to check its expiration (robust, handles multiple calls and clock desync)
      const decoded = token.accessToken ? decodeJwt(token.accessToken as string) : null;
      if (decoded && decoded.exp) {
        // Access token is valid (with 10-second safety buffer), return it
        if (Date.now() / 1000 < decoded.exp - 10) {
          return token;
        }
      }

      // Access token has expired, try to update it using refreshAccessToken
      return refreshAccessToken(token);
    },
    async session({ session, token }) {
      if (token && session.user) {
        session.user.id = token.id as string;
        session.user.role = token.role as string;
        session.user.createdAt = token.createdAt as string;
        session.user.permissions = token.permissions as string[];
        (session.user as any).isFirstLogin = token.isFirstLogin as boolean;
        (session.user as any).stationId = token.stationId as string | null;
        (session.user as any).organizationId = token.organizationId as
          | string
          | null;
        (session.user as any).token = token.accessToken as string; // Provide newest token to the session
        (session.user as any).error = token.error;
      }
      return session;
    },
  },
  providers: [],
} satisfies NextAuthConfig;

async function refreshAccessToken(token: any) {
  try {
    const role = token.role as string;
    let refreshUrl = "/auth/refresh-token";

    if (role === "SUPER_ADMIN" || role === "ADMIN") {
      refreshUrl = "/auth/admin/refresh-token";
    } else if (role === "OPERATOR") {
      refreshUrl = "/auth/operator/refresh-token";
    }

    const url = `${process.env.NEXT_PUBLIC_API_URL || "http://localhost:3001/api/v1"}${refreshUrl}`;

    console.log(`[AUTH] Rotating token for role: ${role} at ${url}`);

    const response = await fetch(url, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        refreshToken: token.refreshToken,
        deviceId: token.deviceId || "web-portal-default",
      }),
    });

    const refreshedTokens = await response.json();

    if (!response.ok) {
      throw refreshedTokens;
    }

    return {
      ...token,
      accessToken: refreshedTokens.data.token,
      refreshToken: refreshedTokens.data.refreshToken ?? token.refreshToken, // Fall back to old refresh token
    };
  } catch (error) {
    console.error("[AUTH] Error refreshing access token:", error);

    return {
      ...token,
      error: "RefreshAccessTokenError",
    };
  }
}
