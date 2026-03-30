import React from "react";
import { TrendingUp, TrendingDown } from "lucide-react";
import { DashboardTabs } from "./dashboard-tabs";
import { cn } from "@/lib/utils";

type Trend = { value: string; up: boolean } | undefined;

// ─── Stat Card ───────────────────────────────────────────────────────────────
export function StatCard({
    label,
    value,
    sub,
    trend,
    iconBg,
    icon: Icon,
}: {
    label: string;
    value: string | number;
    sub?: string;
    trend?: Trend;
    iconBg: string;
    icon: React.ElementType;
}) {
    return (
        <div
            className="group relative flex flex-col justify-between p-6 glass-card border-white/40 shadow-premium hover:shadow-premium-lg transition-all duration-500 cursor-default overflow-hidden"
            style={{ borderRadius: 16 }}
        >
            <div
                className={`absolute -top-12 -right-12 w-40 h-40 rounded-full blur-3xl opacity-[0.12] pointer-events-none transition-transform duration-700 group-hover:scale-150 ${iconBg}`}
            />

            <div className="flex items-start justify-between mb-5 relative z-10">
                <div
                    className={`w-11 h-11 flex items-center justify-center rounded-2xl ${iconBg} shadow-lg shadow-black/5 transition-all duration-500 group-hover:scale-110 group-hover:rotate-3`}
                >
                    <Icon size={20} className="text-white" />
                </div>

                {trend && (
                    <span
                        className={`inline-flex items-center gap-1.5 text-[11px] font-bold px-2.5 py-1 rounded-full backdrop-blur-md shadow-sm border ${trend.up
                            ? "text-emerald-700 bg-emerald-500/10 border-emerald-500/20"
                            : "text-rose-600 bg-rose-500/10 border-rose-500/20"
                            }`}
                    >
                        {trend.up ? <TrendingUp size={12} /> : <TrendingDown size={12} />}
                        {trend.value}
                    </span>
                )}
            </div>

            <div className="relative z-10">
                <p className="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400/80 mb-2">
                    {label}
                </p>
                <p className="text-3xl font-black text-slate-900 leading-tight tracking-tight">
                    {value}
                </p>
                {sub && (
                    <p className="text-[12px] text-slate-500 font-semibold mt-2 opacity-70">{sub}</p>
                )}
            </div>
        </div>
    );
}

// ─── Metric Card (KPI) ───────────────────────────────────────────────────────
export function MetricCard({
    label,
    value,
    sub,
    icon: Icon,
    accent,
    trend,
}: {
    label: string;
    value: number | string;
    sub: string;
    icon: React.ElementType;
    accent: string;
    trend?: Trend;
}) {
    return (
        <div className="relative group bg-white rounded-2xl border border-slate-100 p-5 flex flex-col gap-4 shadow-[0_1px_3px_rgba(0,0,0,0.04)] hover:shadow-[0_4px_16px_rgba(0,0,0,0.08)] hover:-translate-y-0.5 transition-all duration-200">
            <div className="flex items-start justify-between">
                <div
                    className="w-9 h-9 rounded-xl flex items-center justify-center"
                    style={{ backgroundColor: `${accent}15` }}
                >
                    <Icon size={16} style={{ color: accent }} strokeWidth={2.5} />
                </div>
                {trend && (
                    <span
                        className={`inline-flex items-center gap-0.5 text-[10px] font-bold px-1.5 py-0.5 rounded-full ${trend.up
                            ? "bg-emerald-50 text-emerald-600"
                            : "bg-rose-50 text-rose-500"
                            }`}
                    >
                        {trend.up ? (
                            <TrendingUp size={9} strokeWidth={3} />
                        ) : (
                            <TrendingDown size={9} strokeWidth={3} />
                        )}
                        {trend.value}
                    </span>
                )}
            </div>

            <div>
                <p className="text-2xl font-extrabold text-slate-900 tracking-tight leading-none tabular-nums">
                    {typeof value === 'number' ? value.toLocaleString() : value}
                </p>
                <p className="text-[11px] font-semibold text-slate-400 mt-1.5 uppercase tracking-wider">
                    {label}
                </p>
            </div>

            <div
                className="absolute bottom-0 left-4 right-4 h-[2px] rounded-full opacity-0 group-hover:opacity-100 transition-opacity duration-200"
                style={{ backgroundColor: accent }}
            />
        </div>
    );
}

// ─── Dashboard Card ──────────────────────────────────────────────────────────
export function Card({
    children,
    className = "",
}: {
    children: React.ReactNode;
    className?: string;
}) {
    return (
        <div
            className={cn(
                "bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)]",
                className
            )}
        >
            {children}
        </div>
    );
}

// ─── Dashboard Card Header ───────────────────────────────────────────────────
export function CardHeader({
    icon: Icon,
    title,
    iconColor = "#6366f1",
    action,
    badge,
}: {
    icon: React.ElementType;
    title: string;
    iconColor?: string;
    action?: React.ReactNode;
    badge?: React.ReactNode;
}) {
    return (
        <div className="flex items-center justify-between px-6 py-4 border-b border-slate-50">
            <div className="flex items-center gap-2.5">
                <div
                    className="w-7 h-7 rounded-lg flex items-center justify-center"
                    style={{ backgroundColor: `${iconColor}15` }}
                >
                    <Icon size={13} style={{ color: iconColor }} strokeWidth={2.5} />
                </div>
                <span className="text-sm font-bold text-slate-800">{title}</span>
                {badge}
            </div>
            {action && (
                <div>
                    {action}
                </div>
            )}
        </div>
    );
}

// ─── Older Panel (Backward Compatibility) ───────────────────────────────────
export function Panel({
    icon: Icon,
    iconColor = "text-indigo-400",
    title,
    badge,
    tabs,
    tabParamName,
    activeTab,
    action,
    children,
    className = "",
}: {
    icon: React.ElementType;
    iconColor?: string;
    title: string;
    badge?: React.ReactNode;
    tabs?: string[];
    tabParamName?: string;
    activeTab?: string;
    action?: React.ReactNode;
    children: React.ReactNode;
    className?: string;
}) {
    // Determine the hex color from tailwind class if possible, or use a default
    // This is a bit of a hack to make the new CardHeader look consistent with old iconColor props
    const iconHex = iconColor.includes('indigo') ? '#6366f1' :
        iconColor.includes('amber') ? '#f59e0b' :
            iconColor.includes('emerald') ? '#10b981' : '#6366f1';

    return (
        <Card className={className}>
            <CardHeader
                icon={Icon}
                title={title}
                iconColor={iconHex}
                badge={badge}
                action={
                    <div className="flex items-center gap-3">
                        {tabs && (
                            <DashboardTabs
                                tabs={tabs}
                                tabParamName={tabParamName}
                                activeTab={activeTab}
                            />
                        )}
                        {action}
                    </div>
                }
            />
            <div className="p-6">{children}</div>
        </Card>
    );
}
