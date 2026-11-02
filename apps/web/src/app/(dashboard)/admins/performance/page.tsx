import { BarChart3, TrendingUp } from "lucide-react";

export default function AdminPerformancePage() {
  return (
    <div className="flex flex-col gap-5">
        <div>
          <div className="flex items-center gap-2 mb-2">
            <span className="text-[10px] font-semibold uppercase tracking-[0.05em] text-sky-600 bg-sky-50 px-2.5 py-1 rounded-full">
              Analytics
            </span>
          </div>
          <h1 className="text-[20px] font-semibold text-slate-800 tracking-tight">
            Admin Performance
          </h1>
          <p className="text-sm text-slate-400 font-medium mt-0.5">
            Comparative metrics for operator efficiency and approval rates.
          </p>
        </div>

        <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden">
          <div className="flex items-center gap-2.5 px-6 py-4 border-b border-slate-50">
            <div className="w-7 h-7 bg-sky-50 rounded-xl flex items-center justify-center">
              <BarChart3 size={13} className="text-sky-500" strokeWidth={2.5} />
            </div>
            <span className="text-[14px] font-semibold text-slate-800">
              Efficiency Metrics
            </span>
          </div>

          <div className="flex flex-col items-center justify-center py-28 gap-4 text-slate-300">
            <div className="w-14 h-14 bg-sky-50 rounded-xl flex items-center justify-center">
              <TrendingUp
                size={24}
                strokeWidth={1.5}
                className="text-sky-200"
              />
            </div>
            <div className="text-center">
              <p className="text-sm font-semibold text-slate-400">
                Coming soon
              </p>
              <p className="text-[12px] text-slate-300 mt-0.5">
                Performance leaderboard and analytics coming soon
              </p>
            </div>
          </div>
        </div>
    </div>
  );
}
