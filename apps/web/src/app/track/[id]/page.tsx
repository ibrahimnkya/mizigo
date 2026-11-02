"use client";

import { useEffect, useRef, useState } from "react";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useParams, useRouter } from "next/navigation";
import Image from "next/image";
import Link from "next/link";
import { SiteFooter } from "@/components/layout/site-footer";
import { format } from "date-fns";
import { toast } from "sonner";
import {
  ArrowRight,
  Check,
  Copy,
  Loader2,
  MapPin,
  Printer,
  Search,
  SearchX,
  ShieldCheck,
  TrainFront,
  MoreHorizontal,
  PackageSearch,
  X,
} from "lucide-react";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";
import { trackingNote } from "@/lib/tracking-note";

/* ─── Status wording (plain language, like the app) ───────────────────────── */

const STATUS: Record<string, { label: string; headline: (to: string) => string }> = {
  PENDING: { label: "Request received", headline: () => "We're preparing your parcel" },
  APPROVED: { label: "Approved", headline: () => "Approved and waiting for drop-off" },
  PAYMENT_PENDING: { label: "Awaiting payment", headline: () => "Waiting for payment" },
  PAID: { label: "Paid", headline: () => "Paid and waiting for drop-off" },
  RECEIVED: { label: "At the origin station", headline: () => "Received at the station" },
  DISPATCHED: { label: "On the way", headline: (to) => `On the way to ${to}` },
  IN_TRANSIT: { label: "On the way", headline: (to) => `On the way to ${to}` },
  OFFLOADED: { label: "Ready for pickup", headline: (to) => `Ready for pickup in ${to}` },
  AT_STATION: { label: "Ready for pickup", headline: (to) => `Ready for pickup in ${to}` },
  DELIVERED: { label: "Delivered", headline: () => "Delivered to the receiver" },
  COMPLETED: { label: "Delivered", headline: () => "Delivered to the receiver" },
  DELAYED: { label: "Delayed", headline: () => "Running a little late" },
  CANCELED: { label: "Cancelled", headline: () => "This parcel was cancelled" },
  CANCELLED: { label: "Cancelled", headline: () => "This parcel was cancelled" },
  REJECTED: { label: "Rejected", headline: () => "This request was rejected" },
  LOST: { label: "Under review", headline: () => "We're looking into this parcel" },
};

const STEP_LABELS: Record<string, string> = {
  PENDING: "Requested",
  RECEIVED: "Received",
  IN_TRANSIT: "On the way",
  AT_STATION: "At station",
  DELIVERED: "Delivered",
};

const city = (s?: string) => (s || "—").split(",")[0]!.trim();
const pretty = (s?: string | null) =>
  s
    ? s
        .replace(/_/g, " ")
        .toLowerCase()
        .replace(/^\w/, (c) => c.toUpperCase())
    : null;

/* ─── Shell: maroon top bar with logo + search ────────────────────────────── */

