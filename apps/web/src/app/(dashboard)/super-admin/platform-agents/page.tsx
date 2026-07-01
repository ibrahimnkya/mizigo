"use client";

import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";
import {
  Users,
  Building2,
  Plus,
  Pencil,
  Trash2,
  Loader2,
  CheckCircle,
  XCircle,
  Clock,
  Eye,
  CircleDollarSign,
  BadgeCheck,
  BadgeX,
  TrendingUp,
  Layers,
  AlertCircle,
  Calendar,
  Percent,
  ShieldCheck,
} from "lucide-react";
import { useState, Suspense } from "react";
import { useSearchParams } from "next/navigation";
import { toast } from "sonner";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { Switch } from "@repo/ui/switch";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
  DialogClose,
} from "@repo/ui/dialog";
import { cn } from "@/lib/utils";
import { format } from "date-fns";

// ─── Types ────────────────────────────────────────────────────────────────────

type AgentType = "INDEPENDENT" | "BUSINESS";
type KycStatus = "PENDING" | "UNDER_REVIEW" | "APPROVED" | "REJECTED";

interface PlatformAgent {
  id: string;
  type: AgentType;
  name: string;
  email: string;
  phone: string | null;
  businessName: string | null;
  businessReg: string | null;
  address: string | null;
  kycStatus: KycStatus;
  kycNotes: string | null;
  commissionRate: number | null;
  isActive: boolean;
  reviewedAt: string | null;
  createdAt: string;
  updatedAt: string;
  _count?: { commissions: number };
}

interface AgentCommission {
  id: string;
  agentId: string;
  periodStart: string;
  periodEnd: string;
  grossRevenue: number;
  commissionRate: number;
  commissionDue: number;
  collectedAt: string | null;
  notes: string | null;
  createdAt: string;
  agent?: { id: string; name: string; type: AgentType; email: string; businessName: string | null };
}

interface AgentFormState {
  id?: string;
  type: AgentType;
  name: string;
  email: string;
  phone: string;
  businessName: string;
  businessReg: string;
  address: string;
  commissionRate: string;
}

interface CommissionFormState {
  agentId: string;
  agentName: string;
  periodStart: string;
  periodEnd: string;
  grossRevenue: string;
  notes: string;
}

// ─── KYC Badge ────────────────────────────────────────────────────────────────

function KycBadge({ status }: { status: KycStatus }) {
  const map: Record<KycStatus, { label: string; className: string; icon: any }> = {
    PENDING: { label: "Pending", className: "bg-amber-50 text-amber-700 border-amber-100", icon: Clock },
    UNDER_REVIEW: { label: "Under Review", className: "bg-blue-50 text-blue-700 border-blue-100", icon: Eye },
    APPROVED: { label: "Approved", className: "bg-emerald-50 text-emerald-700 border-emerald-100", icon: BadgeCheck },
    REJECTED: { label: "Rejected", className: "bg-red-50 text-red-700 border-red-100", icon: BadgeX },
  };
  const { label, className, icon: Icon } = map[status] || map.PENDING;
  return (
    <span className={cn("inline-flex items-center gap-1.5 px-2.5 py-1 text-[9px] font-black uppercase tracking-widest rounded-[6px] border", className)}>
      <Icon size={9} />
      {label}
    </span>
  );
}

// ─── Main Inner Component ─────────────────────────────────────────────────────

