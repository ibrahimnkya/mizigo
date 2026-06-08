import { PaymentList } from "@/components/dashboard/payment-list";

export default function MyPaymentsPage() {
  return (
    <div className="flex flex-col gap-2 p-2 min-h-screen animate-in fade-in duration-700">
      <PaymentList />
    </div>
  );
}
