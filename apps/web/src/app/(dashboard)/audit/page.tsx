import { ShieldCheck, Activity, User as UserIcon, Clock, FileText, Search, Download, Filter } from "lucide-react"
import { cn } from "@/lib/utils"
import { auth } from "@/auth"
import { redirect } from "next/navigation"

async function getAuditLogs() {
    try {
        const res = await fetch("http://localhost:3000/api/audit", { cache: "no-store" })
        if (!res.ok) return []
        return res.json()
    } catch (e) {
        console.error("Failed to fetch audit logs", e)
        return []
    }
}

// Colour-code action verbs
function actionMeta(action: string) {
    const a = action?.toUpperCase()
    if (a?.includes("CREATE") || a?.includes("ADD"))    return { className: "bg-emerald-50 text-emerald-700 border-emerald-200/60", dot: "bg-emerald-500" }
    if (a?.includes("UPDATE") || a?.includes("EDIT"))   return { className: "bg-blue-50 text-blue-700 border-blue-200/60",          dot: "bg-blue-500" }
    if (a?.includes("DELETE") || a?.includes("REMOVE")) return { className: "bg-rose-50 text-rose-700 border-rose-200/60",       dot: "bg-rose-500" }
    if (a?.includes("LOGIN")  || a?.includes("AUTH"))   return { className: "bg-violet-50 text-violet-700 border-violet-200/60", dot: "bg-violet-500" }
    if (a?.includes("APPROVE"))                         return { className: "bg-emerald-50 text-emerald-700 border-emerald-200/60", dot: "bg-emerald-500" }
    if (a?.includes("REJECT"))                          return { className: "bg-amber-50 text-amber-700 border-amber-200/60",    dot: "bg-amber-500" }
    return { className: "bg-slate-50 text-slate-600 border-slate-200/60", dot: "bg-slate-400" }
}

function ActionBadge({ action }: { action: string }) {
    const { className, dot } = actionMeta(action)
    return (
        <span className={cn("inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-[11px] font-black border uppercase tracking-widest whitespace-nowrap", className)}>
            <span className={cn("w-1.5 h-1.5 rounded-full shrink-0", dot)} />
            {action}
        </span>
    )
}

