import { RecentActivity } from "@/components/dashboard/recent-activity";
import { auth } from "@/auth";
import { getInternalUrl } from "@/lib/utils";
import { Activity } from "lucide-react";

async function getActivity() {
  const res = await fetch(getInternalUrl("/api/parcel"), {
    cache: "no-store",
  });
  if (!res.ok) return [];
  return res.json();
}

export default async function ActivityFeedPage() {
  const activities = await getActivity();

  return (
    <div className="flex flex-col gap-5">
        {/* Header */}
        <div>
          <div className="flex items-center gap-2 mb-2">
            <span className="text-[10px] font-semibold uppercase tracking-[0.05em] text-indigo-600 bg-indigo-50 px-2.5 py-1 rounded-full">
              <span className="inline-block w-1.5 h-1.5 rounded-full bg-indigo-500 mr-1 animate-pulse align-middle" />
              Live
            </span>
          </div>
          <h1 className="text-[20px] font-semibold text-slate-800 tracking-tight">
            Activity Feed
          </h1>
          <p className="text-sm text-slate-400 font-medium mt-0.5">
            Real-time log of all system activities, parcel approvals, and
            terminal events.
          </p>
        </div>

        {/* Feed card */}
        <div>
          <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden">
            <div className="flex items-center justify-between px-6 py-4 border-b border-slate-50">
              <div className="flex items-center gap-2.5">
                <div className="w-7 h-7 bg-indigo-50 rounded-xl flex items-center justify-center">
                  <Activity
                    size={13}
                    className="text-indigo-500"
                    strokeWidth={2.5}
                  />
                </div>
                <span className="text-[14px] font-semibold text-slate-800">
                  System Logistics Log
                </span>
                {activities.length > 0 && (
                  <span className="ml-1 px-2 py-0.5 bg-slate-100 text-slate-500 text-[11px] font-semibold rounded-full">
                    {activities.length}
                  </span>
                )}
              </div>
              <span className="inline-flex items-center gap-1.5 text-[10px] font-semibold uppercase tracking-[0.15em] text-emerald-600 bg-emerald-50 px-2.5 py-1 rounded-full">
                <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-pulse" />
                Live Feed
              </span>
            </div>
            <div className="p-6">
              <RecentActivity activities={activities} />
            </div>
          </div>
        </div>
    </div>
  );
}
