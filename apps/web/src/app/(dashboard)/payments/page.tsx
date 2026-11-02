import { PaymentList } from "@/components/dashboard/payment-list";
import { ReportPageHeader } from "@/components/reports/report-page-header";

export default async function PaymentsPage({
  searchParams,
}: {
  searchParams: Promise<{ tab?: string }>;
}) {
  const resolvedParams = await searchParams;
  const tab = resolvedParams.tab || "overview";

  return (
    <div className="flex flex-col gap-5">
      <ReportPageHeader
        title="Payments Hub"
        subtitle="Monitor all financial transactions and revenue streams"
        iconName="CreditCard"
        tabs={["Overview", "All"]}
        tabParamName="tab"
        activeTab={tab}
      />
      <PaymentList tab={tab} />
    </div>
  );
}
