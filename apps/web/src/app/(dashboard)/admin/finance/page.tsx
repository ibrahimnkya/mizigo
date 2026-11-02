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
  description,
}: FinanceCardProps) {
  const numericVal = typeof value === "number" ? value : null;
  const counted = useCountUp(numericVal ?? 0, 1000);

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
    <div className="bg-white border border-[#E2E2E2] rounded-[20px] p-5 flex flex-col gap-3">
      {/* Top Row */}
      <div className="flex items-start justify-between">
        <div className={cn("w-8 h-8 rounded-xl flex items-center justify-center", iconBg, iconColor)}>
          <Icon size={14} strokeWidth={2} />
        </div>
        <span className={cn("inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border", tagBg, tagColor)}>
          {tag}
        </span>
      </div>

      {/* Value */}
      <p className={cn("text-[26px] font-semibold leading-none tabular-nums", iconColor)}>
        {displayValue}
      </p>

      {/* Title & Description */}
      <div>
        <h3 className="text-[14px] font-semibold text-slate-800">{label}</h3>
        <p className="text-[11px] font-medium text-slate-500 mt-0.5 leading-normal line-clamp-2">
          {description}
        </p>
      </div>
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
      <div className="flex flex-col gap-5">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    );
  }

  return (
      <div className="w-full flex flex-col gap-6">
        <div className="flex-shrink-0 [&_>_div]:!mb-0">
          <ReportPageHeader
            title="Financial Overview"
            subtitle="Track platform earnings, service fees, and payouts"
            iconName="CreditCard"
            hideBackArrow={true}
            action={
              <button className="h-8 px-3 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-[12px] font-semibold transition-colors flex items-center gap-2">
                <FileText size={13} strokeWidth={2} />
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
                {isSuperAdmin ? (
                  <FinanceCard
                    label="Total Platform Earnings"
                    value={summary?.totalPlatformEarnings || 0}
                    isCurrency={true}
                    icon={Coins}
                    iconBg="bg-indigo-50"
                    iconColor="text-indigo-600"
                    tag="Total Platform"
                    tagBg="bg-indigo-50"
                    tagColor="text-indigo-600 border-indigo-200"
                    accentBar=""
                    description="Overall earnings across all organizations (commission + extras + system fees)"
                    seed={78}
                  />
                ) : (
                  <FinanceCard
                    label="Net Revenue"
                    value={summary?.netRevenue || 0}
                    isCurrency={true}
                    icon={Coins}
                    iconBg="bg-indigo-50"
                    iconColor="text-indigo-600"
                    tag="Your Org"
                    tagBg="bg-indigo-50"
                    tagColor="text-indigo-600 border-indigo-200"
                    accentBar=""
                    description="What your organization keeps after platform commission and fees"
                    seed={78}
                  />
                )}
                <FinanceCard
                  label="Platform Share (Orgs)"
                  value={summary?.platformCommission || 0}
                  isCurrency={true}
                  icon={Building}
                  iconBg="bg-blue-50"
                  iconColor="text-blue-600"
                  tag="Orgs Share"
                  tagBg="bg-blue-50"
                  tagColor="text-blue-600 border-blue-200"
                  accentBar=""
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
                  tagColor="text-amber-600 border-amber-200"
                  accentBar=""
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
                  tagColor="text-purple-600 border-purple-200"
                  accentBar=""
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
                  tagColor="text-emerald-600 border-emerald-200"
                  accentBar=""
                  description="Total amount collected on transit bookings"
                  seed={90}
                />
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                {/* Analytical Overview */}
                <div className="lg:col-span-2 bg-white border border-[#E2E2E2] rounded-[20px] p-6 flex flex-col items-center justify-center text-center min-h-[320px]">
                  <div className="w-12 h-12 rounded-xl bg-blue-50 border border-blue-200 flex items-center justify-center mb-4">
                    <Activity className="w-6 h-6 text-blue-600" strokeWidth={2} />
                  </div>
                  <h4 className="text-[14px] font-semibold text-slate-800 mb-2">
                    Revenue Breakdown
                  </h4>
                  <p className="text-[12px] font-medium text-slate-500 max-w-md leading-relaxed">
                    Detailed charts showing your revenue and platform shares will appear here as transactions are completed.
                  </p>
                </div>

                <div className="flex flex-col gap-4">
                  {/* Payout System */}
                  <div className="bg-white border border-[#E2E2E2] rounded-[20px] p-6 flex flex-col justify-between min-h-[220px]">
                    <div>
                      <PieChart className="mb-3 text-blue-600 w-5 h-5" strokeWidth={2} />
                      <h3 className="text-[14px] font-semibold text-slate-800 mb-1">
                        Payout System
                      </h3>
                      <p className="text-[11px] font-medium text-slate-500 leading-relaxed mb-4">
                        Real-time status of payments and platform payouts.
                      </p>
                    </div>

                    <div className="space-y-2">
                      <div className="flex justify-between items-center bg-slate-50 p-2 rounded-xl border border-slate-200">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">System Status</span>
                        <span className="inline-flex items-center gap-1.5 px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border bg-emerald-50 text-emerald-700 border-emerald-200">
                          <div className="w-1.5 h-1.5 bg-emerald-500 rounded-full" />
                          Operational
                        </span>
                      </div>
                      <div className="flex justify-between items-center bg-slate-50 p-2 rounded-xl border border-slate-200">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">Payout Success</span>
                        <span className="text-[12px] font-semibold text-slate-800">99.9%</span>
                      </div>
                    </div>
                  </div>

                  {/* Fees Summary */}
                  <div className="bg-white border border-[#E2E2E2] rounded-[20px] p-6 flex flex-col justify-between min-h-[220px]">
                    <div>
                      <h4 className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em] mb-3 flex items-center gap-2">
                        <Scale className="w-3.5 h-3.5" />
                        Standard Fees & Taxes
                      </h4>

                      <div className="space-y-3">
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
                          <div key={i} className="flex justify-between items-start">
                            <div className="flex flex-col">
                              <span className="text-[13px] font-semibold text-slate-700">
                                {fee.label}
                              </span>
                              <span className="text-[11px] font-medium text-slate-500">
                                {fee.desc}
                              </span>
                            </div>
                            <span className="font-semibold text-slate-900 text-[13px]">
                              {fee.value}
                            </span>
                          </div>
                        ))}
                      </div>
                    </div>

                    <button className="w-full h-8 bg-white hover:bg-slate-50 border border-slate-200 text-slate-600 rounded-xl text-[12px] font-medium transition-colors mt-3">
                      View Fee Settings
                    </button>
                  </div>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "earnings" && (
            <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden p-4 animate-in slide-in-from-bottom-2 duration-500">
              <DataTable
                title="Organization Earnings"
                data={commissions || []}
                columns={[
                  {
                    header: "Organization",
                    accessor: (comm: any) => (
                      <div className="flex items-center gap-3">
                        <div className="w-9 h-9 rounded-xl bg-slate-100 border border-slate-200 flex items-center justify-center text-slate-600 shrink-0">
                          <Building size={15} strokeWidth={2} />
                        </div>
                        <div className="flex flex-col">
                          <span className="font-semibold text-slate-800 text-[13px] uppercase tracking-tight">
                            {comm.organizationName}
                          </span>
                          <span className="text-[11px] font-medium text-slate-500">
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
                        <span className="font-semibold text-slate-800 text-[13px] tabular-nums">
                          TSh {new Intl.NumberFormat().format(comm.grossRevenue)}
                        </span>
                        <span className="text-[11px] font-medium text-slate-500 mt-0.5">
                          Total Bookings
                        </span>
                      </div>
                    ),
                  },
                  {
                    header: "Platform Fee Rate",
                    accessor: (comm: any) => (
                      <span className="inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border bg-indigo-50 text-indigo-700 border-indigo-200">
                        {(comm.commissionRate * 100).toFixed(1)}%
                      </span>
                    ),
                  },
                  {
                    header: "Platform Share",
                    accessor: (comm: any) => (
                      <div className="flex flex-col">
                        <span className="text-rose-600 font-semibold text-[13px] tabular-nums">
                          -TSh {new Intl.NumberFormat().format(comm.platformCommission)}
                        </span>
                        <span className="text-[11px] font-medium text-slate-500 mt-0.5">
                          Platform Revenue
                        </span>
                      </div>
                    ),
                  },
                  {
                    header: "Net Earnings",
                    accessor: (comm: any) => (
                      <div className="flex flex-col items-end pr-6">
                        <span className="text-emerald-600 font-semibold text-[13px] tabular-nums">
                          TSh {new Intl.NumberFormat().format(comm.netToOrganization)}
                        </span>
                        <span className="text-[11px] font-medium text-slate-500 mt-0.5">
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
  );
}

export default function FinanceSummaryPage() {
  return (
    <Suspense
      fallback={
        <div className="flex flex-col gap-5">
          Loading page...
        </div>
      }
    >
      <FinanceSummaryPageInner />
    </Suspense>
  );
}
