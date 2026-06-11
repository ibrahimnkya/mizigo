"use client";

import { useState, useEffect } from "react";
import {
  Calculator,
  CheckCircle2,
  Zap,
  TrendingUp,
  XCircle,
  Tag,
  Info,
  Coins,
  BadgePercent,
  Ruler,
  Weight,
  Hash,
  Layers,
  Box,
  FileText,
  RefreshCw,
} from "lucide-react";
import {
  Sheet,
  SheetContent,
  SheetTitle,
  SheetDescription,
} from "@repo/ui/sheet";
import { usePricingTransactions } from "@/modules/pricing/use-pricing";
import { cn } from "@/lib/utils";

interface PricingDetailSheetProps {
  open: boolean;
  onClose: () => void;
  rule: any | null;
}

function fmt(n: number | null | undefined) {
  if (n === null || n === undefined) return "—";
  return new Intl.NumberFormat("en-TZ").format(n);
}

function DetailRow({
  label,
  value,
  icon: Icon,
  mono,
}: {
  label: string;
  value: React.ReactNode;
  icon?: React.ElementType;
  mono?: boolean;
}) {
  return (
    <div className="flex items-start justify-between py-3 border-b border-slate-50 last:border-0 group">
      <div className="flex items-center gap-2 text-[11px] font-black text-slate-400 uppercase tracking-widest">
        {Icon && (
          <Icon
            size={12}
            strokeWidth={3}
            className="text-slate-300 group-hover:text-blue-400 transition-colors"
          />
        )}
        {label}
      </div>
      <div
        className={cn(
          "text-[13px] font-bold text-slate-800 text-right max-w-[55%]",
          mono && "font-mono text-[11px]",
        )}
      >
        {value}
      </div>
    </div>
  );
}

function Badge({
  children,
  color = "slate",
}: {
  children: React.ReactNode;
  color?: "slate" | "emerald" | "blue" | "amber" | "rose";
}) {
  const colors = {
    slate: "bg-slate-100 text-slate-600 border-slate-200",
    emerald: "bg-emerald-50 text-emerald-700 border-emerald-100",
    blue: "bg-blue-50 text-blue-700 border-blue-100",
    amber: "bg-amber-50 text-amber-700 border-amber-100",
    rose: "bg-rose-50 text-rose-700 border-rose-100",
  };
  return (
    <span
      className={cn(
        "inline-flex items-center gap-1 px-2 py-0.5 rounded-md border text-[10px] font-black uppercase tracking-wider",
        colors[color],
      )}
    >
      {children}
    </span>
  );
}

