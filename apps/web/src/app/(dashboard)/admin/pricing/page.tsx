"use client";

import { DataTable } from "@/components/shared/data-table";
import { cn } from "@/lib/utils";
import {
  Calculator,
  Plus,
  Zap,
  TrendingUp,
  Database,
  BadgePercent,
  Globe,
} from "lucide-react";

import { PricingModal } from "@/components/admin/pricing-modal"; // create-only
import { PricingActionMenu } from "@/components/admin/pricing-action-menu";
import { PricingDetailSheet } from "@/components/admin/pricing-detail-sheet";
import { usePricingRules } from "@/modules/pricing/use-pricing";
import { useState, useEffect, Suspense } from "react";
import { useSearchParams } from "next/navigation";
import { DashboardTabs } from "@/components/dashboard/dashboard-tabs";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useSession } from "next-auth/react";
import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";

// --- Animated counter hook ---
function useCountUp(target: number, duration = 1200): number {
  const [value, setValue] = useState(0);
  useEffect(() => {
    if (!target) {
      setValue(0);
      return;
    }
    const steps = 40;
    const increment = target / steps;
    let current = 0;
    const timer = setInterval(() => {
      current += increment;
      if (current >= target) {
        setValue(target);
        clearInterval(timer);
      } else {
        setValue(Math.floor(current));
      }
    }, duration / steps);
    return () => clearInterval(timer);
  }, [target, duration]);
  return value;
}

// --- Sparkline SVG ---
function Sparkline({ color = "#10b981", seed = 0 }: { color?: string; seed?: number }) {
  const basePoints = [30, 55, 40, 70, 52, 80, 65, 90, 72, 95];
  const points = basePoints.map((p, i) => {
    const shift = Math.sin(seed + i) * 8;
    return Math.max(10, Math.min(100, p + shift));
  });
  const h = 48, w = 120;
  const max = Math.max(...points), min = Math.min(...points);
  const coords: [number, number][] = points.map((p, i) => [
    (i / (points.length - 1)) * w,
    h - ((p - min) / (max - min)) * (h - 4) - 2,
  ]);
  const path = coords.map(([x, y], i) => `${i === 0 ? "M" : "L"}${x.toFixed(1)},${y.toFixed(1)}`).join(" ");
  const fill = path + ` L${w},${h} L0,${h} Z`;
  const gradId = `spark-${color.replace("#", "")}-${seed}`;

  return (
    <svg viewBox={`0 0 ${w} ${h}`} className="w-full h-12" preserveAspectRatio="none">
      <defs>
        <linearGradient id={gradId} x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stopColor={color} stopOpacity="0.2" />
          <stop offset="100%" stopColor={color} stopOpacity="0" />
        </linearGradient>
      </defs>
      <path d={fill} fill={`url(#${gradId})`} />
      <path d={path} fill="none" stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" />
    </svg>
  );
}

// --- Helper to map text class to Hex ---
const getSparkColor = (colorClass: string) => {
  if (colorClass.includes("blue")) return "#3b82f6";
  if (colorClass.includes("emerald")) return "#10b981";
  if (colorClass.includes("indigo")) return "#6366f1";
  if (colorClass.includes("amber")) return "#f59e0b";
  if (colorClass.includes("orange")) return "#f97316";
  if (colorClass.includes("violet")) return "#8b5cf6";
  if (colorClass.includes("cyan")) return "#06b6d4";
  if (colorClass.includes("rose")) return "#f43f5e";
  return "#94a3b8";
};

// --- Custom PricingCard Component ---
interface PricingCardProps {
  label: string;
  value: number | string;
  icon: React.ElementType;
  iconBg: string;
  iconColor: string;
  tag: string;
  tagBg: string;
  tagColor: string;
  accentBar: string;
  description: string;
  seed: number;
}

