"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import {
  Package,
  User,
  CreditCard,
  CheckCircle2,
  XCircle,
  Clock,
  Loader2,
  ArrowLeft,
  Receipt,
  TrainFront,
  Info,
  Zap,
  Phone,
  MapPin,
  Route,
} from "lucide-react";
import { cn } from "@/lib/utils";
import {
  PaymentGatewayService,
  PaymentChannel,
} from "@/services/paymentGatewayService";

// ── Status config ──────────────────────────────────────────────────────────────

const STATUS_META: Record<
  string,
  { label: string; color: string; bg: string; border: string; dot: string }
> = {
  PENDING: {
    label: "Pending Review",
    color: "text-amber-700",
    bg: "bg-amber-50",
    border: "border-amber-200/60",
    dot: "bg-amber-400",
  },
  APPROVED: {
    label: "Approved",
    color: "text-blue-700",
    bg: "bg-blue-50",
    border: "border-blue-200/60",
    dot: "bg-blue-500",
  },
  PAYMENT_PENDING: {
    label: "Awaiting Payment",
    color: "text-violet-700",
    bg: "bg-violet-50",
    border: "border-violet-200/60",
    dot: "bg-violet-500",
  },
  PAID: {
    label: "Paid",
    color: "text-emerald-700",
    bg: "bg-emerald-50",
    border: "border-emerald-200/60",
    dot: "bg-emerald-500",
  },
  COMPLETED: {
    label: "Completed",
    color: "text-slate-600",
    bg: "bg-slate-50",
    border: "border-slate-200",
    dot: "bg-slate-400",
  },
  REJECTED: {
    label: "Rejected",
    color: "text-rose-700",
    bg: "bg-rose-50",
    border: "border-rose-200/60",
    dot: "bg-rose-500",
  },
};


// ── Types ──────────────────────────────────────────────────────────────────────

interface Payment {
  id: string;
  status: string;
  amount: number;
  paymentMethod?: string | null;
  transactionReference?: string | null;
  paidAt?: string | null;
  createdAt: string;
}

interface TrackingEvent {
  id: string;
  status: string;
  location?: string | null;
  description?: string | null;
  timestamp: string | Date;
}

interface ParcelDetail {
  id: string;
  trackingNumber?: string;
  additionalServices?: unknown;
  origin?: { name: string } | null;
  destination?: { name: string } | null;
  tracking?: TrackingEvent[];
  fromAddress: string;
  toAddress: string;
  serviceType: string;
  parcelType: string;
  parcelSize: string;
  peopleNeeded: number;
  weight: number;
  length?: number | null;
  width?: number | null;
  height?: number | null;
  urgency: string;
  isFragile: boolean;
  specialInstructions?: string | null;
  receiverName: string;
  receiverPhone?: string | null;
  receiverPays: boolean;
  pickupType: string;
  status: string;
  rejectionReason?: string | null;
  amount?: number | null;
  createdAt: string;
  updatedAt: string;
  user?: { name: string; email: string; phone?: string | null } | null;
  approvedBy?: { name: string; email: string } | null;
  payment?: Payment | null;
}

interface ParcelDetailPanelProps {
  parcel: ParcelDetail;
  defaultTab: string;
  userRole?: string;
}

// ── Sub-components ─────────────────────────────────────────────────────────────

/** Sender/payment details the station app stores alongside the parcel. */
function readMeta(raw: unknown): Record<string, any> {
  if (!raw) return {};
  if (typeof raw === "string") {
    try {
      return JSON.parse(raw);
    } catch {
      return {};
    }
  }
  return typeof raw === "object" && !Array.isArray(raw) ? (raw as Record<string, any>) : {};
}

const tsh = (n: number) => `TSh ${Math.round(n).toLocaleString("en-US")}`;
const fmtDate = (d: string | Date) =>
  new Date(d).toLocaleString("en-GB", { day: "numeric", month: "short", year: "numeric", hour: "2-digit", minute: "2-digit" });
const city = (s?: string | null) => (s || "—").split(",")[0].trim();

