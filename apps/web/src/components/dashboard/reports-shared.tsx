import { ArrowUpRight } from "lucide-react";

export function StatPill({
    label, value, sub, icon: Icon, accent, subUp,
}: {
    label: string; value: string; sub: string;
    icon: React.ElementType; accent: string; subUp?: boolean
}) {
    return (
        <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] p-5 flex flex-col gap-3">
            <div className="flex items-center justify-between">
                <span className="text-[10px] font-extrabold uppercase tracking-[0.12em] text-slate-400">{label}</span>
                <div className="w-7 h-7 rounded-lg flex items-center justify-center" style={{ backgroundColor: `${accent}15` }}>
                    <Icon size={13} style={{ color: accent }} strokeWidth={2.5} />
                </div>
            </div>
            <p className="text-2xl font-extrabold text-slate-900 tracking-tight tabular-nums">{value}</p>
            <p className={`text-[11px] font-semibold flex items-center gap-1 ${subUp ? "text-emerald-600" : "text-slate-400"}`}>
                {subUp && <ArrowUpRight size={11} />}
                {sub}
            </p>
        </div>
    )
}

export function ChartCard({ title, icon: Icon, accent = "#6366f1", children }: {
    title: string; icon: React.ElementType; accent?: string; children: React.ReactNode
}) {
    return (
        <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden">
            <div className="flex items-center gap-2.5 px-6 py-4 border-b border-slate-50">
                <div className="w-7 h-7 rounded-lg flex items-center justify-center" style={{ backgroundColor: `${accent}15` }}>
                    <Icon size={13} style={{ color: accent }} strokeWidth={2.5} />
                </div>
                <span className="text-[14px] font-extrabold text-slate-800">{title}</span>
            </div>
            <div className="p-6">{children}</div>
        </div>
    )
}
