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

import { PricingModal } from "@/components/admin/pricing-modal";
import { PricingActionMenu } from "@/components/admin/pricing-action-menu";
import { usePricingRules } from "@/modules/pricing/use-pricing";
import { useState, Suspense } from "react";
import { useSearchParams } from "next/navigation";
import { DashboardTabs } from "@/components/dashboard/dashboard-tabs";
import { ReportPageHeader } from "@/components/reports/report-page-header";

function PricingPageInner() {
  const { data: rules, isLoading } = usePricingRules();
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [selectedRule, setSelectedRule] = useState<any>(null);
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  const handleEdit = (rule: any) => {
    setSelectedRule(rule);
    setIsModalOpen(true);
  };

  const handleCreate = () => {
    setSelectedRule(null);
    setIsModalOpen(true);
  };

  const columns = [
    {
      header: "Rule Name",
      accessor: (rule: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-10 w-10 rounded-[10px] flex items-center justify-center shadow-lg transition-all duration-300",
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
          <div className="flex flex-col">
            <span className="font-black text-slate-900 text-[13px] tracking-tight group-hover:text-blue-600 transition-colors uppercase">
              {rule.name}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest line-clamp-1">
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
          <PricingActionMenu rule={rule} onEdit={handleEdit} />
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
          rule={selectedRule}
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
                {[
                  {
                    label: "Active Rules",
                    count: activeRules,
                    icon: Calculator,
                    color: "text-blue-600",
                    bg: "bg-blue-50",
                  },
                  {
                    label: "Base Price Multiplier",
                    count: `${baseMultiplier}x`,
                    icon: TrendingUp,
                    color: "text-emerald-600",
                    bg: "bg-emerald-50",
                  },
                  {
                    label: "Express Delivery Markup",
                    count: `+${expressPremium}%`,
                    icon: BadgePercent,
                    color: "text-indigo-600",
                    bg: "bg-indigo-50",
                  },
                  {
                    label: "Global Coverage",
                    count: "100%",
                    icon: Globe,
                    color: "text-slate-600",
                    bg: "bg-slate-50",
                  },
                ].map((stat, i) => (
                  <div
                    key={i}
                    className="flex flex-col p-6 bg-white border border-slate-100 rounded-[10px] shadow-sm group hover:border-slate-300 transition-all hover:shadow-xl hover:shadow-slate-100/50"
                  >
                    <div className="flex items-center justify-between mb-4">
                      <div className={cn("p-2.5 rounded-[10px]", stat.bg)}>
                        <stat.icon className={cn("w-5 h-5", stat.color)} />
                      </div>
                      <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest leading-none">
                        {stat.label}
                      </span>
                    </div>
                    <div className="flex items-baseline gap-2">
                      <span className="text-3xl font-black text-slate-900 tabular-nums">
                        {stat.count}
                      </span>
                    </div>
                  </div>
                ))}
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
            <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden p-1">
              <DataTable
                title="Current Pricing Rules"
                data={rules || []}
                columns={columns}
                isLoading={isLoading}
                hideActions={true}
                hideInternalSearch={true}
              />
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
