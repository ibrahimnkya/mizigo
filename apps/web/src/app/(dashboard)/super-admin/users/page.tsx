"use client";
import { Suspense } from "react";

import { useRouter, useSearchParams } from "next/navigation";
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
import { PeopleOverview } from "@/components/users/people-overview";

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

  const router = useRouter();
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
            <PeopleOverview
              users={Array.isArray(users) ? users : (users as any)?.data ?? []}
              loading={isLoading}
              title="Platform admins"
              manageLabel="Manage admins"
              onManage={() => router.push("?tab=all")}
            />
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
