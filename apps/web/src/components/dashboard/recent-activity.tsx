import { Badge } from "@repo/ui/badge";
import { Package, MapPin, Calendar, ArrowRight, Activity } from "lucide-react";
import { cn } from "@repo/ui/utils";
import Link from "next/link";

interface RecentActivityProps {
    activities: any[]
}

export function RecentActivity({ activities }: RecentActivityProps) {
    if (!activities || activities.length === 0) {
        return (
            <div className="flex flex-col items-center justify-center py-20 text-slate-400">
                <Package className="w-12 h-12 opacity-10 mb-4" />
                <p className="text-sm font-medium">No activity yet.</p>
            </div>
        )
    }

    return (
        <div className="relative space-y-0 pb-2">
            <div className="absolute left-5 top-2 bottom-2 w-0.5 bg-slate-100/80" />

            {activities.map((item, idx) => (
                <div key={item.id} className="relative pl-12 pr-2 py-4 hover:bg-slate-50/50 transition-all group rounded-lg">
                    {/* Glowing indicator */}
                    <div className="absolute left-5 -translate-x-1/2 top-[26px]">
                        <div className="h-2.5 w-2.5 rounded-full bg-slate-200 border-2 border-white ring-2 ring-transparent group-hover:ring-indigo-100 group-hover:bg-indigo-500 transition-all duration-300 shadow-sm" />
                    </div>

                    <div className="flex flex-col gap-1.5">
                        <div className="flex items-center justify-between">
                            <h4 className="font-bold text-slate-800 text-[13px] tracking-tight group-hover:text-indigo-600 transition-colors">
                                Cargo #{item.id.slice(-6).toUpperCase()}
                            </h4>
                            <Badge
                                variant="secondary"
                                className={cn(
                                    "capitalize text-[9px] font-extrabold px-1.5 py-0 rounded-[4px] border-none shadow-none",
                                    item.status === 'PENDING' && "bg-amber-50 text-amber-600",
                                    item.status === 'APPROVED' && "bg-emerald-50 text-emerald-600",
                                    item.status === 'REJECTED' && "bg-rose-50 text-rose-600"
                                )}
                            >
                                {item.status.toLowerCase()}
                            </Badge>
                        </div>

                        <div className="flex flex-col gap-1 text-[11px] font-medium text-slate-400">
                            <div className="flex items-center gap-1.5">
                                <MapPin size={11} className="text-slate-300" />
                                <span className="truncate max-w-[80px]">{item.fromAddress}</span>
                                <ArrowRight size={10} className="text-slate-200" />
                                <span className="truncate max-w-[80px] text-slate-500">{item.toAddress}</span>
                            </div>
                            <div className="flex items-center gap-1.5 opacity-70">
                                <Calendar size={11} className="text-slate-300" />
                                <span>{new Date(item.createdAt).toLocaleDateString()} · {new Date(item.createdAt).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}</span>
                            </div>
                        </div>
                    </div>
                </div>
            ))}
        </div>
    )
}
