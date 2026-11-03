"use client";

import { cn } from "@/lib/utils";
import {
  CreditCard,
  TrendingUp,
  Zap,
  Activity,
  Database,
  Info,
  Wallet,
  CheckCircle2,
  FileText,
  ArrowUpRight,
  Coins,
} from "lucide-react";
import { useQuery } from "@tanstack/react-query";
import {
  CustomRange,
  RangeKey,
  ReportFilters,
  ReportSummary,
  rangeLabel,
  rangeParams,
} from "@/components/reports/report-kit";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { PaymentDetailSheet, paymentStatus } from "./payment-detail-sheet";
import { Receipt } from "lucide-react";
import { downloadExcel } from "@/lib/export";
import { FileSpreadsheet } from "lucide-react";
import { BreakdownCard } from "@/components/shared/overview-kit";
import { CheckCircle2 as PaidIcon, Clock3, Percent, XCircle as FailedIcon } from "lucide-react";
import api from "@/lib/api/client";
import { DataTable } from "@/components/shared/data-table";
import { format } from "date-fns";
import { useState, useEffect } from "react";
import { useStations } from "@/modules/stations/use-stations";

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

// --- Custom PaymentStatCard Component ---
interface PaymentStatCardProps {
  label: string;
  value: number;
  isCurrency?: boolean;
  isPercent?: boolean;
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

function PaymentStatCard({
  label,
  value,
  isCurrency = false,
  isPercent = false,
  icon: Icon,
  iconBg,
  iconColor,
  tag,
  tagBg,
  tagColor,
  accentBar,
  description,
  seed,
}: PaymentStatCardProps) {
  const counted = useCountUp(value, 1000);
  const sparkColor = getSparkColor(iconColor);

  const displayValue = isCurrency
    ? `TSh ${counted.toLocaleString()}`
    : isPercent
      ? `${counted}%`
      : counted.toLocaleString();

  return (
    <div className="group bg-white rounded-[20px] border border-[#E2E2E2] p-5 flex flex-col justify-between hover: hover:border-slate-200  transition-all duration-300 h-full relative overflow-hidden">
      {/* Top Row */}
      <div className="flex items-start justify-between">
        <div className={cn("w-9 h-9 rounded-xl flex items-center justify-center transition-all duration-300 group-hover:scale-110 ", iconBg, iconColor)}>
          <Icon size={16} strokeWidth={2.5} />
        </div>
        <span className={cn("text-[9px] font-bold uppercase tracking-[0.05em] px-2.5 py-1.5 rounded-md border", tagBg, tagColor)}>
          {tag}
        </span>
      </div>

      {/* Main Content */}
      <div className="mt-4 flex-1 flex flex-col justify-between">
        <div>
          {/* Primary value */}
          <p className={cn("text-[24px] font-semibold tracking-tight leading-none tabular-nums", iconColor)}>
            {displayValue}
          </p>
          
          {/* Title & Description */}
          <h3 className="text-[13px] font-semibold text-slate-800 tracking-tight mt-3">
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

const STATUS_TITLES: Record<string, string> = {
  SUCCESS: "Successful payments",
  PENDING: "Pending payments",
  FAILED: "Failed payments",
  REFUNDED: "Refunds",
};

export function PaymentList({
  status,
  tab = "overview",
  title,
}: {
  status?: string | string[];
  tab?: string;
  title?: string;
}) {
  const firstStatus = Array.isArray(status) ? status[0] : status;
  const pageTitle = title ?? (firstStatus ? STATUS_TITLES[firstStatus] ?? "Payments" : "Payments");
  const [selectedStationId, setSelectedStationId] = useState<string>("");
  const [selectedPayment, setSelectedPayment] = useState<any | null>(null);
  const [range, setRange] = useState<RangeKey>("month");
  const [custom, setCustom] = useState<CustomRange>({ from: "", to: "" });
  const dates = rangeParams(range, custom);
  const { data: stations } = useStations();
  const stationList = Array.isArray(stations) ? stations : [];

  const { data: payments, isLoading } = useQuery({
    queryKey: ["payments", status, selectedStationId, dates],
    queryFn: async () => {
      const params = new URLSearchParams();
      if (status) {
        if (Array.isArray(status)) {
          status.forEach((s) => params.append("status", s));
        } else {
          params.append("status", status);
        }
      }
      if (selectedStationId) {
        params.append("stationId", selectedStationId);
      }
      if (dates.dateFrom) params.append("dateFrom", dates.dateFrom);
      if (dates.dateTo) params.append("dateTo", dates.dateTo);
      const { data } = await api.get(`/payments?${params.toString()}`);
      return data.data || [];
    },
  });

  const rawPayments = Array.isArray(payments) ? payments : [];

  const totalPaid = rawPayments.filter((p: any) => p.status === "SUCCESS");
  const totalPending = rawPayments.filter((p: any) => p.status === "PENDING");

  const totalPaidAmount = totalPaid.reduce(
    (acc: number, p: any) => acc + p.amount,
    0,
  );
  const totalPendingAmount = totalPending.reduce(
    (acc: number, p: any) => acc + p.amount,
    0,
  );

  const successRate = rawPayments.length
    ? ((totalPaid.length / rawPayments.length) * 100).toFixed(1) + "%"
    : "0%";

  // Always the full figure, e.g. TSh 1,250,000 — never abbreviated.
  const formatAmount = (amt: number) => `TSh ${Math.round(amt || 0).toLocaleString("en-US")}`;

  const columns = [
    {
      header: "Transaction",
      accessor: (pay: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-10 w-10 rounded-xl flex items-center justify-center ",
              pay.status === "SUCCESS"
                ? "bg-[#5C0B19]"
                : "bg-slate-200 grayscale",
            )}
          >
            <FileText className="h-5 w-5 text-white" />
          </div>
          <div className="flex flex-col">
            <span className="font-semibold text-slate-900 text-[14px] uppercase">
              #
              {pay.parcel?.id?.slice(-8).toUpperCase() ||
                pay.transactionReference?.slice(-8).toUpperCase() ||
                "---"}
            </span>
            <span className="text-[10px] text-slate-400 uppercase mt-1">
              Reference
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Reference ID",
      accessor: (pay: any) => (
        <span className="text-[12px] font-bold text-blue-600">
          {pay.transactionReference?.slice(0, 10) || "PENDING"}
        </span>
      ),
    },
    {
      header: "Origin Station",
      accessor: (pay: any) => (
        <span className="text-[12px] font-bold text-slate-600">
          {pay.parcel?.origin?.name || "---"}
        </span>
      ),
    },
    {
      header: "Status",
      accessor: (pay: any) => {
        const isSuccess = pay.status === "SUCCESS" || pay.status === "PAID";
        return (
          <div
            className={cn(
              "inline-flex items-center gap-2 px-3 py-1.5 rounded-full border",
              isSuccess
                ? "bg-emerald-50 border-emerald-100 text-emerald-600"
                : "bg-amber-50 border-amber-100 text-amber-600",
            )}
          >
            <Zap
              className={cn(
                "w-3 h-3",
                isSuccess ? "fill-emerald-600" : "fill-amber-500",
              )}
            />
            <span className="text-[10px] font-bold uppercase">
              {isSuccess ? "Paid" : "Pending"}
            </span>
          </div>
        );
      },
    },
    {
      header: "Amount",
      accessor: (pay: any) => (
        <div className="flex items-center gap-1 text-slate-900">
          <Wallet className="w-4 h-4 text-slate-400" />
          <span className="text-[14px] font-semibold">
            TSh {pay.amount.toLocaleString()}
          </span>
        </div>
      ),
    },
    {
      header: "Date",
      accessor: (pay: any) => (
        <div className="flex flex-col text-right pr-4">
          <span className="text-[12px] font-bold text-slate-900">
            {format(new Date(pay.createdAt || Date.now()), "HH:mm")}
          </span>
          <span className="text-[10px] text-slate-400 uppercase">
            {format(new Date(pay.createdAt || Date.now()), "MMM dd, yyyy")}
          </span>
        </div>
      ),
    },
  ];

  return (
    <div className="w-full flex flex-col gap-6 animate-in fade-in duration-700">
      <div className="[&_>_div]:!mb-0">
        <ReportPageHeader
          title={pageTitle}
          subtitle="Every payment for parcels, by period and station"
          iconName="CreditCard"
          hideBackArrow
          tabs={["Overview", "All"]}
          tabParamName="tab"
          activeTab={tab}
          heroContent={
            <ReportFilters
              onDark
              range={range}
              onRange={setRange}
              custom={custom}
              onCustom={setCustom}
              stationId={selectedStationId}
              onStation={setSelectedStationId}
              extra={
                <button
                  onClick={() =>
                    downloadExcel({
                      title: pageTitle,
                      subtitle: `${rangeLabel(range, custom)} · ${stationList.find((x: any) => x.id === selectedStationId)?.name ?? "All stations"}`,
                      filename: `payments-${new Date().toISOString().slice(0, 10)}`,
                      columns: [
                        { header: "Date", key: "date" },
                        { header: "Parcel", key: "parcel" },
                        { header: "Reference", key: "reference" },
                        { header: "Method", key: "method" },
                        { header: "Status", key: "status" },
                        { header: "Amount", key: "amount" },
                      ],
                      data: rawPayments.map((p: any) => ({
                        date: p.createdAt ? new Date(p.createdAt).toLocaleString("en-GB") : "",
                        parcel: p.parcel?.trackingNumber ?? "",
                        reference: p.transactionReference ?? "",
                        method: p.paymentMethod ?? "",
                        status: p.status,
                        amount: formatAmount(p.amount || 0),
                      })),
                    })
                  }
                  disabled={!rawPayments.length}
                  style={{ marginLeft: "auto" }}
                  className="flex h-11 items-center gap-2 rounded-full bg-orange-500 px-5 text-[13px] font-semibold text-white transition hover:bg-orange-600 disabled:opacity-40"
                >
                  <FileSpreadsheet size={15} /> Export to Excel
                </button>
              }
            />
          }
        />
      </div>

      {tab.toLowerCase() === "overview" && (() => {
        const failed = rawPayments.filter((p: any) => p.status === "FAILED").length;
        const byMethod = new Map<string, number>();
        totalPaid.forEach((p: any) => {
          const m = String(p.paymentMethod || p.provider || "Other").replace(/_/g, " ");
          byMethod.set(m, (byMethod.get(m) ?? 0) + (p.amount || 0));
        });
        const recent = [...rawPayments]
          .sort((x: any, y: any) => new Date(y.createdAt).getTime() - new Date(x.createdAt).getTime())
          .slice(0, 10);
        const tone = (st: string) =>
          st === "SUCCESS" || st === "PAID"
            ? "bg-emerald-50 text-emerald-700"
            : st === "PENDING"
              ? "bg-amber-50 text-amber-700"
              : "bg-rose-50 text-rose-700";
        return (
          <div className="flex flex-col gap-5">
            <ReportSummary
              label="Money received"
              value={isLoading ? "…" : formatAmount(totalPaidAmount)}
              note={totalPendingAmount ? `${formatAmount(totalPendingAmount)} still pending` : "Nothing pending"}
              loading={isLoading}
              chips={[
                { label: "Paid", value: totalPaid.length.toLocaleString("en-US"), icon: PaidIcon },
                { label: "Pending", value: totalPending.length.toLocaleString("en-US"), icon: Clock3 },
                { label: "Success rate", value: rawPayments.length ? successRate : "—", icon: Percent },
                { label: "Failed", value: failed.toLocaleString("en-US"), icon: FailedIcon },
              ]}
            />
            <section className="overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white">
              <div className="flex flex-wrap items-center justify-between gap-3 border-b border-slate-100 px-5 py-4">
                <div>
                  <h2 className="text-[17px] font-semibold text-[#1C1C1E]">Recent payments</h2>
                  <p className="text-[13px] text-slate-500">Latest {recent.length} · click a row to see its details</p>
                </div>
                <a
                  href="?tab=all"
                  className="flex h-10 items-center rounded-full bg-[#5C0B19] px-4 text-[13px] font-semibold text-white transition hover:bg-[#4F0A0C]"
                >
                  All payments
                </a>
              </div>
              {recent.length === 0 ? (
                <p className="px-6 py-12 text-center text-[14px] text-slate-400">No payments in this period.</p>
              ) : (
                <>
                <ul className="divide-y divide-slate-100 md:hidden">
                  {recent.map((p: any) => {
                    const st = paymentStatus(p.status);
                    return (
                      <li key={p.id}>
                        <button type="button" onClick={() => setSelectedPayment(p)} className="flex w-full items-center gap-3 px-4 py-3 text-left active:bg-orange-50/40">
                          <div className="min-w-0 flex-1">
                            <p className="truncate text-[14px] font-semibold tracking-wide text-[#1C1C1E]">{p.parcel?.trackingNumber ?? "Payment"}</p>
                            <p className="truncate text-[12px] text-slate-500">
                              {[p.parcel?.origin?.name, p.createdAt ? new Date(p.createdAt).toLocaleString("en-GB", { day: "numeric", month: "short", hour: "2-digit", minute: "2-digit" }) : null]
                                .filter(Boolean)
                                .join(" · ")}
                            </p>
                          </div>
                          <div className="shrink-0 text-right">
                            <p className="text-[14px] font-semibold tabular-nums text-[#1C1C1E]">{formatAmount(p.amount || 0)}</p>
                            <span className={"mt-0.5 inline-block rounded-full px-2 py-0.5 text-[11px] font-semibold " + st.tone}>{st.label}</span>
                          </div>
                        </button>
                      </li>
                    );
                  })}
                </ul>
                <div className="hidden overflow-x-auto md:block">
                  <table className="w-full min-w-[720px] text-left">
                    <thead>
                      <tr className="bg-[#F7F5F4] text-[12px] font-semibold text-slate-500">
                        <th className="px-5 py-3">Date</th>
                        <th className="px-5 py-3">Parcel</th>
                        <th className="px-5 py-3">Station</th>
                        <th className="px-5 py-3">Method</th>
                        <th className="px-5 py-3">Status</th>
                        <th className="px-5 py-3 text-right">Amount</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-slate-100">
                      {recent.map((p: any) => {
                        const st = paymentStatus(p.status);
                        return (
                          <tr
                            key={p.id}
                            onClick={() => setSelectedPayment(p)}
                            className="cursor-pointer text-[14px] transition hover:bg-orange-50/40"
                          >
                            <td className="whitespace-nowrap px-5 py-3.5 text-slate-500">
                              {p.createdAt
                                ? new Date(p.createdAt).toLocaleString("en-GB", { day: "numeric", month: "short", year: "numeric", hour: "2-digit", minute: "2-digit" })
                                : "—"}
                            </td>
                            <td className="px-5 py-3.5 font-semibold tracking-wide text-[#1C1C1E]">{p.parcel?.trackingNumber ?? "—"}</td>
                            <td className="px-5 py-3.5 text-slate-600">{p.parcel?.origin?.name ?? "—"}</td>
                            <td className="px-5 py-3.5 capitalize text-slate-600">{p.paymentMethod ? String(p.paymentMethod).replace(/_/g, " ").toLowerCase() : "—"}</td>
                            <td className="px-5 py-3.5">
                              <span className={"rounded-full px-2.5 py-1 text-[12px] font-semibold " + st.tone}>{st.label}</span>
                            </td>
                            <td className="whitespace-nowrap px-5 py-3.5 text-right font-semibold tabular-nums text-[#1C1C1E]">
                              {formatAmount(p.amount || 0)}
                            </td>
                          </tr>
                        );
                      })}
                    </tbody>
                  </table>
                </div>
                </>
              )}
            </section>

            <BreakdownCard
              title="By payment method"
              subtitle="Money received per method"
              items={[...byMethod.entries()].map(([label, value]) => ({ label, value }))}
              format={(n) => formatAmount(n)}
              empty="No successful payments yet."
            />
          </div>
        );
      })()}

      {tab.toLowerCase() === "all" && (
        <div className="bg-white rounded-[20px] border border-[#E2E2E2]  overflow-hidden p-4">
          <DataTable
            title="Payments"
            data={rawPayments}
            columns={columns}
            isLoading={isLoading}
            hideInternalSearch={true}
            onRowClick={(p: any) => setSelectedPayment(p)}
          />
        </div>
      )}
      <PaymentDetailSheet payment={selectedPayment} onClose={() => setSelectedPayment(null)} />
    </div>
  );
}
