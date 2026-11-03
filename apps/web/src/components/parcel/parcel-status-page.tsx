import Link from "next/link";
import { ArrowLeft, PackageX, ShieldCheck, Timer, TriangleAlert } from "lucide-react";
import { prisma } from "@repo/database";
import { auth } from "@/auth";
import { ParcelList } from "./parcel-list";

const ICONS = { cancel: PackageX, lost: TriangleAlert, approved: ShieldCheck, pending: Timer };

export interface ParcelStatusPageProps {
  status: string | string[];
  title: string;
  subtitle: string;
  /** Illustration from /public/brand, or an icon for statuses without one. */
  image?: string;
  icon?: keyof typeof ICONS;
  /** Label above the big number on the summary card. */
  headline: string;
  /** Shown on the summary card when there are no parcels. */
  emptyText: string;
  /** Label for the "today" stat, e.g. "Delivered today". */
  todayLabel: string;
  /** Show the oldest-waiting stat and the 2+ days warning (for queues). */
  isQueue?: boolean;
}

async function getSummary(status: string | string[]) {
  const session = await auth();
  const user = session?.user as { role?: string; organizationId?: string } | undefined;
  const where: Record<string, unknown> = { status: Array.isArray(status) ? { in: status } : status };
  if (user?.role !== "SUPER_ADMIN" && user?.organizationId) where.organizationId = user.organizationId;

  const startOfDay = new Date();
  startOfDay.setHours(0, 0, 0, 0);

  try {
    const [count, today, value, oldest, newest] = await Promise.all([
      prisma.parcel.count({ where }),
      prisma.parcel.count({ where: { ...where, updatedAt: { gte: startOfDay } } }),
      prisma.parcel.aggregate({ where, _sum: { amount: true } }),
      prisma.parcel.findFirst({ where, orderBy: { updatedAt: "asc" }, select: { updatedAt: true } }),
      prisma.parcel.findFirst({ where, orderBy: { updatedAt: "desc" }, select: { updatedAt: true } }),
    ]);
    return {
      count,
      today,
      value: value._sum.amount ?? 0,
      oldest: oldest?.updatedAt ?? null,
      newest: newest?.updatedAt ?? null,
    };
  } catch (error) {
    console.error("[ParcelStatusPage] summary failed:", error);
    return { count: 0, today: 0, value: 0, oldest: null, newest: null };
  }
}

function age(from: Date) {
  const hours = Math.floor((Date.now() - from.getTime()) / 3_600_000);
  if (hours < 1) return "under an hour";
  if (hours < 24) return `${hours} h`;
  const days = Math.floor(hours / 24);
  return `${days} day${days === 1 ? "" : "s"}`;
}

/** Status list page in the app's look: back header, bridge summary card, parcel table. */
export async function ParcelStatusPage(props: ParcelStatusPageProps) {
  const s = await getSummary(props.status);
  const Icon = props.icon ? ICONS[props.icon] : null;
  const oldDays = s.oldest ? (Date.now() - s.oldest.getTime()) / 86_400_000 : 0;

  const stats = [
    { label: props.todayLabel, value: s.today.toLocaleString("en-US") },
    { label: "Total value", value: `TSh ${Math.round(s.value).toLocaleString("en-US")}` },
    props.isQueue
      ? { label: "Oldest waiting", value: s.oldest ? age(s.oldest) : "—" }
      : { label: "Last update", value: s.newest ? `${age(s.newest)} ago` : "—" },
  ];

  return (
    <div className="flex flex-col gap-6">
      <div className="flex items-center gap-3">
        <Link
          href="/parcel"
          aria-label="Back to parcels"
          className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full border border-[#E2E2E2] bg-white text-slate-600 transition hover:border-orange-200 hover:bg-orange-50 hover:text-orange-600"
        >
          <ArrowLeft size={18} />
        </Link>
        <div>
          <h1 className="text-[26px] font-semibold leading-tight text-[#1C1C1E]">{props.title}</h1>
          <p className="text-[14px] text-slate-500">{props.subtitle}</p>
        </div>
      </div>

      <section className="bridge-card p-6 md:p-8">
        <div className="flex flex-wrap items-start justify-between gap-4">
          <div className="flex items-center gap-4">
            <div className="flex h-16 w-16 items-center justify-center rounded-2xl bg-white/10">
              {props.image ? (
                // eslint-disable-next-line @next/next/no-img-element
                <img src={props.image} alt="" className="h-12 w-12 object-contain" />
              ) : Icon ? (
                <Icon size={28} className="text-white" />
              ) : null}
            </div>
            <div>
              <p className="text-[14px] text-white/70">{props.headline}</p>
              <p className="text-[30px] sm:text-[40px] font-semibold leading-none tabular-nums">{s.count.toLocaleString("en-US")}</p>
            </div>
          </div>
          {props.isQueue && s.count > 0 && oldDays >= 2 && (
            <span className="accent-pill text-[13px]">Some have waited 2+ days</span>
          )}
        </div>

        {s.count === 0 ? (
          <p className="mt-6 text-[15px] text-white/75">{props.emptyText}</p>
        ) : (
          <div className="mt-8 grid grid-cols-1 gap-3 sm:grid-cols-3">
            {stats.map((st) => (
              <div key={st.label} className="rounded-2xl border border-white/15 bg-white/10 px-4 py-3 backdrop-blur-md">
                <p className="text-[12px] text-white/60">{st.label}</p>
                <p className="mt-0.5 text-[20px] font-semibold tabular-nums">{st.value}</p>
              </div>
            ))}
          </div>
        )}
      </section>

      <div className="overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white">
        <ParcelList status={props.status} />
      </div>
    </div>
  );
}