function Field({ label, value }: { label: string; value?: string | number | null }) {
  return (
    <div className="flex flex-col gap-0.5 rounded-2xl bg-[#F7F5F4] px-4 py-3">
      <span className="text-[12px] text-slate-500">{label}</span>
      <span className="text-[14px] font-semibold text-[#1C1C1E] leading-snug">
        {value === null || value === undefined || value === "" ? <span className="font-normal text-slate-400">—</span> : value}
      </span>
    </div>
  );
}

function Section({
  title,
  icon: Icon,
  children,
  action,
}: {
  title: string;
  icon: React.ElementType;
  children: React.ReactNode;
  action?: React.ReactNode;
}) {
  return (
    <div className="bg-white rounded-[24px] border border-[#E2E2E2] p-5">
      <div className="mb-4 flex items-center justify-between gap-2">
        <div className="flex items-center gap-2.5">
          <span className="flex h-8 w-8 items-center justify-center rounded-full bg-orange-50">
            <Icon size={15} className="text-orange-500" />
          </span>
          <h3 className="text-[16px] font-semibold text-[#1C1C1E]">{title}</h3>
        </div>
        {action}
      </div>
      {children}
    </div>
  );
}

function StatusPill({ status, onDark = false }: { status: string; onDark?: boolean }) {
  const meta = STATUS_META[status];
  return (
    <span
      className={cn(
        "inline-flex items-center gap-1.5 rounded-full px-3 py-1 text-[12px] font-semibold whitespace-nowrap",
        onDark ? "bg-white/15 text-white" : cn("border", meta?.bg, meta?.color, meta?.border),
      )}
    >
      <span className={cn("h-1.5 w-1.5 rounded-full", onDark ? "bg-orange-400" : meta?.dot ?? "bg-slate-400")} />
      {meta?.label ?? status}
    </span>
  );
}

function ContactRow({ label, name, phone }: { label: string; name?: string | null; phone?: string | null }) {
  return (
    <div className="flex items-center gap-3">
      <div className="flex h-11 w-11 shrink-0 items-center justify-center rounded-full bg-[#5C0B19] text-[15px] font-semibold text-white">
        {(name || "?").charAt(0).toUpperCase()}
      </div>
      <div className="min-w-0 flex-1">
        <p className="text-[12px] text-slate-500">{label}</p>
        <p className="truncate text-[15px] font-semibold text-[#1C1C1E]">{name || "—"}</p>
      </div>
      {phone && (
        <a
          href={`tel:${phone}`}
          className="flex h-9 shrink-0 items-center gap-1.5 rounded-full bg-orange-50 px-3 text-[13px] font-semibold text-orange-600 transition hover:bg-orange-500 hover:text-white"
        >
          <Phone size={14} /> {phone}
        </a>
      )}
    </div>
  );
}

// ── Hero: maroon bridge card, like the app's parcel header ─────────────────────

