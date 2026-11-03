"use client";

import { useState } from "react";
import { format } from "date-fns";
import { ArrowRight, CreditCard, MapPin, Receipt, User, X } from "lucide-react";
import { Sheet, SheetClose, SheetContent, SheetDescription, SheetTitle } from "@repo/ui/sheet";
import { cn } from "@/lib/utils";
import { ParcelDetailSheet } from "@/components/parcel/parcel-detail-sheet";

const tsh = (n?: number | null) => `TSh ${Math.round(n || 0).toLocaleString("en-US")}`;

export const PAYMENT_STATUS: Record<string, { label: string; tone: string }> = {
  SUCCESS: { label: "Paid", tone: "bg-emerald-50 text-emerald-700" },
  PAID: { label: "Paid", tone: "bg-emerald-50 text-emerald-700" },
  PENDING: { label: "Pending", tone: "bg-amber-50 text-amber-700" },
  FAILED: { label: "Failed", tone: "bg-rose-50 text-rose-700" },
  REFUNDED: { label: "Refunded", tone: "bg-slate-100 text-slate-600" },
};
export const paymentStatus = (s?: string) => PAYMENT_STATUS[s ?? ""] ?? { label: s ?? "—", tone: "bg-slate-100 text-slate-600" };

const meta = (p: any) => {
  const m = p?.parcel?.additionalServices;
  return m && typeof m === "object" && !Array.isArray(m) ? m : {};
};

function Row({ label, value }: { label: string; value?: React.ReactNode }) {
  return (
    <div className="flex items-start justify-between gap-4 py-2.5 text-[14px]">
      <span className="text-slate-500">{label}</span>
      <span className="text-right font-medium text-[#1C1C1E]">{value || "—"}</span>
    </div>
  );
}

/** Side panel with one payment's full details. */
export function PaymentDetailSheet({ payment, onClose }: { payment: any | null; onClose: () => void }) {
  const [openParcel, setOpenParcel] = useState<any | null>(null);
  const st = paymentStatus(payment?.status);
  const m = meta(payment);
  return (
    <Sheet open={!!payment} onOpenChange={(o) => !o && onClose()}>
      <SheetContent className="flex w-full flex-col gap-0 overflow-y-auto border-0 bg-[#F3F3F3] p-0 sm:max-w-[440px] [&>button:last-child]:hidden">
        {payment && (
          <>
            <div className="bridge-card rounded-none px-6 pb-7 pt-8">
              <div className="flex items-center justify-between">
                <span className="flex h-12 w-12 items-center justify-center rounded-2xl bg-white/15">
                  <CreditCard size={22} className="text-orange-300" />
                </span>
                <SheetClose
                  aria-label="Close"
                  className="flex h-10 w-10 items-center justify-center rounded-full bg-white/15 text-white transition hover:bg-white/25 focus:outline-none focus-visible:ring-2 focus-visible:ring-white/60"
                >
                  <X size={18} />
                </SheetClose>
              </div>
              <SheetTitle className="mt-5 text-[13px] font-normal text-white/70">Amount</SheetTitle>
              <div className="flex flex-wrap items-center gap-3">
                <p className="text-[28px] sm:text-[36px] font-semibold leading-none tabular-nums text-white">{tsh(payment.amount)}</p>
                <span className={cn("rounded-full px-3 py-1 text-[12px] font-semibold", st.tone)}>{st.label}</span>
              </div>
              <SheetDescription className="mt-2 text-[13px] text-white/60">
                {payment.createdAt ? format(new Date(payment.createdAt), "d MMM yyyy · HH:mm") : ""}
              </SheetDescription>
            </div>

            <div className="flex flex-col gap-4 p-5">
              <section className="rounded-[20px] border border-[#E2E2E2] bg-white px-4 py-1.5">
                <p className="flex items-center gap-2 pt-2.5 text-[13px] font-semibold text-[#1C1C1E]">
                  <Receipt size={15} className="text-orange-500" /> Payment
                </p>
                <div className="divide-y divide-slate-100">
                  <Row label="Method" value={payment.paymentMethod?.replace(/_/g, " ")} />
                  <Row label="Reference" value={payment.transactionReference} />
                  <Row label="Paid at" value={payment.paidAt ? format(new Date(payment.paidAt), "d MMM yyyy · HH:mm") : null} />
                  {payment.systemFee != null && <Row label="System fee" value={tsh(payment.systemFee)} />}
                  {payment.commission != null && <Row label="Commission" value={tsh(payment.commission)} />}
                  {payment.netAmount != null && <Row label="Net amount" value={tsh(payment.netAmount)} />}
                </div>
              </section>

              {payment.parcel && (
                <section className="rounded-[20px] border border-[#E2E2E2] bg-white px-4 py-1.5">
                  <p className="flex items-center gap-2 pt-2.5 text-[13px] font-semibold text-[#1C1C1E]">
                    <MapPin size={15} className="text-orange-500" /> Parcel
                  </p>
                  <div className="divide-y divide-slate-100">
                    <Row label="Tracking number" value={payment.parcel.trackingNumber} />
                    <Row
                      label="Route"
                      value={
                        payment.parcel.origin || payment.parcel.destination
                          ? `${payment.parcel.origin?.name ?? "—"} → ${payment.parcel.destination?.name ?? "—"}`
                          : null
                      }
                    />
                    <Row label="Parcel price" value={payment.parcel.amount != null ? tsh(payment.parcel.amount) : null} />
                  </div>
                </section>
              )}

              <section className="rounded-[20px] border border-[#E2E2E2] bg-white px-4 py-1.5">
                <p className="flex items-center gap-2 pt-2.5 text-[13px] font-semibold text-[#1C1C1E]">
                  <User size={15} className="text-orange-500" /> People
                </p>
                <div className="divide-y divide-slate-100">
                  <Row label="Sender" value={[m.senderName, m.senderPhone].filter(Boolean).join(" · ")} />
                  <Row
                    label="Receiver"
                    value={[payment.parcel?.receiverName, payment.parcel?.receiverPhone].filter(Boolean).join(" · ")}
                  />
                </div>
              </section>

              {payment.parcel?.id && (
                <button
                  type="button"
                  onClick={() => setOpenParcel(payment.parcel)}
                  className="flex h-12 items-center justify-center gap-2 rounded-full bg-[#5C0B19] text-[14px] font-semibold text-white transition hover:bg-[#4F0A0C]"
                >
                  View parcel <ArrowRight size={16} />
                </button>
              )}
            </div>
          </>
        )}
      </SheetContent>
      <ParcelDetailSheet parcel={openParcel} onClose={() => setOpenParcel(null)} />
    </Sheet>
  );
}