function Shell({
  children,
  logo,
}: {
  children: React.ReactNode;
  logo?: { url?: string | null; name?: string | null };
}) {
  const router = useRouter();
  const [q, setQ] = useState("");
  return (
    <div className="flex min-h-screen w-full flex-col bg-[#F3F3F3] text-[#1C1C1E] lg:h-screen lg:overflow-hidden">
      <header className="fixed inset-x-0 top-3 z-50 px-3 text-white sm:top-4 sm:px-5">
        <nav className="relative z-10 mx-auto flex w-full max-w-6xl flex-wrap items-center justify-between gap-3 rounded-[28px] border border-white/15 bg-[#5C0B19]/80 py-2.5 pl-4 pr-2.5 shadow-[0_16px_40px_-20px_rgba(0,0,0,0.6)] backdrop-blur-xl sm:flex-nowrap sm:rounded-full sm:pl-6">
          <Link href="/" className="flex items-center gap-2.5" aria-label="MiziGO home">
            {logo?.url ? (
              // eslint-disable-next-line @next/next/no-img-element
              <img src={logo.url} alt={logo.name || "Logo"} className="h-10 w-auto max-w-[10rem] object-contain" />
            ) : (
              <>
                <Image src="/brand/logo_icon.png" alt="" width={40} height={40} className="h-10 w-10" priority />
                <Image
                  src="/brand/logo_text.png"
                  alt="MiziGO"
                  width={110}
                  height={34}
                  className="h-7 w-auto"
                  priority
                />
              </>
            )}
          </Link>
          <form
            onSubmit={(e) => {
              e.preventDefault();
              if (q.trim()) router.push(`/track/${encodeURIComponent(q.trim().toUpperCase())}`);
            }}
            className="relative w-full sm:w-80"
          >
            <Search size={16} className="pointer-events-none absolute left-4 top-1/2 -translate-y-1/2 text-white/50" />
            <input
              value={q}
              onChange={(e) => setQ(e.target.value.toUpperCase())}
              placeholder="Track another parcel"
              aria-label="Tracking number"
              className="h-11 w-full rounded-full border border-white/20 bg-white/10 pl-11 pr-12 text-[14px] text-white outline-none backdrop-blur-md placeholder:text-white/45 focus:border-orange-400"
            />
            <button
              type="submit"
              aria-label="Track"
              className="absolute right-1.5 top-1.5 flex h-8 w-8 items-center justify-center rounded-full bg-orange-500 transition hover:bg-orange-600"
            >
              <ArrowRight size={16} />
            </button>
          </form>
        </nav>
      </header>
      <div className="relative h-52 shrink-0 overflow-hidden bg-gradient-to-b from-[#5C0B19] to-[#4F0A0C] sm:h-36">
        <div className="pointer-events-none absolute inset-0 bg-bridge bg-cover bg-bottom opacity-25" />
      </div>
      <main className="relative z-10 mx-auto -mt-10 flex min-h-0 w-full max-w-6xl flex-1 flex-col px-5 pb-5 sm:px-8">
        {children}
      </main>
      <SiteFooter />
    </div>
  );
}

function Card({ title, children, className }: { title?: string; children: React.ReactNode; className?: string }) {
  return (
    <section className={cn("flex min-h-0 flex-col rounded-[24px] border border-[#E2E2E2] bg-white p-5", className)}>
      {title && <h2 className="mb-3 shrink-0 text-[16px] font-semibold">{title}</h2>}
      {children}
    </section>
  );
}

function Fact({ label, value }: { label: string; value?: string | null }) {
  return (
    <div className="rounded-2xl bg-[#F7F5F4] px-3.5 py-2.5">
      <p className="text-[12px] text-slate-500">{label}</p>
      <p className="text-[14px] font-semibold">{value || "—"}</p>
    </div>
  );
}

/* ─── Options menu: one control for all parcel actions ───────────────────── */

function ParcelOptions({
  canReport,
  onCopy,
  onPrint,
  onReport,
}: {
  canReport: boolean;
  onCopy: () => void;
  onPrint: () => void;
  onReport: () => void;
}) {
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);
  useEffect(() => {
    if (!open) return;
    const close = (e: MouseEvent) => !ref.current?.contains(e.target as Node) && setOpen(false);
    const esc = (e: KeyboardEvent) => e.key === "Escape" && setOpen(false);
    document.addEventListener("mousedown", close);
    document.addEventListener("keydown", esc);
    return () => {
      document.removeEventListener("mousedown", close);
      document.removeEventListener("keydown", esc);
    };
  }, [open]);

  const item = "flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-left text-[14px] transition hover:bg-orange-50";
  const run = (fn: () => void) => () => {
    setOpen(false);
    fn();
  };

  return (
    <div ref={ref} className="relative print:hidden">
      <button
        onClick={() => setOpen((v) => !v)}
        aria-haspopup="menu"
        aria-expanded={open}
        className="flex h-10 items-center gap-2 rounded-full bg-white/10 px-4 text-[13px] font-semibold transition hover:bg-white/20"
      >
        <MoreHorizontal size={16} /> Options
      </button>
      {open && (
        <div
          role="menu"
          className="absolute right-0 top-12 z-30 w-60 rounded-2xl border border-[#E2E2E2] bg-white p-1.5 text-[#1C1C1E] shadow-premium"
        >
          <button role="menuitem" onClick={run(onCopy)} className={item}>
            <Copy size={16} className="text-slate-500" /> Copy tracking link
          </button>
          <button role="menuitem" onClick={run(onPrint)} className={item}>
            <Printer size={16} className="text-slate-500" /> Print
          </button>
          {canReport && (
            <>
              <div className="my-1 h-px bg-slate-100" />
              <button role="menuitem" onClick={run(onReport)} className={cn(item, "text-rose-600 hover:bg-rose-50")}>
                <PackageSearch size={16} /> Report lost parcel
              </button>
            </>
          )}
        </div>
      )}
    </div>
  );
}

