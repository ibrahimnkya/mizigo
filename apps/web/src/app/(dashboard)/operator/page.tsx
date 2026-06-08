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
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 animate-in fade-in duration-700">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-12 w-full">
        {/* Welcome & Dashboard */}
        <UnifiedDashboardContent
          role={session.user.role}
          userName={session.user.name || "Operator"}
        />

        {/* Recent Activities */}
        <div className="space-y-6">
          <p className="text-[10px] font-black uppercase tracking-[0.25em] text-slate-400">
            Recent Station Activity
          </p>
          <div className="bg-white rounded-[10px] border border-slate-100 shadow-md overflow-hidden p-2">
            <RecentActivity activities={dashboardData.recentActivity} />
          </div>
        </div>
      </div>
    </div>
  );
}
