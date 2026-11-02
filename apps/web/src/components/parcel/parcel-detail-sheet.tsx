"use client";

import { useRouter } from "next/navigation";
import { useSession } from "next-auth/react";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { format } from "date-fns";
import { CreditCard, Package, PackageSearch, Route, TrainFront, User, X, XCircle } from "lucide-react";
import { Sheet, SheetClose, SheetContent, SheetDescription, SheetTitle } from "@repo/ui/sheet";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";
import { trackingNote } from "@/lib/tracking-note";
import { ActionPanel, LostParcelPanel, ParcelPaymentSection } from "./parcel-detail-panel";

const tsh = (n?: number | null) => `TSh ${Math.round(n || 0).toLocaleString("en-US")}`;
const nice = (s?: string | null) => (s ? s.replace(/_/g, " ").toLowerCase().replace(/^\w/, (c) => c.toUpperCase()) : null);

export const PARCEL_STATUS: Record<string, { label: string; tone: string }> = {
  PENDING: { label: "Requested", tone: "bg-slate-100 text-slate-600" },
  APPROVED: { label: "Approved", tone: "bg-[#FBF1F2] text-[#5C0B19]" },
  PAYMENT_PENDING: { label: "Awaiting payment", tone: "bg-amber-50 text-amber-700" },
  PAID: { label: "Paid", tone: "bg-emerald-50 text-emerald-700" },
  RECEIVED: { label: "Received", tone: "bg-[#FBF1F2] text-[#5C0B19]" },
  DISPATCHED: { label: "Dispatched", tone: "bg-orange-50 text-orange-700" },
  IN_TRANSIT: { label: "On the way", tone: "bg-orange-50 text-orange-700" },
  OFFLOADED: { label: "Offloaded", tone: "bg-amber-50 text-amber-700" },
  AT_STATION: { label: "At station", tone: "bg-amber-50 text-amber-700" },
  DELIVERED: { label: "Delivered", tone: "bg-emerald-50 text-emerald-700" },
  CANCELED: { label: "Cancelled", tone: "bg-slate-100 text-slate-600" },
  REJECTED: { label: "Rejected", tone: "bg-slate-100 text-slate-600" },
  DELAYED: { label: "Delayed", tone: "bg-rose-50 text-rose-700" },
  LOST: { label: "Lost", tone: "bg-rose-50 text-rose-700" },
};
const statusOf = (s?: string) => PARCEL_STATUS[s ?? ""] ?? { label: nice(s) ?? "—", tone: "bg-slate-100 text-slate-600" };

const SERVICE_LABELS: Record<string, string> = {
  insurance: "Insurance",
  packaging: "Secure packaging",
  fragile: "Special handling",
};

function Row({ label, value }: { label: string; value?: React.ReactNode }) {
  return (
    <div className="flex items-start justify-between gap-4 py-2.5 text-[14px]">
      <span className="shrink-0 text-slate-500">{label}</span>
      <span className="text-right font-medium text-[#1C1C1E]">{value || "—"}</span>
    </div>
  );
}

function Section({ icon: Icon, title, children }: { icon: React.ElementType; title: string; children: React.ReactNode }) {
  return (
    <section className="rounded-[20px] border border-[#E2E2E2] bg-white px-4 py-1.5">
      <p className="flex items-center gap-2 pt-2.5 text-[13px] font-semibold text-[#1C1C1E]">
        <Icon size={15} className="text-orange-500" /> {title}
      </p>
      <div className="divide-y divide-slate-100">{children}</div>
    </section>
  );
}

const person = (name?: string | null, phone?: string | null) => [name, phone].filter(Boolean).join(" · ") || null;

/**
 * Complete parcel view in a side panel: details, people, payment, journey and
 * the operational actions (approve/reject, lost, agent payment). Opened from
 * any parcel list or the parcel report; `parcel` is the row that was clicked.
 */
