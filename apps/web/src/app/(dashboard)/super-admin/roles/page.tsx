"use client";

import { useSearchParams } from "next/navigation";
import { useState, Suspense } from "react";
import { useQuery } from "@tanstack/react-query";
import { cn } from "@/lib/utils";
import api from "@/lib/api/client";
import { CreateRoleModal } from "@/components/roles/create-role-modal";
import { UpdateRoleModal } from "@/components/roles/update-role-modal";
import { RoleDetailsModal } from "@/components/roles/role-details-modal";
import { DataTable } from "@/components/shared/data-table";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import {
  ShieldCheck,
  Shield,
  Settings,
  CheckCircle2,
  Activity,
  Fingerprint,
  Terminal,
  Database,
} from "lucide-react";

const ROLE_COLORS: Record<string, string> = {
  SUPER_ADMIN: "bg-rose-50 text-rose-600 border-rose-200",
  ADMIN: "bg-blue-50 text-blue-600 border-blue-200",
  STATION_MASTER: "bg-amber-50 text-amber-700 border-amber-200",
  CLERK: "bg-emerald-50 text-emerald-700 border-emerald-200",
  TRAIN_GUARD: "bg-cyan-50 text-cyan-700 border-cyan-200",
  AGENT: "bg-violet-50 text-violet-700 border-violet-200",
  // Legacy
  OPERATOR: "bg-emerald-50 text-emerald-700 border-emerald-200",
};