/* ─── Report lost: verified by the sender's or receiver's phone ─────────── */

function ReportLostDialog({
  trackingNumber,
  onClose,
  onReported,
}: {
  trackingNumber: string;
  onClose: () => void;
  onReported: () => void;
}) {
  const [phone, setPhone] = useState("");
  const [details, setDetails] = useState("");
  const [sending, setSending] = useState(false);
  const [error, setError] = useState("");
  const [done, setDone] = useState(false);

  const submit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSending(true);
    try {
      await api.post(`/parcel/track/${encodeURIComponent(trackingNumber)}/report-lost`, { phone, details });
      setDone(true);
      onReported();
    } catch (err: any) {
      setError(err?.response?.data?.error?.message || err?.response?.data?.message || "Couldn't send the report. Please try again.");
    } finally {
      setSending(false);
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-end justify-center bg-black/40 p-4 sm:items-center" onClick={onClose}>
      <div
        role="dialog"
        aria-modal="true"
        aria-labelledby="report-lost-title"
        onClick={(e) => e.stopPropagation()}
        className="w-full max-w-md rounded-[28px] bg-white p-6 text-[#1C1C1E] shadow-premium"
      >
        <div className="flex items-start justify-between gap-3">
          <div className="flex h-12 w-12 items-center justify-center rounded-full bg-rose-50">
            <PackageSearch size={22} className="text-rose-600" />
          </div>
          <button onClick={onClose} aria-label="Close" className="rounded-full p-2 text-slate-400 hover:bg-slate-100">
            <X size={18} />
          </button>
        </div>

        {done ? (
          <>
            <h2 id="report-lost-title" className="mt-4 text-[20px] font-semibold">Report received</h2>
            <p className="mt-1 text-[15px] text-slate-500">
              Our station team will look into {trackingNumber} and contact you on the number you gave.
            </p>
            <button
              onClick={onClose}
              className="mt-6 h-12 w-full rounded-full bg-[#5C0B19] text-[15px] font-semibold text-white transition hover:bg-[#4F0A0C]"
            >
              Done
            </button>
          </>
        ) : (
          <form onSubmit={submit}>
            <h2 id="report-lost-title" className="mt-4 text-[20px] font-semibold">Report a lost parcel</h2>
            <p className="mt-1 text-[14px] text-slate-500">
              To confirm it&apos;s you, enter the sender&apos;s or receiver&apos;s phone number for {trackingNumber}.
            </p>
            <label className="mt-5 block text-[13px] font-medium text-slate-600" htmlFor="lost-phone">
              Phone number
            </label>
            <input
              id="lost-phone"
              type="tel"
              required
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              placeholder="e.g. 0712 345 678"
              className="mt-1.5 h-12 w-full rounded-2xl border border-[#E2E2E2] px-4 text-[15px] outline-none focus:border-orange-500 focus:ring-4 focus:ring-orange-500/10"
            />
            <label className="mt-4 block text-[13px] font-medium text-slate-600" htmlFor="lost-details">
              What happened? <span className="font-normal text-slate-400">(optional)</span>
            </label>
            <textarea
              id="lost-details"
              rows={3}
              maxLength={500}
              value={details}
              onChange={(e) => setDetails(e.target.value)}
              placeholder="e.g. It was due on Monday and the station says it hasn't arrived."
              className="mt-1.5 w-full resize-none rounded-2xl border border-[#E2E2E2] px-4 py-3 text-[15px] outline-none focus:border-orange-500 focus:ring-4 focus:ring-orange-500/10"
            />
            {error && <p className="mt-3 rounded-2xl bg-rose-50 px-4 py-2.5 text-[13px] text-rose-700">{error}</p>}
            <button
              type="submit"
              disabled={sending}
              className="mt-5 flex h-12 w-full items-center justify-center gap-2 rounded-full bg-[#5C0B19] text-[15px] font-semibold text-white transition hover:bg-[#4F0A0C] disabled:opacity-60"
            >
              {sending && <Loader2 size={17} className="animate-spin" />} Send report
            </button>
          </form>
        )}
      </div>
    </div>
  );
}

