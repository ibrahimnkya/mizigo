"use client";

import { useMemo } from "react";
import { startOfMonth } from "date-fns";
import { CheckCircle2, PauseCircle, ShieldCheck, UserPlus, Users } from "lucide-react";
import { ReportSummary } from "@/components/reports/report-kit";
import { Cell, Pie, PieChart, ResponsiveContainer, Tooltip } from "recharts";
import { cn } from "@/lib/utils";
import { formatDistanceToNow } from "date-fns";

const ROLE_LABELS: Record<string, string> = {
  SUPER_ADMIN: "Super admins",
  ADMIN: "Admins",
  ORG_ADMIN: "Admins",
  STATION_MASTER: "Station masters",
  CLERK: "Clerks",
  TRAIN_GUARD: "Train guards",
  AGENT: "Agents",
  CUSTOMER: "Customers",
};
// Brand-led palette for the role donut.
const ROLE_COLORS = ["#5C0B19", "#F78A1F", "#A63A4C", "#FBAF69", "#45393A", "#DD720B", "#CF7C89"];

const roleOf = (u: any) => String(u?.role?.name ?? u?.role ?? "OTHER");

/** Overview tab for user lists: summary card + one card with roles and newest people. */
export function PeopleOverview({
  users,
  loading,
  title = "People",
  onManage,
  manageLabel = "Manage people",
}: {
  users: any[];
  loading?: boolean;
  title?: string;
  onManage?: () => void;
  manageLabel?: string;
}) {
  const stats = useMemo(() => {
    const byRole = new Map<string, number>();
    const monthStart = startOfMonth(new Date());
    let active = 0;
    let newThisMonth = 0;
    for (const u of users) {
      const label = ROLE_LABELS[roleOf(u)] ?? roleOf(u).replace(/_/g, " ").toLowerCase();
      byRole.set(label, (byRole.get(label) ?? 0) + 1);
      if (u.isActive !== false) active += 1;
      if (u.createdAt && new Date(u.createdAt) >= monthStart) newThisMonth += 1;
    }
    const roles = [...byRole.entries()].sort((a, b) => b[1] - a[1]);
    const newest = [...users]
      .filter((u) => u.createdAt)
      .sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime())
      .slice(0, 6);
    return { roles, active, newThisMonth, newest };
  }, [users]);


  return (
    <div className="flex flex-col gap-5">
      <ReportSummary
        label={title}
        value={loading ? "…" : users.length.toLocaleString("en-US")}
        note={stats.roles.map(([r, n]) => `${r} ${n}`).join(" · ") || undefined}
        loading={loading}
        chips={[
          { label: "Active", value: stats.active.toLocaleString("en-US"), icon: CheckCircle2 },
          { label: "Disabled", value: (users.length - stats.active).toLocaleString("en-US"), icon: PauseCircle },
          { label: "Roles", value: String(stats.roles.length), icon: ShieldCheck },
          { label: "Added this month", value: stats.newThisMonth.toLocaleString("en-US"), icon: UserPlus },
        ]}
      />

      <section className="overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white">
        <div className="flex flex-wrap items-center justify-between gap-3 border-b border-slate-100 px-5 py-4">
          <div>
            <h2 className="text-[17px] font-semibold text-[#1C1C1E]">Your team</h2>
            <p className="text-[13px] text-slate-500">Who has access, by role</p>
          </div>
          {onManage && (
            <button
              onClick={onManage}
              className="h-10 rounded-full bg-[#5C0B19] px-4 text-[13px] font-semibold text-white transition hover:bg-[#4F0A0C]"
            >
              {manageLabel}
            </button>
          )}
        </div>

        {loading ? (
          <div className="grid gap-4 p-5 lg:grid-cols-2">
            <div className="h-48 animate-pulse rounded-[20px] bg-slate-100" />
            <div className="h-48 animate-pulse rounded-[20px] bg-slate-100" />
          </div>
        ) : users.length === 0 ? (
          <div className="flex flex-col items-center px-6 py-12 text-center">
            <span className="flex h-16 w-16 items-center justify-center rounded-full bg-orange-50">
              <Users size={26} className="text-orange-500" />
            </span>
            <p className="mt-4 text-[17px] font-semibold text-[#1C1C1E]">No one here yet</p>
            <p className="mt-1 text-[14px] text-slate-500">People you add will appear here.</p>
          </div>
        ) : (
          <div className="grid gap-5 p-5 lg:grid-cols-2">
            <div className="rounded-[20px] border border-[#E2E2E2] p-4">
              <p className="mb-2 text-[14px] font-semibold text-[#1C1C1E]">By role</p>
              <div className="flex flex-col items-center gap-4 sm:flex-row">
                <div className="relative h-[180px] w-[180px] shrink-0">
                  <ResponsiveContainer width="100%" height="100%">
                    <PieChart>
                      <Pie
                        data={stats.roles.map(([name, value]) => ({ name, value }))}
                        dataKey="value"
                        nameKey="name"
                        innerRadius={58}
                        outerRadius={86}
                        paddingAngle={stats.roles.length > 1 ? 2 : 0}
                        stroke="none"
                      >
                        {stats.roles.map(([role], i) => (
                          <Cell key={role} fill={ROLE_COLORS[i % ROLE_COLORS.length]} />
                        ))}
                      </Pie>
                      <Tooltip
                        contentStyle={{ borderRadius: 14, border: "1px solid #E2E2E2", fontSize: 13 }}
                        formatter={(v: any, n: any) => [Number(v).toLocaleString("en-US"), n]}
                      />
                    </PieChart>
                  </ResponsiveContainer>
                  <div className="pointer-events-none absolute inset-0 flex flex-col items-center justify-center">
                    <span className="text-[24px] font-semibold leading-none tabular-nums text-[#1C1C1E]">
                      {users.length.toLocaleString("en-US")}
                    </span>
                    <span className="mt-1 text-[12px] text-slate-500">people</span>
                  </div>
                </div>
                <ul className="w-full space-y-2.5">
                  {stats.roles.map(([role, n], i) => (
                    <li key={role} className="flex items-center gap-3 text-[14px]">
                      <span className="h-3 w-3 shrink-0 rounded-full" style={{ background: ROLE_COLORS[i % ROLE_COLORS.length] }} />
                      <span className="flex-1 capitalize text-[#1C1C1E]">{role}</span>
                      <span className="font-semibold tabular-nums text-[#1C1C1E]">{n.toLocaleString("en-US")}</span>
                      <span className="w-10 text-right tabular-nums text-slate-400">
                        {users.length ? Math.round((n / users.length) * 100) : 0}%
                      </span>
                    </li>
                  ))}
                </ul>
              </div>
            </div>

            <div className="rounded-[20px] border border-[#E2E2E2] p-4">
              <p className="mb-2 text-[14px] font-semibold text-[#1C1C1E]">Recently added</p>
              <ul className="divide-y divide-slate-100">
                {stats.newest.map((u) => (
                  <li key={u.id} className="flex items-center gap-3 py-2.5">
                    <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-[#5C0B19] text-[13px] font-semibold text-white">
                      {(u.name || "?").charAt(0).toUpperCase()}
                    </span>
                    <div className="min-w-0 flex-1">
                      <p className="truncate text-[14px] font-semibold text-[#1C1C1E]">{u.name}</p>
                      <p className="truncate text-[12px] text-slate-500">
                        {[ROLE_LABELS[roleOf(u)]?.replace(/s$/, ""), u.station?.name ?? u.organization?.name].filter(Boolean).join(" · ") || u.email}
                      </p>
                    </div>
                    <span
                      className={cn(
                        "shrink-0 rounded-full px-2 py-0.5 text-[11px] font-semibold",
                        u.isActive === false ? "bg-slate-100 text-slate-500" : "bg-emerald-50 text-emerald-700",
                      )}
                    >
                      {u.isActive === false ? "Disabled" : "Active"}
                    </span>
                    <span className="hidden shrink-0 text-[12px] text-slate-400 sm:inline">
                      {formatDistanceToNow(new Date(u.createdAt), { addSuffix: true })}
                    </span>
                  </li>
                ))}
              </ul>
            </div>
          </div>
        )}
      </section>
    </div>
  );
}
