import NextAuth, { DefaultSession } from "next-auth";
import { JWT } from "next-auth/jwt";

declare module "next-auth" {
  /**
   * Returned by `useSession`, `getSession` and received as a prop on the `SessionProvider` React Context
   */
  interface Session {
    user: {
      id: string;
      role: string;
      createdAt: string;
      permissions: string[];
      organizationId?: string | null;
      stationId?: string | null;
    } & DefaultSession["user"];
  }

  interface User {
    id: string;
    role: string;
    createdAt: string;
    permissions: string[];
    organizationId?: string | null;
    stationId?: string | null;
  }
}

declare module "next-auth/jwt" {
  interface JWT {
    organizationId?: string | null;
    stationId?: string | null;
  }
}