/* ─── Page ─────────────────────────────────────────────────────────────────── */

export default function PublicTrackingPage() {
  const { id } = useParams();
  const trackingId = decodeURIComponent(String(id ?? ""));
  const queryClient = useQueryClient();
  const [reportOpen, setReportOpen] = useState(false);

  const { data, isLoading, error } = useQuery({
    queryKey: ["public-tracking", trackingId],
    queryFn: async () => (await api.get(`/parcel/track/${encodeURIComponent(trackingId)}`)).data.data,
    enabled: !!trackingId,
    retry: 1,
  });

  if (isLoading) {
    return (
      <Shell>
        <div className="flex min-h-[320px] flex-1 flex-col items-center justify-center rounded-[28px] border border-[#E2E2E2] bg-white">
          <Loader2 size={28} className="animate-spin text-orange-500" />
          <p className="mt-3 text-[15px] text-slate-500">Finding {trackingId}…</p>
        </div>
      </Shell>
    );
  }

  const notFound = (error as any)?.response?.status === 404;
  if (error && !notFound) {
    return (
      <Shell>
        <div className="flex flex-1 flex-col items-center justify-center rounded-[28px] border border-[#E2E2E2] bg-white px-6 py-14 text-center">
          <div className="flex h-16 w-16 items-center justify-center rounded-full bg-orange-50">
            <SearchX size={28} className="text-orange-500" />
          </div>
          <h1 className="mt-4 text-[22px] font-semibold">Tracking is unavailable right now</h1>
          <p className="mt-1 max-w-md text-[15px] text-slate-500">
            We couldn&apos;t reach the tracking service. Please try again in a moment.
          </p>
          <button
            onClick={() => window.location.reload()}
            className="mt-6 rounded-full bg-[#5C0B19] px-6 py-3 text-[14px] font-semibold text-white transition hover:bg-[#4F0A0C]"
          >
            Try again
          </button>
        </div>
      </Shell>
    );
  }

  if (error || !data?.parcel) {
    return (
      <Shell>
        <div className="flex flex-1 flex-col items-center justify-center rounded-[28px] border border-[#E2E2E2] bg-white px-6 py-14 text-center">
          <div className="flex h-16 w-16 items-center justify-center rounded-full bg-orange-50">
            <SearchX size={28} className="text-orange-500" />
          </div>
          <h1 className="mt-4 text-[22px] font-semibold">We couldn&apos;t find “{trackingId}”</h1>
          <p className="mt-1 max-w-md text-[15px] text-slate-500">
            Check the tracking number on your receipt or SMS and try again using the search above.
          </p>
          <Link
            href="/"
            className="mt-6 rounded-full bg-[#5C0B19] px-6 py-3 text-[14px] font-semibold text-white transition hover:bg-[#4F0A0C]"
          >
            Back to home
          </Link>
        </div>
      </Shell>
    );
  }

  const parcel = data.parcel;
  const masked: boolean = !!data.isPrivacyMasked;
  const history: { id: string; status: string; location?: string; description?: string; timestamp: string }[] = [
    ...(data.trackingHistory ?? []),
  ].reverse();
  const steps: { status: string; reached: boolean }[] = data.statusTimeline ?? [];
  const to = city(parcel.route?.destinationStation);
  const from = city(parcel.route?.receivingStation);
  const meta = STATUS[parcel.status] ?? {
    label: pretty(parcel.status) ?? "",
    headline: () => pretty(parcel.status) ?? "",
  };
  const reachedCount = steps.filter((s) => s.reached).length;
  const stopped = ["CANCELED", "CANCELLED", "REJECTED", "LOST"].includes(parcel.status);

  const openReport = !!parcel.lostReport && !parcel.lostReport.resolved;

  const copyLink = () => {
    navigator.clipboard.writeText(window.location.href);
    toast.success("Tracking link copied");
  };

  return (
    <Shell logo={{ url: parcel.organization?.logoUrl, name: parcel.organization?.name }}>
      <div className="grid min-h-0 flex-1 gap-5 lg:grid-cols-[minmax(0,1.1fr)_minmax(0,1fr)]">
        {/* Hero */}
        <section className="bridge-card flex flex-col p-6">
          <div className="flex flex-wrap items-start justify-between gap-3">
            <div className="flex items-center gap-4">
              <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-white/10">
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img src="/brand/staff_parcel.png" alt="" className="h-10 w-10 object-contain" />
              </div>
              <div>
                <p className="text-[13px] text-white/65">Tracking number</p>
                <p className="text-[24px] font-semibold tracking-wide sm:text-[28px]">{parcel.trackingNumber}</p>
              </div>
            </div>
            <ParcelOptions
              canReport={!stopped && !openReport}
              onCopy={copyLink}
              onPrint={() => window.print()}
              onReport={() => setReportOpen(true)}
            />
          </div>

          <div className="mt-5">
            <div className="flex flex-wrap items-center gap-2">
              <span className={cn("accent-pill", stopped && "bg-white/20")}>{meta.label}</span>
              {openReport && (
                <span className="inline-flex items-center gap-1.5 rounded-full bg-white/15 px-3 py-1 text-xs font-semibold">
                  <PackageSearch size={13} /> Reported missing · we&apos;re looking into it
                </span>
              )}
            </div>
            <h1 className="mt-3 text-[28px] font-semibold leading-tight sm:text-[32px]">{meta.headline(to)}</h1>
            <p className="mt-1 text-[14px] text-white/65">
              Last update {format(new Date(parcel.updatedAt), "d MMM yyyy, HH:mm")}
            </p>
          </div>

          <div className="mt-5 flex items-center gap-4 rounded-2xl border border-white/15 bg-white/10 px-5 py-4 backdrop-blur-md">
            <div className="min-w-0 flex-1">
              <p className="text-[12px] text-white/60">From</p>
              <p className="truncate text-[18px] font-semibold">{from}</p>
            </div>
            <div className="flex flex-[1.2] items-center gap-2">
              <span className="h-2 w-2 rounded-full border-2 border-orange-400" />
              <span className="h-px flex-1 border-t border-dashed border-white/40" />
              <TrainFront size={18} className="text-orange-400" />
              <span className="h-px flex-1 border-t border-dashed border-white/40" />
              <MapPin size={14} className="text-orange-400" />
            </div>
            <div className="min-w-0 flex-1 text-right">
              <p className="text-[12px] text-white/60">To</p>
              <p className="truncate text-[18px] font-semibold">{to}</p>
            </div>
          </div>

          {/* Progress */}
          {!stopped && steps.length > 0 && (
            <div className="relative mt-auto pt-6">
              <div className="absolute left-4 right-4 top-[2.5rem] h-1 rounded-full bg-white/15" />
              <div
                className="absolute left-4 top-[2.5rem] h-1 rounded-full bg-orange-500 transition-all"
                style={{
                  width: `calc((100% - 2rem) * ${Math.max(0, reachedCount - 1) / Math.max(1, steps.length - 1)})`,
                }}
              />
              <ol className="relative flex justify-between">
                {steps.map((s, i) => {
                  const current = s.reached && (i === steps.length - 1 || !steps[i + 1]?.reached);
                  return (
                    <li key={s.status} className="flex w-16 flex-col items-center text-center sm:w-20">
                      <span
                        className={cn(
                          "flex h-9 w-9 items-center justify-center rounded-full border-4 border-[#5C0B19]",
                          s.reached ? "bg-orange-500 text-white" : "bg-white/20 text-white/60",
                          current && "ring-4 ring-orange-500/30",
                        )}
                      >
                        {s.reached ? (
                          <Check size={15} strokeWidth={3} />
                        ) : (
                          <span className="h-2 w-2 rounded-full bg-white/60" />
                        )}
                      </span>
                      <span
                        className={cn(
                          "mt-2 text-[12px] leading-tight",
                          s.reached ? "font-semibold text-white" : "text-white/55",
                        )}
                      >
                        {STEP_LABELS[s.status] ?? pretty(s.status)}
                      </span>
                    </li>
                  );
                })}
              </ol>
            </div>
          )}
        </section>

        <div className="flex min-h-0 flex-col gap-5">
          <Card title="Journey" className="lg:flex-1">
            {history.length === 0 ? (
              <p className="text-[14px] text-slate-500">No scans yet. Updates appear here as the parcel moves.</p>
            ) : (
              <ol className="min-h-0 flex-1 overflow-y-auto pr-1">
                {history.map((e, i) => (
                  <li key={e.id} className="relative flex gap-4 pb-5 last:pb-0">
                    {i < history.length - 1 && (
                      <span className="absolute bottom-0 left-[11px] top-6 w-px bg-slate-200" />
                    )}
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
                          {STATUS[e.status]?.label ?? pretty(e.status)}
                        </p>
                        <p className="text-[12px] text-slate-400">{format(new Date(e.timestamp), "d MMM, HH:mm")}</p>
                      </div>
                      {trackingNote(e) && (
                        <p className="mt-0.5 text-[13px] text-slate-500">
                          {trackingNote(e)}
                        </p>
                      )}
                    </div>
                  </li>
                ))}
              </ol>
            )}
          </Card>

          <Card title="Parcel">
            <div className="grid grid-cols-3 gap-2.5">
              <Fact label="Item" value={parcel.itemName} />
              <Fact label="Type" value={pretty(parcel.parcelType)} />
              <Fact label="Size" value={pretty(parcel.packageSize || parcel.parcelSize)} />
              <Fact label="Priority" value={parcel.urgency} />
              <Fact label="Payment" value={parcel.paymentStatus === "PAID" ? "Paid" : pretty(parcel.paymentStatus)} />
              <Fact label="Condition" value={pretty(parcel.condition)} />
            </div>
          </Card>

          <Card title="Receiver">
            <div className="flex items-center gap-3">
              <div className="flex h-11 w-11 items-center justify-center rounded-full bg-[#5C0B19] text-[15px] font-semibold text-white">
                {(parcel.receiver?.name || "?").charAt(0).toUpperCase()}
              </div>
              <div className="min-w-0">
                <p className="truncate text-[15px] font-semibold">{parcel.receiver?.name || "—"}</p>
                {parcel.receiver?.phone && (
                  <p className="text-[13px] text-slate-500">•••• {String(parcel.receiver.phone).slice(-4)}</p>
                )}
              </div>
            </div>
            <div className="mt-4 flex gap-3 rounded-2xl bg-orange-50 px-4 py-3">
              <ShieldCheck size={18} className="mt-0.5 shrink-0 text-orange-500" />
              <p className="text-[13px] leading-snug text-orange-900">
                The receiver collects the parcel with the one-time code sent by SMS. Never share it with anyone else.
              </p>
            </div>
            {masked && (
              <p className="mt-3 text-[12px] text-slate-400">
                Some details are hidden because you searched by phone number.
              </p>
            )}
          </Card>
        </div>
      </div>
      {reportOpen && (
        <ReportLostDialog
          trackingNumber={parcel.trackingNumber}
          onClose={() => setReportOpen(false)}
          onReported={() => queryClient.invalidateQueries({ queryKey: ["public-tracking", trackingId] })}
        />
      )}
    </Shell>
  );
}
