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
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
        <ReportPageHeader
          title="Payments Engine"
          subtitle="Monitor all financial transactions and revenue streams"
          iconName="CreditCard"
          hideBackArrow={true}
          tabs={["Overview", "All"]}
          tabParamName="tab"
          activeTab={tab}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          <PaymentList tab={tab} />
        </div>
      </div>
    </div>
  );
}
