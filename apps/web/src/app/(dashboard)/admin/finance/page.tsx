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
  DollarSign,
  Scale,
  Zap,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { DataTable } from "@/components/shared/data-table";
import { useSession } from "next-auth/react";
import { useSearchParams } from "next/navigation";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useState, Suspense } from "react";

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
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
        <ReportPageHeader
          title="Financial Registry"
          subtitle="System-wide revenue, commissions and settlement reconciliation"
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

        <div className="mt-2 animate-in fade-in duration-700">
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-10">
              {/* Stats */}
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                {[
                  {
                    label: "Total Gross Revenue",
                    count: `TSh ${new Intl.NumberFormat().format(summary?.totalRevenue || 0)}`,
                    icon: DollarSign,
                    color: "text-blue-600",
                    bg: "bg-blue-50",
                  },
                  {
                    label: "Platform Commission",
                    count: `TSh ${new Intl.NumberFormat().format(summary?.platformCommission || 0)}`,
                    icon: Zap,
                    color: "text-amber-600",
                    bg: "bg-amber-50",
                  },
                  {
                    label: "Growth Indicator",
                    count: "+12.4%",
                    icon: TrendingUp,
                    color: "text-emerald-600",
                    bg: "bg-emerald-50",
                  },
                  {
                    label: "Security Status",
                    count: "Validated",
                    icon: ShieldCheck,
                    color: "text-indigo-600",
                    bg: "bg-indigo-50",
                  },
                ].map((stat, i) => (
                  <div
                    key={i}
                    className="flex flex-col p-6 bg-white border border-slate-100 rounded-[12px] shadow-sm hover:shadow-xl hover:shadow-slate-200/50 transition-all duration-300"
                  >
                    <div className="flex items-center justify-between mb-5">
                      <div className={cn("p-2.5 rounded-xl", stat.bg)}>
                        <stat.icon
                          className={cn("w-5 h-5", stat.color)}
                          strokeWidth={2.5}
                        />
                      </div>
                      <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest leading-none">
                        {stat.label}
                      </span>
                    </div>
                    <div className="flex flex-col">
                      <span className="text-[28px] font-black text-slate-900 tabular-nums leading-none tracking-tight">
                        {stat.count}
                      </span>
                    </div>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-10">
                {/* Analytical Overview */}
                <div className="lg:col-span-2 bg-white rounded-[20px] border border-slate-100 shadow-sm p-10 flex flex-col items-center justify-center text-center relative overflow-hidden">
                  <div className="absolute top-0 right-0 w-64 h-64 bg-blue-50/50 rounded-full blur-3xl -mr-32 -mt-32" />
                  <div className="w-20 h-20 rounded-[2rem] bg-blue-50 flex items-center justify-center mb-6 relative z-10 border border-blue-100">
                    <Activity
                      className="w-10 h-10 text-blue-600"
                      strokeWidth={2.5}
                    />
                  </div>
                  <h4 className="text-[18px] font-black text-slate-900 mb-2 relative z-10">
                    Revenue Distribution
                  </h4>
                  <p className="text-[13px] text-slate-400 max-w-md font-bold leading-relaxed relative z-10">
                    Comprehensive analysis of financial flow across
                    organizations will be visualized here as the settlement
                    ledger expands.
                  </p>
                </div>

                <div className="space-y-6">
                  {/* Financial Health */}
                  <div className="bg-slate-900 rounded-[20px] p-8 text-white relative overflow-hidden shadow-2xl">
                    <div className="absolute top-0 right-0 w-32 h-32 bg-blue-500/10 rounded-full blur-3xl -mr-16 -mt-16" />
                    <PieChart
                      className="mb-6 text-blue-400 w-8 h-8"
                      strokeWidth={2.5}
                    />
                    <h3 className="text-[20px] font-black mb-2 tracking-tight">
                      System Liquidity
                    </h3>
                    <p className="text-slate-400 text-[12px] font-bold leading-relaxed opacity-70 mb-8">
                      Real-time monitoring of clearing and settlement stability
                      across the platform.
                    </p>

                    <div className="space-y-4 text-[11px] font-black uppercase tracking-widest">
                      <div className="flex justify-between items-center bg-white/5 p-3 rounded-xl border border-white/5">
                        <span className="text-slate-500">Node Status</span>
                        <span className="text-emerald-400 flex items-center gap-2">
                          <div className="w-1.5 h-1.5 bg-emerald-400 rounded-full animate-pulse" />
                          Operational
                        </span>
                      </div>
                      <div className="flex justify-between items-center bg-white/5 p-3 rounded-xl border border-white/5">
                        <span className="text-slate-500">Clearance</span>
                        <span className="text-blue-400">99.9% Success</span>
                      </div>
                    </div>
                  </div>

                  {/* Fees Summary */}
                  <div className="bg-white rounded-[20px] border border-slate-100 shadow-sm p-8 space-y-6">
                    <h4 className="font-black text-slate-900 text-[14px] uppercase tracking-widest mb-2 flex items-center gap-3">
                      <Scale className="w-4 h-4 text-slate-400" />
                      Standard Tariffs
                    </h4>

                    <div className="space-y-4">
                      {[
                        {
                          label: "Value Added Tax",
                          value: "18%",
                          desc: "Statutory VAT",
                        },
                        {
                          label: "Insurance Levy",
                          value: "2.5%",
                          desc: "Goods in transit",
                        },
                        {
                          label: "Platform Fee",
                          value: "TSh 500",
                          desc: "Flat processing",
                        },
                      ].map((fee, i) => (
                        <div
                          key={i}
                          className="flex justify-between items-start group"
                        >
                          <div className="flex flex-col">
                            <span className="text-[12px] font-black text-slate-700">
                              {fee.label}
                            </span>
                            <span className="text-[9px] font-bold text-slate-400 uppercase tracking-tight">
                              {fee.desc}
                            </span>
                          </div>
                          <span className="font-black text-slate-900 text-sm">
                            {fee.value}
                          </span>
                        </div>
                      ))}
                    </div>

                    <button className="w-full h-11 bg-slate-50 hover:bg-slate-900 hover:text-white rounded-xl text-[10px] font-black uppercase tracking-[0.2em] transition-all duration-300 mt-4 border border-slate-100 hover:border-slate-900">
                      Audit Settings
                    </button>
                  </div>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "earnings" && (
            <div className="bg-white rounded-[20px] border border-slate-200/60 shadow-sm overflow-hidden p-1 animate-in slide-in-from-bottom-2 duration-500">
              <DataTable
                title="Organization Revenue Registry"
                data={commissions || []}
                columns={[
                  {
                    header: "Organization / Entity",
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
                            Registered Service Provider
                          </span>
                        </div>
                      </div>
                    ),
                  },
                  {
                    header: "Gross Volume",
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
                    header: "Service Rate",
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
                    header: "Net Settlement",
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
