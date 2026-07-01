import { PaymentList } from "@/components/dashboard/payment-list";
import { ReportPageHeader } from "@/components/reports/report-page-header";

export default async function AdminPaymentsPage({
  searchParams,
}: {
  searchParams: Promise<{ tab?: string }>;
}) {
  const resolvedParams = await searchParams;
  const tab = resolvedParams.tab || "overview";

  return (
    <div className="max-w-[1520px] mx-auto w-full flex flex-col gap-6 animate-in fade-in duration-700">
      <ReportPageHeader
        title="Payments Engine"
        subtitle="Monitor all financial transactions and revenue streams"
        iconName="CreditCard"
        hideBackArrow={true}
        tabs={["Overview", "All"]}
        tabParamName="tab"
        activeTab={tab}
      />

      <div className="mt-2">
        <PaymentList tab={tab} />
      </div>
    </div>
  );
}