function RolesPageInner() {
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";
  const [selectedRole, setSelectedRole] = useState<any>(null);
  const [detailsOpen, setDetailsOpen] = useState(false);

  const {
    data: rolesData,
    isLoading,
    refetch,
  } = useQuery({
    queryKey: ["roles-registry"],
    queryFn: async () => {
      const { data } = await api.get("/roles");
      return data.data || data;
    },
  });

  if (isLoading) {
    return (
      <div className="flex items-center justify-center min-h-[300px]">
        <div className="h-8 w-8 border-4 border-slate-200 border-t-rose-600 rounded-full animate-spin" />
      </div>
    );
  }

  const roles = (rolesData || []).map((r: any) => ({
    ...r,
    displayName: r.name.replace("_", " "),
    permissionsList: r.permissions?.map((p: any) => p.permission?.name) || [],
    color: ROLE_COLORS[r.name] || "bg-slate-50 text-slate-600 border-slate-200",
  }));

  const columns = [
    {
      header: "Role Name",
      accessor: (role: any) => (
        <div className="flex items-center gap-3">
          <div className="h-8 w-8 rounded-xl bg-blue-50 border border-blue-100 flex items-center justify-center text-blue-600">
            <Shield className="h-4 w-4 text-blue-400" />
          </div>
          <div className="flex flex-col">
            <span className="font-semibold text-[14px] text-slate-800">
              {role.name?.replace("_", " ")}
            </span>
            <span className="text-[11px] font-medium text-slate-400 uppercase tracking-[0.05em] mt-0.5">
              {role.id?.slice(0, 8).toUpperCase()}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Status",
      accessor: (role: any) => (
        <span className="inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border border-emerald-200 bg-emerald-50 text-emerald-700">
          Active
        </span>
      ),
    },
    {
      header: "Permissions",
      accessor: (role: any) => (
        <span
          className={cn(
            "inline-flex items-center gap-1.5 px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border border-blue-200 bg-blue-50 text-blue-700",
          )}
        >
          <ShieldCheck size={10} />
          {role.permissionsList.length} Items
        </span>
      ),
    },
    {
      header: "Actions",
      accessor: (role: any) => (
        <div className="flex items-center justify-end gap-2 pr-4">
          <UpdateRoleModal role={role} onSuccess={refetch} />
          <button className="h-8 w-8 flex items-center justify-center bg-white border border-slate-200 hover:bg-slate-50 text-slate-500 rounded-xl transition-colors">
            <Settings size={13} strokeWidth={2.5} />
          </button>
        </div>
      ),
    },
  ];

  return (
    <>
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Protocol Management"
          subtitle="Manage global system security nodes and privilege matrix"
          iconName="ShieldCheck"
          action={<CreateRoleModal onSuccess={refetch} />}
          tabs={["Overview", "Registry"]}
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
                    label: "Security Nodes",
                    count: roles.length,
                    icon: Shield,
                    color: "text-rose-600",
                    bg: "bg-rose-50",
                  },
                  {
                    label: "Active Protocols",
                    count: "Strict",
                    icon: ShieldCheck,
                    color: "text-emerald-600",
                    bg: "bg-emerald-50",
                  },
                  {
                    label: "Privilege Matrix",
                    count: "Global",
                    icon: Database,
                    color: "text-blue-600",
                    bg: "bg-blue-50",
                  },
                  {
                    label: "Compliance Index",
                    count: "100%",
                    icon: Activity,
                    color: "text-indigo-600",
                    bg: "bg-indigo-50",
                  },
                ].map((stat, i) => (
                  <div
                    key={i}
                    className="flex flex-col p-5 bg-white border border-[#E2E2E2] rounded-[20px]"
                  >
                    <div className="flex items-center justify-between mb-3">
                      <div className={cn("p-2 rounded-xl", stat.bg)}>
                        <stat.icon
                          className={cn("w-4 h-4", stat.color)}
                          strokeWidth={2.5}
                        />
                      </div>
                      <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                        {stat.label}
                      </span>
                    </div>
                    <span className="text-[26px] font-semibold text-slate-900 tabular-nums leading-none">
                      {stat.count}
                    </span>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-white border border-[#E2E2E2] rounded-[20px] flex flex-col min-h-[360px]">
                  <div className="px-5 py-4 border-b border-slate-200 flex items-center gap-2">
                    <Fingerprint className="h-4 w-4 text-slate-500" strokeWidth={2.5} />
                    <h3 className="text-[14px] font-semibold text-slate-800">
                      Security Infrastructure
                    </h3>
                  </div>
                  <div className="p-5 flex flex-col flex-1">
                    <p className="text-[13px] text-slate-500 leading-relaxed mb-5">
                      Roles define the cryptographic boundaries of operation.
                      Every privilege assigned creates a secure path for data
                      interaction.
                    </p>
                    <div className="space-y-2 mt-auto">
                      <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Protocol Count
                        </span>
                        <span className="text-[14px] font-semibold text-rose-600 tabular-nums">
                          {roles.length}
                        </span>
                      </div>
                      <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Compliance
                        </span>
                        <span className="inline-flex items-center gap-1.5 px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border border-emerald-200 bg-emerald-50 text-emerald-700">
                          Validated
                        </span>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[20px] border border-[#E2E2E2] p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-12 h-12 rounded-xl bg-blue-50 flex items-center justify-center mb-4">
                    <Activity className="w-6 h-6 text-blue-600" strokeWidth={2.5} />
                  </div>
                  <h4 className="text-[14px] font-semibold text-slate-800 mb-2">
                    Access Heatmap
                  </h4>
                  <p className="text-[13px] text-slate-500 max-w-md leading-relaxed">
                    Graphical analysis of role usage and privilege distribution
                    across the platform's authentication nodes.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "registry" && (
            <div className="bg-white rounded-[20px] border border-[#E2E2E2] overflow-hidden animate-in slide-in-from-bottom-2 duration-500">
              <DataTable
                title="Security Role Registry"
                data={roles || []}
                columns={columns}
                isLoading={isLoading}
                hideInternalSearch={false}
                hideActions={true}
                searchKey="name"
                searchPlaceholder="Filter protocols by name..."
                onRowClick={(role) => {
                  setSelectedRole(role);
                  setDetailsOpen(true);
                }}
              />
            </div>
          )}
        </div>
      </div>

    <RoleDetailsModal
      role={selectedRole}
      open={detailsOpen}
      onOpenChange={setDetailsOpen}
    />
    </>
  );
}

export default function RolesPage() {
  return (
    <Suspense
      fallback={
        <div className="flex items-center justify-center min-h-[300px]">
          Loading page...
        </div>
      }
    >
      <RolesPageInner />
    </Suspense>
  );
}
