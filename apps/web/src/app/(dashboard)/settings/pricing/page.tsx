import { Tag, Settings2, MoreHorizontal, Plus, Percent } from "lucide-react"
import { cn } from "@/lib/utils"

async function getPricing() {
    const res = await fetch("http://localhost:3000/api/pricing", { cache: "no-store" })
    if (!res.ok) return []
    return res.json()
}

export default async function PricingPage() {
    const rules = await getPricing()

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                <div className="flex flex-col sm:flex-row sm:items-end justify-between gap-4">
                    <div>
                        <div className="flex items-center gap-2 mb-2">
                            <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-violet-600 bg-violet-50 px-2.5 py-1 rounded-full">
                                Pricing
                            </span>
                        </div>
                        <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Pricing Rules</h1>
                        <p className="text-sm text-slate-400 font-medium mt-0.5">Manage dynamic pricing conditions and discounts across terminals.</p>
                    </div>
                    <button className="inline-flex items-center gap-2 bg-slate-900 hover:bg-slate-800 text-white text-[13px] font-extrabold px-5 py-2.5 rounded-xl shadow-lg shadow-slate-900/10 transition-all hover:-translate-y-0.5 active:translate-y-0 whitespace-nowrap">
                        <Plus size={14} strokeWidth={2.5} /> Add Rule
                    </button>
                </div>

                {rules.length === 0 ? (
                    <div className="h-60 rounded-2xl border-2 border-dashed border-slate-200 flex flex-col items-center justify-center gap-3 text-slate-300">
                        <Tag size={32} strokeWidth={1.5} />
                        <p className="text-sm font-semibold text-slate-400">No pricing rules configured yet</p>
                        <button className="text-[12px] font-extrabold text-indigo-500 hover:text-indigo-700 transition-colors mt-1">
                            Create your first rule
                        </button>
                    </div>
                ) : (
                    <div className="flex flex-col gap-3">
                        {rules.map((rule: any) => (
                            <div
                                key={rule.id}
                                className="group bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] hover:shadow-[0_4px_16px_rgba(0,0,0,0.07)] transition-all duration-200 overflow-hidden"
                            >
                                <div className="px-5 py-4 flex flex-col md:flex-row md:items-center justify-between gap-4">

                                    {/* Left: icon + info */}
                                    <div className="flex items-center gap-4">
                                        <div className="w-10 h-10 rounded-xl bg-violet-50 flex items-center justify-center shrink-0 group-hover:scale-105 transition-transform duration-200">
                                            <Tag size={15} className="text-violet-600" strokeWidth={2.5} />
                                        </div>
                                        <div>
                                            <div className="flex items-center gap-2.5 flex-wrap">
                                                <h3 className="text-[14px] font-extrabold text-slate-900 tracking-tight">{rule.name}</h3>
                                                <span className={cn(
                                                    "inline-flex items-center gap-1.5 px-2 py-0.5 rounded-lg text-[10px] font-bold border",
                                                    rule.isActive
                                                        ? "bg-emerald-50 text-emerald-700 border-emerald-200/60"
                                                        : "bg-slate-50 text-slate-500 border-slate-200/60"
                                                )}>
                                                    <span className={cn("w-1 h-1 rounded-full", rule.isActive ? "bg-emerald-500" : "bg-slate-400")} />
                                                    {rule.isActive ? "Active" : "Paused"}
                                                </span>
                                            </div>
                                            <p className="text-[12px] text-slate-400 font-medium mt-0.5 line-clamp-1 max-w-[360px]">{rule.description}</p>
                                        </div>
                                    </div>

                                    {/* Right: adjustment + actions */}
                                    <div className="flex items-center gap-6 md:ml-auto">
                                        <div className="text-right">
                                            <p className="text-[9px] font-extrabold uppercase tracking-[0.14em] text-slate-400 mb-1">Adjustment</p>
                                            <div className="flex items-baseline justify-end gap-1 tabular-nums">
                                                {rule.type === "PERCENTAGE" ? (
                                                    <>
                                                        <span className="text-[11px] font-extrabold text-indigo-500">%</span>
                                                        <span className="text-[20px] font-extrabold text-slate-900">{rule.value}</span>
                                                    </>
                                                ) : (
                                                    <>
                                                        <span className="text-[11px] font-extrabold text-indigo-500 uppercase">TZS</span>
                                                        <span className="text-[20px] font-extrabold text-slate-900">{rule.value.toLocaleString()}</span>
                                                    </>
                                                )}
                                            </div>
                                        </div>

                                        <div className="flex items-center gap-1.5">
                                            <button className="inline-flex items-center gap-1.5 h-8 px-3 text-[11px] font-extrabold text-slate-500 hover:text-indigo-600 hover:bg-indigo-50 rounded-lg border border-slate-100 transition-colors">
                                                <Settings2 size={12} /> Configure
                                            </button>
                                            <button className="w-8 h-8 flex items-center justify-center text-slate-300 hover:text-slate-600 hover:bg-slate-50 rounded-lg transition-colors">
                                                <MoreHorizontal size={15} />
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </div>
        </div>
    )
}