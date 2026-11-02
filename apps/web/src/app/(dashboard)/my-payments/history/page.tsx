import { PaymentList } from "@/components/dashboard/payment-list";

export default function MyPaymentHistoryPage() {
  return (
    <div className="flex flex-col gap-5">
      <div>
        <div className="flex items-center gap-2 mb-2">
          <span className="text-[10px] font-semibold uppercase tracking-[0.05em] text-slate-500 bg-slate-100 px-2.5 py-1 rounded-full">
            History
          </span>
        </div>
        <h1 className="text-[20px] font-semibold text-slate-800 tracking-tight">Payment History</h1>
        <p className="text-sm text-slate-400 font-medium mt-0.5">Complete history of payments related to your approvals and parcels.</p>
      </div>
      <PaymentList />
    </div>
  );
}
