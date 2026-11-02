"use client";
import { ReportSummary } from "@/components/reports/report-kit";
import { PrimaryPill } from "@/components/shared/overview-kit";
import { Building2 as OrgIcon, CheckCircle2, PauseCircle, Percent } from "lucide-react";
import { Suspense } from "react";

import { useRouter, useSearchParams } from "next/navigation";
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

  const router = useRouter();
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
          {tab.toLowerCase() === "overview" && (() => {
            const orgs: any[] = organizations ?? [];
            const active = orgs.filter((o) => o.isActive).length;
            const rates = orgs.filter((o) => o.commissionRate != null).map((o) => o.commissionRate * 100);
            const avgRate = rates.length ? rates.reduce((n, r) => n + r, 0) / rates.length : 0;
            return (
              <div className="flex flex-col gap-5">
                <ReportSummary
                  label="Organizations"
                  value={isLoading ? "…" : String(orgs.length)}
                  note={`${active} active · ${orgs.length - active} paused`}
                  loading={isLoading}
                  chips={[
                    { label: "Active", value: String(active), icon: CheckCircle2 },
                    { label: "Paused", value: String(orgs.length - active), icon: PauseCircle },
                    { label: "Average commission", value: rates.length ? `${avgRate.toFixed(1)}%` : "—", icon: Percent },
                  ]}
                />
                <section className="overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white">
                  <div className="flex flex-wrap items-center justify-between gap-3 border-b border-slate-100 px-5 py-4">
                    <div>
                      <h2 className="text-[17px] font-semibold text-[#1C1C1E]">Your organizations</h2>
                      <p className="text-[13px] text-slate-500">Partners running parcels on the platform</p>
                    </div>
                    <PrimaryPill onClick={() => router.push("?tab=all")}>Manage organizations</PrimaryPill>
                  </div>
                  {orgs.length === 0 ? (
                    <p className="px-6 py-12 text-center text-[14px] text-slate-400">No organizations yet.</p>
                  ) : (
                    <div className="grid gap-4 p-5 sm:grid-cols-2 xl:grid-cols-3">
                      {orgs.map((o) => (
                        <div key={o.id} className="rounded-[20px] border border-[#E2E2E2] p-4">
                          <div className="flex items-start justify-between gap-3">
                            <div className="flex min-w-0 items-center gap-3">
                              <span className="flex h-11 w-11 shrink-0 items-center justify-center overflow-hidden rounded-2xl bg-[#FBF1F2]">
                                {o.logoUrl ? (
                                  // eslint-disable-next-line @next/next/no-img-element
                                  <img src={o.logoUrl} alt="" className="h-full w-full object-contain" />
                                ) : (
                                  <Building2 size={19} className="text-[#5C0B19]" />
                                )}
                              </span>
                              <div className="min-w-0">
                                <p className="truncate text-[16px] font-semibold text-[#1C1C1E]">{o.name}</p>
                                <p className="truncate text-[12px] text-slate-400">{o.email || o.phone || o.slug || ""}</p>
                              </div>
                            </div>
                            <span className={cn("shrink-0 rounded-full px-2.5 py-1 text-[12px] font-semibold", o.isActive ? "bg-emerald-50 text-emerald-700" : "bg-slate-100 text-slate-500")}>
                              {o.isActive ? "Active" : "Paused"}
                            </span>
                          </div>
                          <div className="mt-4 grid grid-cols-2 gap-2">
                            <div className="rounded-2xl bg-[#F7F5F4] px-3 py-2.5">
                              <p className="text-[12px] text-slate-500">Commission</p>
                              <p className="text-[16px] font-semibold text-[#1C1C1E]">{o.commissionRate != null ? `${(o.commissionRate * 100).toFixed(1)}%` : "—"}</p>
                            </div>
                            <div className="rounded-2xl bg-[#F7F5F4] px-3 py-2.5">
                              <p className="text-[12px] text-slate-500">Joined</p>
                              <p className="text-[16px] font-semibold text-[#1C1C1E]">{o.createdAt ? new Date(o.createdAt).toLocaleDateString("en-GB", { month: "short", year: "numeric" }) : "—"}</p>
                            </div>
                          </div>
                        </div>
                      ))}
                    </div>
                  )}
                </section>
              </div>
            );
          })()}

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
