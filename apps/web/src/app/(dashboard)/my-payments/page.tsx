import { PaymentList } from "@/components/dashboard/payment-list";

export default function MyPaymentsPage() {
  return (
    <div className="max-w-[1520px] mx-auto w-full flex flex-col gap-6 animate-in fade-in duration-700 py-4">
      <PaymentList />
    </div>
  );
}
