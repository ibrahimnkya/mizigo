import { BarChart3, TrendingUp } from "lucide-react";

export default function AdminPerformancePage() {
    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                <div>
                    <div className="flex items-center gap-2 mb-2">
                        <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-sky-600 bg-sky-50 px-2.5 py-1 rounded-full">
                            Analytics
                        </span>
                    </div>
                    <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Admin Performance</h1>
                    <p className="text-sm text-slate-400 font-medium mt-0.5">Comparative metrics for operator efficiency and approval rates.</p>
                </div>

                <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden">
                    <div className="flex items-center gap-2.5 px-6 py-4 border-b border-slate-50">
                        <div className="w-7 h-7 bg-sky-50 rounded-lg flex items-center justify-center">
                            <BarChart3 size={13} className="text-sky-500" strokeWidth={2.5} />
                        </div>
                        <span className="text-[14px] font-extrabold text-slate-800">Efficiency Metrics</span>
                    </div>

                    <div className="flex flex-col items-center justify-center py-28 gap-4 text-slate-300">
                        <div className="w-14 h-14 bg-sky-50 rounded-2xl flex items-center justify-center">
                            <TrendingUp size={24} strokeWidth={1.5} className="text-sky-200" />
                        </div>
                        <div className="text-center">
                            <p className="text-sm font-semibold text-slate-400">Coming soon</p>
                            <p className="text-[12px] text-slate-300 mt-0.5">Performance leaderboard and analytics coming soon</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}