function ParcelHero({ parcel }: { parcel: ParcelDetail }) {
  const meta = readMeta(parcel.additionalServices);
  const express = parcel.urgency === "Express";
  const paid = meta.paymentStatus === "PAID" || ["PAID", "COMPLETED"].includes(parcel.status);
  return (
    <section className="bridge-card p-6 md:p-8">
      <div className="flex flex-wrap items-start justify-between gap-3">
        <div className="flex items-center gap-4">
          <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-white/10">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src="/brand/staff_parcel.png" alt="" className="h-10 w-10 object-contain" />
          </div>
          <div>
            <p className="text-[13px] text-white/65">Tracking number</p>
            <p className="text-[28px] font-semibold leading-tight tracking-wide">
              {parcel.trackingNumber || `#${parcel.id.slice(-8).toUpperCase()}`}
            </p>
          </div>
        </div>
        <div className="flex items-center gap-2">
          {express && <span className="accent-pill">Express</span>}
          <StatusPill status={parcel.status} onDark />
        </div>
      </div>

      {/* Route */}
      <div className="mt-7 flex items-center gap-4 rounded-2xl border border-white/15 bg-white/10 px-5 py-4 backdrop-blur-md">
        <div className="min-w-0 flex-1">
          <p className="text-[12px] text-white/60">From</p>
          <p className="truncate text-[18px] font-semibold">{city(parcel.origin?.name || parcel.fromAddress)}</p>
        </div>
        <div className="flex flex-[1.2] items-center gap-2 text-white/70">
          <span className="h-2 w-2 rounded-full border-2 border-orange-400" />
          <span className="h-px flex-1 border-t border-dashed border-white/40" />
          <TrainFront size={18} className="text-orange-400" />
          <span className="h-px flex-1 border-t border-dashed border-white/40" />
          <MapPin size={14} className="text-orange-400" />
        </div>
        <div className="min-w-0 flex-1 text-right">
          <p className="text-[12px] text-white/60">To</p>
          <p className="truncate text-[18px] font-semibold">{city(parcel.destination?.name || parcel.toAddress)}</p>
        </div>
      </div>

      <div className="mt-4 grid grid-cols-2 gap-3 sm:grid-cols-3">
        <div className="rounded-2xl border border-white/15 bg-white/10 px-4 py-3">
          <p className="text-[12px] text-white/60">Amount</p>
          <p className="text-[20px] font-semibold tabular-nums">{parcel.amount != null ? tsh(parcel.amount) : "Not priced"}</p>
        </div>
        <div className="rounded-2xl border border-white/15 bg-white/10 px-4 py-3">
          <p className="text-[12px] text-white/60">Payment</p>
          <p className="text-[20px] font-semibold">{paid ? "Paid" : parcel.receiverPays ? "Receiver pays" : "Not paid"}</p>
        </div>
        <div className="col-span-2 rounded-2xl border border-white/15 bg-white/10 px-4 py-3 sm:col-span-1">
          <p className="text-[12px] text-white/60">Received</p>
          <p className="text-[16px] font-semibold">{fmtDate(parcel.createdAt)}</p>
        </div>
      </div>
    </section>
  );
}

// ── Journey timeline ───────────────────────────────────────────────────────────

function Journey({ parcel }: { parcel: ParcelDetail }) {
  const events = parcel.tracking ?? [];
  return (
    <Section title="Journey" icon={Route}>
      {events.length === 0 ? (
        <p className="text-[14px] text-slate-500">No updates yet. Each scan along the way will show here.</p>
      ) : (
        <ol className="relative">
          {events.map((e, i) => (
            <li key={e.id} className="relative flex gap-4 pb-5 last:pb-0">
              {i < events.length - 1 && <span className="absolute left-[11px] top-6 bottom-0 w-px bg-slate-200" />}
              <span
                className={cn(
                  "relative mt-0.5 flex h-6 w-6 shrink-0 items-center justify-center rounded-full",
                  i === 0 ? "bg-orange-500" : "bg-slate-200",
                )}
              >
                <span className={cn("h-2 w-2 rounded-full", i === 0 ? "bg-white" : "bg-slate-400")} />
              </span>
              <div className="min-w-0 flex-1">
                <div className="flex flex-wrap items-center justify-between gap-x-3">
                  <p className={cn("text-[14px] font-semibold", i === 0 ? "text-[#1C1C1E]" : "text-slate-600")}>
                    {STATUS_META[e.status]?.label ?? e.status}
                  </p>
                  <p className="text-[12px] text-slate-400">{fmtDate(e.timestamp)}</p>
                </div>
                {(e.description || e.location) && (
                  <p className="mt-0.5 text-[13px] text-slate-500">
                    {[e.description, e.location].filter(Boolean).join(" · ")}
                  </p>
                )}
              </div>
            </li>
          ))}
        </ol>
      )}
    </Section>
  );
}

// ── Details Tab ────────────────────────────────────────────────────────────────

