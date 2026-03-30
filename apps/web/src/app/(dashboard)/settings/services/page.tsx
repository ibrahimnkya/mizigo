import { Truck, Zap, Shield, Edit2, Plus, Trash2 } from "lucide-react"
import { cn } from "@/lib/utils"

async function getServices() {
    const res = await fetch("http://localhost:3000/api/services", { cache: "no-store" })
    if (!res.ok) return []
    return res.json()
}

function getServiceIcon(name: string) {
    if (name?.includes("EXPRESS")) return Zap
    if (name?.includes("FRAGILE")) return Shield
    return Truck
}

function getServiceAccent(name: string) {
    if (name?.includes("EXPRESS")) return { color: "#f59e0b", bg: "#f59e0b15", text: "text-amber-600" }
    if (name?.includes("FRAGILE")) return { color: "#f43f5e", bg: "#f43f5e15", text: "text-rose-600" }
    return { color: "#6366f1", bg: "#6366f115", text: "text-indigo-600" }
}

export default async function ServicesPage() {
    const services = await getServices()

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                <div className="flex flex-col sm:flex-row sm:items-end justify-between gap-4">
                    <div>
                        <div className="flex items-center gap-2 mb-2">
                            <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-indigo-600 bg-indigo-50 px-2.5 py-1 rounded-full">
                                Configuration
                            </span>
                        </div>
                        <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Service Types</h1>
                        <p className="text-sm text-slate-400 font-medium mt-0.5">Configure logistics service levels and base pricing.</p>
                    </div>
                    <button className="inline-flex items-center gap-2 bg-slate-900 hover:bg-slate-800 text-white text-[13px] font-extrabold px-5 py-2.5 rounded-xl shadow-lg shadow-slate-900/10 transition-all hover:-translate-y-0.5 active:translate-y-0 whitespace-nowrap">
                        <Plus size={14} strokeWidth={2.5} /> Add Service
                    </button>
                </div>

                {services.length === 0 ? (
                    <div className="h-60 rounded-2xl border-2 border-dashed border-slate-200 flex flex-col items-center justify-center gap-3 text-slate-300">
                        <Truck size={32} strokeWidth={1.5} />
                        <p className="text-sm font-semibold text-slate-400">No services configured yet</p>
                    </div>
                ) : (
                    <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
                        {services.map((service: any) => {
                            const Icon = getServiceIcon(service.name)
                            const accent = getServiceAccent(service.name)
                            return (
                                <div
                                    key={service.id}
                                    className="group relative bg-white rounded-2xl border border-slate-100 p-5 shadow-[0_1px_3px_rgba(0,0,0,0.04)] hover:shadow-[0_8px_24px_rgba(0,0,0,0.08)] hover:-translate-y-0.5 transition-all duration-200 overflow-hidden flex flex-col gap-4"
                                >
                                    <div className="absolute -top-6 -right-6 w-24 h-24 rounded-full blur-2xl pointer-events-none" style={{ backgroundColor: accent.color, opacity: 0.05 }} />

                                    {/* Top */}
                                    <div className="flex items-start justify-between">
                                        <div className="w-9 h-9 rounded-xl flex items-center justify-center" style={{ backgroundColor: accent.bg }}>
                                            <Icon size={15} style={{ color: accent.color }} strokeWidth={2.5} />
                                        </div>
                                        <span className={cn(
                                            "inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg text-[11px] font-bold border tracking-wide",
                                            service.isActive
                                                ? "bg-emerald-50 text-emerald-700 border-emerald-200/60"
                                                : "bg-slate-50 text-slate-500 border-slate-200/60"
                                        )}>
                                            <span className={cn("w-1.5 h-1.5 rounded-full", service.isActive ? "bg-emerald-500" : "bg-slate-400")} />
                                            {service.isActive ? "Active" : "Inactive"}
                                        </span>
                                    </div>

                                    {/* Info */}
                                    <div className="flex-1">
                                        <h3 className="text-[15px] font-extrabold text-slate-900 tracking-tight">{service.name}</h3>
                                        <p className="text-[12px] text-slate-400 font-medium mt-1 leading-relaxed line-clamp-2">{service.description}</p>
                                    </div>

                                    {/* Footer */}
                                    <div className="pt-4 border-t border-slate-50 flex items-end justify-between">
                                        <div>
                                            <p className="text-[9px] font-extrabold uppercase tracking-[0.12em] text-slate-400 mb-1">Base Rate</p>
                                            <p className="text-[18px] font-extrabold text-slate-900 tabular-nums">
                                                TZS {service.basePrice.toLocaleString()}
                                            </p>
                                        </div>
                                        <div className="flex gap-1.5">
                                            <button className="w-8 h-8 rounded-lg flex items-center justify-center text-slate-300 hover:text-indigo-600 hover:bg-indigo-50 transition-colors">
                                                <Edit2 size={13} />
                                            </button>
                                            <button className="w-8 h-8 rounded-lg flex items-center justify-center text-slate-300 hover:text-rose-600 hover:bg-rose-50 transition-colors">
                                                <Trash2 size={13} />
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            )
                        })}
                    </div>
                )}
            </div>
        </div>
    )
}
