import { RecentActivity } from "@/components/dashboard/recent-activity";
import { auth } from "@/auth";
import { Activity } from "lucide-react";

async function getActivity() {
    const res = await fetch("http://localhost:3000/api/cargo", { cache: "no-store" });
    if (!res.ok) return [];
    return res.json();
}

export default async function ActivityFeedPage() {
    const activities = await getActivity();

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                {/* Header */}
                <div>
                    <div className="flex items-center gap-2 mb-2">
                        <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-indigo-600 bg-indigo-50 px-2.5 py-1 rounded-full">
                            <span className="inline-block w-1.5 h-1.5 rounded-full bg-indigo-500 mr-1 animate-pulse align-middle" />
                            Live
                        </span>
                    </div>
                    <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Activity Feed</h1>
                    <p className="text-sm text-slate-400 font-medium mt-0.5">
                        Real-time log of all system activities, cargo approvals, and terminal events.
                    </p>
                </div>

                {/* Feed card */}
                <div>
                    <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden">
                        <div className="flex items-center justify-between px-6 py-4 border-b border-slate-50">
                            <div className="flex items-center gap-2.5">
                                <div className="w-7 h-7 bg-indigo-50 rounded-lg flex items-center justify-center">
                                    <Activity size={13} className="text-indigo-500" strokeWidth={2.5} />
                                </div>
                                <span className="text-[14px] font-extrabold text-slate-800">System Logistics Log</span>
                                {activities.length > 0 && (
                                    <span className="ml-1 px-2 py-0.5 bg-slate-100 text-slate-500 text-[11px] font-extrabold rounded-full">
                                        {activities.length}
                                    </span>
                                )}
                            </div>
                            <span className="inline-flex items-center gap-1.5 text-[10px] font-extrabold uppercase tracking-[0.15em] text-emerald-600 bg-emerald-50 px-2.5 py-1 rounded-full">
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
        </div>
    );
}