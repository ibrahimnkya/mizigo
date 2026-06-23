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
  Phone,
  Mail,
  Calendar,
  Building2,
  Activity,
  UserCheck,
  Zap,
  ShieldAlert,
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
      header: "Entity Node",
      accessor: (u: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-10 w-10 rounded-[10px] flex items-center justify-center shadow-lg transition-all duration-300",
              u.isActive !== false
                ? "bg-slate-900 shadow-slate-100"
                : "bg-slate-200 shadow-transparent grayscale",
            )}
          >
            <Users
              className={cn(
                "w-5 h-5 text-white",
                u.isActive === false && "text-slate-400",
              )}
            />
          </div>
          <div className="flex flex-col">
            <span
              className={cn(
                "font-black text-[13px] tracking-tight group-hover:text-blue-600 transition-colors uppercase",
                u.isActive !== false ? "text-slate-900" : "text-slate-400",
              )}
            >
              {u.name}
            </span>
            <span className="text-[10px] text-slate-400 font-bold uppercase tracking-widest leading-none mt-1">
              UID:{u.id?.substring(0, 8) || "GLOBAL"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "System Protocol",
      accessor: (u: any) => {
        const role = u.role?.name || u.role || "GUEST";
        return (
          <div className="flex flex-col gap-1">
            <div className="flex items-center gap-1.5 px-2.5 py-1 bg-slate-50 border border-slate-100 rounded-[10px] w-fit">
              <span className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
                {role.replace("_", " ")}
              </span>
            </div>
            <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest pl-1">
              {u.organization?.name || "ROOT · PLATFORM"}
            </span>
          </div>
        );
      },
    },
    {
      header: "Service Capability",
      accessor: (u: any) => (
        <div className="flex items-center gap-2">
          <div
            className={cn(
              "w-1.5 h-1.5 rounded-full",
              u.isActive !== false
                ? "bg-emerald-500 shadow-[0_0_8px_rgba(16,185,129,0.5)]"
                : "bg-slate-300",
            )}
          />
          <span className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em]">
            {u.isActive !== false ? "Authorized Node" : "Access Suspended"}
          </span>
        </div>
      ),
    },
    {
      header: "Fee Protocol",
      accessor: (u: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-2 text-slate-700 font-black text-[12px] tracking-tight">
            <span>{u.email}</span>
          </div>
          <div className="flex items-center gap-2 text-slate-400 font-bold text-[10px] uppercase tracking-widest">
            <span>{u.phone || "NO SECURE LINK"}</span>
          </div>
        </div>
      ),
    },
    {
      header: "Action Suite",
      accessor: (u: any) => (
        <div className="flex items-center justify-end pr-4">
          <button className="h-9 px-4 bg-slate-900 hover:bg-blue-600 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm">
            Manage
          </button>
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
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
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
                      (u: any) => (u.role?.name || u.role) === "OPERATOR",
                    ).length,
                    icon: UserCheck,
                    color: "text-emerald-600",
                    bg: "bg-emerald-50",
                  },
                  {
                    label: "Network Nodes",
                    count: users?.length,
                    icon: Users,
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
                        {stat.count || 0}
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
                      <Users
                        className="h-6 w-6 text-blue-400"
                        strokeWidth={2.5}
                      />
                    </div>
                    <h3 className="text-[24px] font-black tracking-tight leading-none mb-3">
                      Identity Provisioning
                    </h3>
                    <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-80 mb-6">
                      Users form the core of the platform's authentication
                      matrix. Access levels strictly dictate service capability
                      across all modules.
                    </p>
                  </div>

                  <div className="relative z-10 space-y-3">
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          Privileged Access
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          Admins
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-emerald-400 tabular-nums">
                        {users?.filter((u: any) =>
                          ["SUPER_ADMIN", "ADMIN", "ORG_ADMIN"].includes(
                            u.role?.name || u.role,
                          ),
                        ).length || 0}
                      </span>
                    </div>
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          Total Entities
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          System Global
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-blue-400 tabular-nums">
                        {users?.length || 0}
                      </span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-16 h-16 rounded-full bg-blue-50 flex items-center justify-center mb-4">
                    <Activity className="w-8 h-8 text-blue-500" />
                  </div>
                  <h4 className="text-[16px] font-black text-slate-900 mb-2">
                    User Access Distribution
                  </h4>
                  <p className="text-[13px] text-slate-400 max-w-md">
                    Detailed graphical analysis of role distributions and system
                    access metrics will be populated here as new users register.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all" && (
            <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden p-1">
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
    </div>
  );
}

export default function GlobalUsersPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">
          Loading page...
        </div>
      }
    >
      <GlobalUsersPageInner />
    </Suspense>
  );
}
