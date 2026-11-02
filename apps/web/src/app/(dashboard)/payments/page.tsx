import { PaymentList } from "@/components/dashboard/payment-list";

export default async function PaymentsPage({
  searchParams,
}: {
  searchParams: Promise<{ tab?: string }>;
}) {
  const { tab = "overview" } = await searchParams;
  // PaymentList renders the page header itself, with the filters inside it.
  return <PaymentList tab={tab} />;
}
