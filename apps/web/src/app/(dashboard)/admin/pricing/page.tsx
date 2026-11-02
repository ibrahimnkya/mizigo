"use client";
import { ReportSummary } from "@/components/reports/report-kit";
import { PrimaryPill } from "@/components/shared/overview-kit";
import { CheckCircle2, PauseCircle, SlidersHorizontal, TrainFront } from "lucide-react";

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
import { useRouter, useSearchParams } from "next/navigation";
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
  description,
}: PricingCardProps) {
  const valStr = String(value);
  const numericVal = parseFloat(valStr.replace(/[^\d.]/g, ""));
  const isNumeric = !isNaN(numericVal);
  const counted = useCountUp(isNumeric ? numericVal : 0, 1000);

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

function PricingPageInner() {
  const { data: session } = useSession();
  const isSuperAdmin = session?.user?.role === "SUPER_ADMIN";
  const [selectedOrgId, setSelectedOrgId] = useState<string>(""); // "" = global/platform
  const { data: rules, isLoading } = usePricingRules(selectedOrgId || null);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [viewRule, setViewRule] = useState<any>(null);
  const router = useRouter();
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
              "h-9 w-9 rounded-xl border flex items-center justify-center shrink-0",
              rule.isActive
                ? "bg-[#5C0B19] border-slate-700"
                : "bg-slate-100 border-slate-200",
            )}
          >
            {rule.type === "MULTIPLIER" ? (
              <TrendingUp
                className={cn(
                  "h-4 w-4",
                  rule.isActive ? "text-white" : "text-slate-400",
                )}
                strokeWidth={2}
              />
            ) : (
              <Calculator
                className={cn(
                  "h-4 w-4",
                  rule.isActive ? "text-white" : "text-slate-400",
                )}
                strokeWidth={2}
              />
            )}
          </div>
          <div className="flex flex-col min-w-0">
            <span className="font-semibold text-slate-800 text-[13px] uppercase truncate max-w-[220px]">
              {rule.name}
            </span>
            <span className="text-[11px] font-medium text-slate-500 truncate max-w-[220px]">
              {rule.condition || "All parcels"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Identifier",
      accessor: (rule: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1.5 px-2 py-1 bg-slate-50 border border-slate-200 rounded-xl w-fit">
            <span className="text-[11px] font-medium text-slate-600">
              ID:{rule.id?.slice(0, 8) || "RULE-001"}
            </span>
          </div>
          <span className="text-[11px] font-medium text-slate-400 pl-1">
            Version: 2.1
          </span>
        </div>
      ),
    },
    {
      header: "Status",
      accessor: (rule: any) => (
        <span
          className={cn(
            "inline-flex items-center gap-1.5 px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border",
            rule.isActive
              ? "bg-emerald-50 text-emerald-700 border-emerald-200"
              : "bg-rose-50 text-rose-700 border-rose-200",
          )}
        >
          <div
            className={cn(
              "w-1.5 h-1.5 rounded-full",
              rule.isActive ? "bg-emerald-500" : "bg-rose-500",
            )}
          />
          {rule.isActive ? "Active" : "Paused"}
        </span>
      ),
    },
    {
      header: "Price Info",
      accessor: (rule: any) => (
        <div className="flex flex-col gap-0.5">
          <div className="flex items-center gap-1 text-blue-600">
            <BadgePercent className="w-3.5 h-3.5" strokeWidth={2} />
            <span className="text-[13px] font-semibold">
              {rule.type === "MULTIPLIER"
                ? `${rule.value}x`
                : `TSh ${new Intl.NumberFormat().format(rule.value)}`}
            </span>
          </div>
          <span className="text-[11px] font-medium text-slate-400">
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
    <div className="flex flex-col gap-5">
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
              className="h-8 px-3 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-[12px] font-semibold transition-colors flex items-center gap-2"
            >
              <Plus size={13} strokeWidth={2} />
              Add Pricing
            </button>
          }
          tabs={["Overview", "All"]}
          tabParamName="tab"
          activeTab={tab}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          {tab.toLowerCase() === "overview" && (() => {
            const all: any[] = rules ?? [];
            const meta = (r: any) => {
              try {
                return JSON.parse(r.condition || "{}");
              } catch {
                return {};
              }
            };
            const tariffs = all.filter((r) => r.type === "SGR_TARIFF");
            const others = all.filter((r) => r.type !== "SGR_TARIFF");
            const charge = (r: any) => {
              const c = meta(r).parcelCategory ?? {};
              if (r.type === "MULTIPLIER") return `× ${r.value}`;
              if (c.chargingMode === "Percentage_Wise") return `${r.value}% of declared value`;
              return `TSh ${Number(r.value || 0).toLocaleString("en-US")}`;
            };
            return (
              <div className="flex flex-col gap-5">
                <ReportSummary
                  label="Pricing rules"
                  value={isLoading ? "…" : String(all.length)}
                  note="Prices come from the SGR tariff matched by weight, plus extra services"
                  loading={isLoading}
                  chips={[
                    { label: "Active", value: String(all.filter((r) => r.isActive).length), icon: CheckCircle2 },
                    { label: "SGR tariffs", value: String(tariffs.length), icon: TrainFront },
                    { label: "Other rules", value: String(others.length), icon: SlidersHorizontal },
                    { label: "Paused", value: String(all.filter((r) => !r.isActive).length), icon: PauseCircle },
                  ]}
                />
                <section className="overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white">
                  <div className="flex flex-wrap items-center justify-between gap-3 border-b border-slate-100 px-5 py-4">
                    <div>
                      <h2 className="text-[17px] font-semibold text-[#1C1C1E]">SGR tariffs</h2>
                      <p className="text-[13px] text-slate-500">The lightest tariff that can carry a parcel&apos;s weight is used</p>
                    </div>
                    <PrimaryPill onClick={() => router.push("?tab=all")}>Manage rules</PrimaryPill>
                  </div>
                  {tariffs.length === 0 ? (
                    <p className="px-6 py-12 text-center text-[14px] text-slate-400">No SGR tariffs set up yet.</p>
                  ) : (
                    <div className="grid gap-4 p-5 sm:grid-cols-2 xl:grid-cols-3">
                      {[...tariffs]
                        .sort((a, b) => (meta(a).parcelCategory?.maxWeightInKg ?? 1e9) - (meta(b).parcelCategory?.maxWeightInKg ?? 1e9))
                        .map((r) => {
                          const c = meta(r).parcelCategory ?? {};
                          return (
                            <div key={r.id} className="rounded-[20px] border border-[#E2E2E2] p-4">
                              <div className="flex items-start justify-between gap-3">
                                <div className="flex min-w-0 items-center gap-3">
                                  <span className="flex h-11 w-11 shrink-0 items-center justify-center rounded-2xl bg-orange-50">
                                    <TrainFront size={19} className="text-orange-500" />
                                  </span>
                                  <div className="min-w-0">
                                    <p className="truncate text-[15px] font-semibold text-[#1C1C1E]">{c.name || r.name}</p>
                                    <p className="truncate text-[12px] text-slate-400">{c.code || r.name}</p>
                                  </div>
                                </div>
                                <span className={cn("shrink-0 rounded-full px-2.5 py-1 text-[12px] font-semibold", r.isActive ? "bg-emerald-50 text-emerald-700" : "bg-slate-100 text-slate-500")}>
                                  {r.isActive ? "Active" : "Paused"}
                                </span>
                              </div>
                              <div className="mt-4 grid grid-cols-2 gap-2">
                                <div className="rounded-2xl bg-[#F7F5F4] px-3 py-2.5">
                                  <p className="text-[12px] text-slate-500">Charge</p>
                                  <p className="text-[15px] font-semibold text-[#1C1C1E]">{charge(r)}</p>
                                </div>
                                <div className="rounded-2xl bg-[#F7F5F4] px-3 py-2.5">
                                  <p className="text-[12px] text-slate-500">Up to</p>
                                  <p className="text-[15px] font-semibold text-[#1C1C1E]">{c.maxWeightInKg ? `${c.maxWeightInKg} kg` : "Any weight"}</p>
                                </div>
                              </div>
                            </div>
                          );
                        })}
                    </div>
                  )}
                  {others.length > 0 && (
                    <div className="border-t border-slate-100 px-5 py-4">
                      <p className="mb-2 text-[14px] font-semibold text-[#1C1C1E]">Other rules</p>
                      <ul className="divide-y divide-slate-100">
                        {others.map((r) => (
                          <li key={r.id} className="flex items-center justify-between gap-3 py-2.5 text-[14px]">
                            <span className="min-w-0 truncate text-[#1C1C1E]">
                              {r.name}
                              {r.condition && <span className="ml-2 text-[12px] text-slate-400">{r.condition}</span>}
                            </span>
                            <span className="shrink-0 font-semibold tabular-nums text-[#1C1C1E]">{charge(r)}</span>
                          </li>
                        ))}
                      </ul>
                    </div>
                  )}
                </section>
              </div>
            );
          })()}

          {tab.toLowerCase() === "all" && (
            <div className="space-y-4">
              {isSuperAdmin && (
                <div className="bg-white border border-[#E2E2E2] rounded-[20px] p-5 flex flex-col sm:flex-row justify-between items-center gap-4">
                  <div className="flex flex-col text-left">
                    <h3 className="text-[14px] font-semibold text-slate-800">
                      {selectedOrgId
                        ? <>Editing overrides for <span className="text-blue-600">{organizations.find((o: any) => o.id === selectedOrgId)?.name}</span></>
                        : "Global Platform Pricing Rules"
                      }
                    </h3>
                    <p className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em] mt-1">
                      {selectedOrgId ? "Custom rates overriding platform defaults" : "Global defaults applied across all organizations"}
                    </p>
                  </div>
                  <div className="flex items-center gap-3 shrink-0">
                    <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">Select Scope:</span>
                    <select
                      value={selectedOrgId}
                      onChange={(e) => setSelectedOrgId(e.target.value)}
                      className="h-8 px-3 bg-white border border-[#E2E2E2] rounded-[20px] text-[12px] font-medium text-slate-700 outline-none focus:ring-2 focus:ring-blue-500 cursor-pointer min-w-[200px]"
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
              <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden p-1">
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
  );
}

export default function PricingPage() {
  return (
    <Suspense
      fallback={
        <div className="flex items-center justify-center min-h-[300px]">
          Loading page...
        </div>
      }
    >
      <PricingPageInner />
    </Suspense>
  );
}
