import type { NextAuthConfig } from 'next-auth';

export const authConfig: NextAuthConfig = {
    pages: {
        signIn: '/login',
    },
    callbacks: {
        authorized({ auth, request: { nextUrl } }) {
            const isLoggedIn = !!auth?.user;
            const isLoginPage = nextUrl.pathname.startsWith('/login');
            const isChangeOtpPage = nextUrl.pathname.startsWith('/change-otp');
            const userRole = auth?.user?.role;
            const isFirstLogin = (auth?.user as any)?.isFirstLogin;

            if (isLoginPage) {
                if (isLoggedIn) {
                    if (isFirstLogin) return Response.redirect(new URL('/change-otp', nextUrl));
                    return Response.redirect(new URL('/dashboard', nextUrl));
                }
                return true;
            }

            // Protect all other routes
            if (!isLoggedIn) return false;

            if (isFirstLogin && !isChangeOtpPage && !nextUrl.pathname.startsWith('/api')) {
                return Response.redirect(new URL('/change-otp', nextUrl));
            }

            if (!isFirstLogin && isChangeOtpPage) {
                return Response.redirect(new URL('/dashboard', nextUrl));
            }

            // Role-based authorization
            const pathname = nextUrl.pathname;

            // SUPER_ADMIN only routes
            const superAdminRoutes = ['/payments', '/admins', '/reports', '/settings', '/audit', '/users'];
            if (superAdminRoutes.some(route => pathname.startsWith(route)) && userRole !== 'SUPER_ADMIN') {
                // Special check for pages shared with ADMIN and OPERATOR
                const isSharedReport = pathname === '/reports' || pathname.startsWith('/reports/volume') || pathname.startsWith('/reports/turnaround');
                if (isSharedReport && (userRole === 'ADMIN' || userRole === 'SUPER_ADMIN' || userRole === 'OPERATOR')) return true;

                const sharedRoutes = ['/notifications', '/users'];
                if (sharedRoutes.some(route => pathname.startsWith(route)) && (userRole === 'ADMIN' || userRole === 'SUPER_ADMIN')) return true;

                // If it's a shared child route like /cargo or /dashboard, we handle it separately
                if (pathname.startsWith('/cargo') || pathname.startsWith('/dashboard')) return true;

                return Response.redirect(new URL('/dashboard', nextUrl));
            }

            // ADMIN only routes
            const adminOnlyRoutes = ['/my-payments', '/performance'];
            if (adminOnlyRoutes.some(route => pathname.startsWith(route)) && userRole !== 'ADMIN') {
                return Response.redirect(new URL('/dashboard', nextUrl));
            }

            return true;
        },
        async jwt({ token, user, trigger }) {
            if (trigger === "update") {
                token.isFirstLogin = false;
            }
            if (user) {
                token.id = user.id;
                token.role = user.role;
                token.createdAt = (user as any).createdAt;
                token.permissions = (user as any).permissions;
                token.isFirstLogin = (user as any).isFirstLogin;
                token.stationId = (user as any).stationId;
                token.organizationId = (user as any).organizationId;
            }
            return token;
        },
        async session({ session, token }) {
            if (token && session.user) {
                session.user.id = token.id as string;
                session.user.role = token.role as string;
                session.user.createdAt = token.createdAt as string;
                session.user.permissions = token.permissions as string[];
                (session.user as any).isFirstLogin = token.isFirstLogin as boolean;
                (session.user as any).stationId = token.stationId as string | null;
                (session.user as any).organizationId = token.organizationId as string | null;
            }
            return session;
        },

    },
    providers: [], // Add providers with an empty array for now
} satisfies NextAuthConfig;
