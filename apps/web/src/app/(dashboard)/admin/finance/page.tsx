"use client";

import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import {
  CreditCard,
  ShieldCheck,
  TrendingUp,
  Activity,
  PieChart,
  CheckCircle2,
  FileText,
  Building,
  Coins,
  Scale,
  Zap,
  TrendingDown,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { DataTable } from "@/components/shared/data-table";
import { useSession } from "next-auth/react";
import { useSearchParams } from "next/navigation";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useState, useEffect, Suspense } from "react";

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

// --- Custom FinanceCard Component ---
interface FinanceCardProps {
  label: string;
  value: number | string;
  isCurrency?: boolean;
  isPercentage?: boolean;
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

function FinanceCard({
  label,
  value,
  isCurrency,
  isPercentage,
  icon: Icon,
  iconBg,
  iconColor,
  tag,
  tagBg,
  tagColor,
  accentBar,
  description,
  seed,
}: FinanceCardProps) {
  const numericVal = typeof value === "number" ? value : null;
  const counted = useCountUp(numericVal ?? 0, 1000);
  const sparkColor = getSparkColor(iconColor);

  let displayValue = "";
  if (numericVal !== null) {
    if (isCurrency) {
      displayValue = `TSh ${counted.toLocaleString()}`;
    } else if (isPercentage) {
      displayValue = `${numericVal >= 0 ? "+" : ""}${counted.toFixed(1)}%`;
    } else {
      displayValue = counted.toLocaleString();
    }
  } else {
    displayValue = String(value);
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

function FinanceSummaryPageInner() {
  const { data: session } = useSession();
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";
  const isSuperAdmin = session?.user?.role === "SUPER_ADMIN";

  const { data: summary, isLoading: sumLoading } = useQuery({
    queryKey: ["finance-summary"],
    queryFn: async () => {
      const { data } = await api.get("/finance/summary");
      return data.data;
    },
  });

  const { data: commissions, isLoading: commLoading } = useQuery({
    queryKey: ["finance-commissions"],
    queryFn: async () => {
      const { data } = await api.get("/finance/commissions");
      return data.data;
    },
    enabled: isSuperAdmin,
  });

  if (sumLoading) {
    return (
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    );
  }

  return (
    <div className="max-w-[1520px] mx-auto w-full flex flex-col gap-6 animate-in fade-in duration-700">
      <div className="w-full flex flex-col gap-6">
        <div className="flex-shrink-0 [&_>_div]:!mb-0">
          <ReportPageHeader
            title="Financial Overview"
            subtitle="Track platform earnings, service fees, and payouts"
            iconName="CreditCard"
            hideBackArrow={true}
            action={
              <button className="h-10 px-6 bg-slate-900 text-white rounded-[10px] text-[11px] font-black uppercase tracking-[0.2em] flex items-center gap-2 hover:bg-slate-800 transition-all active:scale-95 shadow-lg shadow-slate-900/10">
                <FileText size={14} strokeWidth={2.5} />
                Export Data
              </button>
            }
            tabs={["Overview", "Earnings"]}
            tabParamName="tab"
            activeTab={tab}
          />
        </div>

        <div className="mt-2">
          {tab.toLowerCase() === "overview" && (
            <div className="flex flex-col gap-6">
              {/* Stats */}
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">
                <FinanceCard
                  label="Total Platform Earnings"
                  value={summary?.totalPlatformEarnings || 0}
                  isCurrency={true}
                  icon={Coins}
                  iconBg="bg-indigo-50"
                  iconColor="text-indigo-600"
                  tag="Total Platform"
                  tagBg="bg-indigo-50"
                  tagColor="text-indigo-600"
                  accentBar="bg-indigo-500"
                  description="Overall earnings (commission + extras + system fees)"
                  seed={78}
                />
                <FinanceCard
                  label="Platform Share (Orgs)"
                  value={summary?.platformCommission || 0}
                  isCurrency={true}
                  icon={Building}
                  iconBg="bg-blue-50"
                  iconColor="text-blue-600"
                  tag="Orgs Share"
                  tagBg="bg-blue-50"
                  tagColor="text-blue-600"
                  accentBar="bg-blue-500"
                  description="Commissions accrued from bookings"
                  seed={12}
                />
                <FinanceCard
                  label="Additional Services"
                  value={summary?.additionalServicesRevenue || 0}
                  isCurrency={true}
                  icon={Zap}
                  iconBg="bg-amber-50"
                  iconColor="text-amber-600"
                  tag="Extras"
                  tagBg="bg-amber-50"
                  tagColor="text-amber-600"
                  accentBar="bg-amber-500"
                  description="Accrued from packaging, insurance, fragile handling"
                  seed={34}
                />
                <FinanceCard
                  label="System Transaction Fees"
                  value={summary?.systemFeeRevenue || 0}
                  isCurrency={true}
                  icon={Scale}
                  iconBg="bg-purple-50"
                  iconColor="text-purple-600"
                  tag="System Fees"
                  tagBg="bg-purple-50"
                  tagColor="text-purple-600"
                  accentBar="bg-purple-500"
                  description="Accrued from flat 500 TSh processing fee"
                  seed={56}
                />
                <FinanceCard
                  label="Gross Bookings"
                  value={summary?.totalRevenue || 0}
                  isCurrency={true}
                  icon={TrendingUp}
                  iconBg="bg-emerald-50"
                  iconColor="text-emerald-600"
                  tag="Gross Rev"
                  tagBg="bg-emerald-50"
                  tagColor="text-emerald-600"
                  accentBar="bg-emerald-500"
                  description="Total amount collected on transit bookings"
                  seed={90}
                />
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                {/* Analytical Overview */}
                <div className="lg:col-span-2 bg-white rounded-2xl border border-slate-100 shadow-sm p-6 flex flex-col items-center justify-center text-center relative overflow-hidden min-h-[320px]">
                  <div className="absolute top-0 right-0 w-64 h-64 bg-blue-50/50 rounded-full blur-3xl -mr-32 -mt-32" />
                  <div className="w-16 h-16 rounded-[1.5rem] bg-blue-50 flex items-center justify-center mb-4 relative z-10 border border-blue-100">
                    <Activity
                      className="w-8 h-8 text-blue-600"
                      strokeWidth={2.5}
                    />
                  </div>
                  <h4 className="text-[16px] font-black text-slate-900 mb-2 relative z-10">
                    Revenue Breakdown
                  </h4>
                  <p className="text-[12px] text-slate-400 max-w-md font-bold leading-relaxed relative z-10">
                    Detailed charts showing your revenue and platform shares will appear here as transactions are completed.
                  </p>
                </div>

                <div className="flex flex-col gap-6">
                  {/* Payout System */}
                  <div className="bg-slate-900 rounded-2xl p-6 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[220px]">
                    <div className="absolute top-0 right-0 w-32 h-32 bg-blue-500/10 rounded-full blur-3xl -mr-16 -mt-16" />
                    <div>
                      <PieChart
                        className="mb-4 text-blue-400 w-6 h-6"
                        strokeWidth={2.5}
                      />
                      <h3 className="text-[16px] font-black mb-1 tracking-tight">
                        Payout System
                      </h3>
                      <p className="text-slate-400 text-[11px] font-bold leading-relaxed opacity-70 mb-4">
                        Real-time status of payments and platform payouts.
                      </p>
                    </div>

                    <div className="space-y-3 text-[10px] font-black uppercase tracking-widest">
                      <div className="flex justify-between items-center bg-white/5 p-2.5 rounded-xl border border-white/5">
                        <span className="text-slate-500">System Status</span>
                        <span className="text-emerald-400 flex items-center gap-1.5">
                          <div className="w-1.5 h-1.5 bg-emerald-400 rounded-full animate-pulse" />
                          Operational
                        </span>
                      </div>
                      <div className="flex justify-between items-center bg-white/5 p-2.5 rounded-xl border border-white/5">
                        <span className="text-slate-500">Payout Success</span>
                        <span className="text-blue-400">99.9% Success</span>
                      </div>
                    </div>
                  </div>

                  {/* Fees Summary */}
                  <div className="bg-white rounded-2xl border border-slate-100 shadow-sm p-6 flex flex-col justify-between min-h-[220px]">
                    <div>
                      <h4 className="font-black text-slate-900 text-[12px] uppercase tracking-widest mb-3 flex items-center gap-2">
                        <Scale className="w-3.5 h-3.5 text-slate-400" />
                        Standard Fees & Taxes
                      </h4>

                      <div className="space-y-3.5">
                        {[
                          {
                            label: "VAT (Value Added Tax)",
                            value: "18%",
                            desc: "Standard sales tax",
                          },
                          {
                            label: "Transit Insurance",
                            value: "2.5%",
                            desc: "Parcel cover",
                          },
                          {
                            label: "Processing Fee",
                            value: "TSh 500",
                            desc: "Flat rate per transaction",
                          },
                        ].map((fee, i) => (
                          <div
                            key={i}
                            className="flex justify-between items-start group"
                          >
                            <div className="flex flex-col">
                              <span className="text-[11px] font-black text-slate-700">
                                {fee.label}
                              </span>
                              <span className="text-[8px] font-bold text-slate-400 uppercase tracking-tight">
                                {fee.desc}
                              </span>
                            </div>
                            <span className="font-black text-slate-900 text-xs">
                              {fee.value}
                            </span>
                          </div>
                        ))}
                      </div>
                    </div>

                    <button className="w-full h-9 bg-slate-50 hover:bg-slate-900 hover:text-white rounded-xl text-[9px] font-black uppercase tracking-[0.2em] transition-all duration-300 mt-3 border border-slate-100 hover:border-slate-900">
                      View Fee Settings
                    </button>
                  </div>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "earnings" && (
            <div className="bg-white rounded-2xl border border-slate-200/60 shadow-sm overflow-hidden p-4 animate-in slide-in-from-bottom-2 duration-500">
              <DataTable
                title="Organization Earnings"
                data={commissions || []}
                columns={[
                  {
                    header: "Organization",
                    accessor: (comm: any) => (
                      <div className="flex items-center gap-4">
                        <div className="w-11 h-11 rounded-xl bg-slate-900 flex items-center justify-center text-white shadow-lg shadow-slate-900/10 border border-white/10 shrink-0">
                          <Building size={18} strokeWidth={2.5} />
                        </div>
                        <div className="flex flex-col">
                          <span className="font-black text-slate-900 text-[14px] tracking-tight uppercase">
                            {comm.organizationName}
                          </span>
                          <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest leading-none">
                            Registered Partner
                          </span>
                        </div>
                      </div>
                    ),
                  },
                  {
                    header: "Gross Revenue",
                    accessor: (comm: any) => (
                      <div className="flex flex-col">
                        <span className="font-black text-slate-900 text-[14px] tabular-nums tracking-tighter">
                          TSh{" "}
                          {new Intl.NumberFormat().format(comm.grossRevenue)}
                        </span>
                        <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest leading-none mt-1">
                          Total Bookings
                        </span>
                      </div>
                    ),
                  },
                  {
                    header: "Platform Fee Rate",
                    accessor: (comm: any) => (
                      <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-xl bg-indigo-50 border border-indigo-100 text-indigo-600 text-[11px] font-black uppercase tracking-widest">
                        {(comm.commissionRate * 100).toFixed(1)}%
                      </div>
                    ),
                  },
                  {
                    header: "Platform Share",
                    accessor: (comm: any) => (
                      <div className="flex flex-col">
                        <span className="text-rose-600 font-black text-[14px] tabular-nums tracking-tighter">
                          -TSh{" "}
                          {new Intl.NumberFormat().format(
                            comm.platformCommission,
                          )}
                        </span>
                        <span className="text-[9px] font-black text-rose-300 uppercase tracking-widest leading-none mt-1">
                          Platform Revenue
                        </span>
                      </div>
                    ),
                  },
                  {
                    header: "Net Earnings",
                    accessor: (comm: any) => (
                      <div className="flex flex-col items-end pr-6">
                        <span className="text-emerald-600 font-black text-[16px] tabular-nums tracking-tighter">
                          TSh{" "}
                          {new Intl.NumberFormat().format(
                            comm.netToOrganization,
                          )}
                        </span>
                        <span className="text-[9px] font-black text-emerald-300 uppercase tracking-widest leading-none mt-1">
                          Available Funds
                        </span>
                      </div>
                    ),
                  },
                ]}
                isLoading={commLoading}
                searchKey="organizationName"
                searchPlaceholder="Filter by organization name..."
                hideInternalSearch={false}
              />
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default function FinanceSummaryPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">
          Loading page...
        </div>
      }
    >
      <FinanceSummaryPageInner />
    </Suspense>
  );
}
