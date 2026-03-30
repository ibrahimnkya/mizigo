import { Bell, Info, CheckCircle, AlertTriangle, XCircle, Check, Clock, MoreHorizontal, Archive } from "lucide-react"
import { cn } from "@/lib/utils"

async function getNotifications() {
    const res = await fetch("http://localhost:3000/api/notifications", { cache: "no-store" })
    if (!res.ok) return []
    return res.json()
}

const TYPE_META: Record<string, { icon: any; color: string; bg: string; bar: string; dot: string }> = {
    INFO:    { icon: Info,          color: "text-sky-600",     bg: "bg-sky-50",     bar: "bg-sky-400",     dot: "bg-sky-500" },
    WARNING: { icon: AlertTriangle, color: "text-amber-600",   bg: "bg-amber-50",   bar: "bg-amber-400",   dot: "bg-amber-500" },
    SUCCESS: { icon: CheckCircle,   color: "text-emerald-600", bg: "bg-emerald-50", bar: "bg-emerald-500", dot: "bg-emerald-500" },
    ERROR:   { icon: XCircle,       color: "text-rose-600",    bg: "bg-rose-50",    bar: "bg-rose-500",    dot: "bg-rose-500" },
}

const DEFAULT_META = { icon: Bell, color: "text-slate-500", bg: "bg-slate-50", bar: "bg-slate-300", dot: "bg-slate-400" }

export default async function NotificationsPage() {
    const notifications = await getNotifications()
    const unreadCount = notifications.filter((n: any) => !n.isRead).length

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                {/* Header */}
                <div className="flex flex-col sm:flex-row sm:items-end justify-between gap-4">
                    <div>
                        <div className="flex items-center gap-2 mb-2">
                            <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-indigo-600 bg-indigo-50 px-2.5 py-1 rounded-full">
                                Alerts
                            </span>
                            {unreadCount > 0 && (
                                <span className="inline-flex items-center gap-1 text-[10px] font-extrabold text-indigo-600 bg-indigo-50 px-2 py-0.5 rounded-full border border-indigo-100">
                                    <span className="w-1.5 h-1.5 rounded-full bg-indigo-500 animate-pulse" />
                                    {unreadCount} unread
                                </span>
                            )}
                        </div>
                        <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Notifications</h1>
                        <p className="text-sm text-slate-400 font-medium mt-0.5">
                            Stay updated with system alerts and shipment status changes across all terminals.
                        </p>
                    </div>

                    <div className="flex items-center gap-2.5">
                        <button className="inline-flex items-center gap-1.5 h-9 px-4 text-[12px] font-extrabold text-slate-500 hover:text-slate-700 border border-slate-200 bg-white rounded-xl hover:bg-slate-50 transition-colors shadow-[0_1px_2px_rgba(0,0,0,0.04)]">
                            <Archive size={13} /> Archive all
                        </button>
                        <button className="inline-flex items-center gap-1.5 h-9 px-4 text-[12px] font-extrabold text-white bg-slate-900 hover:bg-slate-800 rounded-xl transition-all hover:-translate-y-0.5 active:translate-y-0 shadow-lg shadow-slate-900/10">
                            <Check size={13} strokeWidth={2.5} /> Mark all read
                        </button>
                    </div>
                </div>

                {/* List */}
                {notifications.length === 0 ? (
                    <div className="h-64 rounded-2xl border-2 border-dashed border-slate-200 flex flex-col items-center justify-center gap-3 text-slate-300">
                        <div className="w-12 h-12 bg-slate-50 rounded-2xl flex items-center justify-center">
                            <Bell size={22} strokeWidth={1.5} className="text-slate-200" />
                        </div>
                        <div className="text-center">
                            <p className="text-sm font-semibold text-slate-400">You're all caught up</p>
                            <p className="text-[12px] mt-0.5">No recent alerts or system events</p>
                        </div>
                    </div>
                ) : (
                    <div className="flex flex-col gap-2.5">
                        {notifications.map((notif: any) => {
                            const meta = TYPE_META[notif.type] ?? DEFAULT_META
                            const Icon = meta.icon

                            return (
                                <div
                                    key={notif.id}
                                    className={cn(
                                        "group relative bg-white rounded-2xl border shadow-[0_1px_3px_rgba(0,0,0,0.04)] hover:shadow-[0_6px_20px_rgba(0,0,0,0.07)] hover:-translate-y-0.5 transition-all duration-200 overflow-hidden cursor-pointer",
                                        notif.isRead ? "border-slate-100 opacity-70" : "border-slate-100"
                                    )}
                                >
                                    {/* Left accent bar */}
                                    <div className={cn(
                                        "absolute top-0 left-0 bottom-0 w-[3px] transition-all duration-200 group-hover:w-1",
                                        notif.isRead ? "bg-slate-100" : meta.bar
                                    )} />

                                    <div className="pl-5 pr-5 py-4 flex items-start gap-4">

                                        {/* Icon */}
                                        <div className={cn(
                                            "w-8 h-8 rounded-xl flex items-center justify-center shrink-0 mt-0.5",
                                            meta.bg
                                        )}>
                                            <Icon size={14} className={meta.color} strokeWidth={2.5} />
                                        </div>

                                        {/* Content */}
                                        <div className="flex-1 min-w-0">
                                            <div className="flex items-start justify-between gap-3">
                                                <div className="flex items-center gap-2 min-w-0">
                                                    <h3 className={cn(
                                                        "text-[14px] font-extrabold tracking-tight truncate",
                                                        notif.isRead ? "text-slate-400" : "text-slate-900"
                                                    )}>
                                                        {notif.title}
                                                    </h3>
                                                    {!notif.isRead && (
                                                        <span className="w-1.5 h-1.5 rounded-full bg-indigo-500 animate-pulse shrink-0" />
                                                    )}
                                                </div>

                                                <div className="flex items-center gap-2 shrink-0">
                                                    <span className="text-[10px] font-bold text-slate-400 tabular-nums flex items-center gap-1">
                                                        <Clock size={10} className="opacity-40" />
                                                        {new Date(notif.createdAt).toLocaleDateString("en-GB", { day: "2-digit", month: "short" })}
                                                        <span className="text-slate-300 mx-0.5">·</span>
                                                        {new Date(notif.createdAt).toLocaleTimeString("en-GB", { hour: "2-digit", minute: "2-digit" })}
                                                    </span>
                                                    <button className="w-6 h-6 flex items-center justify-center rounded-lg text-slate-300 hover:text-slate-600 hover:bg-slate-50 transition-colors opacity-0 group-hover:opacity-100">
                                                        <MoreHorizontal size={14} />
                                                    </button>
                                                </div>
                                            </div>

                                            <p className={cn(
                                                "text-[12px] font-medium leading-relaxed mt-1",
                                                notif.isRead ? "text-slate-400" : "text-slate-500"
                                            )}>
                                                {notif.message}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            )
                        })}
                    </div>
                )}

                {/* Footer */}
                <div className="flex items-center justify-center pt-2 pb-4">
                    <div className="flex items-center gap-2">
                        <span className="w-1.5 h-1.5 rounded-full bg-emerald-500" />
                        <p className="text-[9px] font-extrabold uppercase tracking-[0.2em] text-slate-300">
                            System Monitoring Active
                        </p>
                    </div>
                </div>

            </div>
        </div>
    )
}