function DetailsTab({
  parcel,
  onActionSuccess,
  userRole,
}: {
  parcel: ParcelDetail;
  onActionSuccess: () => void;
  userRole?: string;
}) {
  const meta = readMeta(parcel.additionalServices);
  const services: string[] = Array.isArray(meta.services) ? meta.services.map(String) : [];
  const SERVICE_LABELS: Record<string, string> = {
    insurance: "Insurance",
    packaging: "Secure packaging",
    fragile: "Special handling",
  };

  return (
    <div className="grid gap-5 lg:grid-cols-[minmax(0,1fr)_360px]">
      <div className="flex min-w-0 flex-col gap-5">
        {parcel.rejectionReason && (
          <div className="flex items-start gap-3 rounded-[20px] border border-rose-200 bg-rose-50 px-5 py-4">
            <XCircle size={18} className="mt-0.5 shrink-0 text-rose-500" />
            <div>
              <p className="text-[14px] font-semibold text-rose-700">Rejected</p>
              <p className="text-[13px] text-rose-600">{parcel.rejectionReason}</p>
            </div>
          </div>
        )}

        <Section title="Parcel" icon={Package}>
          <div className="grid grid-cols-2 gap-3 md:grid-cols-3">
            <Field label="Item" value={meta.itemName} />
            <Field label="Type" value={parcel.parcelType} />
            <Field label="Size" value={parcel.parcelSize} />
            <Field label="Weight" value={parcel.weight ? `${parcel.weight} kg` : null} />
            <Field label="Priority" value={parcel.urgency} />
            <Field label="Condition" value={meta.condition} />
            <Field
              label="Declared value"
              value={meta.declaredValue ? tsh(Number(meta.declaredValue)) : null}
            />
            <Field
              label="Dimensions"
              value={parcel.length ? `${parcel.length} × ${parcel.width} × ${parcel.height} cm` : null}
            />
            <Field label="Fragile" value={parcel.isFragile ? "Yes" : "No"} />
          </div>
          {services.length > 0 && (
            <div className="mt-4 flex flex-wrap items-center gap-2">
              <span className="text-[13px] text-slate-500">Extra services:</span>
              {services.map((sv) => (
                <span key={sv} className="rounded-full bg-orange-50 px-3 py-1 text-[12px] font-semibold text-orange-700">
                  {SERVICE_LABELS[sv] ?? sv}
                </span>
              ))}
            </div>
          )}
          {parcel.specialInstructions && (
            <div className="mt-4 rounded-2xl bg-[#F7F5F4] px-4 py-3">
              <p className="text-[12px] text-slate-500">Instructions</p>
              <p className="text-[14px] text-slate-700">{parcel.specialInstructions}</p>
            </div>
          )}
        </Section>

        <Journey parcel={parcel} />
      </div>

      <div className="flex flex-col gap-5">
        <Section title="People" icon={User}>
          <div className="flex flex-col gap-4">
            <ContactRow
              label="Sender"
              name={meta.senderName || parcel.user?.name}
              phone={meta.senderPhone || parcel.user?.phone}
            />
            <div className="h-px bg-slate-100" />
            <ContactRow label="Receiver" name={parcel.receiverName} phone={parcel.receiverPhone} />
            {parcel.approvedBy && (
              <>
                <div className="h-px bg-slate-100" />
                <ContactRow label="Approved by" name={parcel.approvedBy.name} />
              </>
            )}
          </div>
        </Section>

        {/* Payment (for agents when status is PAYMENT_PENDING) */}
        {parcel.status === "PAYMENT_PENDING" && userRole === "AGENT" && (
          <ParcelPaymentSection parcel={parcel} onPaymentInitiated={onActionSuccess} />
        )}

        {/* Admin actions */}
        {(parcel.status === "PENDING" || parcel.status === "PAID") && userRole !== "AGENT" && (
          <ActionPanel parcel={parcel} onSuccess={onActionSuccess} />
        )}
      </div>
    </div>
  );
}

// ── Receipt Tab ────────────────────────────────────────────────────────────────

