"use client";

import Link from "next/link";
import { useState } from "react";
import { ArrowRight, PackageX, Search, SearchX, TriangleAlert, X } from "lucide-react";
import { cn } from "@/lib/utils";

export interface ParcelCardData {
  key: string;
  title: string;
  description: string;
  href: string;
  image?: string;
  icon?: "cancel" | "lost";
  tone: "maroon" | "orange" | "amber" | "green" | "neutral" | "red";
  count: number;
  snapshot: { label: string; value: string | number }[];
}

export interface ParcelSummary {
  total: number;
  active: number;
  delivered: number;
  received: number;
  inTransit: number;
  atStation: number;
}

const TONES: Record<ParcelCardData["tone"], { soft: string; text: string }> = {
  maroon: { soft: "bg-[#FBF1F2]", text: "text-[#5C0B19]" },
  orange: { soft: "bg-orange-50", text: "text-orange-600" },
  amber: { soft: "bg-amber-50", text: "text-amber-600" },
  green: { soft: "bg-emerald-50", text: "text-emerald-600" },
  neutral: { soft: "bg-slate-100", text: "text-slate-600" },
  red: { soft: "bg-rose-50", text: "text-rose-600" },
};

const ICONS = { cancel: PackageX, lost: TriangleAlert };

const fmt = (n: number) => n.toLocaleString("en-US");

/* ─── Summary: maroon bridge card, like the app's Reports summary ─────────── */
function SummaryCard({ summary }: { summary: ParcelSummary }) {
  const pct = summary.total > 0 ? Math.round((summary.delivered / summary.total) * 100) : 0;
  const stats = [
    { label: "Received", value: summary.received },
    { label: "On the way", value: summary.inTransit },
    { label: "At station", value: summary.atStation },
    { label: "Delivered", value: summary.delivered },
  ];

  return (
    <section className="bridge-card p-6 md:p-8">
      <div className="flex flex-wrap items-start justify-between gap-4">
        <div>
          <p className="text-[14px] text-white/70">All parcels</p>
          <p className="mt-1 text-[30px] sm:text-[44px] font-semibold leading-none tabular-nums">{fmt(summary.total)}</p>
          <p className="mt-2 text-[14px] text-white/70">
            {summary.total === 0
              ? "No parcels yet. They'll appear here once a station receives one."
              : `${fmt(summary.active)} still moving through the network`}
          </p>
        </div>
        {summary.total > 0 && <span className="accent-pill text-[13px]">{pct}% delivered</span>}
      </div>

      <div className="mt-8 grid grid-cols-2 gap-3 sm:grid-cols-4">
        {stats.map((s) => (
          <div key={s.label} className="rounded-2xl border border-white/15 bg-white/10 px-4 py-3 backdrop-blur-md">
            <p className="text-[12px] text-white/60">{s.label}</p>
            <p className="mt-0.5 text-[22px] font-semibold tabular-nums">{fmt(s.value)}</p>
          </div>
        ))}
      </div>
    </section>
  );
}

