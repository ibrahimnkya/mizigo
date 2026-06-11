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
    <div className="h-full flex flex-col overflow-hidden bg-[#f8f9fb]">
      <div className="max-w-[1520px] w-full mx-auto flex-1 flex flex-col gap-4 min-h-0">
        <div className="flex-shrink-0 [&_>_div]:!mb-0">
          <ReportPageHeader
            title="Payments Engine"
            subtitle="Monitor all financial transactions and revenue streams"
            iconName="CreditCard"
            hideBackArrow={true}
            tabs={["Overview", "All"]}
            tabParamName="tab"
            activeTab={tab}
          />
        </div>

        <div className="flex-1 min-h-0 animate-in fade-in duration-700">
          <PaymentList tab={tab} />
        </div>
      </div>
    </div>
  );
}