function ReceiptTab({ parcel }: { parcel: ParcelDetail }) {
  const pay = parcel.payment;
  const [downloading, setDownloading] = useState(false);

  const handleDownloadPDF = async () => {
    setDownloading(true);
    try {
      const res = await fetch(`/api/parcel/${parcel.id}/receipt/pdf`);
      if (!res.ok) throw new Error("PDF generation failed");
      const blob = await res.blob();
      const url = URL.createObjectURL(blob);
      const a = document.createElement("a");
      a.href = url;
      a.download = `mizigo-receipt-${parcel.id.slice(-6).toUpperCase()}.pdf`;
      document.body.appendChild(a);
      a.click();
      a.remove();
      URL.revokeObjectURL(url);
    } catch (e) {
      console.error("PDF download failed:", e);
    } finally {
      setDownloading(false);
    }
  };

  if (!pay || pay.status !== "SUCCESS") {
    return (
      <div className="flex flex-col items-center justify-center py-24 text-slate-300 gap-3">
        <Receipt size={36} strokeWidth={1.5} />
        <p className="text-sm font-semibold text-slate-400">
          No receipt available yet
        </p>
        <p className="text-[12px] text-slate-300">
          Receipt will appear once payment is confirmed
        </p>
      </div>
    );
  }

  const paidAt = pay.paidAt
    ? new Date(pay.paidAt).toLocaleString("en-TZ", {
        dateStyle: "long",
        timeStyle: "short",
      })
    : "—";

  const rows = [
    { label: "Receipt No.", value: `RCP-${pay.id.slice(-8).toUpperCase()}` },
    { label: "Transaction Ref.", value: pay.transactionReference ?? "—" },
    { label: "Payment Method", value: pay.paymentMethod?.toUpperCase() ?? "—" },
    { label: "Paid At", value: paidAt },
    { label: "Parcel ID", value: `#${parcel.id.slice(-8).toUpperCase()}` },
    { label: "Route", value: `${parcel.fromAddress} → ${parcel.toAddress}` },
    { label: "Customer", value: parcel.user?.name ?? "—" },
  ];

  return (
    <div className="flex justify-center py-2">
      <div className="w-full max-w-md">
        {/* Receipt card */}
        <div className="bg-white border border-[#E2E2E2] rounded-[20px] shadow-[0_4px_24px_rgba(0,0,0,0.08)] overflow-hidden">
          {/* Header */}
          <div className="bg-slate-900 px-6 py-7 text-white">
            <div className="flex items-start justify-between">
              <div>
                <p className="text-[9px] font-semibold uppercase tracking-[0.05em] text-slate-500">
                  Official Receipt
                </p>
                <p className="text-[18px] font-semibold tracking-tight mt-1">
                  Mizigo Logistics
                </p>
              </div>
              <div className="w-8 h-8 bg-emerald-50 rounded-xl flex items-center justify-center">
                <CheckCircle2 size={16} className="text-white" />
              </div>
            </div>
            <div className="mt-5">
              <p className="text-[10px] text-slate-500 font-semibold uppercase tracking-[0.05em] mb-1">
                Amount Paid
              </p>
              <p className="text-[28px] font-semibold tracking-tight tabular-nums">
                TZS {pay.amount.toLocaleString()}
              </p>
            </div>
            <div className="mt-3 inline-flex items-center gap-1.5 bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 px-3 py-1 rounded-full">
              <span className="w-1.5 h-1.5 rounded-full bg-emerald-400" />
              <span className="text-[11px] font-semibold uppercase tracking-wider">
                Payment Confirmed
              </span>
            </div>
          </div>

          {/* Rows */}
          <div className="px-6 divide-y divide-slate-50">
            {rows.map(({ label, value }) => (
              <div
                key={label}
                className="flex justify-between items-center py-3"
              >
                <span className="text-[11px] text-slate-400 font-semibold">
                  {label}
                </span>
                <span className="text-[12px] text-slate-800 font-bold text-right max-w-[200px] truncate">
                  {value}
                </span>
              </div>
            ))}
          </div>

          {/* Footer */}
          <div className="px-6 py-4 bg-slate-50 border-t border-slate-100 text-center">
            <p className="text-[11px] text-slate-400 font-medium">
              Thank you for using Mizigo Logistics
            </p>
          </div>
        </div>

        {/* Actions */}
        <div className="flex justify-center gap-6 mt-4">
          <button
            onClick={() => window.print()}
            className="flex items-center gap-1.5 text-[12px] text-slate-400 hover:text-slate-700 font-semibold transition-colors"
          >
            <Receipt size={13} /> Print
          </button>
          <button
            onClick={handleDownloadPDF}
            disabled={downloading}
            className="flex items-center gap-1.5 text-[12px] text-indigo-500 hover:text-indigo-700 font-semibold transition-colors disabled:opacity-50"
          >
            {downloading ? (
              <Loader2 size={13} className="animate-spin" />
            ) : (
              <Receipt size={13} />
            )}
            {downloading ? "Generating…" : "Download PDF"}
          </button>
        </div>
      </div>
    </div>
  );
}

// ── Action Panel ───────────────────────────────────────────────────────────────

