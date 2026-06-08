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
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
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
    </div>
  );
}
