import { PaymentList } from "@/components/dashboard/payment-list";

export default function RefundPaymentsPage() {
  return (
    <div className="max-w-[1520px] mx-auto w-full flex flex-col gap-6 animate-in fade-in duration-700 py-4">
      <div>
        <div className="flex items-center gap-2 mb-2">
          <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-slate-500 bg-slate-100 px-2.5 py-1 rounded-full">
            Refunded
          </span>
        </div>
        <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">
          Refunded Transactions
        </h1>
        <p className="text-sm text-slate-400 font-medium mt-0.5">
          History of all refunded payments.
        </p>
      </div>
      <PaymentList status="REFUNDED" />
    </div>
  );
}