function ActionPanel({
  parcel,
  onSuccess,
}: {
  parcel: ParcelDetail;
  onSuccess: () => void;
}) {
  const [amount, setAmount] = useState(parcel.amount?.toString() ?? "");
  const [reason, setReason] = useState("");
  const [loading, setLoading] = useState<
    "approve" | "reject" | "complete" | null
  >(null);
  const [error, setError] = useState("");

  const call = async (
    body: object,
    action: "approve" | "reject" | "complete",
  ) => {
    setLoading(action);
    setError("");
    try {
      const res = await fetch(`/api/parcel/${parcel.id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error ?? "Request failed");
      onSuccess();
    } catch (e: any) {
      setError(e.message);
    } finally {
      setLoading(null);
    }
  };

  return (
    <div className="bg-white rounded-[20px] border border-[#E2E2E2] shadow-[0_1px_4px_rgba(0,0,0,0.04)] overflow-hidden">
      <div className="flex items-center gap-2 px-5 py-3.5 border-b border-slate-50 bg-slate-50/50">
        <CheckCircle2 size={12} className="text-slate-400" strokeWidth={2.5} />
        <span className="text-[10.5px] font-semibold uppercase tracking-[0.1em] text-slate-500">
          Admin Actions
        </span>
      </div>
      <div className="px-5 py-4">
        {error && (
          <div className="mb-4 px-3 py-2 bg-rose-50 rounded-xl text-rose-600 text-[12px] font-semibold border border-rose-100">
            {error}
          </div>
        )}

        {parcel.status === "PENDING" && (
          <div className="flex flex-col gap-4">
            <div>
              <label className="block text-[10px] font-semibold text-slate-400 uppercase tracking-wider mb-1.5">
                Payment Amount (TZS)
              </label>
              <div className="relative">
                <span className="absolute left-3.5 top-1/2 -translate-y-1/2 text-[11px] font-semibold text-slate-400">
                  TZS
                </span>
                <input
                  type="number"
                  value={amount}
                  onChange={(e) => setAmount(e.target.value)}
                  placeholder="0"
                  className="w-full pl-14 pr-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-[13px] font-bold text-slate-900 focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:bg-white transition-colors"
                />
              </div>
            </div>
            <div>
              <label className="block text-[10px] font-semibold text-slate-400 uppercase tracking-wider mb-1.5">
                Rejection Reason (if rejecting)
              </label>
              <textarea
                value={reason}
                onChange={(e) => setReason(e.target.value)}
                rows={2}
                placeholder="Optional — required if rejecting"
                className="w-full px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-[13px] text-slate-900 focus:outline-none focus:ring-2 focus:ring-rose-400 focus:bg-white resize-none transition-colors"
              />
            </div>
            <div className="grid grid-cols-2 gap-2.5">
              <button
                disabled={!!loading}
                onClick={() =>
                  call(
                    { status: "APPROVED", amount: Number(amount) },
                    "approve",
                  )
                }
                className="py-2.5 bg-emerald-600 hover:bg-emerald-700 disabled:opacity-60 text-white rounded-xl text-[12px] font-semibold flex items-center justify-center gap-1.5 transition-colors shadow-md shadow-emerald-100"
              >
                {loading === "approve" ? (
                  <Loader2 size={13} className="animate-spin" />
                ) : (
                  <CheckCircle2 size={13} />
                )}
                Approve
              </button>
              <button
                disabled={!!loading}
                onClick={() => {
                  if (!reason.trim()) {
                    setError("Rejection reason required");
                    return;
                  }
                  call({ status: "REJECTED", reason }, "reject");
                }}
                className="py-2.5 bg-rose-600 hover:bg-rose-700 disabled:opacity-60 text-white rounded-xl text-[12px] font-semibold flex items-center justify-center gap-1.5 transition-colors"
              >
                {loading === "reject" ? (
                  <Loader2 size={13} className="animate-spin" />
                ) : (
                  <XCircle size={13} />
                )}
                Reject
              </button>
            </div>
          </div>
        )}

        {parcel.status === "PAID" && (
          <button
            disabled={!!loading}
            onClick={() => call({ status: "COMPLETED" }, "complete")}
            className="w-full py-3 bg-indigo-600 hover:bg-indigo-700 disabled:opacity-60 text-white rounded-xl text-[13px] font-semibold flex items-center justify-center gap-2 transition-colors shadow-md shadow-indigo-100"
          >
            {loading === "complete" ? (
              <Loader2 size={14} className="animate-spin" />
            ) : (
              <TrainFront size={14} />
            )}
            Mark as Delivered
          </button>
        )}
      </div>
    </div>
  );
}

// ── Parcel Payment Section (For Agents) ──────────────────────────────────────────

function ParcelPaymentSection({
  parcel,
  onPaymentInitiated,
}: {
  parcel: ParcelDetail;
  onPaymentInitiated: () => void;
}) {
  const [provider, setProvider] = useState("");
  const [phone, setPhone] = useState(parcel.user?.phone ?? "");
  const [loading, setLoading] = useState<string | null>(null);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [channels, setChannels] = useState<PaymentChannel[]>([]);

  useEffect(() => {
    const loadChannels = async () => {
      const data = await PaymentGatewayService.getChannels();
      setChannels(data);
    };
    loadChannels();
  }, []);

  const handlePay = async () => {
    if (!provider) {
      setError("Please select a payment provider");
      return;
    }
    if (!phone) {
      setError("Phone number is required");
      return;
    }

    setLoading("pay");
    setError("");
    setSuccess("");
    try {
      const res = await fetch("/api/payment/initiate", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ parcelId: parcel.id, provider, phone }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error ?? "Payment initiation failed");

      setSuccess(data.message);
      setTimeout(() => onPaymentInitiated(), 3000);
    } catch (e: any) {
      setError(e.message);
    } finally {
      setLoading(null);
    }
  };

  const handleSimulate = async () => {
    setLoading("simulate");
    setError("");
    setSuccess("");
    try {
      const res = await fetch("/api/payment/simulate", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ parcelId: parcel.id }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error ?? "Simulation failed");

      setSuccess(data.message);
      setTimeout(() => onPaymentInitiated(), 2000);
    } catch (e: any) {
      setError(e.message);
    } finally {
      setLoading(null);
    }
  };

  return (
    <div className="bg-white rounded-xl border border-indigo-100 shadow-[0_4px_12px_rgba(79,70,229,0.08)] overflow-hidden">
      <div className="flex items-center gap-2 px-5 py-3.5 border-b border-indigo-50 bg-indigo-50/30">
        <CreditCard size={14} className="text-indigo-500" strokeWidth={2.5} />
        <span className="text-[11px] font-semibold uppercase tracking-[0.1em] text-indigo-600">
          Complete Payment
        </span>
      </div>
      <div className="px-5 py-5 flex flex-col gap-5">
        {error && (
          <div className="px-3 py-2 bg-rose-50 rounded-xl text-rose-600 text-[11px] font-semibold border border-rose-100 flex items-center gap-2">
            <XCircle size={12} /> {error}
          </div>
        )}
        {success && (
          <div className="px-3 py-2 bg-emerald-50 rounded-xl text-emerald-600 text-[11px] font-semibold border border-emerald-100 flex items-center gap-2">
            <CheckCircle2 size={12} /> {success}
          </div>
        )}

        {channels.length > 0 && (
          <div>
            <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-wider mb-2.5">
              Select Provider
            </p>
            <div className="grid grid-cols-2 gap-2">
              {channels.map((ch) => (
                <button
                  key={ch.id}
                  onClick={() => {
                    setProvider(ch.uts_name);
                    setError("");
                  }}
                  className={cn(
                    "flex items-center gap-2.5 px-3 py-2.5 rounded-xl border text-[12px] font-bold transition-all",
                    provider === ch.uts_name
                      ? "bg-indigo-600 border-indigo-600 text-white shadow-md shadow-indigo-100"
                      : "bg-white border-slate-100 text-slate-600 hover:border-slate-300",
                  )}
                >
                  <div className="w-5 h-5 rounded-full bg-slate-100 overflow-hidden shrink-0 border border-slate-200">
                    <img
                      src={ch.logoUrl}
                      alt={ch.mobile_channel}
                      className="w-full h-full object-cover"
                    />
                  </div>
                  {ch.mobile_channel === "YAS"
                    ? "Mixx by Yas"
                    : ch.mobile_channel}
                </button>
              ))}
            </div>
          </div>
        )}

        <div>
          <label className="block text-[10px] font-semibold text-slate-400 uppercase tracking-wider mb-2">
            Payment Phone Number
          </label>
          <input
            type="tel"
            value={phone}
            onChange={(e) => setPhone(e.target.value)}
            placeholder="07XXXXXXXX"
            className="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-[14px] font-bold text-slate-900 focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:bg-white transition-colors"
          />
          <p className="text-[10px] text-slate-400 mt-2 flex items-center gap-1">
            <Info size={10} /> Enter number to receive M-Pesa/Airtel Money
            prompt
          </p>
        </div>

        <div className="flex flex-col gap-2">
          <button
            disabled={!!loading || !!success}
            onClick={handlePay}
            className="w-full py-3.5 bg-indigo-600 hover:bg-indigo-700 disabled:opacity-60 text-white rounded-xl text-[14px] font-semibold flex items-center justify-center gap-2 transition-all  shadow-indigo-100 active:scale-[0.98]"
          >
            {loading === "pay" ? (
              <Loader2 size={16} className="animate-spin" />
            ) : (
              <CreditCard size={16} />
            )}
            {loading === "pay"
              ? "Initiating..."
              : `Pay TZS ${parcel.amount?.toLocaleString()}`}
          </button>

          <button
            disabled={!!loading || !!success}
            onClick={handleSimulate}
            className="w-full py-2.5 bg-slate-100 hover:bg-slate-200 disabled:opacity-60 text-slate-600 rounded-xl text-[12px] font-bold flex items-center justify-center gap-2 transition-colors border border-slate-200"
          >
            {loading === "simulate" ? (
              <Loader2 size={14} className="animate-spin" />
            ) : (
              <Zap size={14} className="text-amber-500" />
            )}
            Simulate Success (Demo)
          </button>
        </div>
      </div>
    </div>
  );
}

// ── Main ───────────────────────────────────────────────────────────────────────

export function ParcelDetailPanel({ parcel, defaultTab, userRole }: ParcelDetailPanelProps) {
  const router = useRouter();
  const [tab, setTab] = useState<"details" | "receipt">(defaultTab === "receipt" ? "receipt" : "details");
  const hasPaid = ["PAID", "COMPLETED"].includes(parcel.status);

  return (
    <div className="mx-auto flex w-full max-w-6xl flex-col gap-6 pb-8">
      {/* Header */}
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div className="flex items-center gap-3">
          <button
            onClick={() => router.back()}
            aria-label="Back"
            className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full border border-[#E2E2E2] bg-white text-slate-600 transition hover:border-orange-200 hover:bg-orange-50 hover:text-orange-600"
          >
            <ArrowLeft size={18} />
          </button>
          <div>
            <h1 className="text-[26px] font-semibold leading-tight text-[#1C1C1E]">Parcel details</h1>
            <p className="text-[14px] text-slate-500">Last updated {fmtDate(parcel.updatedAt)}</p>
          </div>
        </div>

        <div className="flex items-center gap-1 rounded-full border border-[#E2E2E2] bg-white p-1">
          {(["details", "receipt"] as const).map((t) => (
            <button
              key={t}
              onClick={() => setTab(t)}
              disabled={t === "receipt" && !hasPaid}
              title={t === "receipt" && !hasPaid ? "Available once the parcel is paid" : undefined}
              className={cn(
                "rounded-full px-5 py-2 text-[13px] font-semibold transition",
                tab === t
                  ? "bg-orange-500 text-white"
                  : "text-slate-500 hover:text-slate-800 disabled:cursor-not-allowed disabled:opacity-40",
              )}
            >
              {t === "details" ? "Details" : "Receipt"}
            </button>
          ))}
        </div>
      </div>

      <ParcelHero parcel={parcel} />

      {tab === "details" ? (
        <DetailsTab parcel={parcel} onActionSuccess={() => router.refresh()} userRole={userRole} />
      ) : (
        <div className="mx-auto w-full max-w-2xl">
          <ReceiptTab parcel={parcel} />
        </div>
      )}
    </div>
  );
}