function PricingCard({
  label,
  value,
  icon: Icon,
  iconBg,
  iconColor,
  tag,
  tagBg,
  tagColor,
  accentBar,
  description,
  seed,
}: PricingCardProps) {
  const valStr = String(value);
  const numericVal = parseFloat(valStr.replace(/[^\d.]/g, ""));
  const isNumeric = !isNaN(numericVal);
  const counted = useCountUp(isNumeric ? numericVal : 0, 1000);
  const sparkColor = getSparkColor(iconColor);

  let displayValue = valStr;
  if (isNumeric) {
    if (valStr.includes("x")) {
      displayValue = `${counted.toFixed(2)}x`;
    } else if (valStr.includes("%")) {
      displayValue = `+${counted.toFixed(1)}%`;
    } else {
      displayValue = counted.toLocaleString();
    }
  }

  return (
    <div className="group bg-white rounded-2xl border border-slate-100 p-5 flex flex-col justify-between hover:shadow-xl hover:border-slate-200 hover:-translate-y-0.5 transition-all duration-300 h-full relative overflow-hidden">
      {/* Top Row */}
      <div className="flex items-start justify-between">
        <div className={cn("w-9 h-9 rounded-xl flex items-center justify-center transition-all duration-300 group-hover:scale-110 shadow-sm", iconBg, iconColor)}>
          <Icon size={16} strokeWidth={2.5} />
        </div>
        <span className={cn("text-[9px] font-bold uppercase tracking-[0.18em] px-2.5 py-1.5 rounded-md border", tagBg, tagColor)}>
          {tag}
        </span>
      </div>

      {/* Main Content */}
      <div className="mt-4 flex-1 flex flex-col justify-between">
        <div>
          {/* Primary value */}
          <p className={cn("text-[26px] font-black tracking-tight leading-none tabular-nums", iconColor)}>
            {displayValue}
          </p>
          
          {/* Title & Description */}
          <h3 className="text-[13px] font-black text-slate-800 tracking-tight mt-3">
            {label}
          </h3>
          <p className="text-[10px] font-bold text-slate-400 mt-1 leading-normal line-clamp-2">
            {description}
          </p>
        </div>

        {/* Sparkline */}
        <div className="mt-4 space-y-3">
          <div className="opacity-40 group-hover:opacity-100 transition-opacity duration-300">
            <Sparkline color={sparkColor} seed={seed} />
          </div>
        </div>
      </div>

      {/* Bottom accent glow */}
      <div className={cn("absolute bottom-0 left-0 right-0 h-[3px] opacity-0 group-hover:opacity-100 transition-opacity duration-300", accentBar)} />
    </div>
  );
}