function PlatformAgentsPageInner() {
  const queryClient = useQueryClient();
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  // ── Modal state ──
  const [agentModal, setAgentModal] = useState(false);
  const [kycModal, setKycModal] = useState(false);
  const [commissionModal, setCommissionModal] = useState(false);
  const [collectModal, setCollectModal] = useState<AgentCommission | null>(null);
  const [selectedAgent, setSelectedAgent] = useState<PlatformAgent | null>(null);

  const [agentForm, setAgentForm] = useState<AgentFormState>({
    type: "INDEPENDENT",
    name: "",
    email: "",
    phone: "",
    businessName: "",
    businessReg: "",
    address: "",
    commissionRate: "",
  });

  const [kycForm, setKycForm] = useState({
    agentId: "",
    agentName: "",
    kycStatus: "APPROVED" as KycStatus,
    kycNotes: "",
  });

  const [commissionForm, setCommissionForm] = useState<CommissionFormState>({
    agentId: "",
    agentName: "",
    periodStart: "",
    periodEnd: "",
    grossRevenue: "",
    notes: "",
  });

  // ── Queries ──
  const { data: agents = [], isLoading: loadingAgents } = useQuery<PlatformAgent[]>({
    queryKey: ["platform-agents"],
    queryFn: async () => {
      const { data } = await api.get("/platform-agents");
      return data.data || data;
    },
  });

  const { data: commissions = [], isLoading: loadingCommissions } = useQuery<AgentCommission[]>({
    queryKey: ["agent-commissions"],
    queryFn: async () => {
      const { data } = await api.get("/agent-commissions");
      return data.data || data;
    },
  });

  // ── Mutations ──
  const { mutate: createAgent, isPending: isCreating } = useMutation({
    mutationFn: async (payload: Omit<AgentFormState, "id">) => {
      const { data } = await api.post("/platform-agents", {
        ...payload,
        commissionRate: payload.commissionRate ? parseFloat(payload.commissionRate) / 100 : undefined,
      });
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["platform-agents"] });
      toast.success("Platform agent registered successfully");
      setAgentModal(false);
      resetAgentForm();
    },
    onError: (err: any) => toast.error(err.response?.data?.error?.message || "Failed to register agent"),
  });

  const { mutate: updateAgent, isPending: isUpdating } = useMutation({
    mutationFn: async ({ id, payload }: { id: string; payload: Partial<AgentFormState> }) => {
      const { data } = await api.put(`/platform-agents/${id}`, {
        ...payload,
        commissionRate: payload.commissionRate ? parseFloat(payload.commissionRate) / 100 : undefined,
      });
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["platform-agents"] });
      toast.success("Agent details updated");
      setAgentModal(false);
      resetAgentForm();
    },
    onError: (err: any) => toast.error(err.response?.data?.error?.message || "Failed to update agent"),
  });

  const { mutate: updateKyc, isPending: isUpdatingKyc } = useMutation({
    mutationFn: async ({ id, kycStatus, kycNotes }: { id: string; kycStatus: KycStatus; kycNotes: string }) => {
      const { data } = await api.put(`/platform-agents/${id}`, { kycStatus, kycNotes });
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["platform-agents"] });
      toast.success("KYC status updated successfully");
      setKycModal(false);
    },
    onError: (err: any) => toast.error(err.response?.data?.error?.message || "Failed to update KYC"),
  });

  const { mutate: deleteAgent } = useMutation({
    mutationFn: async (id: string) => {
      const { data } = await api.delete(`/platform-agents/${id}`);
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["platform-agents"] });
      toast.success("Agent removed from platform");
    },
    onError: (err: any) => toast.error(err.response?.data?.error?.message || "Failed to remove agent"),
  });

  const { mutate: createCommission, isPending: isCreatingCommission } = useMutation({
    mutationFn: async (payload: CommissionFormState) => {
      const { data } = await api.post("/agent-commissions", {
        agentId: payload.agentId,
        periodStart: payload.periodStart,
        periodEnd: payload.periodEnd,
        grossRevenue: parseFloat(payload.grossRevenue),
        notes: payload.notes,
      });
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["agent-commissions"] });
      toast.success("Commission period recorded");
      setCommissionModal(false);
      resetCommissionForm();
    },
    onError: (err: any) => toast.error(err.response?.data?.error?.message || "Failed to record commission"),
  });

  const { mutate: collectCommission, isPending: isCollecting } = useMutation({
    mutationFn: async ({ id, notes }: { id: string; notes?: string }) => {
      const { data } = await api.put(`/agent-commissions/${id}/collect`, { notes });
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["agent-commissions"] });
      toast.success("Commission marked as collected");
      setCollectModal(null);
    },
    onError: (err: any) => toast.error(err.response?.data?.error?.message || "Failed to collect commission"),
  });

  // ── Helpers ──
  const resetAgentForm = () => setAgentForm({ type: "INDEPENDENT", name: "", email: "", phone: "", businessName: "", businessReg: "", address: "", commissionRate: "" });
  const resetCommissionForm = () => setCommissionForm({ agentId: "", agentName: "", periodStart: "", periodEnd: "", grossRevenue: "", notes: "" });

  const openCreateAgent = () => {
    resetAgentForm();
    setAgentModal(true);
  };

  const openEditAgent = (agent: PlatformAgent) => {
    setAgentForm({
      id: agent.id,
      type: agent.type,
      name: agent.name,
      email: agent.email,
      phone: agent.phone || "",
      businessName: agent.businessName || "",
      businessReg: agent.businessReg || "",
      address: agent.address || "",
      commissionRate: agent.commissionRate ? String(agent.commissionRate * 100) : "",
    });
    setAgentModal(true);
  };

  const openKycReview = (agent: PlatformAgent) => {
    setKycForm({ agentId: agent.id, agentName: agent.name, kycStatus: agent.kycStatus === "REJECTED" ? "APPROVED" : agent.kycStatus, kycNotes: agent.kycNotes || "" });
    setKycModal(true);
  };

  const openCommissionModal = (agent: PlatformAgent) => {
    const today = new Date();
    const firstOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
    const lastOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);
    setCommissionForm({
      agentId: agent.id,
      agentName: agent.name,
      periodStart: format(firstOfMonth, "yyyy-MM-dd"),
      periodEnd: format(lastOfMonth, "yyyy-MM-dd"),
      grossRevenue: "",
      notes: "",
    });
    setCommissionModal(true);
  };

  const handleAgentSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!agentForm.name.trim() || !agentForm.email.trim()) {
      toast.error("Name and email are required");
      return;
    }
    const { id, ...payload } = agentForm;
    if (id) {
      updateAgent({ id, payload });
    } else {
      createAgent(payload);
    }
  };

  const handleKycSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    updateKyc({ id: kycForm.agentId, kycStatus: kycForm.kycStatus, kycNotes: kycForm.kycNotes });
  };

  const handleCommissionSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!commissionForm.periodStart || !commissionForm.periodEnd || !commissionForm.grossRevenue) {
      toast.error("Period dates and gross revenue are required");
      return;
    }
    createCommission(commissionForm);
  };

  const formatCurrency = (amount: number) =>
    new Intl.NumberFormat("en-TZ", { style: "currency", currency: "TZS", minimumFractionDigits: 0 }).format(amount);

  // ── Stats ──
  const totalAgents = agents.length;
  const activeAgents = agents.filter((a) => a.isActive).length;
  const pendingKyc = agents.filter((a) => ["PENDING", "UNDER_REVIEW"].includes(a.kycStatus)).length;
  const independentAgents = agents.filter((a) => a.type === "INDEPENDENT").length;
  const businesses = agents.filter((a) => a.type === "BUSINESS").length;

  const totalCommissionDue = commissions.reduce((s, c) => s + c.commissionDue, 0);
  const totalCollected = commissions.filter((c) => c.collectedAt).reduce((s, c) => s + c.commissionDue, 0);
  const pendingCommissions = commissions.filter((c) => !c.collectedAt);

  const kycAgents = agents.filter((a) => ["PENDING", "UNDER_REVIEW"].includes(a.kycStatus));

  if (loadingAgents) {
    return (
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
        <ReportPageHeader
          title="Platform Agents & Businesses"
          subtitle="Register and manage independent agents and business partners — KYC, commission rates, and collection"
          icon={(props: any) => <Users className="text-blue-400" {...props} />}
          hideBackArrow={true}
          tabs={["Overview", "All Agents", "KYC Review", "Commissions"]}
          tabParamName="tab"
          activeTab={tab}
          action={
            <button
              onClick={openCreateAgent}
              className="h-11 px-6 bg-blue-600 hover:bg-blue-500 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 shadow-xl shadow-blue-600/10 transition-all active:scale-95 shrink-0"
            >
              <Plus size={14} strokeWidth={3} />
              Register Agent
            </button>
          }
        />

        {/* ── TAB: OVERVIEW ── */}
        {tab.toLowerCase() === "overview" && (
          <div className="space-y-6 animate-in fade-in duration-500">
            {/* Stats Row */}
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
              {[
                { label: "Total Agents", val: totalAgents, icon: Layers, color: "text-blue-500", bg: "bg-blue-50" },
                { label: "Active & Approved", val: activeAgents, icon: CheckCircle, color: "text-emerald-500", bg: "bg-emerald-50" },
                { label: "Pending KYC", val: pendingKyc, icon: Clock, color: "text-amber-500", bg: "bg-amber-50" },
                { label: "Commission Collected", val: formatCurrency(totalCollected), icon: CircleDollarSign, color: "text-indigo-500", bg: "bg-indigo-50" },
              ].map((stat, i) => (
                <div key={i} className="flex flex-col p-6 bg-white border border-slate-100 rounded-[10px] shadow-sm hover:border-slate-300 transition-all hover:shadow-xl hover:shadow-slate-100/50">
                  <div className="flex items-center justify-between mb-4">
                    <div className={cn("p-2.5 rounded-[10px]", stat.bg)}>
                      <stat.icon className={cn("w-5 h-5", stat.color)} />
                    </div>
                    <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest leading-none">{stat.label}</span>
                  </div>
                  <span className="text-3xl font-black text-slate-900 tabular-nums">{stat.val}</span>
                </div>
              ))}
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
              {/* Dark explainer card */}
              <div className="lg:col-span-1 bg-slate-900 rounded-[10px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[400px]">
                <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-blue-500/10 rounded-full blur-[100px]" />
                <div className="relative z-10 space-y-6">
                  <div className="h-12 w-12 rounded-[10px] bg-white/10 flex items-center justify-center mb-8 border border-white/10">
                    <ShieldCheck className="h-6 w-6 text-blue-400" />
                  </div>
                  <h3 className="text-[24px] font-black tracking-tight leading-none mb-3">Agent Network</h3>
                  <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-85">
                    Platform agents and business partners generate revenue on your behalf. They submit KYC, get approved, and earn commissions on the parcels they refer.
                  </p>
                  <div className="grid grid-cols-2 gap-3 pt-4">
                    <div className="bg-white/5 rounded-[8px] p-3 border border-white/5">
                      <p className="text-[10px] font-black uppercase tracking-widest text-slate-500 mb-1">Independent</p>
                      <p className="text-xl font-black text-white tabular-nums">{independentAgents}</p>
                    </div>
                    <div className="bg-white/5 rounded-[8px] p-3 border border-white/5">
                      <p className="text-[10px] font-black uppercase tracking-widest text-slate-500 mb-1">Businesses</p>
                      <p className="text-xl font-black text-white tabular-nums">{businesses}</p>
                    </div>
                  </div>
                </div>
                <div className="relative z-10 flex items-center gap-3 pt-6 border-t border-white/10">
                  <TrendingUp className="w-5 h-5 text-emerald-400" />
                  <span className="text-[11px] font-black uppercase tracking-wider text-slate-300">Commission-based partner model</span>
                </div>
              </div>

              {/* Active agents quick list */}
              <div className="lg:col-span-2 bg-white border border-slate-100 rounded-[10px] p-6 shadow-sm flex flex-col">
                <div className="flex items-center justify-between pb-3 border-b border-slate-100 mb-4">
                  <div>
                    <h3 className="text-md font-black text-slate-900 tracking-tight">Active Agent Directory</h3>
                    <p className="text-slate-400 font-bold text-[10px] uppercase tracking-wider mt-0.5">Approved & operational agents</p>
                  </div>
                </div>
                <div className="divide-y divide-slate-100 max-h-[300px] overflow-y-auto pr-1 flex-1">
                  {agents.filter((a) => a.isActive).map((agent, idx) => (
                    <div key={agent.id} className="py-3.5 flex items-center justify-between gap-4 first:pt-0 last:pb-0">
                      <div className="flex items-center gap-3 flex-1 min-w-0">
                        <div className={cn("h-8 w-8 rounded-[8px] flex items-center justify-center shrink-0", agent.type === "BUSINESS" ? "bg-indigo-100" : "bg-blue-100")}>
                          {agent.type === "BUSINESS" ? <Building2 size={14} className="text-indigo-600" /> : <Users size={14} className="text-blue-600" />}
                        </div>
                        <div className="min-w-0">
                          <p className="text-xs font-black text-slate-800 truncate">{agent.name}</p>
                          <p className="text-[10px] font-bold text-slate-400 truncate">{agent.email}</p>
                        </div>
                      </div>
                      <div className="text-right shrink-0">
                        <p className="text-xs font-black text-blue-600">{agent.commissionRate ? `${(agent.commissionRate * 100).toFixed(1)}%` : "—"}</p>
                        <p className="text-[9px] font-bold text-slate-400 uppercase tracking-wider">commission</p>
                      </div>
                    </div>
                  ))}
                  {agents.filter((a) => a.isActive).length === 0 && (
                    <p className="text-center text-xs text-slate-400 py-12 font-bold uppercase tracking-wider">No active agents yet.</p>
                  )}
                </div>
                <div className="pt-4 border-t border-slate-100 flex justify-between items-center">
                  <span className="text-[10px] font-black text-slate-400 uppercase tracking-wider">
                    {pendingCommissions.length} commission period{pendingCommissions.length !== 1 ? "s" : ""} awaiting collection
                  </span>
                  <span className="text-[11px] font-black text-blue-600 tabular-nums">{formatCurrency(totalCommissionDue - totalCollected)} outstanding</span>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* ── TAB: ALL AGENTS ── */}
        {tab.toLowerCase() === "all agents" && (
          <div className="animate-in fade-in duration-500 space-y-4">
            {agents.length === 0 ? (
              <div className="bg-white border border-dashed border-slate-200 rounded-[10px] p-16 flex flex-col items-center justify-center text-center">
                <Users className="w-12 h-12 text-slate-300 mb-4 animate-pulse" />
                <h3 className="text-md font-black text-slate-700 mb-1">No Platform Agents Registered</h3>
                <p className="text-slate-400 text-xs font-semibold max-w-sm leading-relaxed mb-6">Register your first independent agent or business partner to get started.</p>
                <button onClick={openCreateAgent} className="h-11 px-6 bg-slate-900 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 hover:bg-slate-800 transition-all">
                  <Plus size={14} strokeWidth={3} />
                  Register First Agent
                </button>
              </div>
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-5">
                {agents.map((agent) => (
                  <div
                    key={agent.id}
                    className={cn(
                      "bg-white rounded-[10px] border border-slate-100 p-6 shadow-sm flex flex-col gap-4 hover:shadow-md hover:border-slate-200 transition-all duration-300",
                      !agent.isActive && "opacity-70 bg-slate-50/50"
                    )}
                  >
                    {/* Header */}
                    <div className="flex items-start justify-between gap-3">
                      <div className="flex items-center gap-3">
                        <div className={cn("h-10 w-10 rounded-[10px] flex items-center justify-center shrink-0", agent.type === "BUSINESS" ? "bg-indigo-100" : "bg-blue-100")}>
                          {agent.type === "BUSINESS" ? <Building2 size={18} className="text-indigo-600" /> : <Users size={18} className="text-blue-600" />}
                        </div>
                        <div>
                          <h3 className="text-[14px] font-black text-slate-900 tracking-tight leading-tight">{agent.name}</h3>
                          {agent.businessName && <p className="text-[10px] font-bold text-slate-500 mt-0.5">{agent.businessName}</p>}
                        </div>
                      </div>
                      <KycBadge status={agent.kycStatus} />
                    </div>

                    {/* Info */}
                    <div className="space-y-1.5">
                      <p className="text-[11px] font-semibold text-slate-500">{agent.email}</p>
                      {agent.phone && <p className="text-[11px] font-semibold text-slate-400">{agent.phone}</p>}
                      {agent.address && <p className="text-[11px] font-semibold text-slate-400 truncate">{agent.address}</p>}
                    </div>

                    {/* Commission & type chips */}
                    <div className="flex items-center gap-2 flex-wrap">
                      <span className={cn("px-2.5 py-1 text-[9px] font-black uppercase tracking-widest rounded-[6px]", agent.type === "BUSINESS" ? "bg-indigo-50 text-indigo-700" : "bg-blue-50 text-blue-700")}>
                        {agent.type === "BUSINESS" ? "Business" : "Independent"}
                      </span>
                      {agent.commissionRate !== null && (
                        <span className="px-2.5 py-1 text-[9px] font-black uppercase tracking-widest rounded-[6px] bg-slate-100 text-slate-700 flex items-center gap-1">
                          <Percent size={8} />
                          {(agent.commissionRate * 100).toFixed(1)}% commission
                        </span>
                      )}
                      <span className={cn("px-2.5 py-1 text-[9px] font-black uppercase tracking-widest rounded-[6px]", agent.isActive ? "bg-emerald-50 text-emerald-700" : "bg-slate-100 text-slate-500")}>
                        {agent.isActive ? "Active" : "Inactive"}
                      </span>
                    </div>

                    {/* Date */}
                    <div className="flex items-center gap-1.5 text-[10px] font-bold text-slate-400 pt-2 border-t border-slate-50">
                      <Calendar size={11} />
                      <span>Registered {format(new Date(agent.createdAt), "MMM dd, yyyy")}</span>
                    </div>

                    {/* Actions */}
                    <div className="flex items-center justify-between gap-2 pt-3 border-t border-slate-100">
                      <div className="flex items-center gap-1">
                        <button onClick={() => openKycReview(agent)} title="Update KYC" className="p-2 text-slate-400 hover:text-blue-600 hover:bg-blue-50 rounded-[6px] transition-all">
                          <ShieldCheck size={14} />
                        </button>
                        <button onClick={() => openEditAgent(agent)} title="Edit Agent" className="p-2 text-slate-400 hover:text-emerald-600 hover:bg-emerald-50 rounded-[6px] transition-all">
                          <Pencil size={14} />
                        </button>
                        <button
                          onClick={() => { if (confirm(`Remove ${agent.name} from the platform?`)) deleteAgent(agent.id); }}
                          title="Remove Agent"
                          className="p-2 text-slate-400 hover:text-red-500 hover:bg-red-50 rounded-[6px] transition-all"
                        >
                          <Trash2 size={14} />
                        </button>
                      </div>
                      {agent.kycStatus === "APPROVED" && (
                        <button
                          onClick={() => openCommissionModal(agent)}
                          className="h-8 px-3 bg-blue-600 hover:bg-blue-500 text-white rounded-[6px] text-[10px] font-black uppercase tracking-widest flex items-center gap-1.5 transition-all"
                        >
                          <CircleDollarSign size={11} />
                          Record Commission
                        </button>
                      )}
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        )}

        {/* ── TAB: KYC REVIEW ── */}
        {tab.toLowerCase() === "kyc review" && (
          <div className="animate-in fade-in duration-500 space-y-4">
            <div className="flex items-center justify-between">
              <div>
                <h2 className="text-sm font-black text-slate-800">KYC Review Queue</h2>
                <p className="text-[11px] font-bold text-slate-400 uppercase tracking-wider mt-0.5">{kycAgents.length} agent{kycAgents.length !== 1 ? "s" : ""} awaiting review</p>
              </div>
            </div>

            {kycAgents.length === 0 ? (
              <div className="bg-white border border-dashed border-slate-200 rounded-[10px] p-16 flex flex-col items-center justify-center text-center">
                <CheckCircle className="w-12 h-12 text-emerald-400 mb-4" />
                <h3 className="text-md font-black text-slate-700 mb-1">All Clear!</h3>
                <p className="text-slate-400 text-xs font-semibold max-w-sm">No agents currently pending KYC review.</p>
              </div>
            ) : (
              <div className="bg-white border border-slate-100 rounded-[10px] shadow-sm overflow-hidden">
                <div className="divide-y divide-slate-100">
                  {kycAgents.map((agent) => (
                    <div key={agent.id} className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 px-6 py-5 hover:bg-slate-50/50 transition-colors">
                      <div className="flex items-center gap-4 flex-1 min-w-0">
                        <div className={cn("h-10 w-10 rounded-[10px] flex items-center justify-center shrink-0", agent.type === "BUSINESS" ? "bg-indigo-100" : "bg-blue-100")}>
                          {agent.type === "BUSINESS" ? <Building2 size={16} className="text-indigo-600" /> : <Users size={16} className="text-blue-600" />}
                        </div>
                        <div className="min-w-0">
                          <p className="text-sm font-black text-slate-900">{agent.name}</p>
                          <p className="text-[11px] font-semibold text-slate-400">{agent.email} · {agent.type === "BUSINESS" ? "Business" : "Independent Agent"}</p>
                          {agent.businessName && <p className="text-[10px] font-bold text-slate-400 mt-0.5">{agent.businessName} {agent.businessReg ? `· Reg: ${agent.businessReg}` : ""}</p>}
                        </div>
                      </div>
                      <div className="flex items-center gap-3 shrink-0 justify-between sm:justify-end w-full sm:w-auto pt-3 sm:pt-0 border-t border-slate-100 sm:border-0">
                        <KycBadge status={agent.kycStatus} />
                        <button
                          onClick={() => openKycReview(agent)}
                          className="h-9 px-4 bg-slate-900 hover:bg-slate-800 text-white rounded-[8px] text-[10px] font-black uppercase tracking-widest flex items-center gap-1.5 transition-all"
                        >
                          <Eye size={11} />
                          Review
                        </button>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            )}
          </div>
        )}

        {/* ── TAB: COMMISSIONS ── */}
        {tab.toLowerCase() === "commissions" && (
          <div className="animate-in fade-in duration-500 space-y-6">
            {/* Commission stats */}
            <div className="grid grid-cols-1 sm:grid-cols-3 gap-6">
              {[
                { label: "Total Commission Due", val: formatCurrency(totalCommissionDue), icon: CircleDollarSign, color: "text-blue-500", bg: "bg-blue-50" },
                { label: "Total Collected", val: formatCurrency(totalCollected), icon: CheckCircle, color: "text-emerald-500", bg: "bg-emerald-50" },
                { label: "Pending Collection", val: formatCurrency(totalCommissionDue - totalCollected), icon: AlertCircle, color: "text-amber-500", bg: "bg-amber-50" },
              ].map((stat, i) => (
                <div key={i} className="flex flex-col p-6 bg-white border border-slate-100 rounded-[10px] shadow-sm hover:border-slate-300 transition-all">
                  <div className="flex items-center justify-between mb-4">
                    <div className={cn("p-2.5 rounded-[10px]", stat.bg)}><stat.icon className={cn("w-5 h-5", stat.color)} /></div>
                    <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest">{stat.label}</span>
                  </div>
                  <span className="text-2xl font-black text-slate-900 tabular-nums">{stat.val}</span>
                </div>
              ))}
            </div>

            {/* Commission ledger */}
            {loadingCommissions ? (
              <div className="flex items-center justify-center py-12"><Loader2 className="w-6 h-6 animate-spin text-slate-400" /></div>
            ) : commissions.length === 0 ? (
              <div className="bg-white border border-dashed border-slate-200 rounded-[10px] p-16 flex flex-col items-center justify-center text-center">
                <CircleDollarSign className="w-12 h-12 text-slate-300 mb-4 animate-pulse" />
                <h3 className="text-md font-black text-slate-700 mb-1">No Commission Records</h3>
                <p className="text-slate-400 text-xs font-semibold max-w-sm">Use "Record Commission" on an approved agent to add billing periods.</p>
              </div>
            ) : (
              <div className="bg-white border border-slate-100 rounded-[10px] shadow-sm overflow-hidden">
                <div className="px-6 py-4 border-b border-slate-100 flex items-center justify-between">
                  <div>
                    <h3 className="text-sm font-black text-slate-900">Commission Ledger</h3>
                    <p className="text-[10px] font-bold text-slate-400 uppercase tracking-wider mt-0.5">All billing periods across all agents</p>
                  </div>
                </div>
                <div className="divide-y divide-slate-100">
                  {commissions.map((c) => (
                    <div key={c.id} className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 px-6 py-4 hover:bg-slate-50/50 transition-colors">
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2 mb-1">
                          <p className="text-sm font-black text-slate-900">{c.agent?.name || "Unknown Agent"}</p>
                          <span className={cn("px-2 py-0.5 text-[9px] font-black uppercase tracking-widest rounded-[4px]", c.agent?.type === "BUSINESS" ? "bg-indigo-50 text-indigo-700" : "bg-blue-50 text-blue-700")}>
                            {c.agent?.type === "BUSINESS" ? "Business" : "Independent"}
                          </span>
                        </div>
                        <p className="text-[11px] font-semibold text-slate-400">
                          {format(new Date(c.periodStart), "MMM dd")} – {format(new Date(c.periodEnd), "MMM dd, yyyy")}
                          {" · "}Gross: {formatCurrency(c.grossRevenue)}
                          {" · "}Rate: {(c.commissionRate * 100).toFixed(1)}%
                        </p>
                        {c.notes && <p className="text-[10px] font-semibold text-slate-400 mt-0.5 italic">{c.notes}</p>}
                      </div>
                      <div className="flex items-center justify-between sm:justify-end gap-4 shrink-0 w-full sm:w-auto pt-3 sm:pt-0 border-t border-slate-100 sm:border-t-0">
                        <div className="text-left sm:text-right">
                          <p className="text-sm font-black text-blue-600 tabular-nums">{formatCurrency(c.commissionDue)}</p>
                          <p className="text-[9px] font-bold text-slate-400 uppercase tracking-wider">due</p>
                        </div>
                        {c.collectedAt ? (
                          <span className="inline-flex items-center gap-1.5 px-3 py-1.5 text-[9px] font-black uppercase tracking-widest rounded-[6px] bg-emerald-50 text-emerald-700 border border-emerald-100">
                            <CheckCircle size={9} />
                            Collected {format(new Date(c.collectedAt), "MMM dd")}
                          </span>
                        ) : (
                          <button
                            onClick={() => setCollectModal(c)}
                            className="h-9 px-4 bg-emerald-600 hover:bg-emerald-500 text-white rounded-[8px] text-[10px] font-black uppercase tracking-widest flex items-center gap-1.5 transition-all"
                          >
                            <CheckCircle size={11} />
                            Collect
                          </button>
                        )}
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            )}
          </div>
        )}
      </div>

      {/* ─── CREATE / EDIT AGENT MODAL ─── */}
      <Dialog open={agentModal} onOpenChange={setAgentModal}>
        <DialogContent className="w-full sm:w-[580px] p-6 bg-white rounded-2xl border border-slate-100 shadow-2xl max-h-[90vh] overflow-y-auto">
          <form onSubmit={handleAgentSubmit}>
            <DialogHeader className="mb-5">
              <DialogTitle className="text-[18px] font-black text-slate-900 tracking-tight leading-none mb-1">
                {agentForm.id ? "Edit Agent Details" : "Register Platform Agent"}
              </DialogTitle>
              <span className="text-[11px] font-extrabold text-slate-400 uppercase tracking-widest">
                {agentForm.id ? "Update agent profile and commission settings" : "Add an independent agent or business partner"}
              </span>
            </DialogHeader>

            <div className="space-y-4">
              {/* Type selector */}
              <div className="space-y-2">
                <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Agent Type</label>
                <div className="grid grid-cols-2 gap-3">
                  {(["INDEPENDENT", "BUSINESS"] as AgentType[]).map((t) => (
                    <button
                      key={t}
                      type="button"
                      onClick={() => setAgentForm({ ...agentForm, type: t })}
                      className={cn(
                        "flex items-center gap-3 p-3 rounded-[10px] border-2 transition-all",
                        agentForm.type === t ? "border-blue-500 bg-blue-50" : "border-slate-100 bg-slate-50 hover:border-slate-200"
                      )}
                    >
                      {t === "BUSINESS" ? <Building2 size={16} className={agentForm.type === t ? "text-blue-600" : "text-slate-400"} /> : <Users size={16} className={agentForm.type === t ? "text-blue-600" : "text-slate-400"} />}
                      <span className={cn("text-xs font-black", agentForm.type === t ? "text-blue-700" : "text-slate-500")}>
                        {t === "INDEPENDENT" ? "Independent Agent" : "Business / Company"}
                      </span>
                    </button>
                  ))}
                </div>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Full Name *</label>
                  <input type="text" placeholder="e.g. John Mwamba" value={agentForm.name} onChange={(e) => setAgentForm({ ...agentForm, name: e.target.value })} className="w-full h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all" />
                </div>
                <div className="space-y-2">
                  <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Email *</label>
                  <input type="email" placeholder="email@example.com" value={agentForm.email} onChange={(e) => setAgentForm({ ...agentForm, email: e.target.value })} className="w-full h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all" />
                </div>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Phone</label>
                  <input type="tel" placeholder="+255 700 000 000" value={agentForm.phone} onChange={(e) => setAgentForm({ ...agentForm, phone: e.target.value })} className="w-full h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all" />
                </div>
                <div className="space-y-2">
                  <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Commission Rate (%)</label>
                  <div className="relative">
                    <input type="number" min="0" max="100" step="0.1" placeholder="e.g. 5" value={agentForm.commissionRate} onChange={(e) => setAgentForm({ ...agentForm, commissionRate: e.target.value })} className="w-full h-11 pl-4 pr-8 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all" />
                    <span className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 text-xs font-black">%</span>
                  </div>
                </div>
              </div>

              {agentForm.type === "BUSINESS" && (
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div className="space-y-2">
                    <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Business Name</label>
                    <input type="text" placeholder="Company Ltd." value={agentForm.businessName} onChange={(e) => setAgentForm({ ...agentForm, businessName: e.target.value })} className="w-full h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all" />
                  </div>
                  <div className="space-y-2">
                    <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Registration No.</label>
                    <input type="text" placeholder="REG-12345" value={agentForm.businessReg} onChange={(e) => setAgentForm({ ...agentForm, businessReg: e.target.value })} className="w-full h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all" />
                  </div>
                </div>
              )}

              <div className="space-y-2">
                <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Address</label>
                <input type="text" placeholder="City, Region" value={agentForm.address} onChange={(e) => setAgentForm({ ...agentForm, address: e.target.value })} className="w-full h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all" />
              </div>
            </div>

            <DialogFooter className="mt-6 flex items-center justify-end gap-3">
              <DialogClose asChild>
                <button type="button" onClick={resetAgentForm} className="h-11 px-5 border border-slate-200 hover:border-slate-300 text-slate-700 rounded-[10px] text-[11px] font-black uppercase tracking-widest transition-all active:scale-95">Cancel</button>
              </DialogClose>
              <button type="submit" disabled={isCreating || isUpdating} className="h-11 px-6 bg-slate-900 text-white hover:bg-slate-800 rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 transition-all active:scale-95 disabled:opacity-50">
                {(isCreating || isUpdating) ? <Loader2 size={13} className="animate-spin" /> : null}
                {agentForm.id ? "Save Changes" : "Register Agent"}
              </button>
            </DialogFooter>
          </form>
        </DialogContent>
      </Dialog>

      {/* ─── KYC REVIEW MODAL ─── */}
      <Dialog open={kycModal} onOpenChange={setKycModal}>
        <DialogContent className="w-full sm:w-[480px] p-6 bg-white rounded-2xl border border-slate-100 shadow-2xl">
          <form onSubmit={handleKycSubmit}>
            <DialogHeader className="mb-5">
              <DialogTitle className="text-[18px] font-black text-slate-900 tracking-tight leading-none mb-1">KYC Review</DialogTitle>
              <span className="text-[11px] font-extrabold text-slate-400 uppercase tracking-widest">{kycForm.agentName}</span>
            </DialogHeader>

            <div className="space-y-4">
              <div className="space-y-2">
                <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Decision</label>
                <div className="grid grid-cols-2 gap-3">
                  {([
                    { value: "UNDER_REVIEW", label: "Under Review", icon: Eye, color: "blue" },
                    { value: "APPROVED", label: "Approve", icon: CheckCircle, color: "emerald" },
                    { value: "REJECTED", label: "Reject", icon: XCircle, color: "red" },
                    { value: "PENDING", label: "Reset to Pending", icon: Clock, color: "amber" },
                  ] as { value: KycStatus; label: string; icon: any; color: string }[]).map(({ value, label, icon: Icon, color }) => (
                    <button
                      key={value}
                      type="button"
                      onClick={() => setKycForm({ ...kycForm, kycStatus: value })}
                      className={cn(
                        "flex items-center gap-2 p-3 rounded-[10px] border-2 transition-all text-left",
                        kycForm.kycStatus === value
                          ? `border-${color}-500 bg-${color}-50`
                          : "border-slate-100 bg-slate-50 hover:border-slate-200"
                      )}
                    >
                      <Icon size={14} className={kycForm.kycStatus === value ? `text-${color}-600` : "text-slate-400"} />
                      <span className={cn("text-[11px] font-black", kycForm.kycStatus === value ? `text-${color}-700` : "text-slate-500")}>{label}</span>
                    </button>
                  ))}
                </div>
              </div>

              <div className="space-y-2">
                <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Review Notes</label>
                <textarea
                  rows={3}
                  placeholder="Add approval notes or reason for rejection..."
                  value={kycForm.kycNotes}
                  onChange={(e) => setKycForm({ ...kycForm, kycNotes: e.target.value })}
                  className="w-full p-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white resize-none transition-all"
                />
              </div>
            </div>

            <DialogFooter className="mt-6 flex items-center justify-end gap-3">
              <DialogClose asChild>
                <button type="button" className="h-11 px-5 border border-slate-200 hover:border-slate-300 text-slate-700 rounded-[10px] text-[11px] font-black uppercase tracking-widest transition-all active:scale-95">Cancel</button>
              </DialogClose>
              <button
                type="submit"
                disabled={isUpdatingKyc}
                className={cn(
                  "h-11 px-6 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 transition-all active:scale-95 disabled:opacity-50",
                  kycForm.kycStatus === "APPROVED" ? "bg-emerald-600 hover:bg-emerald-500" :
                  kycForm.kycStatus === "REJECTED" ? "bg-red-600 hover:bg-red-500" :
                  "bg-slate-900 hover:bg-slate-800"
                )}
              >
                {isUpdatingKyc ? <Loader2 size={13} className="animate-spin" /> : null}
                Confirm Decision
              </button>
            </DialogFooter>
          </form>
        </DialogContent>
      </Dialog>

      {/* ─── RECORD COMMISSION MODAL ─── */}
      <Dialog open={commissionModal} onOpenChange={setCommissionModal}>
        <DialogContent className="w-full sm:w-[480px] p-6 bg-white rounded-2xl border border-slate-100 shadow-2xl">
          <form onSubmit={handleCommissionSubmit}>
            <DialogHeader className="mb-5">
              <DialogTitle className="text-[18px] font-black text-slate-900 tracking-tight leading-none mb-1">Record Commission Period</DialogTitle>
              <span className="text-[11px] font-extrabold text-slate-400 uppercase tracking-widest">{commissionForm.agentName}</span>
            </DialogHeader>

            <div className="space-y-4">
              <div className="grid grid-cols-2 gap-4">
                <div className="space-y-2">
                  <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Period Start</label>
                  <input type="date" value={commissionForm.periodStart} onChange={(e) => setCommissionForm({ ...commissionForm, periodStart: e.target.value })} className="w-full h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all" />
                </div>
                <div className="space-y-2">
                  <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Period End</label>
                  <input type="date" value={commissionForm.periodEnd} onChange={(e) => setCommissionForm({ ...commissionForm, periodEnd: e.target.value })} className="w-full h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all" />
                </div>
              </div>

              <div className="space-y-2">
                <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Gross Revenue for this Period (TZS)</label>
                <div className="relative">
                  <div className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 text-xs font-black">TZS</div>
                  <input type="number" min="0" step="any" placeholder="0" value={commissionForm.grossRevenue} onChange={(e) => setCommissionForm({ ...commissionForm, grossRevenue: e.target.value })} className="w-full h-11 pl-12 pr-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all" />
                </div>
              </div>

              {/* Commission preview */}
              {commissionForm.grossRevenue && (() => {
                const agent = agents.find((a) => a.id === commissionForm.agentId);
                if (agent?.commissionRate && commissionForm.grossRevenue) {
                  const due = parseFloat(commissionForm.grossRevenue) * agent.commissionRate;
                  return (
                    <div className="flex items-center justify-between p-4 bg-blue-50 border border-blue-100 rounded-[10px]">
                      <span className="text-xs font-black text-blue-700">Commission Due ({(agent.commissionRate * 100).toFixed(1)}%)</span>
                      <span className="text-sm font-black text-blue-800 tabular-nums">{formatCurrency(due)}</span>
                    </div>
                  );
                }
                return null;
              })()}

              <div className="space-y-2">
                <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Notes (optional)</label>
                <textarea rows={2} placeholder="Any additional notes..." value={commissionForm.notes} onChange={(e) => setCommissionForm({ ...commissionForm, notes: e.target.value })} className="w-full p-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white resize-none transition-all" />
              </div>
            </div>

            <DialogFooter className="mt-6 flex items-center justify-end gap-3">
              <DialogClose asChild>
                <button type="button" onClick={resetCommissionForm} className="h-11 px-5 border border-slate-200 hover:border-slate-300 text-slate-700 rounded-[10px] text-[11px] font-black uppercase tracking-widest transition-all active:scale-95">Cancel</button>
              </DialogClose>
              <button type="submit" disabled={isCreatingCommission} className="h-11 px-6 bg-slate-900 text-white hover:bg-slate-800 rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 transition-all active:scale-95 disabled:opacity-50">
                {isCreatingCommission ? <Loader2 size={13} className="animate-spin" /> : null}
                Record Period
              </button>
            </DialogFooter>
          </form>
        </DialogContent>
      </Dialog>

      {/* ─── COLLECT COMMISSION MODAL ─── */}
      <Dialog open={!!collectModal} onOpenChange={() => setCollectModal(null)}>
        <DialogContent className="w-full sm:w-[420px] p-6 bg-white rounded-2xl border border-slate-100 shadow-2xl">
          <DialogHeader className="mb-5">
            <DialogTitle className="text-[18px] font-black text-slate-900 tracking-tight leading-none mb-1">Confirm Commission Collection</DialogTitle>
            <span className="text-[11px] font-extrabold text-slate-400 uppercase tracking-widest">This action cannot be undone</span>
          </DialogHeader>

          {collectModal && (
            <div className="space-y-4">
              <div className="p-4 bg-emerald-50 border border-emerald-100 rounded-[10px] space-y-2">
                <div className="flex justify-between">
                  <span className="text-xs font-black text-slate-600">Agent</span>
                  <span className="text-xs font-black text-slate-900">{collectModal.agent?.name}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-xs font-black text-slate-600">Period</span>
                  <span className="text-xs font-semibold text-slate-700">{format(new Date(collectModal.periodStart), "MMM dd")} – {format(new Date(collectModal.periodEnd), "MMM dd, yyyy")}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-xs font-black text-slate-600">Commission Due</span>
                  <span className="text-sm font-black text-emerald-700 tabular-nums">{formatCurrency(collectModal.commissionDue)}</span>
                </div>
              </div>

              <div className="flex items-center justify-end gap-3">
                <button onClick={() => setCollectModal(null)} className="h-11 px-5 border border-slate-200 hover:border-slate-300 text-slate-700 rounded-[10px] text-[11px] font-black uppercase tracking-widest transition-all active:scale-95">Cancel</button>
                <button
                  disabled={isCollecting}
                  onClick={() => collectCommission({ id: collectModal.id })}
                  className="h-11 px-6 bg-emerald-600 hover:bg-emerald-500 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 transition-all active:scale-95 disabled:opacity-50"
                >
                  {isCollecting ? <Loader2 size={13} className="animate-spin" /> : <CheckCircle size={13} />}
                  Mark as Collected
                </button>
              </div>
            </div>
          )}
        </DialogContent>
      </Dialog>
    </div>
  );
}

export default function PlatformAgentsPage() {
  return (
    <Suspense fallback={<div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">Loading...</div>}>
      <PlatformAgentsPageInner />
    </Suspense>
  );
}
