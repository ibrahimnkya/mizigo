"use client";

import { Suspense, useState } from "react";
import { useUsers } from "@/modules/users/use-users";
import { DataTable } from "@/components/shared/data-table";
import { StatusBadge } from "@/components/shared/status-badge";
import { format } from "date-fns";
import {
  UserCog,
  Plus,
  Shield,
  UserCircle,
  Users,
  ShieldAlert,
  Train,
  Activity,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { CreateUserModal } from "@/components/users/create-user-modal";
import { StaffDetailModal } from "@/components/users/staff-detail-modal";
import { useSession } from "next-auth/react";
import { useSearchParams } from "next/navigation";
import { ReportPageHeader } from "@/components/reports/report-page-header";

function AdminUsersPageInner() {
  const { data: session } = useSession();
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  // Sub-role Tab State (within staffs tab)
  const [activeTab, setActiveTab] = useState<
    "ADMIN" | "STATION_MASTER" | "CLERK" | "TRAIN_GUARD"
  >("ADMIN");

  // Fetch filtered users for current active sub-role tab
  const { data: users, isLoading } = useUsers({ role: activeTab });

  // Fetch all users to calculate global statistics cards
  const { data: allUsers } = useUsers();

  const [selectedStaffId, setSelectedStaffId] = useState<string | null>(null);
  const currentUserRole = session?.user?.role || "OPERATOR";

  // Calculate statistics
  const totalStaff = allUsers?.length || 0;
  const activeStaff = allUsers?.filter((u: any) => u.isActive).length || 0;
  const stationManagers =
    allUsers?.filter((u: any) => u.role?.name === "STATION_MASTER").length || 0;
  const clerksAndGuards =
    allUsers?.filter(
      (u: any) => u.role?.name === "CLERK" || u.role?.name === "TRAIN_GUARD",
    ).length || 0;

  const columns = [
    {
      header: "Name & Contact",
      accessor: (user: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-10 w-10 rounded-[10px] flex items-center justify-center shadow-lg transition-all duration-300",
              user.isActive
                ? "bg-slate-900 shadow-slate-100"
                : "bg-slate-200 shadow-transparent grayscale",
            )}
          >
            <UserCircle
              className={cn(
                "h-5 w-5 text-white",
                !user.isActive && "text-slate-400",
              )}
            />
          </div>
          <div className="flex flex-col">
            <div className="flex items-center gap-2">
              <span className="font-black text-slate-900 text-[13px] tracking-tight group-hover:text-blue-600 transition-colors uppercase">
                {user.name}
              </span>
              {user.role?.name && (
                <span
                  className={cn(
                    "text-[8px] font-extrabold px-1.5 py-0.5 rounded-md uppercase tracking-wider shrink-0",
                    user.role.name === "ADMIN"
                      ? "bg-blue-50 text-blue-600 border border-blue-100"
                      : user.role.name === "SUPER_ADMIN"
                        ? "bg-violet-50 text-violet-600 border border-violet-100"
                        : user.role.name === "STATION_MASTER"
                          ? "bg-amber-50 text-amber-600 border border-amber-100"
                          : user.role.name === "CLERK"
                            ? "bg-emerald-50 text-emerald-600 border border-emerald-100"
                            : user.role.name === "TRAIN_GUARD"
                              ? "bg-cyan-50 text-cyan-600 border border-cyan-100"
                              : "bg-slate-50 text-slate-500 border border-slate-100",
                  )}
                >
                  {user.role.name.replace("_", " ")}
                </span>
              )}
            </div>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest line-clamp-1">
              {user.email || user.phone}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Assigned Location",
      accessor: (user: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1.5 px-2.5 py-1 bg-slate-50 border border-slate-100 rounded-[10px] w-fit">
            <span className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
              {user.station?.name || "GLOBAL ACCESS"}
            </span>
          </div>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest pl-1">
            Location
          </span>
        </div>
      ),
    },
    {
      header: "Status",
      accessor: (user: any) => (
        <div className="flex flex-col gap-1.5">
          <StatusBadge status={user.isActive ? "ACTIVE" : "INACTIVE"} />
          <div className="flex items-center gap-1.5 pl-1.5">
            <div
              className={cn(
                "w-1 h-1 rounded-full",
                user.isActive ? "bg-emerald-500 animate-pulse" : "bg-slate-300",
              )}
            />
            <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest">
              {user.isActive ? "Active" : "Suspended"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Joined On",
      accessor: (user: any) => (
        <div className="flex flex-col gap-1">
          <span className="text-[14px] font-black tracking-tighter text-slate-700">
            {format(new Date(user.createdAt), "MMM dd, yyyy")}
          </span>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest pl-0.5">
            Registration Date
          </span>
        </div>
      ),
    },
    {
      header: "Actions",
      accessor: (user: any) => (
        <div className="flex items-center justify-end gap-2 pr-4">
          <button
            onClick={() => setSelectedStaffId(user.id)}
            className="h-9 px-4 bg-slate-900 hover:bg-blue-600 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm flex items-center gap-2"
          >
            Manage
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
        <ReportPageHeader
          title="Staff Directory"
          subtitle="Manage partner personnel, supervisors, and station workforce"
          iconName="Users"
          action={<CreateUserModal currentUserRole={currentUserRole} />}
          tabs={["Overview", "Staffs Directory"]}
          tabParamName="tab"
          activeTab={tab}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          {/* OVERVIEW TAB CONTENT */}
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-6 animate-in fade-in duration-500">
              {/* Stats Cards */}
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                {[
                  {
                    label: "Total Staff",
                    count: totalStaff,
                    icon: Users,
                    color: "text-indigo-500",
                    bg: "bg-indigo-50",
                  },
                  {
                    label: "Active Members",
                    count: activeStaff,
                    icon: UserCircle,
                    color: "text-emerald-500",
                    bg: "bg-emerald-50",
                  },
                  {
                    label: "Station Managers",
                    count: stationManagers,
                    icon: ShieldAlert,
                    color: "text-amber-500",
                    bg: "bg-amber-50",
                  },
                  {
                    label: "Clerks & Guards",
                    count: clerksAndGuards,
                    icon: Train,
                    color: "text-cyan-500",
                    bg: "bg-cyan-50",
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

              {/* Description blocks */}
              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-slate-900 rounded-[12px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[380px]">
                  <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-blue-500/10 rounded-full blur-[100px]" />

                  <div className="relative z-10">
                    <div className="h-12 w-12 rounded-[10px] bg-white/10 flex items-center justify-center mb-8 border border-white/10 backdrop-blur-md shadow-2xl">
                      <Shield
                        className="h-6 w-6 text-blue-400"
                        strokeWidth={2.5}
                      />
                    </div>
                    <h3 className="text-[22px] font-black tracking-tight leading-none mb-3 uppercase">
                      Workspace Directory
                    </h3>
                    <p className="text-slate-400 text-[12.5px] font-bold leading-relaxed opacity-85">
                      Manage partner personnel, supervisors, and transit
                      operations workforce. Assign physical branch stations to
                      enable operator access.
                    </p>
                  </div>

                  <div className="relative z-10 space-y-3">
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                        Managers
                      </span>
                      <span className="text-[14px] font-black text-amber-400 tabular-nums">
                        {stationManagers}
                      </span>
                    </div>
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                        Clerks & Guards
                      </span>
                      <span className="text-[14px] font-black text-cyan-400 tabular-nums">
                        {clerksAndGuards}
                      </span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[12px] border border-slate-100 shadow-sm p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-16 h-16 rounded-full bg-blue-50 flex items-center justify-center mb-4 border border-blue-100">
                    <Activity className="w-8 h-8 text-blue-500" />
                  </div>
                  <h4 className="text-[16px] font-black text-slate-900 mb-2 uppercase">
                    Workforce Telemetry
                  </h4>
                  <p className="text-[13px] text-slate-400 max-w-md">
                    Individual agent activity metrics, cargo dispatch records,
                    and audit summaries will populate here in real time as
                    operators log events.
                  </p>
                </div>
              </div>
            </div>
          )}

          {/* STAFFS DIRECTORY TAB CONTENT */}
          {tab.toLowerCase() === "staffs directory" && (
            <div className="space-y-6 animate-in fade-in duration-500">
              {/* Sub Tabs Toggle */}
              <div className="flex flex-wrap items-center gap-1.5 p-1 bg-slate-100 w-fit rounded-[10px] border border-slate-200">
                <button
                  onClick={() => setActiveTab("ADMIN")}
                  className={cn(
                    "flex items-center gap-2 px-5 py-2.5 rounded-[10px] text-xs font-bold transition-all uppercase tracking-wider",
                    activeTab === "ADMIN"
                      ? "bg-white text-blue-600 shadow-sm border border-slate-200"
                      : "text-slate-500 hover:text-slate-700",
                  )}
                >
                  <Shield className="h-3.5 w-3.5" />
                  Admins
                </button>
                <button
                  onClick={() => setActiveTab("STATION_MASTER")}
                  className={cn(
                    "flex items-center gap-2 px-5 py-2.5 rounded-[10px] text-xs font-bold transition-all uppercase tracking-wider",
                    activeTab === "STATION_MASTER"
                      ? "bg-white text-blue-600 shadow-sm border border-slate-200"
                      : "text-slate-500 hover:text-slate-700",
                  )}
                >
                  <ShieldAlert className="h-3.5 w-3.5" />
                  Station Managers
                </button>
                <button
                  onClick={() => setActiveTab("CLERK")}
                  className={cn(
                    "flex items-center gap-2 px-5 py-2.5 rounded-[10px] text-xs font-bold transition-all uppercase tracking-wider",
                    activeTab === "CLERK"
                      ? "bg-white text-blue-600 shadow-sm border border-slate-200"
                      : "text-slate-500 hover:text-slate-700",
                  )}
                >
                  <Users className="h-3.5 w-3.5" />
                  Clerks
                </button>
                <button
                  onClick={() => setActiveTab("TRAIN_GUARD")}
                  className={cn(
                    "flex items-center gap-2 px-5 py-2.5 rounded-[10px] text-xs font-bold transition-all uppercase tracking-wider",
                    activeTab === "TRAIN_GUARD"
                      ? "bg-white text-blue-600 shadow-sm border border-slate-200"
                      : "text-slate-500 hover:text-slate-700",
                  )}
                >
                  <Train className="h-3.5 w-3.5" />
                  Train Guards
                </button>
              </div>

              {/* User Table */}
              <DataTable
                title={
                  activeTab === "ADMIN"
                    ? "Admins"
                    : activeTab === "STATION_MASTER"
                      ? "Station Managers"
                      : activeTab === "CLERK"
                        ? "Clerks"
                        : "Train Guards"
                }
                data={users || []}
                columns={columns}
                isLoading={isLoading}
                hideActions={true}
              />
            </div>
          )}
        </div>
      </div>
      {/* Detail Slide-out Sheet */}
      {selectedStaffId && (
        <StaffDetailModal
          staffId={selectedStaffId}
          onClose={() => setSelectedStaffId(null)}
        />
      )}
    </div>
  );
}

export default function AdminUsersPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">
          Loading page...
        </div>
      }
    >
      <AdminUsersPageInner />
    </Suspense>
  );
}