/* ─── Status tile: illustration + count, like the app's action tiles ─────── */
function StatusTile({ card }: { card: ParcelCardData }) {
  const tone = TONES[card.tone];
  const Icon = card.icon ? ICONS[card.icon] : null;
  const empty = card.count === 0;

  return (
    <Link
      href={card.href}
      className="group flex h-full flex-col rounded-[24px] border border-[#E2E2E2] bg-white p-5 transition hover:-translate-y-0.5 hover:shadow-premium"
    >
      <div className="flex items-start justify-between gap-3">
        <div className={cn("flex h-14 w-14 shrink-0 items-center justify-center rounded-2xl", tone.soft)}>
          {card.image ? (
            // eslint-disable-next-line @next/next/no-img-element
            <img src={card.image} alt="" className="h-11 w-11 object-contain transition-transform group-hover:scale-110" />
          ) : Icon ? (
            <Icon size={24} className={tone.text} />
          ) : null}
        </div>
        <span className="flex h-9 w-9 items-center justify-center rounded-full bg-slate-100 text-slate-500 transition group-hover:bg-orange-500 group-hover:text-white">
          <ArrowRight size={16} />
        </span>
      </div>

      <div className="mt-4">
        <h3 className="text-[16px] font-semibold text-[#1C1C1E]">{card.title}</h3>
        {empty ? (
          <p className="mt-1 text-[15px] font-medium text-slate-400">None yet</p>
        ) : (
          <p className={cn("mt-1 text-[30px] font-semibold leading-none tabular-nums", tone.text)}>{fmt(card.count)}</p>
        )}
        <p className="mt-2 text-[13px] leading-snug text-slate-500">{card.description}</p>
      </div>

      <div className="min-h-4 flex-1" />
      {!empty && (
        <div className="grid grid-cols-2 gap-3 border-t border-slate-100 pt-4">
          {card.snapshot.map((s) => (
            <div key={s.label}>
              <p className="text-[12px] text-slate-400">{s.label}</p>
              <p className="text-[14px] font-semibold text-slate-700 tabular-nums">{s.value}</p>
            </div>
          ))}
        </div>
      )}
    </Link>
  );
}

export function ParcelDashboard({ cards, summary }: { cards: ParcelCardData[]; summary: ParcelSummary }) {
  const [query, setQuery] = useState("");
  const q = query.trim().toLowerCase();
  const filtered = q
    ? cards.filter((c) => `${c.title} ${c.description}`.toLowerCase().includes(q))
    : cards;

  return (
    <div className="flex flex-col gap-6">
      {/* Header */}
      <div className="flex flex-wrap items-end justify-between gap-4">
        <div>
          <h1 className="text-[26px] font-semibold text-[#1C1C1E]">Parcels</h1>
          <p className="text-[14px] text-slate-500">Every parcel in your network, grouped by where it is now.</p>
        </div>
        <div className="relative w-full sm:w-72">
          <Search size={16} className="pointer-events-none absolute left-4 top-1/2 -translate-y-1/2 text-slate-400" />
          <input
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Filter statuses…"
            className="h-11 w-full rounded-full border border-[#E2E2E2] bg-white pl-11 pr-10 text-[14px] text-slate-700 outline-none transition placeholder:text-slate-400 focus:border-orange-500 focus:ring-4 focus:ring-orange-500/10"
          />
          {query && (
            <button
              onClick={() => setQuery("")}
              aria-label="Clear"
              className="absolute right-3 top-1/2 -translate-y-1/2 rounded-full p-1 text-slate-400 hover:bg-slate-100 hover:text-slate-600"
            >
              <X size={14} />
            </button>
          )}
        </div>
      </div>

      <SummaryCard summary={summary} />

      {/* Status tiles */}
      <div>
        <div className="mb-3 flex items-end justify-between">
          <h2 className="text-[19px] font-semibold text-[#1C1C1E]">By status</h2>
          <p className="text-[13px] text-slate-400">Open a status to see its parcels</p>
        </div>

        {filtered.length > 0 ? (
          <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-3">
            {filtered.map((card) => (
              <StatusTile key={card.key} card={card} />
            ))}
          </div>
        ) : (
          <div className="flex flex-col items-center rounded-[24px] border border-[#E2E2E2] bg-white px-6 py-14 text-center">
            <div className="flex h-16 w-16 items-center justify-center rounded-full bg-orange-50">
              <SearchX size={28} className="text-orange-500" />
            </div>
            <h3 className="mt-4 text-[17px] font-semibold text-[#1C1C1E]">No status matches “{query}”</h3>
            <p className="mt-1 text-[14px] text-slate-500">Try “received”, “delivered” or “lost”.</p>
            <button
              onClick={() => setQuery("")}
              className="mt-5 h-10 rounded-full bg-[#5C0B19] px-5 text-[14px] font-semibold text-white transition hover:bg-[#4F0A0C]"
            >
              Clear filter
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