export default async function AuditLogsPage() {
    const session = await auth()
    if (session?.user?.role !== 'SUPER_ADMIN') {
        redirect("/dashboard")
    }

    const logs = await getAuditLogs()

    return (
        <div className="flex flex-col gap-8 p-6 md:p-10 bg-white max-w-[1440px] mx-auto min-h-[85vh] shadow-[0_0_80px_-20px_rgba(0,0,0,0.08)] rounded-[2.5rem] my-8 border border-slate-100/50 relative overflow-hidden">
            {/* Background Decoration */}
            <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-blue-50/20 rounded-full blur-3xl -mr-64 -mt-64 pointer-events-none" />
            <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-slate-50/30 rounded-full blur-3xl -ml-48 -mb-48 pointer-events-none" />
            
            {/* Header Section */}
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-6 pb-6 border-b border-slate-100 relative z-10">
                <div>
                    <h1 className="text-2xl font-black text-slate-900 tracking-tight flex items-center gap-3">
                        <ShieldCheck className="w-6 h-6 text-blue-600" strokeWidth={3} />
                        Security Intelligence
                        <span className="px-3 py-1 bg-blue-50 text-blue-600 text-[12px] font-bold rounded-full border border-blue-100 uppercase tracking-widest">
                            {logs.length} Operations
                        </span>
                    </h1>
                    <p className="text-slate-500 font-medium text-[14px] mt-1">Immutable audit trail of system-wide administrative activity</p>
                </div>
                
                <div className="flex items-center gap-3">
                    <span className="inline-flex items-center gap-2 text-[11px] font-black uppercase tracking-[0.2em] text-blue-600 bg-blue-50 px-4 py-2 rounded-2xl border border-blue-100">
                        <span className="w-2 h-2 rounded-full bg-blue-500 animate-pulse" />
                        Active Monitoring
                    </span>
                    <button className="flex items-center gap-2.5 px-6 h-12 bg-slate-900 text-white rounded-2xl hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 active:scale-95 text-[12px] font-black uppercase tracking-widest border-none">
                        <Download size={16} strokeWidth={2.5} />
                        Audit Report
                    </button>
                </div>
            </div>

            {/* Filtering & Search */}
            <div className="flex flex-col gap-4 bg-slate-50/50 p-5 rounded-[2rem] border border-slate-100 shadow-sm relative z-10">
                <div className="flex flex-wrap items-center gap-4">
                    <div className="relative group min-w-[320px] flex-1">
                        <Search size={18} className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-blue-600 transition-colors" />
                        <input 
                            type="text"
                            placeholder="Search logs by action, resource or user ID..."
                            className="w-full pl-12 pr-4 py-3 bg-white border border-slate-200 rounded-2xl focus:outline-none focus:ring-4 focus:ring-blue-500/10 focus:border-blue-500/50 transition-all text-slate-700 font-bold text-[14px] shadow-sm placeholder:text-slate-300"
                        />
                    </div>

                    <div className="flex items-center gap-2 bg-white px-4 py-2 rounded-2xl border border-slate-200 shadow-sm text-slate-400">
                        <Filter size={14} />
                        <span className="text-[12px] font-black text-slate-700 uppercase tracking-tight">Timeframe: All Time</span>
                    </div>
                </div>
            </div>

            {/* Logs Table */}
            <div className="relative z-10 overflow-hidden bg-white rounded-[2rem] border border-slate-100 shadow-2xl shadow-slate-100/50 flex-1 flex flex-col">
                <div className="overflow-x-auto">
                    <table className="w-full text-left border-collapse">
                        <thead>
                            <tr className="bg-slate-50/50 border-b border-slate-100">
                                <th className="py-5 px-6 text-[11px] font-black text-slate-400 uppercase tracking-[0.2em] w-[180px]">Operation</th>
                                <th className="py-5 px-6 text-[11px] font-black text-slate-400 uppercase tracking-[0.2em]">Target Resource</th>
                                <th className="py-5 px-6 text-[11px] font-black text-slate-400 uppercase tracking-[0.2em]">Actor Intelligence</th>
                                <th className="py-5 px-6 text-[11px] font-black text-slate-400 uppercase tracking-[0.2em]">Data Context</th>
                                <th className="py-5 px-6 text-[11px] font-black text-slate-400 uppercase tracking-[0.2em] text-right">Sequence Time</th>
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-slate-50">
                            {logs.length === 0 ? (
                                <tr>
                                    <td colSpan={5} className="py-32 text-center">
                                        <div className="flex flex-col items-center gap-6">
                                            <div className="w-20 h-20 bg-slate-50 rounded-3xl flex items-center justify-center border border-slate-100 shadow-sm">
                                                <Activity size={32} strokeWidth={1.5} className="text-slate-300" />
                                            </div>
                                            <div className="space-y-1">
                                                <p className="text-xl font-black text-slate-900">Silent Audit Vault</p>
                                                <p className="text-[14px] text-slate-400 font-bold">No system events have been registered in this cycle.</p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            ) : (
                                logs.map((log: any) => (
                                    <tr key={log.id} className="group hover:bg-blue-50/30 transition-all duration-300">
                                        {/* Action Badge */}
                                        <td className="py-5 px-6 whitespace-nowrap">
                                            <ActionBadge action={log.action} />
                                        </td>

                                        {/* Resource */}
                                        <td className="py-5 px-6">
                                            <div className="flex items-center gap-3">
                                                <div className="w-1.5 h-1.5 rounded-full bg-blue-400 opacity-0 group-hover:opacity-100 transition-opacity" />
                                                <span className="text-[12px] font-black text-slate-700 uppercase tracking-widest bg-slate-50 px-3 py-1.5 rounded-xl border border-slate-100">
                                                    {log.resource}
                                                </span>
                                            </div>
                                        </td>

                                        {/* User Actor */}
                                        <td className="py-5 px-6 whitespace-nowrap">
                                            <div className="flex items-center gap-3">
                                                <div className="w-9 h-9 rounded-xl bg-slate-50 flex items-center justify-center border border-slate-100">
                                                    <UserIcon size={14} className="text-slate-400" />
                                                </div>
                                                <div className="flex flex-col">
                                                    <span className="text-[13px] font-black text-slate-900">
                                                        {log.userId === session?.user?.id ? "Me (Admin)" : (log.userId || "Service Agent")}
                                                    </span>
                                                    <span className="text-[11px] font-black text-slate-300 uppercase tracking-tight">System Entity</span>
                                                </div>
                                            </div>
                                        </td>

                                        {/* Context Details */}
                                        <td className="py-5 px-6 max-w-[300px]">
                                            <div className="flex items-center gap-2">
                                                <FileText size={14} className="text-slate-300 shrink-0" />
                                                <span className="font-mono text-[11px] text-slate-400 font-bold truncate bg-slate-50/50 px-3 py-1.5 rounded-xl border border-dotted border-slate-200 block w-full">
                                                    {typeof log.details === "object"
                                                        ? JSON.stringify(log.details)
                                                        : log.details ?? "Encrypted Event Signature"}
                                                </span>
                                            </div>
                                        </td>

                                        {/* Timestamp */}
                                        <td className="py-5 px-6 text-right whitespace-nowrap">
                                            <div className="flex flex-col items-end gap-1">
                                                <div className="flex items-center gap-2 text-[14px] font-black text-slate-900 tabular-nums">
                                                    <Clock size={12} className="text-slate-300" />
                                                    {new Date(log.createdAt).toLocaleDateString("en-GB", { day: "2-digit", month: "short", year: "numeric" })}
                                                </div>
                                                <span className="text-[11px] text-slate-400 font-black uppercase tracking-widest tabular-nums">
                                                    {new Date(log.createdAt).toLocaleTimeString("en-GB", { hour: "2-digit", minute: "2-digit", second: "2-digit" })}
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                ))
                            )}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    )
}