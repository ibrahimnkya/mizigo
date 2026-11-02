"use client";
import { Suspense } from "react";

import { useSearchParams } from "next/navigation";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { DataTable } from "@/components/shared/data-table";
import {
  Users,
  ShieldCheck,
  BadgeCheck,
  Activity,
  UserCheck,
} from "lucide-react";
import { format } from "date-fns";
import { ProvisionUserModal } from "@/components/users/provision-user-modal";
import { cn } from "@/lib/utils";

function GlobalUsersPageInner() {
  const {
    data: users,
    isLoading,
    refetch,
  } = useQuery({
    queryKey: ["global-users"],
    queryFn: async () => {
      const { data } = await api.get("/users/global");
      return data.data || data;
    },
  });

  const columns = [
    {
      header: "User",
      accessor: (u: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-8 w-8 rounded-xl flex items-center justify-center",
              u.isActive !== false
                ? "bg-blue-600"
                : "bg-slate-200 grayscale",
            )}
          >
            <Users
              className={cn(
                "w-4 h-4 text-white",
                u.isActive === false && "text-slate-400",
              )}
            />
          </div>
          <div className="flex flex-col">
            <span
              className={cn(
                "font-semibold text-[14px] text-slate-800",
                u.isActive !== false ? "text-slate-800" : "text-slate-400",
              )}
            >
              {u.name}
            </span>
            <span className="text-[11px] text-slate-400 font-medium uppercase tracking-[0.05em] mt-0.5">
              {u.id?.substring(0, 8) || "GLOBAL"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Role",
      accessor: (u: any) => {
        const role = u.role?.name || u.role || "GUEST";
        return (
          <div className="flex flex-col gap-1">
            <span className="inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border border-slate-200 bg-slate-50 text-slate-600 w-fit">
              {role.replace("_", " ")}
            </span>
            <span className="text-[11px] font-medium text-slate-400">
              {u.organization?.name || "Platform"}
            </span>
          </div>
        );
      },
    },
    {
      header: "Status",
      accessor: (u: any) => (
        <span
          className={cn(
            "inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border",
            u.isActive !== false
              ? "bg-emerald-50 text-emerald-700 border-emerald-200"
              : "bg-slate-50 text-slate-500 border-slate-200",
          )}
        >
          {u.isActive !== false ? "Active" : "Suspended"}
        </span>
      ),
    },
    {
      header: "Contact",
      accessor: (u: any) => (
        <div className="flex flex-col gap-0.5">
          <span className="text-[13px] font-medium text-slate-700">{u.email}</span>
          <span className="text-[12px] text-slate-400">{u.phone || "—"}</span>
        </div>
      ),
    },
    {
      header: "Actions",
      accessor: (u: any) => (
        <div className="flex items-center justify-end pr-4">
          <button className="h-8 px-3 bg-white border border-slate-200 hover:bg-slate-50 text-slate-600 rounded-xl text-[12px] font-medium transition-colors">
            Manage
          </button>
        </div>
      ),
    },
  ];

  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  return (
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Global Users"
          subtitle="Manage identity provisioning and system access"
          iconName="Users"
          action={<ProvisionUserModal onSuccess={refetch} />}
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
                    label: "Super Admins",
                    count: users?.filter(
                      (u: any) => (u.role?.name || u.role) === "SUPER_ADMIN",
                    ).length,
                    icon: ShieldCheck,
                    color: "text-rose-600",
                    bg: "bg-rose-50",
                  },
                  {
                    label: "Org Admins",
                    count: users?.filter(
                      (u: any) =>
                        (u.role?.name || u.role) === "ADMIN" ||
                        (u.role?.name || u.role) === "ORG_ADMIN",
                    ).length,
                    icon: BadgeCheck,
                    color: "text-blue-600",
                    bg: "bg-blue-50",
                  },
                  {
                    label: "System Staffs",
                    count: users?.filter(
                      (u: any) => ["CLERK", "TRAIN_GUARD", "STATION_MASTER", "AGENT", "OPERATOR"].includes(u.role?.name || u.role),
                    ).length,
                    icon: UserCheck,
                    color: "text-emerald-600",
                    bg: "bg-emerald-50",
                  },
                  {
                    label: "Total Users",
                    count: users?.length,
                    icon: Users,
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
                      {stat.count || 0}
                    </span>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-white border border-[#E2E2E2] rounded-[20px] flex flex-col min-h-[360px]">
                  <div className="px-5 py-4 border-b border-slate-200 flex items-center gap-2">
                    <Users className="h-4 w-4 text-slate-500" />
                    <h3 className="text-[14px] font-semibold text-slate-800">
                      Identity Provisioning
                    </h3>
                  </div>
                  <div className="p-5 flex flex-col flex-1">
                    <p className="text-[13px] text-slate-500 leading-relaxed mb-5">
                      Users form the core of the platform's authentication
                      matrix. Access levels strictly dictate service capability
                      across all modules.
                    </p>
                    <div className="space-y-2 mt-auto">
                      <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Privileged Access
                        </span>
                        <span className="text-[14px] font-semibold text-emerald-600 tabular-nums">
                          {users?.filter((u: any) =>
                            ["SUPER_ADMIN", "ADMIN", "ORG_ADMIN"].includes(
                              u.role?.name || u.role,
                            ),
                          ).length || 0}
                        </span>
                      </div>
                      <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Total Entities
                        </span>
                        <span className="text-[14px] font-semibold text-blue-600 tabular-nums">
                          {users?.length || 0}
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
                    User Access Distribution
                  </h4>
                  <p className="text-[13px] text-slate-500 max-w-md">
                    Detailed graphical analysis of role distributions and system
                    access metrics will be populated here as new users register.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all" && (
            <div className="bg-white rounded-[20px] border border-[#E2E2E2] overflow-hidden">
              <DataTable
                title="Entity Directory"
                data={users || []}
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

export default function GlobalUsersPage() {
  return (
    <Suspense
      fallback={
        <div className="flex items-center justify-center min-h-[300px]">
          Loading page...
        </div>
      }
    >
      <GlobalUsersPageInner />
    </Suspense>
  );
}