export function PricingDetailSheet({
  open,
  onClose,
  rule,
}: PricingDetailSheetProps) {
  const { data: transactions, isLoading: isTxLoading } = usePricingTransactions(rule?.id);

  const [activeTab, setActiveTab] = useState<"details" | "transactions">("details");
  const isSgr = rule?.type === "SGR_TARIFF";
  const cat = rule?.parcelCategory;

  const chargingModeColor =
    cat?.chargingMode === "Fixed_Amount"
      ? "emerald"
      : cat?.chargingMode === "Percentage_Wise"
        ? "blue"
        : "slate";

  const txList = Array.isArray(transactions) ? transactions : [];
  const totalRevenue = txList.reduce(
    (acc: number, t: any) => acc + (t.status === "SUCCESS" || t.status === "PAID" ? t.amount : 0),
    0,
  );
  const successCount = txList.filter((t: any) => t.status === "SUCCESS" || t.status === "PAID").length;
  const successRate = txList.length
    ? ((successCount / txList.length) * 100).toFixed(1) + "%"
    : "0%";

  useEffect(() => {
    setActiveTab("details");
  }, [rule, open]);

  return (
    <Sheet open={open} onOpenChange={(val) => !val && onClose()}>
      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 shadow-2xl flex flex-col rounded-2xl">
        {/* Header Section */}
        <div className="bg-slate-900 px-8 py-8 flex items-center justify-between shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="flex items-center gap-5 relative z-10 pr-16">
            <div className="w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md">
              <Calculator className="w-6 h-6 text-white" strokeWidth={2.5} />
            </div>
            <div className="flex flex-col relative z-10 text-left">
              <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase">
                Tariff Details
              </SheetTitle>
              <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
                Pricing rule configuration
              </SheetDescription>
            </div>
          </div>
        </div>

        {/* Tab Navigation */}
        {rule && (
          <div className="flex items-center gap-1 border-b border-slate-100 px-8 py-2.5 bg-slate-50 shrink-0">
            <button
              id="pricing-tab-details"
              onClick={() => setActiveTab("details")}
              className={cn(
                "px-4 py-2 rounded-lg text-[10px] font-black uppercase tracking-wider transition-all",
                activeTab === "details"
                  ? "bg-white text-slate-900 shadow-sm border border-slate-200"
                  : "text-slate-400 hover:text-slate-600",
              )}
            >
              Rule Details
            </button>
            <button
              id="pricing-tab-transactions"
              onClick={() => setActiveTab("transactions")}
              className={cn(
                "px-4 py-2 rounded-lg text-[10px] font-black uppercase tracking-wider transition-all flex items-center gap-1.5",
                activeTab === "transactions"
                  ? "bg-white text-slate-900 shadow-sm border border-slate-200"
                  : "text-slate-400 hover:text-slate-600",
              )}
            >
              <span>Rule Transactions</span>
              <span className="bg-slate-200 text-slate-600 text-[8px] font-bold px-1.5 py-0.5 rounded-full">
                {txList.length}
              </span>
            </button>
          </div>
        )}

        {/* Content Area */}
        <div className="flex-1 overflow-y-auto custom-scrollbar">
          {
            /* READ ONLY VIEW MODE */
            rule ? <div className="p-8 space-y-8">
              {activeTab === "details" && (
                <div className="space-y-6 animate-in fade-in duration-200">
                  {/* Status badges */}
                  <div className="flex items-center gap-2">
                    {rule.isActive ? (
                      <Badge color="emerald">
                        <CheckCircle2 size={10} strokeWidth={3} />
                        Active
                      </Badge>
                    ) : (
                      <Badge color="rose">
                        <XCircle size={10} strokeWidth={3} />
                        Paused
                      </Badge>
                    )}
                    <Badge color={isSgr ? "blue" : "slate"}>
                      {isSgr ? (
                        <>
                          <Zap size={10} strokeWidth={3} />
                          SGR Tariff
                        </>
                      ) : (
                        rule.type
                      )}
                    </Badge>
                  </div>

                  {/* Core Info */}
                  <div className="bg-slate-50 rounded-[12px] px-5 py-1">
                    <p className="text-[10px] font-black text-slate-400 uppercase tracking-widest pt-4 pb-2 text-left">
                      Core Info
                    </p>
                    <DetailRow
                      label="Name"
                      icon={Tag}
                      value={rule.name}
                    />
                    {rule.description && (
                      <DetailRow
                        label="Description"
                        icon={Info}
                        value={rule.description}
                      />
                    )}
                    <DetailRow
                      label="Minimum Charge"
                      icon={Coins}
                      value={
                        <span className="text-emerald-700 font-black">
                          TSh {fmt(rule.minimumCharge ?? rule.value)}
                        </span>
                      }
                    />
                    {!isSgr && (
                      <DetailRow
                        label="Value"
                        icon={BadgePercent}
                        value={
                          rule.type === "MULTIPLIER"
                            ? `${rule.value}×`
                            : `TSh ${fmt(rule.value)}`
                        }
                      />
                    )}
                    {isSgr && (
                      <>
                        <DetailRow
                          label="Distance Rate"
                          icon={Ruler}
                          value={`${rule.distanceRate ?? "—"}×`}
                        />
                        <DetailRow
                          label="Weight Rate"
                          icon={Weight}
                          value={`${rule.weightRate ?? "—"}×`}
                        />
                      </>
                    )}
                    {rule.sgrId && (
                      <DetailRow
                        label="SGR ID"
                        icon={Hash}
                        value={rule.sgrId}
                        mono
                      />
                    )}
                  </div>

                  {/* Parcel Category (SGR only) */}
                  {isSgr && cat && (
                    <div className="bg-blue-50/60 rounded-[12px] px-5 py-1 border border-blue-100">
                      <p className="text-[10px] font-black text-blue-400 uppercase tracking-widest pt-4 pb-2 text-left">
                        Parcel Category
                      </p>
                      <DetailRow
                        label="Category Name"
                        icon={Layers}
                        value={cat.name}
                      />
                      <DetailRow
                        label="Code"
                        icon={Hash}
                        value={<span className="font-mono">{cat.code}</span>}
                      />
                      <DetailRow
                        label="Description"
                        icon={Info}
                        value={cat.description || "—"}
                      />
                      <DetailRow
                        label="Charging Mode"
                        icon={Zap}
                        value={
                          <Badge color={chargingModeColor as any}>
                            {cat.chargingMode?.replace("_", " ") || "—"}
                          </Badge>
                        }
                      />
                      <DetailRow
                        label="Max Weight"
                        icon={Weight}
                        value={cat.maxWeightInKg ? `${cat.maxWeightInKg} kg` : "—"}
                      />
                      <DetailRow
                        label="Max Length"
                        icon={Ruler}
                        value={cat.maxLengthInCm ? `${cat.maxLengthInCm} cm` : "—"}
                      />
                      <DetailRow
                        label="Max Width"
                        icon={Ruler}
                        value={cat.maxWidthInCm ? `${cat.maxWidthInCm} cm` : "—"}
                      />
                      <DetailRow
                        label="Max Height"
                        icon={Ruler}
                        value={cat.maxHeightInCm ? `${cat.maxHeightInCm} cm` : "—"}
                      />
                      <DetailRow
                        label="Cubic Volume Limit"
                        icon={Box}
                        value={
                          cat.cubicVolumeLimit ? `${fmt(cat.cubicVolumeLimit)} cm³` : "—"
                        }
                      />
                    </div>
                  )}

                  {/* Metadata */}
                  <div className="bg-slate-50 rounded-[12px] px-5 py-1">
                    <p className="text-[10px] font-black text-slate-400 uppercase tracking-widest pt-4 pb-2 text-left">
                      Metadata
                    </p>
                    <DetailRow
                      label="Rule ID"
                      icon={Hash}
                      value={<span className="font-mono text-[10px]">{rule.id}</span>}
                    />
                    <DetailRow
                      label="Type"
                      value={rule.type}
                    />
                    <DetailRow
                      label="Created"
                      value={
                        rule.createdAt
                          ? new Date(rule.createdAt).toLocaleDateString("en-TZ", {
                              day: "2-digit",
                              month: "short",
                              year: "numeric",
                            })
                          : "—"
                      }
                    />
                    <DetailRow
                      label="Last Updated"
                      value={
                        rule.updatedAt
                          ? new Date(rule.updatedAt).toLocaleDateString("en-TZ", {
                              day: "2-digit",
                              month: "short",
                              year: "numeric",
                            })
                          : "—"
                      }
                    />
                  </div>
                </div>
              )}

              {activeTab === "transactions" && (
                <div className="space-y-6 animate-in fade-in duration-200">
                  {/* Stats Grid */}
                  <div className="grid grid-cols-3 gap-3">
                    <div className="bg-slate-50 border border-slate-100 rounded-[10px] p-3 text-center">
                      <span className="text-[8px] font-black uppercase tracking-wider text-slate-400 block mb-1">
                        Usage Count
                      </span>
                      <span className="text-[16px] font-black text-slate-900">
                        {txList.length}
                      </span>
                    </div>
                    <div className="bg-slate-50 border border-slate-100 rounded-[10px] p-3 text-center">
                      <span className="text-[8px] font-black uppercase tracking-wider text-slate-400 block mb-1">
                        Total Revenue
                      </span>
                      <span className="text-[13px] font-black text-emerald-600 truncate block">
                        TSh {fmt(totalRevenue)}
                      </span>
                    </div>
                    <div className="bg-slate-50 border border-slate-100 rounded-[10px] p-3 text-center">
                      <span className="text-[8px] font-black uppercase tracking-wider text-slate-400 block mb-1">
                        Success Rate
                      </span>
                      <span className="text-[16px] font-black text-blue-600">
                        {successRate}
                      </span>
                    </div>
                  </div>

                  {/* List Content */}
                  {isTxLoading ? (
                    <div className="flex flex-col items-center justify-center py-12 gap-3 text-slate-400 animate-pulse">
                      <RefreshCw size={20} className="animate-spin text-blue-500" />
                      <span className="text-[10px] font-black uppercase tracking-widest">
                        Loading Transactions...
                      </span>
                    </div>
                  ) : txList.length === 0 ? (
                    <div className="flex flex-col items-center justify-center py-16 px-4 text-center border border-dashed border-slate-200 rounded-[12px] bg-slate-50/20 gap-3">
                      <div className="w-12 h-12 rounded-full bg-slate-100 flex items-center justify-center text-slate-400">
                        <FileText size={20} />
                      </div>
                      <div>
                        <h4 className="text-[12px] font-black text-slate-700 uppercase tracking-wider">
                          No Usage Records
                        </h4>
                        <p className="text-[11px] text-slate-400 font-medium max-w-[240px] mt-1 mx-auto">
                          This pricing rule has not been applied to any matched bookings yet.
                        </p>
                      </div>
                    </div>
                  ) : (
                    <div className="space-y-3 text-left">
                      <p className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                        Transactions Breakdown
                      </p>
                      <div className="divide-y divide-slate-100 border border-slate-100 rounded-[12px] overflow-hidden bg-white shadow-sm">
                        {txList.map((tx: any) => {
                          const isPaid = tx.status === "SUCCESS" || tx.status === "PAID";
                          return (
                            <div
                              key={tx.id}
                              className="p-4 flex items-center justify-between hover:bg-slate-50/80 transition-colors"
                            >
                              <div className="flex flex-col gap-1">
                                <span className="text-[12px] font-black text-slate-900 tracking-tight">
                                  #{tx.trackingNumber?.toUpperCase() || tx.id.slice(-8).toUpperCase()}
                                </span>
                                <span className="text-[10px] text-slate-400 font-bold uppercase tracking-tight">
                                  {tx.senderName} → {tx.receiverName}
                                </span>
                                <span className="text-[9px] text-slate-300 font-black uppercase tracking-widest mt-0.5">
                                  {new Date(tx.createdAt).toLocaleDateString("en-TZ", {
                                    day: "2-digit",
                                    month: "short",
                                    year: "numeric",
                                    hour: "2-digit",
                                    minute: "2-digit",
                                  })}
                                </span>
                              </div>
                              <div className="text-right flex flex-col items-end gap-1">
                                <span className="text-[13px] font-black text-slate-900 tabular-nums">
                                  TSh {fmt(tx.amount)}
                                </span>
                                <span
                                  className={cn(
                                    "inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[8px] font-black uppercase tracking-widest border",
                                    isPaid
                                      ? "bg-emerald-50 text-emerald-700 border-emerald-100"
                                      : "bg-amber-50 text-amber-700 border-amber-100",
                                  )}
                                >
                                  {isPaid ? "Paid" : "Pending"}
                                </span>
                              </div>
                            </div>
                          );
                        })}
                      </div>
                    </div>
                  )}
                </div>
              )}
            </div> : null
          }
        </div>

        {/* Action Footer */}
        <div className="p-6 bg-slate-50 border-t border-slate-100 flex gap-3 shrink-0">
          <button
            onClick={onClose}
            className="w-full h-14 bg-slate-900 hover:bg-slate-800 text-white text-[11px] font-black uppercase tracking-widest rounded-xl transition-all active:scale-[0.98]"
          >
            Close
          </button>
        </div>
      </SheetContent>
    </Sheet>
  );
}
