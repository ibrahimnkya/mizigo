import { auth } from "@/auth";
import { UnifiedDashboardContent } from "@/components/dashboard/unified-dashboard-content";
import { RecentActivity } from "@/components/dashboard/recent-activity";
import { getStats } from "@/lib/stats";

export default async function OperatorHomePage() {
  const session = await auth();
  if (!session?.user) return null;

  const dashboardData = (await getStats(session.user)) || {
    recentActivity: [],
  };

  return (
    <div className="flex flex-col gap-5">
        {/* Welcome & Dashboard */}
        <UnifiedDashboardContent
          role={session.user.role}
          userName={session.user.name || "Operator"}
        />

        {/* Recent Activities */}
        <div className="space-y-4">
          <p className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
            Recent Station Activity
          </p>
          <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden">
            <RecentActivity activities={dashboardData.recentActivity} />
          </div>
        </div>
    </div>
  );
}
