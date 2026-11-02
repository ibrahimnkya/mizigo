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
    <div className="relative flex flex-col justify-between p-5 bg-white border border-[#E2E2E2] rounded-[20px] cursor-default overflow-hidden">
      <div className="flex items-start justify-between mb-4">
        <div
          className={`w-9 h-9 flex items-center justify-center rounded-xl ${iconBg}`}
        >
          <Icon size={18} className="text-white" />
        </div>

        {trend && (
          <span
            className={`inline-flex items-center gap-1.5 text-[10px] font-semibold px-1.5 py-0.5 rounded-lg border ${
              trend.up
                ? "text-emerald-700 bg-emerald-50 border-emerald-200"
                : "text-rose-600 bg-rose-50 border-rose-200"
            }`}
          >
            {trend.up ? <TrendingUp size={11} /> : <TrendingDown size={11} />}
            {trend.value}
          </span>
        )}
      </div>

      <div>
        <p className="text-[11px] font-medium uppercase tracking-[0.05em] text-slate-500 mb-2">
          {label}
        </p>
        <p className="text-[26px] font-semibold text-slate-900 leading-tight">
          {value}
        </p>
        {sub && (
          <p className="text-[12px] text-slate-500 font-medium mt-1.5">
            {sub}
          </p>
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
    <div className="relative bg-white rounded-[20px] border border-[#E2E2E2] p-4 flex flex-col gap-3">
      <div className="flex items-start justify-between">
        <div
          className="w-8 h-8 rounded-xl flex items-center justify-center"
          style={{ backgroundColor: `${accent}15` }}
        >
          <Icon size={16} style={{ color: accent }} strokeWidth={2.5} />
        </div>
        {trend && (
          <span
            className={`inline-flex items-center gap-0.5 text-[10px] font-semibold px-1.5 py-0.5 rounded-lg border ${
              trend.up
                ? "bg-emerald-50 text-emerald-600 border-emerald-200"
                : "bg-rose-50 text-rose-500 border-rose-200"
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
        <p className="text-[26px] font-semibold text-slate-900 leading-none tabular-nums">
          {typeof value === "number" ? value.toLocaleString() : value}
        </p>
        <p className="text-[11px] font-medium text-slate-500 mt-1 uppercase tracking-[0.05em]">
          {label}
        </p>
      </div>
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
        "bg-white rounded-[20px] border border-[#E2E2E2]",
        className,
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
    <div className="flex items-center justify-between px-4 py-3 border-b border-slate-200">
      <div className="flex items-center gap-2.5">
        <div
          className="w-6 h-6 rounded-xl flex items-center justify-center"
          style={{ backgroundColor: `${iconColor}15` }}
        >
          <Icon size={13} style={{ color: iconColor }} strokeWidth={2.5} />
        </div>
        <span className="text-[14px] font-semibold text-slate-800">{title}</span>
        {badge}
      </div>
      {action && <div>{action}</div>}
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
  const iconHex = iconColor.includes("indigo")
    ? "#6366f1"
    : iconColor.includes("amber")
      ? "#f59e0b"
      : iconColor.includes("emerald")
        ? "#10b981"
        : "#6366f1";

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
