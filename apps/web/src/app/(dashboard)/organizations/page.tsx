import { auth } from "@/auth";
import { redirect } from "next/navigation";
import { OrganizationList } from "@/components/organizations/organization-list";
import { DashboardTabs } from "@/components/dashboard/dashboard-tabs";
import { ReportPageHeader } from "@/components/reports/report-page-header";

export default async function OrganizationsPage({
  searchParams,
}: {
  searchParams: Promise<{ tab?: string }>;
}) {
  const session = await auth();

  // Only SUPER_ADMIN allowed
  if (!session?.user || session.user.role !== "SUPER_ADMIN") {
    redirect("/dashboard");
  }

  const resolvedParams = await searchParams;
  const tab = resolvedParams.tab || "overview";

  return (
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Organizations"
          subtitle="Manage all system entities and operators"
          iconName="Building2"
          tabs={["Overview", "All"]}
          tabParamName="tab"
          activeTab={tab}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          <OrganizationList tab={tab} />
        </div>
    </div>
  );
}
