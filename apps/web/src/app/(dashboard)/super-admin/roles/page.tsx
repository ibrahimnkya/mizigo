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
  SUPER_ADMIN: "bg-rose-50 text-rose-600 border-rose-100",
  ADMIN: "bg-blue-50 text-blue-600 border-blue-100",
  OPERATOR: "bg-emerald-50 text-emerald-700 border-emerald-100",
  AGENT: "bg-amber-50 text-amber-700 border-amber-100",
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
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="h-10 w-10 border-4 border-slate-200 border-t-rose-600 rounded-full animate-spin" />
      </div>
    );
  }

  const roles = (rolesData || []).map((r: any) => ({
    ...r,
    displayName: r.name.replace("_", " "),
    permissionsList: r.permissions?.map((p: any) => p.permission?.name) || [],
    color: ROLE_COLORS[r.name] || "bg-slate-50 text-slate-600 border-slate-100",
  }));

  const columns = [
    {
      header: "Role Name",
      accessor: (role: any) => (
        <div className="flex items-center gap-3">
          <div className="h-10 w-10 rounded-[10px] bg-slate-900 flex items-center justify-center shadow-lg shadow-slate-200">
            <Shield className="h-5 w-5 text-blue-400" />
          </div>
          <div className="flex flex-col">
            <span className="font-black text-slate-900 text-[14px] tracking-tight group-hover:text-blue-600 transition-colors uppercase">
              {role.name?.replace("_", " ")}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest leading-none mt-1">
              Role ID · {role.id?.slice(0, 8).toUpperCase()}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Access Status",
      accessor: (role: any) => (
        <div className="flex items-center gap-2">
          <div className="w-1.5 h-1.5 rounded-full bg-emerald-500 shadow-[0_0_8px_rgba(16,185,129,0.5)]" />
          <span className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em]">
            Validated Node
          </span>
        </div>
      ),
    },
    {
      header: "Permissions",
      accessor: (role: any) => (
        <div
          className={cn(
            "inline-flex items-center gap-2 px-3 py-1.5 rounded-xl border shadow-sm transition-all bg-blue-50 border-blue-100 text-blue-600 ring-4 ring-blue-500/5",
          )}
        >
          <ShieldCheck size={12} />
          <span className="text-[10px] font-black uppercase tracking-widest">
            {role.permissionsList.length} Items
          </span>
        </div>
      ),
    },
    {
      header: "Action Suite",
      accessor: (role: any) => (
        <div className="flex items-center justify-end gap-3 pr-4">
          <UpdateRoleModal role={role} onSuccess={refetch} />
          <button className="h-9 w-9 flex items-center justify-center text-slate-400 hover:text-blue-600 transition-colors bg-slate-50 rounded-lg border border-slate-100">
            <Settings size={14} strokeWidth={2.5} />
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
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
            <div className="space-y-10">
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
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
                    className="flex flex-col p-6 bg-white border border-slate-100 rounded-[12px] shadow-sm hover:shadow-xl hover:shadow-slate-200/50 transition-all duration-300"
                  >
                    <div className="flex items-center justify-between mb-5">
                      <div className={cn("p-2.5 rounded-xl", stat.bg)}>
                        <stat.icon
                          className={cn("w-5 h-5", stat.color)}
                          strokeWidth={2.5}
                        />
                      </div>
                      <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest leading-none">
                        {stat.label}
                      </span>
                    </div>
                    <div className="flex flex-col">
                      <span className="text-[28px] font-black text-slate-900 tabular-nums leading-none tracking-tight">
                        {stat.count}
                      </span>
                    </div>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-10">
                <div className="lg:col-span-1 bg-slate-900 rounded-[20px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[400px]">
                  <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-rose-500/10 rounded-full blur-[100px]" />

                  <div className="relative z-10">
                    <div className="h-14 w-14 rounded-[1.2rem] bg-white/10 flex items-center justify-center mb-8 border border-white/10 backdrop-blur-md shadow-2xl">
                      <Fingerprint
                        className="h-7 w-7 text-rose-400"
                        strokeWidth={2.5}
                      />
                    </div>
                    <h3 className="text-[24px] font-black tracking-tight leading-none mb-3">
                      Security Infrastructure
                    </h3>
                    <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-70 mb-8">
                      Roles define the cryptographic boundaries of operation.
                      Every privilege assigned creates a secure path for data
                      interaction.
                    </p>
                  </div>

                  <div className="relative z-10 space-y-4">
                    <div className="px-5 py-4 bg-white/5 rounded-xl border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-500 group-hover:text-white transition-colors">
                          Protocol Count
                        </span>
                        <span className="text-[9px] font-bold text-slate-600 uppercase tracking-tight">
                          Active Roles
                        </span>
                      </div>
                      <span className="text-[16px] font-black text-rose-400 tabular-nums">
                        {roles.length}
                      </span>
                    </div>
                    <div className="px-5 py-4 bg-white/5 rounded-xl border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-500 group-hover:text-white transition-colors">
                          Compliance Status
                        </span>
                        <span className="text-[9px] font-bold text-slate-600 uppercase tracking-tight">
                          System Global
                        </span>
                      </div>
                      <span className="text-[12px] font-black text-emerald-400 flex items-center gap-2">
                        <div className="w-1.5 h-1.5 bg-emerald-400 rounded-full animate-pulse" />
                        VALIDATED
                      </span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[20px] border border-slate-100 shadow-sm p-12 flex flex-col items-center justify-center text-center relative overflow-hidden">
                  <div className="absolute top-0 right-0 w-64 h-64 bg-blue-50/50 rounded-full blur-3xl -mr-32 -mt-32" />
                  <div className="w-20 h-20 rounded-[2rem] bg-blue-50 flex items-center justify-center mb-6 relative z-10 border border-blue-100">
                    <Activity
                      className="w-10 h-10 text-blue-600"
                      strokeWidth={2.5}
                    />
                  </div>
                  <h4 className="text-[18px] font-black text-slate-900 mb-2 relative z-10">
                    Access Heatmap
                  </h4>
                  <p className="text-[13px] text-slate-400 max-w-md font-bold leading-relaxed relative z-10">
                    Graphical analysis of role usage and privilege distribution
                    across the platform's authentication nodes.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "registry" && (
            <div className="bg-white rounded-[20px] border border-slate-200/60 shadow-sm overflow-hidden p-1 animate-in slide-in-from-bottom-2 duration-500">
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
    </div>
  );
}

export default function RolesPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">
          Loading page...
        </div>
      }
    >
      <RolesPageInner />
    </Suspense>
  );
}
