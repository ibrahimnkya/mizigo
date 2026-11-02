"use client";

import { formatDistanceToNow } from "date-fns";
import { cn } from "@/lib/utils";

/** Building blocks for page "Overview" tabs, in the app's style. */

export type Tile = { label: string; value: string | number; icon: React.ElementType; tone?: string };

const TONES = [
  "bg-orange-50 text-orange-500",
  "bg-emerald-50 text-emerald-600",
  "bg-[#FBF1F2] text-[#5C0B19]",
  "bg-amber-50 text-amber-600",
];

export function StatTiles({ items, loading }: { items: Tile[]; loading?: boolean }) {
  return (
    <div className={cn("grid grid-cols-2 gap-4", items.length >= 4 ? "lg:grid-cols-4" : "lg:grid-cols-3")}>
      {items.map((t, i) => (
        <div key={t.label} className="flex items-center gap-4 rounded-[24px] border border-[#E2E2E2] bg-white p-5">
          <span className={cn("flex h-12 w-12 shrink-0 items-center justify-center rounded-2xl", t.tone ?? TONES[i % TONES.length])}>
            <t.icon size={22} />
          </span>
          <div className="min-w-0">
            <p className="truncate text-[13px] text-slate-500">{t.label}</p>
            <p className="truncate text-[24px] font-semibold leading-tight tabular-nums text-[#1C1C1E]">
              {loading ? "…" : typeof t.value === "number" ? t.value.toLocaleString("en-US") : t.value}
            </p>
          </div>
        </div>
      ))}
    </div>
  );
}

function CardShell({
  title,
  subtitle,
  action,
  children,
}: {
  title: string;
  subtitle?: string;
  action?: React.ReactNode;
  children: React.ReactNode;
}) {
  return (
    <section className="flex flex-col rounded-[24px] border border-[#E2E2E2] bg-white p-5">
      <div className="mb-4 flex items-start justify-between gap-3">
        <div>
          <h2 className="text-[17px] font-semibold text-[#1C1C1E]">{title}</h2>
          {subtitle && <p className="text-[13px] text-slate-500">{subtitle}</p>}
        </div>
        {action}
      </div>
      {children}
    </section>
  );
}

/** Labelled bars, e.g. users by role. Hides zero rows. */
export function BreakdownCard({
  title,
  subtitle,
  items,
  empty = "Nothing to show yet.",
  action,
  format = (n: number) => n.toLocaleString("en-US"),
}: {
  title: string;
  subtitle?: string;
  items: { label: string; value: number }[];
  empty?: string;
  action?: React.ReactNode;
  format?: (n: number) => string;
}) {
  const rows = items.filter((i) => i.value > 0).sort((a, b) => b.value - a.value);
  const max = Math.max(0, ...rows.map((r) => r.value));
  return (
    <CardShell title={title} subtitle={subtitle} action={action}>
      {rows.length === 0 ? (
        <p className="py-6 text-center text-[14px] text-slate-400">{empty}</p>
      ) : (
        <ul className="space-y-3">
          {rows.map((r) => (
            <li key={r.label}>
              <div className="mb-1 flex items-center justify-between gap-3 text-[14px]">
                <span className="truncate font-medium text-[#1C1C1E]">{r.label}</span>
                <span className="shrink-0 tabular-nums text-slate-500">{format(r.value)}</span>
              </div>
              <div className="h-2 overflow-hidden rounded-full bg-slate-100">
                <div className="h-full rounded-full bg-orange-500" style={{ width: `${Math.max(4, Math.round((r.value / max) * 100))}%` }} />
              </div>
            </li>
          ))}
        </ul>
      )}
    </CardShell>
  );
}

/** Short list of recent items with an avatar letter, a line of detail and a time. */
export function RecentCard({
  title,
  subtitle,
  items,
  empty = "Nothing yet.",
  action,
}: {
  title: string;
  subtitle?: string;
  items: { id: string; title: string; detail?: string; at?: string | Date; badge?: React.ReactNode }[];
  empty?: string;
  action?: React.ReactNode;
}) {
  return (
    <CardShell title={title} subtitle={subtitle} action={action}>
      {items.length === 0 ? (
        <p className="py-6 text-center text-[14px] text-slate-400">{empty}</p>
      ) : (
        <ul className="-my-1 divide-y divide-slate-100">
          {items.map((i) => (
            <li key={i.id} className="flex items-center gap-3 py-2.5">
              <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-[#5C0B19] text-[13px] font-semibold text-white">
                {(i.title || "?").charAt(0).toUpperCase()}
              </span>
              <div className="min-w-0 flex-1">
                <p className="truncate text-[14px] font-semibold text-[#1C1C1E]">{i.title}</p>
                {i.detail && <p className="truncate text-[12px] text-slate-500">{i.detail}</p>}
              </div>
              {i.badge}
              {i.at && (
                <span className="shrink-0 text-[12px] text-slate-400">
                  {formatDistanceToNow(new Date(i.at), { addSuffix: true })}
                </span>
              )}
            </li>
          ))}
        </ul>
      )}
    </CardShell>
  );
}

/** Primary (maroon) pill link/button used in overview cards. */
export function PrimaryPill({ children, onClick, href }: { children: React.ReactNode; onClick?: () => void; href?: string }) {
  const cls = "flex h-9 shrink-0 items-center rounded-full bg-[#5C0B19] px-4 text-[13px] font-semibold text-white transition hover:bg-[#4F0A0C]";
  return href ? (
    <a href={href} className={cls}>
      {children}
    </a>
  ) : (
    <button onClick={onClick} className={cls}>
      {children}
    </button>
  );
}