export function ParcelDetailSheet({ parcel, onClose }: { parcel: any | null; onClose: () => void }) {
  const router = useRouter();
  const queryClient = useQueryClient();
  const { data: session } = useSession();
  const role = (session?.user as any)?.role as string | undefined;

  const { data: full, isLoading } = useQuery({
    queryKey: ["parcel-detail", parcel?.id],
    queryFn: async () => (await api.get(`/parcel/${parcel!.id}`)).data?.data,
    enabled: !!parcel?.id,
    staleTime: 15_000,
  });

  const tracking: string | undefined = full?.trackingNumber ?? parcel?.trackingNumber ?? parcel?.trackingId;
  // Older API builds don't include the journey in the detail response.
  const { data: publicJourney } = useQuery({
    queryKey: ["parcel-journey", tracking],
    queryFn: async () => {
      const { data } = await api.get(`/parcel/track/${encodeURIComponent(tracking!)}`);
      return [...(data?.data?.trackingHistory ?? [])].reverse();
    },
    enabled: !!tracking && !!full && !Array.isArray(full?.tracking),
  });

  const p = { ...(parcel ?? {}), ...(full ?? {}) };
  const meta = p.additionalServices && typeof p.additionalServices === "object" && !Array.isArray(p.additionalServices) ? p.additionalServices : {};
  const from = p.route?.receivingStation ?? p.fromStation ?? p.origin?.name ?? p.fromAddress;
  const to = p.route?.destinationStation ?? p.toStation ?? p.destination?.name ?? p.toAddress;
  const amount = p.amount ?? p.price ?? p.totalPrice;
  const paid = p.paymentStatus === "PAID" || p.payment?.status === "SUCCESS";
  const st = statusOf(p.status);
  const journey: any[] = Array.isArray(full?.tracking) ? full.tracking : publicJourney ?? [];
  const services: string[] = (Array.isArray(p.services) ? p.services : Array.isArray(meta.services) ? meta.services : []).map(String);
  const lostOpen = meta.lostReport && !meta.lostReport.resolved;

  const refresh = () => {
    queryClient.invalidateQueries({ queryKey: ["parcel-detail", parcel?.id] });
    router.refresh();
  };

  return (
    <Sheet open={!!parcel} onOpenChange={(o) => !o && onClose()}>
      <SheetContent className="flex w-full flex-col gap-0 overflow-y-auto border-0 bg-[#F3F3F3] p-0 sm:max-w-[480px] [&>button:last-child]:hidden">
        {parcel && (
          <>
            {/* Header */}
            <div className="bridge-card rounded-none px-6 pb-7 pt-8">
              <div className="flex items-center justify-between">
                <span className="flex h-12 w-12 items-center justify-center rounded-2xl bg-white/15">
                  <Package size={22} className="text-orange-300" />
                </span>
                <SheetClose
                  aria-label="Close"
                  className="flex h-10 w-10 items-center justify-center rounded-full bg-white/15 text-white transition hover:bg-white/25 focus:outline-none focus-visible:ring-2 focus-visible:ring-white/60"
                >
                  <X size={18} />
                </SheetClose>
              </div>
              <SheetTitle className="mt-5 text-[13px] font-normal text-white/70">Tracking number</SheetTitle>
              <div className="flex flex-wrap items-center gap-2">
                <p className="text-[28px] font-semibold leading-tight tracking-wide text-white">{tracking ?? "—"}</p>
                <span className={cn("rounded-full px-3 py-1 text-[12px] font-semibold", st.tone)}>{st.label}</span>
                {p.urgency === "Express" && <span className="accent-pill">Express</span>}
              </div>
              <SheetDescription className="mt-1 text-[13px] text-white/60">
                {p.createdAt ? `Received ${format(new Date(p.createdAt), "d MMM yyyy · HH:mm")}` : ""}
              </SheetDescription>

              <div className="mt-5 flex items-center gap-3 rounded-2xl border border-white/15 bg-white/10 px-4 py-3 text-white">
                <div className="min-w-0 flex-1">
                  <p className="text-[11px] text-white/60">From</p>
                  <p className="truncate text-[15px] font-semibold">{from || "—"}</p>
                </div>
                <TrainFront size={18} className="shrink-0 text-orange-300" />
                <div className="min-w-0 flex-1 text-right">
                  <p className="text-[11px] text-white/60">To</p>
                  <p className="truncate text-[15px] font-semibold">{to || "—"}</p>
                </div>
              </div>

              <div className="mt-3 grid grid-cols-2 gap-3 text-white">
                <div className="rounded-2xl border border-white/15 bg-white/10 px-4 py-2.5">
                  <p className="text-[11px] text-white/60">Amount</p>
                  <p className="text-[18px] font-semibold tabular-nums">{amount != null ? tsh(amount) : "Not priced"}</p>
                </div>
                <div className="rounded-2xl border border-white/15 bg-white/10 px-4 py-2.5">
                  <p className="text-[11px] text-white/60">Payment</p>
                  <p className="text-[18px] font-semibold">{paid ? "Paid" : p.receiverPays ? "Receiver pays" : "Not paid"}</p>
                </div>
              </div>
            </div>

            <div className="flex flex-col gap-4 p-5">
              {lostOpen && (
                <div className="flex items-start gap-3 rounded-[20px] border border-rose-200 bg-rose-50 px-4 py-3">
                  <PackageSearch size={18} className="mt-0.5 shrink-0 text-rose-600" />
                  <p className="text-[14px] text-rose-800">
                    Reported missing by the {meta.lostReport.reportedBy === "RECEIVER" ? "receiver" : "sender"}. See the actions below.
                  </p>
                </div>
              )}
              {p.rejectionReason && (
                <div className="flex items-start gap-3 rounded-[20px] border border-rose-200 bg-rose-50 px-4 py-3">
                  <XCircle size={18} className="mt-0.5 shrink-0 text-rose-600" />
                  <p className="text-[14px] text-rose-800">Rejected: {p.rejectionReason}</p>
                </div>
              )}

              <Section icon={Package} title="Parcel">
                <Row label="Item" value={p.itemName ?? meta.itemName} />
                <Row label="Type" value={nice(p.parcelType)} />
                <Row label="Size" value={nice(p.packageSize ?? p.parcelSize)} />
                <Row label="Weight" value={p.weight ? `${p.weight} kg` : null} />
                <Row label="Priority" value={p.urgency} />
                <Row label="Condition" value={nice(p.condition ?? meta.condition)} />
                <Row label="Declared value" value={(p.declaredValue ?? meta.declaredValue) ? tsh(Number(p.declaredValue ?? meta.declaredValue)) : null} />
                {p.length ? <Row label="Dimensions" value={`${p.length} × ${p.width} × ${p.height} cm`} /> : null}
                {p.isFragile ? <Row label="Fragile" value="Yes" /> : null}
                {services.length > 0 && (
                  <div className="flex flex-wrap items-center justify-between gap-2 py-2.5 text-[14px]">
                    <span className="text-slate-500">Extra services</span>
                    <span className="flex flex-wrap justify-end gap-1.5">
                      {services.map((sv) => (
                        <span key={sv} className="rounded-full bg-orange-50 px-2.5 py-0.5 text-[12px] font-semibold text-orange-700">
                          {SERVICE_LABELS[sv] ?? sv}
                        </span>
                      ))}
                    </span>
                  </div>
                )}
                {p.specialInstructions && <Row label="Instructions" value={p.specialInstructions} />}
              </Section>

              <Section icon={User} title="People">
                <Row label="Sender" value={person(p.sender?.name ?? p.senderName ?? meta.senderName, p.sender?.phone ?? p.senderPhone ?? meta.senderPhone)} />
                <Row label="Receiver" value={person(p.receiver?.name ?? p.receiverName, p.receiver?.phone ?? p.receiverPhone)} />
                {(full?.user?.name || p.receivedBy) && <Row label="Received by" value={full?.user?.name ?? p.receivedBy} />}
                {p.approvedBy?.name && <Row label="Approved by" value={p.approvedBy.name} />}
                {p.dispatcher?.name && <Row label="Dispatched by" value={p.dispatcher.name} />}
                {p.offloader?.name && <Row label="Offloaded by" value={p.offloader.name} />}
                {p.deliverer?.name && <Row label="Delivered by" value={p.deliverer.name} />}
              </Section>

              <Section icon={CreditCard} title="Payment">
                <Row label="Amount" value={amount != null ? tsh(amount) : null} />
                <Row
                  label="Status"
                  value={
                    <span
                      className={cn(
                        "rounded-full px-2 py-0.5 text-[12px] font-semibold",
                        paid ? "bg-emerald-50 text-emerald-700" : "bg-amber-50 text-amber-700",
                      )}
                    >
                      {paid ? "Paid" : "Not paid"}
                    </span>
                  }
                />
                <Row label="How" value={nice(p.payment?.paymentMethod) ?? (p.paymentMode === "TO_PAY" ? "Receiver pays" : nice(p.paymentMode))} />
                {p.payment?.transactionReference && <Row label="Reference" value={p.payment.transactionReference} />}
              </Section>

              <Section icon={Route} title="Journey">
                {isLoading ? (
                  <div className="space-y-2 py-3">
                    {[1, 2, 3].map((n) => (
                      <div key={n} className="h-10 animate-pulse rounded-xl bg-slate-100" />
                    ))}
                  </div>
                ) : journey.length === 0 ? (
                  <p className="py-4 text-[14px] text-slate-400">No updates yet.</p>
                ) : (
                  <ol className="py-3">
                    {journey.map((e: any, i: number) => (
                      <li key={e.id ?? i} className="relative flex gap-3 pb-4 last:pb-0">
                        {i < journey.length - 1 && <span className="absolute bottom-0 left-[9px] top-5 w-px bg-slate-200" />}
                        <span
                          className={cn(
                            "relative mt-0.5 flex h-5 w-5 shrink-0 items-center justify-center rounded-full",
                            i === 0 ? "bg-orange-500" : "bg-slate-200",
                          )}
                        >
                          <span className={cn("h-1.5 w-1.5 rounded-full", i === 0 ? "bg-white" : "bg-slate-400")} />
                        </span>
                        <div className="min-w-0 flex-1">
                          <div className="flex items-center justify-between gap-2">
                            <p className={cn("text-[14px] font-semibold", i === 0 ? "text-[#1C1C1E]" : "text-slate-600")}>
                              {statusOf(e.status).label}
                            </p>
                            <p className="shrink-0 text-[12px] text-slate-400">{format(new Date(e.timestamp), "d MMM, HH:mm")}</p>
                          </div>
                          {trackingNote(e) && <p className="text-[13px] text-slate-500">{trackingNote(e)}</p>}
                        </div>
                      </li>
                    ))}
                  </ol>
                )}
              </Section>

              {/* Operational actions */}
              {full && (
                <>
                  <LostParcelPanel parcel={{ ...p, additionalServices: meta } as any} userRole={role} onDone={refresh} />
                  {(p.status === "PENDING" || p.status === "PAID") && role !== "AGENT" && (
                    <ActionPanel parcel={{ ...p, amount } as any} onSuccess={refresh} />
                  )}
                  {p.status === "PAYMENT_PENDING" && role === "AGENT" && (
                    <ParcelPaymentSection parcel={{ ...p, amount } as any} onPaymentInitiated={refresh} />
                  )}
                </>
              )}
            </div>
          </>
        )}
      </SheetContent>
    </Sheet>
  );
}
