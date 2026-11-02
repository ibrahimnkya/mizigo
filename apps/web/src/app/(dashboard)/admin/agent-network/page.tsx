"use client";

import { Suspense, useMemo, useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { Briefcase, Building2, CheckCircle2, Mail, Phone, Search, Store, User, X } from "lucide-react";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { ReportSummary } from "@/components/reports/report-kit";

interface PlatformAgent {
  id: string;
  type: "INDEPENDENT" | "BUSINESS";
  name: string;
  email: string;
  phone: string | null;
  businessName: string | null;
  businessReg: string | null;
  address: string | null;
  commissionRate: number | null;
  isActive: boolean;
  createdAt: string;
}

const TYPES = [
  { value: "", label: "All" },
  { value: "BUSINESS", label: "Businesses" },
  { value: "INDEPENDENT", label: "Independent" },
];

function AgentNetworkPageInner() {
  const [query, setQuery] = useState("");
  const [type, setType] = useState("");

  const { data: agents = [], isLoading } = useQuery<PlatformAgent[]>({
    queryKey: ["agent-network"],
    queryFn: async () => {
      const { data } = await api.get("/platform-agents/network");
      return data.data || data;
    },
  });

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    return agents.filter(
      (a) =>
        (!type || a.type === type) &&
        (!q ||
          [a.name, a.businessName, a.address, a.email, a.phone].some((v) => String(v ?? "").toLowerCase().includes(q))),
    );
  }, [agents, query, type]);

  const stats = [
    { label: "Businesses", value: agents.filter((a) => a.type === "BUSINESS").length, icon: Building2 },
    { label: "Independent", value: agents.filter((a) => a.type === "INDEPENDENT").length, icon: User },
    { label: "Active", value: agents.filter((a) => a.isActive).length, icon: CheckCircle2 },
    { label: "Paused", value: agents.filter((a) => !a.isActive).length, icon: Store },
  ];

  return (
    <div className="flex flex-col gap-5 pb-4">
      <ReportPageHeader
        title="Agent network"
        subtitle="Where customers can drop off and collect parcels"
        iconName="MapPin"
        hideBackArrow
      />

      <ReportSummary
        label="Agent offices"
        value={isLoading ? "…" : String(agents.length)}
        note="Where customers can drop off and collect parcels"
        loading={isLoading}
        chips={stats.map((x) => ({ label: x.label, value: isLoading ? "…" : String(x.value), icon: x.icon }))}
      />

      <section className="overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white">
        <div className="flex flex-wrap items-center gap-2 border-b border-slate-100 p-4">
          <label className="relative flex h-11 min-w-[240px] flex-1 items-center rounded-2xl border border-[#E2E2E2] bg-white focus-within:border-orange-500 focus-within:ring-4 focus-within:ring-orange-500/10">
            <Search size={16} className="pointer-events-none absolute left-3.5 text-slate-400" />
            <input
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              placeholder="Search name, business, area, phone or email"
              className="h-full w-full bg-transparent pl-10 pr-10 text-[14px] text-slate-700 outline-none placeholder:text-slate-400"
            />
            {query && (
              <button onClick={() => setQuery("")} aria-label="Clear" className="absolute right-2.5 rounded-full p-1 text-slate-400 hover:bg-slate-100">
                <X size={14} />
              </button>
            )}
          </label>
          <div className="flex h-11 gap-1 rounded-2xl bg-slate-100 p-1">
            {TYPES.map((t) => (
              <button
                key={t.value}
                onClick={() => setType(t.value)}
                className={cn(
                  "rounded-xl px-3.5 text-[13px] font-semibold transition",
                  type === t.value ? "bg-white text-[#1C1C1E] shadow-sm" : "text-slate-500 hover:text-[#1C1C1E]",
                )}
              >
                {t.label}
              </button>
            ))}
          </div>
          <span className="ml-auto text-[13px] text-slate-500">
            {filtered.length} of {agents.length}
          </span>
        </div>

        {isLoading ? (
          <div className="grid gap-4 p-4 sm:grid-cols-2 xl:grid-cols-3">
            {[1, 2, 3].map((n) => (
              <div key={n} className="h-[210px] animate-pulse rounded-[20px] bg-slate-100" />
            ))}
          </div>
        ) : filtered.length === 0 ? (
          <div className="flex flex-col items-center px-6 py-14 text-center">
            <span className="flex h-16 w-16 items-center justify-center rounded-full bg-orange-50">
              <Store size={26} className="text-orange-500" />
            </span>
            <p className="mt-4 text-[17px] font-semibold text-[#1C1C1E]">
              {agents.length ? "No agents match your search" : "No agent offices yet"}
            </p>
            <p className="mt-1 text-[14px] text-slate-500">
              {agents.length ? "Try a different name or area." : "Approved agents will appear here."}
            </p>
          </div>
        ) : (
          <div className="grid gap-4 p-5 sm:grid-cols-2 xl:grid-cols-4">
            {filtered.map((a) => {
              const business = a.type === "BUSINESS";
              return (
                <article
                  key={a.id}
                  className="flex flex-col rounded-[24px] border border-[#E2E2E2] bg-white p-5 transition hover:border-orange-300 hover:shadow-premium"
                >
                  <div className="flex items-start justify-between">
                    <span className="flex h-12 w-12 items-center justify-center rounded-2xl bg-orange-50">
                      {business ? <Briefcase size={22} className="text-orange-500" /> : <User size={22} className="text-orange-500" />}
                    </span>
                    <span
                      className={cn(
                        "rounded-full px-2.5 py-0.5 text-[12px] font-semibold",
                        a.isActive ? "bg-orange-500 text-white" : "bg-slate-100 text-slate-500",
                      )}
                    >
                      {a.isActive ? "Active" : "Paused"}
                    </span>
                  </div>
                  <p className="mt-4 truncate text-[16px] font-semibold text-[#1C1C1E]">{a.businessName || a.name}</p>
                  <p className="mt-0.5 line-clamp-2 text-[13px] text-slate-500">{a.address || "No address on file"}</p>
                  <p className="mt-3 truncate text-[12px] text-slate-400">
                    {business ? `Run by ${a.name}` : "Independent"}
                    {a.commissionRate != null ? ` · ${+(a.commissionRate * 100).toFixed(2)}% commission` : ""}
                  </p>
                  <div className="mt-4 flex gap-2 border-t border-slate-100 pt-4">
                    {a.phone && (
                      <a
                        href={`tel:${a.phone}`}
                        aria-label={`Call ${a.businessName || a.name}`}
                        className="flex h-9 flex-1 items-center justify-center gap-1.5 rounded-full bg-[#5C0B19] text-[13px] font-semibold text-white transition hover:bg-[#4F0A0C]"
                      >
                        <Phone size={14} /> Call
                      </a>
                    )}
                    <a
                      href={`mailto:${a.email}`}
                      aria-label={`Email ${a.businessName || a.name}`}
                      className="flex h-9 flex-1 items-center justify-center gap-1.5 rounded-full border border-[#E2E2E2] text-[13px] font-semibold text-[#5C0B19] transition hover:bg-[#FBF1F2]"
                    >
                      <Mail size={14} /> Email
                    </a>
                  </div>
                </article>
              );
            })}
          </div>
        )}
      </section>
    </div>
  );
}

export default function AgentNetworkPage() {
  return (
    <Suspense fallback={<div className="h-40 animate-pulse rounded-[24px] bg-slate-100" />}>
      <AgentNetworkPageInner />
    </Suspense>
  );
}
