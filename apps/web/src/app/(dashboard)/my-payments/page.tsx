import { PaymentList } from "@/components/dashboard/payment-list";

export default function MyPaymentsPage() {
  return (
    <div className="flex flex-col gap-5">
      <PaymentList />
    </div>
  );
}
