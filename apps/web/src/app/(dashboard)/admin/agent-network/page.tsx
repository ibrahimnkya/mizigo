"use client";

import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { useState, Suspense } from "react";
import {
  Building,
  Search,
  MapPin,
  Phone,
  Mail,
  User,
  Briefcase,
  Users,
  Building2,
  Map,
  Loader2,
  Globe,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";

// ─── Types ────────────────────────────────────────────────────────────────────

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

// ─── Inner Page Component ─────────────────────────────────────────────────────

function AgentNetworkPageInner() {
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedType, setSelectedType] = useState<string>("");

  // Fetch Agent Network List
  const { data: agents = [], isLoading, refetch, isFetching } = useQuery<PlatformAgent[]>({
    queryKey: ["agent-network"],
    queryFn: async () => {
      const { data } = await api.get("/platform-agents/network");
      return data.data || data;
    },
  });

  // Filter Agents Locally
  const filteredAgents = agents.filter((agent) => {
    const query = searchQuery.toLowerCase();
    const matchesSearch =
      agent.name.toLowerCase().includes(query) ||
      (agent.businessName?.toLowerCase().includes(query) ?? false) ||
      (agent.address?.toLowerCase().includes(query) ?? false) ||
      (agent.email.toLowerCase().includes(query)) ||
      (agent.phone?.includes(query) ?? false);

    const matchesType = !selectedType || agent.type === selectedType;

    return matchesSearch && matchesType;
  });

  // Stats
  const totalOffices = agents.length;
  const corporateOffices = agents.filter((a) => a.type === "BUSINESS").length;
  const independentOffices = agents.filter((a) => a.type === "INDEPENDENT").length;

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">

        <ReportPageHeader
          title="Agent Network & Offices"
          subtitle="Explore authorized agent locations, drop-off points, and network offices"
          iconName="Building"
          hideBackArrow={true}
        />

        {/* ── Overview Stats cards ── */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="bg-white border border-slate-100 rounded-2xl p-6 shadow-sm flex items-center gap-5">
            <div className="w-14 h-14 rounded-xl bg-blue-50 border border-blue-100 flex items-center justify-center text-blue-600 shrink-0">
              <Building2 size={24} />
            </div>
            <div>
              <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 block mb-0.5">Total Agent Offices</span>
              <span className="text-3xl font-black text-slate-900 leading-none">{totalOffices}</span>
            </div>
          </div>

          <div className="bg-white border border-slate-100 rounded-2xl p-6 shadow-sm flex items-center gap-5">
            <div className="w-14 h-14 rounded-xl bg-emerald-50 border border-emerald-100 flex items-center justify-center text-emerald-600 shrink-0">
              <Briefcase size={24} />
            </div>
            <div>
              <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 block mb-0.5">Business / Corporate</span>
              <span className="text-3xl font-black text-slate-900 leading-none">{corporateOffices}</span>
            </div>
          </div>

          <div className="bg-white border border-slate-100 rounded-2xl p-6 shadow-sm flex items-center gap-5">
            <div className="w-14 h-14 rounded-xl bg-purple-50 border border-purple-100 flex items-center justify-center text-purple-600 shrink-0">
              <User size={24} />
            </div>
            <div>
              <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 block mb-0.5">Independent Agents</span>
              <span className="text-3xl font-black text-slate-900 leading-none">{independentOffices}</span>
            </div>
          </div>
        </div>

        {/* ── Filter Bar ── */}
        <div className="bg-white border border-slate-100 rounded-2xl shadow-sm p-6 flex flex-col md:flex-row gap-4 items-end">
          <div className="flex-1 space-y-2 w-full">
            <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">Search Locations & Names</Label>
            <div className="relative">
              <Search size={14} className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400" />
              <Input
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="Search by agent name, business office, city, address..."
                className="h-12 pl-10 bg-slate-50 border-slate-100 rounded-xl text-[13px] font-bold"
              />
            </div>
          </div>

          <div className="w-full md:w-[240px] space-y-2">
            <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">Office Type</Label>
            <select
              value={selectedType}
              onChange={(e) => setSelectedType(e.target.value)}
              className="w-full h-12 px-4 bg-slate-50 border border-slate-100 rounded-xl text-[13px] font-bold text-slate-700 outline-none focus:ring-2 focus:ring-blue-500 cursor-pointer"
            >
              <option value="">All Types</option>
              <option value="BUSINESS">Business Office</option>
              <option value="INDEPENDENT">Independent Agent</option>
            </select>
          </div>
        </div>

        {/* ── Network Grid ── */}
        {isLoading ? (
          <div className="bg-white border border-slate-100 rounded-2xl shadow-sm min-h-[400px] flex flex-col items-center justify-center gap-3">
            <Loader2 className="w-8 h-8 animate-spin text-slate-400" />
            <span className="text-[11px] font-black text-slate-400 uppercase tracking-widest animate-pulse">Loading agent network...</span>
          </div>
        ) : filteredAgents.length === 0 ? (
          <div className="bg-white border border-slate-100 rounded-2xl shadow-sm min-h-[400px] flex flex-col items-center justify-center text-center p-8">
            <div className="w-14 h-14 bg-slate-50 border border-slate-100 rounded-full flex items-center justify-center text-slate-400 mb-4">
              <Map size={24} />
            </div>
            <h3 className="text-sm font-black text-slate-700">No agent offices found</h3>
            <p className="text-[12px] text-slate-400 max-w-[320px] leading-relaxed mt-1">
              Try adjusting your search queries or category filters to find the right agent office.
            </p>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {filteredAgents.map((agent) => {
              const isBusiness = agent.type === "BUSINESS";

              return (
                <div
                  key={agent.id}
                  className="bg-white border border-slate-100 hover:border-blue-200 rounded-2xl p-6 shadow-sm transition-all duration-300 hover:shadow-md flex flex-col justify-between group relative overflow-hidden"
                >
                  {/* Subtle top decoration */}
                  <div className={cn(
                    "absolute top-0 left-0 right-0 h-1.5",
                    isBusiness ? "bg-emerald-500" : "bg-purple-500"
                  )} />

                  <div>
                    {/* Header */}
                    <div className="flex items-start justify-between gap-4 mb-4">
                      <div>
                        <span className={cn(
                          "px-2.5 py-1 text-[8px] font-black uppercase tracking-widest rounded-md border block w-fit mb-2",
                          isBusiness
                            ? "bg-emerald-50 text-emerald-700 border-emerald-100"
                            : "bg-purple-50 text-purple-700 border-purple-100"
                        )}>
                          {isBusiness ? "Business" : "Independent"}
                        </span>
                        <h4 className="text-[16px] font-black text-slate-900 group-hover:text-blue-600 transition-colors">
                          {agent.businessName || agent.name}
                        </h4>
                        {isBusiness && agent.businessName && (
                          <span className="text-[11px] font-bold text-slate-400 block mt-0.5">
                            Rep: {agent.name}
                          </span>
                        )}
                      </div>
                      <div className={cn(
                        "w-10 h-10 rounded-lg flex items-center justify-center shrink-0 border",
                        isBusiness
                          ? "bg-emerald-50/50 border-emerald-100 text-emerald-600"
                          : "bg-purple-50/50 border-purple-100 text-purple-600"
                      )}>
                        {isBusiness ? <Building size={16} /> : <User size={16} />}
                      </div>
                    </div>

                    {/* Address / Location */}
                    <div className="flex items-start gap-2.5 py-3 border-t border-slate-50 text-[13px] font-medium text-slate-500">
                      <MapPin size={15} className="text-slate-400 mt-0.5 shrink-0" />
                      <span>{agent.address || "Address not registered"}</span>
                    </div>
                  </div>

                  {/* Contact details footer */}
                  <div className="pt-4 border-t border-slate-50 mt-4 space-y-2">
                    {agent.phone && (
                      <div className="flex items-center gap-2.5 text-[12px] font-bold text-slate-700">
                        <Phone size={13} className="text-slate-400 shrink-0" />
                        <span className="font-mono">{agent.phone}</span>
                      </div>
                    )}
                    <div className="flex items-center gap-2.5 text-[12px] font-bold text-slate-700">
                      <Mail size={13} className="text-slate-400 shrink-0" />
                      <span className="truncate">{agent.email}</span>
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        )}

      </div>
    </div>
  );
}

// ─── Export ───────────────────────────────────────────────────────────────────

export default function AgentNetworkPage() {
  return (
    <Suspense fallback={
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    }>
      <AgentNetworkPageInner />
    </Suspense>
  );
}
