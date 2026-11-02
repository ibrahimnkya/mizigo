"use client";
import { Suspense } from "react";

import { useSearchParams } from "next/navigation";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useOrganizations } from "@/modules/organizations/use-organizations";
import { DataTable } from "@/components/shared/data-table";
import { format } from "date-fns";
import {
  Building2,
  Globe,
  Activity,
  Zap,
  ShieldCheck,
  Plus,
} from "lucide-react";
import { CreateOrganizationModal } from "@/components/organizations/create-organization-modal";
import { UpdateOrganizationModal } from "@/components/organizations/update-organization-modal";
import { ViewOrganizationModal } from "@/components/organizations/view-organization-modal";
import { StatusConfirmationModal } from "@/components/organizations/status-confirmation-modal";
import { cn } from "@/lib/utils";

function OrganizationsPageInner() {
  // Get list of organizations
  const { data: organizations, isLoading, refetch } = useOrganizations();

  // Basic stats
  const totalOrgs = organizations?.length || 0;
  const activeOrgs = organizations?.filter((o: any) => o.isActive).length || 0;
  const averageRate = organizations?.length
    ? (
        (organizations.reduce(
          (acc: number, o: any) => acc + (o.commissionRate || 0),
          0,
        ) /
          totalOrgs) *
        100
      ).toFixed(1)
    : "0";
  const activeRatio = totalOrgs
    ? ((activeOrgs / totalOrgs) * 100).toFixed(1) + "%"
    : "0%";

  // Table columns
  const columns = [
    {
      header: "Organization",
      accessor: (org: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-8 w-8 rounded-xl flex items-center justify-center",
              org.isActive
                ? "bg-blue-600"
                : "bg-slate-200 grayscale",
            )}
          >
            <Building2
              className={cn(
                "h-4 w-4 text-white",
                !org.isActive && "text-slate-400",
              )}
            />
          </div>
          <div className="flex flex-col">
            <span
              className={cn(
                "font-semibold text-[14px] text-slate-800",
                !org.isActive && "text-slate-400",
              )}
            >
              {org.name}
            </span>
            <span className="text-[11px] text-slate-400 font-medium uppercase tracking-[0.05em] mt-0.5">
              {org.id.substring(0, 8)}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Commission Rate",
      accessor: (org: any) => (
        <span className="inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border border-blue-200 bg-blue-50 text-blue-700">
          {org.commissionRate !== null
            ? `${(org.commissionRate * 100).toFixed(1)}%`
            : "0%"}
        </span>
      ),
    },
    {
      header: "Status",
      accessor: (org: any) => (
        <span
          className={cn(
            "inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border",
            org.isActive
              ? "bg-emerald-50 text-emerald-700 border-emerald-200"
              : "bg-slate-50 text-slate-500 border-slate-200",
          )}
        >
          {org.isActive ? "Active" : "Inactive"}
        </span>
      ),
    },
    {
      header: "Registered On",
      accessor: (org: any) => (
        <div className="flex flex-col">
          <span className="text-[13px] font-medium text-slate-700">
            {format(new Date(org.createdAt), "MMM dd, yyyy")}
          </span>
        </div>
      ),
    },
    {
      header: "Actions",
      accessor: (org: any) => (
        <div className="flex items-center justify-end gap-2 pr-4">
          <ViewOrganizationModal organization={org} />
          <UpdateOrganizationModal organization={org} onSuccess={refetch} />
          <StatusConfirmationModal organization={org} onSuccess={refetch} />
        </div>
      ),
    },
  ];

  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  return (
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Organizations"
          subtitle="Manage all system entities and operators"
          iconName="Building2"
          action={<CreateOrganizationModal onSuccess={refetch} />}
          tabs={["Overview", "All"]}
          tabParamName="tab"
          activeTab={tab}
          hideBackArrow={true}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-6">
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                {[
                  {
                    label: "Active Partners",
                    count: activeOrgs,
                    icon: ShieldCheck,
                    color: "text-blue-600",
                    bg: "bg-blue-50",
                  },
                  {
                    label: "Total Organizations",
                    count: totalOrgs,
                    icon: Building2,
                    color: "text-emerald-600",
                    bg: "bg-emerald-50",
                  },
                  {
                    label: "Average Commission",
                    count: `${averageRate}%`,
                    icon: Zap,
                    color: "text-indigo-600",
                    bg: "bg-indigo-50",
                  },
                  {
                    label: "Active Ratio",
                    count: activeRatio,
                    icon: Globe,
                    color: "text-slate-600",
                    bg: "bg-slate-50",
                  },
                ].map((stat, i) => (
                  <div
                    key={i}
                    className="flex flex-col p-5 bg-white border border-[#E2E2E2] rounded-[20px]"
                  >
                    <div className="flex items-center justify-between mb-3">
                      <div className={cn("p-2 rounded-xl", stat.bg)}>
                        <stat.icon className={cn("w-4 h-4", stat.color)} />
                      </div>
                      <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                        {stat.label}
                      </span>
                    </div>
                    <span className="text-[26px] font-semibold text-slate-900 tabular-nums">
                      {stat.count}
                    </span>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-white border border-[#E2E2E2] rounded-[20px] flex flex-col min-h-[360px]">
                  <div className="px-5 py-4 border-b border-slate-200 flex items-center gap-2">
                    <Building2 className="h-4 w-4 text-slate-500" />
                    <h3 className="text-[14px] font-semibold text-slate-800">
                      Organization Network
                    </h3>
                  </div>
                  <div className="p-5 flex flex-col flex-1">
                    <p className="text-[13px] text-slate-500 leading-relaxed mb-5">
                      Organizations are the root entities that own stations and
                      fleet. Commissions are applied per organization.
                    </p>
                    <div className="space-y-2 mt-auto">
                      <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Active Partners
                        </span>
                        <span className="text-[14px] font-semibold text-emerald-600 tabular-nums">
                          {activeOrgs}
                        </span>
                      </div>
                      <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Total Network
                        </span>
                        <span className="text-[14px] font-semibold text-blue-600 tabular-nums">
                          {totalOrgs}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[20px] border border-[#E2E2E2] p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-12 h-12 rounded-xl bg-blue-50 flex items-center justify-center mb-4">
                    <Activity className="w-6 h-6 text-blue-600" />
                  </div>
                  <h4 className="text-[14px] font-semibold text-slate-800 mb-2">
                    Growth & Commission Trends
                  </h4>
                  <p className="text-[13px] text-slate-500 max-w-md">
                    Detailed graphical analysis of organizational growth and
                    commission distributions will be populated here as data
                    accumulates.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all" && (
            <div className="bg-white rounded-[20px] border border-[#E2E2E2] overflow-hidden">
              <DataTable
                title="Organization Directory"
                data={organizations || []}
                columns={columns}
                isLoading={isLoading}
                hideInternalSearch={true}
                hideActions={true}
              />
            </div>
          )}
        </div>
    </div>
  );
}

export default function OrganizationsPage() {
  return (
    <Suspense
      fallback={
        <div className="flex items-center justify-center min-h-[300px]">
          Loading page...
        </div>
      }
    >
      <OrganizationsPageInner />
    </Suspense>
  );
}
