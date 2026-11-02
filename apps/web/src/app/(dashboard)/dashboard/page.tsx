import { redirect } from "next/navigation";
import { auth } from "@/auth";

/**
 * /dashboard has no screen of its own: send each role to its home page.
 * (The auth middleware normally does this first; this is the fallback.)
 */
export default async function DashboardPage() {
  const session = await auth();
  const role = (session?.user as { role?: string } | undefined)?.role;
  if (!session) redirect("/login");
  if (role === "SUPER_ADMIN" || role === "ADMIN") redirect("/reports/admin/overview");
  redirect("/operator");
}
