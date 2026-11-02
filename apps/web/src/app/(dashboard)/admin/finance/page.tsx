"use client";

import { useQuery } from "@tanstack/react-query";
import { RevenueOverview } from "@/components/finance/revenue-overview";
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


  return (
      <div className="w-full flex flex-col gap-6">
        {tab.toLowerCase() !== "overview" && (
        <div className="flex-shrink-0 [&_>_div]:!mb-0">
          <ReportPageHeader
            title="Revenue"
            subtitle="Money collected from parcels, by period and station"
            iconName="CreditCard"
            hideBackArrow={true}
            tabs={["Overview", "Earnings"]}
            tabParamName="tab"
            activeTab={tab}
          />
        </div>
        )}

        <div className="mt-2">
          {tab.toLowerCase() === "overview" && (
            <RevenueOverview
              renderHeader={(filters) => (
                <div className="[&_>_div]:!mb-0">
                  <ReportPageHeader
                    title="Revenue"
                    subtitle="Money collected from parcels, by period and station"
                    iconName="CreditCard"
                    hideBackArrow
                    tabs={["Overview", "Earnings"]}
                    tabParamName="tab"
                    activeTab={tab}
                    heroContent={filters}
                  />
                </div>
              )}
            />
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