function PricingPageInner() {
  const { data: session } = useSession();
  const isSuperAdmin = session?.user?.role === "SUPER_ADMIN";
  const [selectedOrgId, setSelectedOrgId] = useState<string>(""); // "" = global/platform
  const { data: rules, isLoading } = usePricingRules(selectedOrgId || null);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [viewRule, setViewRule] = useState<any>(null);
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  const { data: organizations = [] } = useQuery<any[]>({
    queryKey: ["organizations-list"],
    queryFn: async () => {
      const { data } = await api.get("/organizations");
      return data.data || data;
    },
    enabled: isSuperAdmin,
  });

  const handleView = (rule: any) => {
    setViewRule(rule);
  };

  const handleCreate = () => {
    setIsModalOpen(true);
  };

  const columns = [
    {
      header: "Rule Name",
      accessor: (rule: any) => (
        <div className="flex items-center gap-3 min-w-0">
          <div
            className={cn(
              "h-10 w-10 rounded-[10px] flex items-center justify-center shadow-lg transition-all duration-300 shrink-0",
              rule.isActive
                ? "bg-slate-900 shadow-slate-100"
                : "bg-slate-200 shadow-transparent grayscale",
            )}
          >
            {rule.type === "MULTIPLIER" ? (
              <TrendingUp
                className={cn(
                  "h-5 w-5 text-white",
                  !rule.isActive && "text-slate-400",
                )}
              />
            ) : (
              <Calculator
                className={cn(
                  "h-5 w-5 text-white",
                  !rule.isActive && "text-slate-400",
                )}
              />
            )}
          </div>
          <div className="flex flex-col min-w-0">
            <span className="font-black text-slate-900 text-[13px] tracking-tight group-hover:text-blue-600 transition-colors uppercase truncate max-w-[220px]">
              {rule.name}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest truncate max-w-[220px]">
              {rule.condition || "All shipments"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Identifier",
      accessor: (rule: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1.5 px-2.5 py-1 bg-slate-50 border border-slate-100 rounded-[10px] w-fit">
            <span className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
              ID:{rule.id?.slice(0, 8) || "RULE-001"}
            </span>
          </div>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest pl-1">
            Version: 2.1
          </span>
        </div>
      ),
    },
    {
      header: "Status",
      accessor: (rule: any) => (
        <div
          className={cn(
            "inline-flex items-center gap-2 px-3 py-1.5 rounded-[10px] border text-[10px] font-black uppercase tracking-widest shadow-sm",
            rule.isActive
              ? "bg-emerald-50 text-emerald-600 border-emerald-100"
              : "bg-rose-50 text-rose-600 border-rose-100",
          )}
        >
          <div
            className={cn(
              "w-1.5 h-1.5 rounded-full",
              rule.isActive ? "bg-emerald-500 animate-pulse" : "bg-rose-500",
            )}
          />
          {rule.isActive ? "Active" : "Paused"}
        </div>
      ),
    },
    {
      header: "Price Info",
      accessor: (rule: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1 text-blue-600">
            <BadgePercent className="w-4 h-4" strokeWidth={3} />
            <span className="text-[14px] font-black tracking-tighter">
              {rule.type === "MULTIPLIER"
                ? `${rule.value}x`
                : `TSh ${new Intl.NumberFormat().format(rule.value)}`}
            </span>
          </div>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest">
            Fee / Adjustment
          </span>
        </div>
      ),
    },
    {
      header: "Actions",
      accessor: (rule: any) => (
        <div className="flex items-center justify-end gap-2 pr-4">
          <PricingActionMenu rule={rule} onView={handleView} />
        </div>
      ),
    },
  ];

  // Simple Stats
  const activeRules = rules?.filter((r: any) => r.isActive).length || 0;
  const baseMultiplier =
    rules?.find((r: any) => r.name.toLowerCase().includes("base"))?.value ||
    "1.00";
  const expressPremium =
    rules?.find((r: any) => r.name.toLowerCase().includes("express"))?.value ||
    "0";
  const hazardousMultiplier =
    rules?.find((r: any) => r.name.toLowerCase().includes("hazard"))?.value ||
    "1.00";

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
        <PricingModal
          open={isModalOpen}
          onOpenChange={setIsModalOpen}
          rule={null}
          organizationId={selectedOrgId || null}
        />

        <PricingDetailSheet
          open={!!viewRule}
          onClose={() => setViewRule(null)}
          rule={viewRule}
        />

        <ReportPageHeader
          title="Pricing Engine"
          subtitle="Manage global rates, multipliers, and fuel surcharges"
          iconName="Calculator"
          hideBackArrow={true}
          action={
            <button
              onClick={handleCreate}
              className="relative z-10 h-10 px-6 bg-blue-600 hover:bg-blue-500 text-white text-[11px] font-black uppercase tracking-widest rounded-[10px] flex items-center gap-2 transition-all active:scale-95 group"
            >
              <Plus
                size={14}
                strokeWidth={3}
                className="group-hover:rotate-90 transition-transform duration-300"
              />
              Add Pricing
            </button>
          }
          tabs={["Overview", "All"]}
          tabParamName="tab"
          activeTab={tab}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-6">
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                <PricingCard
                  label="Active Rules"
                  value={activeRules}
                  icon={Calculator}
                  iconBg="bg-blue-50"
                  iconColor="text-blue-600"
                  tag="System"
                  tagBg="bg-blue-50"
                  tagColor="text-blue-600"
                  accentBar="bg-blue-500"
                  description="Total custom pricing matrices currently in active deployment"
                  seed={21}
                />
                <PricingCard
                  label="Base Price Multiplier"
                  value={`${baseMultiplier}x`}
                  icon={TrendingUp}
                  iconBg="bg-emerald-50"
                  iconColor="text-emerald-600"
                  tag="Multiplier"
                  tagBg="bg-emerald-50"
                  tagColor="text-emerald-600"
                  accentBar="bg-emerald-500"
                  description="Base rate coefficient applied to standard distance"
                  seed={43}
                />
                <PricingCard
                  label="Express Delivery Markup"
                  value={`+${expressPremium}%`}
                  icon={BadgePercent}
                  iconBg="bg-indigo-50"
                  iconColor="text-indigo-600"
                  tag="Premium"
                  tagBg="bg-indigo-50"
                  tagColor="text-indigo-600"
                  accentBar="bg-indigo-500"
                  description="Percent surcharge automatically added for priority delivery"
                  seed={65}
                />
                <PricingCard
                  label="Global Coverage"
                  value="100%"
                  icon={Globe}
                  iconBg="bg-slate-50"
                  iconColor="text-slate-600"
                  tag="Network"
                  tagBg="bg-slate-50"
                  tagColor="text-slate-600"
                  accentBar="bg-slate-500"
                  description="Status of operational coverage for pricing lookups"
                  seed={87}
                />
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                {/* How It Works Section */}
                <div className="lg:col-span-1 bg-slate-900 rounded-[10px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[400px]">
                  <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-blue-500/10 rounded-full blur-[100px]" />

                  <div className="relative z-10">
                    <div className="h-12 w-12 rounded-[10px] bg-white/10 flex items-center justify-center mb-8 border border-white/10 backdrop-blur-md shadow-2xl shadow-blue-500/10">
                      <Database
                        className="h-6 w-6 text-blue-400"
                        strokeWidth={2.5}
                      />
                    </div>
                    <h3 className="text-[24px] font-black tracking-tight leading-none mb-3">
                      How It Works
                    </h3>
                    <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-80 mb-6">
                      Rules are applied automatically when parcels are
                      processed. Multipliers increase the base price; fixed
                      amounts add a set fee.
                    </p>
                  </div>

                  <div className="relative z-10 space-y-3">
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          Dangerous Goods
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          Multiplier
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-emerald-400 tabular-nums">
                        {hazardousMultiplier}x
                      </span>
                    </div>
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          Express Delivery
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          Price increase
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-blue-400 tabular-nums">
                        +{expressPremium}%
                      </span>
                    </div>
                  </div>
                </div>

                {/* Placeholder for Graphs or other analytical tools */}
                <div className="lg:col-span-2 bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-16 h-16 rounded-full bg-blue-50 flex items-center justify-center mb-4">
                    <TrendingUp className="w-8 h-8 text-blue-500" />
                  </div>
                  <h4 className="text-[16px] font-black text-slate-900 mb-2">
                    Pricing Activity Graph
                  </h4>
                  <p className="text-[13px] text-slate-400 max-w-md">
                    Detailed graphical analysis of pricing rules application and
                    revenue impact will be populated here as parcel data
                    accumulates.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all" && (
            <div className="space-y-4">
              {isSuperAdmin && (
                <div className="bg-white border border-slate-100 rounded-2xl shadow-sm p-6 flex flex-col sm:flex-row justify-between items-center gap-4">
                  <div className="flex flex-col text-left">
                    <h3 className="text-sm font-black text-slate-900 uppercase tracking-tight">
                      {selectedOrgId
                        ? <>Editing overrides for <span className="text-blue-600">{organizations.find((o: any) => o.id === selectedOrgId)?.name}</span></>
                        : "Global Platform Pricing Rules"
                      }
                    </h3>
                    <p className="text-[11px] font-bold text-slate-400 uppercase tracking-widest mt-1">
                      {selectedOrgId ? "Custom rates overriding platform defaults" : "Global defaults applied across all organizations"}
                    </p>
                  </div>
                  <div className="flex items-center gap-3 shrink-0">
                    <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">Select Scope:</span>
                    <select
                      value={selectedOrgId}
                      onChange={(e) => setSelectedOrgId(e.target.value)}
                      className="h-10 px-4 bg-slate-50 border border-slate-100 rounded-xl text-[12px] font-bold text-slate-700 outline-none focus:ring-2 focus:ring-blue-500 cursor-pointer min-w-[200px]"
                    >
                      <option value="">Platform Defaults (Global)</option>
                      {organizations.map((org: any) => (
                        <option key={org.id} value={org.id}>
                          {org.name}
                        </option>
                      ))}
                    </select>
                  </div>
                </div>
              )}
              <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden p-1">
                <DataTable
                  title="Current Pricing Rules"
                  data={rules || []}
                  columns={columns}
                  isLoading={isLoading}
                  hideActions={true}
                  hideInternalSearch={true}
                  onRowClick={handleView}
                />
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default function PricingPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">
          Loading page...
        </div>
      }
    >
      <PricingPageInner />
    </Suspense>
  );
}
