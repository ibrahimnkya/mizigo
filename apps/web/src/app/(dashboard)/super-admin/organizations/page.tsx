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
              "h-10 w-10 rounded-[10px] flex items-center justify-center shadow-lg transition-all duration-300",
              org.isActive
                ? "bg-slate-900 shadow-slate-100"
                : "bg-slate-200 shadow-transparent grayscale",
            )}
          >
            <Building2
              className={cn(
                "h-5 w-5 text-white",
                !org.isActive && "text-slate-400",
              )}
            />
          </div>
          <div className="flex flex-col">
            <span
              className={cn(
                "font-black text-[14px] tracking-tight",
                org.isActive ? "text-slate-900" : "text-slate-400",
              )}
            >
              {org.name}
            </span>
            <span className="text-[10px] text-slate-400 font-bold uppercase tracking-widest mt-1">
              {org.id.substring(0, 8)} · ID
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Commission Rate",
      accessor: (org: any) => (
        <div className="flex items-center gap-2">
          <div className="p-1 px-2.5 bg-blue-50 border border-blue-100 rounded-[10px] flex items-center gap-2">
            <span className="text-[12px] font-black text-blue-700">
              {org.commissionRate !== null
                ? `${(org.commissionRate * 100).toFixed(1)}%`
                : "0%"}
            </span>
          </div>
          <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
            Rate
          </span>
        </div>
      ),
    },
    {
      header: "Status",
      accessor: (org: any) => (
        <div className="flex items-center gap-2">
          <div
            className={cn(
              "w-1.5 h-1.5 rounded-full",
              org.isActive
                ? "bg-emerald-500 shadow-[0_0_8px_rgba(16,185,129,0.5)]"
                : "bg-slate-300 shadow-none",
            )}
          />
          <span className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em]">
            {org.isActive ? "Active Node" : "Restricted"}
          </span>
        </div>
      ),
    },
    {
      header: "Registered On",
      accessor: (org: any) => (
        <div className="flex flex-col">
          <span className="text-[12px] font-bold text-slate-600">
            {format(new Date(org.createdAt), "MMM dd, yyyy")}
          </span>
          <span className="text-[9px] text-slate-300 font-black uppercase tracking-widest mt-0.5">
            CREATED
          </span>
        </div>
      ),
    },
    {
      header: "Action Suite",
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
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
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
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
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
                    className="flex flex-col p-6 bg-white border border-slate-100 rounded-[10px] shadow-sm group hover:border-slate-300 transition-all hover:shadow-xl hover:shadow-slate-100/50"
                  >
                    <div className="flex items-center justify-between mb-4">
                      <div className={cn("p-2.5 rounded-[10px]", stat.bg)}>
                        <stat.icon className={cn("w-5 h-5", stat.color)} />
                      </div>
                      <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest leading-none">
                        {stat.label}
                      </span>
                    </div>
                    <div className="flex items-baseline gap-2">
                      <span className="text-3xl font-black text-slate-900 tabular-nums">
                        {stat.count}
                      </span>
                    </div>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-slate-900 rounded-[10px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[400px]">
                  <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-blue-500/10 rounded-full blur-[100px]" />

                  <div className="relative z-10">
                    <div className="h-12 w-12 rounded-[10px] bg-white/10 flex items-center justify-center mb-8 border border-white/10 backdrop-blur-md shadow-2xl shadow-blue-500/10">
                      <Building2
                        className="h-6 w-6 text-blue-400"
                        strokeWidth={2.5}
                      />
                    </div>
                    <h3 className="text-[24px] font-black tracking-tight leading-none mb-3">
                      Organization Network
                    </h3>
                    <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-80 mb-6">
                      Organizations are the root entities that own stations and
                      fleet. Commissions are applied per organization.
                    </p>
                  </div>

                  <div className="relative z-10 space-y-3">
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          Active Partners
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          Operational
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-emerald-400 tabular-nums">
                        {activeOrgs}
                      </span>
                    </div>
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          Total Network
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          Registered
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-blue-400 tabular-nums">
                        {totalOrgs}
                      </span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-16 h-16 rounded-full bg-blue-50 flex items-center justify-center mb-4">
                    <Activity className="w-8 h-8 text-blue-500" />
                  </div>
                  <h4 className="text-[16px] font-black text-slate-900 mb-2">
                    Growth & Commission Trends
                  </h4>
                  <p className="text-[13px] text-slate-400 max-w-md">
                    Detailed graphical analysis of organizational growth and
                    commission distributions will be populated here as data
                    accumulates.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all" && (
            <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden p-1">
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
    </div>
  );
}

export default function OrganizationsPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">
          Loading page...
        </div>
      }
    >
      <OrganizationsPageInner />
    </Suspense>
  );
}
