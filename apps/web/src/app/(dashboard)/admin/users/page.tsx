"use client";

import { Suspense, useState, useEffect } from "react";
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

// --- Animated counter hook ---
function useCountUp(target: number, duration = 1200): number {
  const [value, setValue] = useState(0);
  useEffect(() => {
    if (!target) {
      setValue(0);
      return;
    }
    const steps = 40;
    const increment = target / steps;
    let current = 0;
    const timer = setInterval(() => {
      current += increment;
      if (current >= target) {
        setValue(target);
        clearInterval(timer);
      } else {
        setValue(Math.floor(current));
      }
    }, duration / steps);
    return () => clearInterval(timer);
  }, [target, duration]);
  return value;
}

// --- Custom StaffCard Component ---
interface StaffCardProps {
  label: string;
  value: number;
  icon: React.ElementType;
  iconBg: string;
  iconColor: string;
  tag: string;
  tagBg: string;
  tagColor: string;
  accentBar: string;
  description: string;
  seed: number;
}

function StaffCard({
  label,
  value,
  icon: Icon,
  iconBg,
  iconColor,
  tag,
  tagBg,
  tagColor,
  description,
}: StaffCardProps) {
  const counted = useCountUp(value, 1000);

  return (
    <div className="bg-white border border-[#E2E2E2] rounded-[20px] p-5 flex flex-col gap-3">
      {/* Top Row */}
      <div className="flex items-start justify-between">
        <div className={cn("w-8 h-8 rounded-xl flex items-center justify-center", iconBg, iconColor)}>
          <Icon size={14} strokeWidth={2} />
        </div>
        <span className={cn("inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border", tagBg, tagColor)}>
          {tag}
        </span>
      </div>

      {/* Value */}
      <p className={cn("text-[26px] font-semibold leading-none tabular-nums", iconColor)}>
        {counted.toLocaleString()}
      </p>

      {/* Title & Description */}
      <div>
        <h3 className="text-[14px] font-semibold text-slate-800">{label}</h3>
        <p className="text-[11px] font-medium text-slate-500 mt-0.5 leading-normal line-clamp-2">
          {description}
        </p>
      </div>
    </div>
  );
}

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
  const currentUserRole = session?.user?.role || "CLERK";

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
              "h-9 w-9 rounded-xl border flex items-center justify-center",
              user.isActive
                ? "bg-slate-900 border-slate-700"
                : "bg-slate-100 border-slate-200",
            )}
          >
            <UserCircle
              className={cn(
                "h-4 w-4",
                user.isActive ? "text-white" : "text-slate-400",
              )}
              strokeWidth={2}
            />
          </div>
          <div className="flex flex-col">
            <div className="flex items-center gap-2">
              <span className="font-semibold text-slate-800 text-[13px] tracking-tight uppercase">
                {user.name}
              </span>
              {user.role?.name && (
                <span
                  className={cn(
                    "inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border shrink-0",
                    user.role.name === "ADMIN"
                      ? "bg-blue-50 text-blue-700 border-blue-200"
                      : user.role.name === "SUPER_ADMIN"
                        ? "bg-violet-50 text-violet-700 border-violet-200"
                        : user.role.name === "STATION_MASTER"
                          ? "bg-amber-50 text-amber-700 border-amber-200"
                          : user.role.name === "CLERK"
                            ? "bg-emerald-50 text-emerald-700 border-emerald-200"
                            : user.role.name === "TRAIN_GUARD"
                              ? "bg-cyan-50 text-cyan-700 border-cyan-200"
                              : "bg-slate-50 text-slate-600 border-slate-200",
                  )}
                >
                  {user.role.name.replace("_", " ")}
                </span>
              )}
            </div>
            <span className="text-[11px] font-medium text-slate-500 line-clamp-1">
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
          <div className="flex items-center gap-1.5 px-2 py-1 bg-slate-50 border border-slate-200 rounded-xl w-fit">
            <span className="text-[11px] font-medium text-slate-600">
              {user.station?.name || "GLOBAL ACCESS"}
            </span>
          </div>
          <span className="text-[11px] font-medium text-slate-400 pl-1">
            Location
          </span>
        </div>
      ),
    },
    {
      header: "Status",
      accessor: (user: any) => (
        <div className="flex flex-col gap-1">
          <StatusBadge status={user.isActive ? "ACTIVE" : "INACTIVE"} />
          <div className="flex items-center gap-1.5 pl-0.5">
            <div
              className={cn(
                "w-1.5 h-1.5 rounded-full",
                user.isActive ? "bg-emerald-500" : "bg-slate-300",
              )}
            />
            <span className="text-[11px] font-medium text-slate-400">
              {user.isActive ? "Active" : "Suspended"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Joined On",
      accessor: (user: any) => (
        <div className="flex flex-col gap-0.5">
          <span className="text-[13px] font-semibold text-slate-700">
            {format(new Date(user.createdAt), "MMM dd, yyyy")}
          </span>
          <span className="text-[11px] font-medium text-slate-400">
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
            className="h-8 px-3 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-[12px] font-semibold transition-colors"
          >
            Manage
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="flex flex-col gap-5">
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
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                <StaffCard
                  label="Total Staff"
                  value={totalStaff}
                  icon={Users}
                  iconBg="bg-indigo-50"
                  iconColor="text-indigo-600"
                  tag="Team"
                  tagBg="bg-indigo-50"
                  tagColor="text-indigo-700 border-indigo-200"
                  accentBar=""
                  description="Total registered personnel in organization directory"
                  seed={19}
                />
                <StaffCard
                  label="Active Members"
                  value={activeStaff}
                  icon={UserCircle}
                  iconBg="bg-emerald-50"
                  iconColor="text-emerald-600"
                  tag="Active"
                  tagBg="bg-emerald-50"
                  tagColor="text-emerald-700 border-emerald-200"
                  accentBar=""
                  description="Staff accounts with active operational clearance"
                  seed={37}
                />
                <StaffCard
                  label="Station Managers"
                  value={stationManagers}
                  icon={ShieldAlert}
                  iconBg="bg-amber-50"
                  iconColor="text-amber-600"
                  tag="Managers"
                  tagBg="bg-amber-50"
                  tagColor="text-amber-700 border-amber-200"
                  accentBar=""
                  description="Supervisors assigned to physically manage terminals"
                  seed={55}
                />
                <StaffCard
                  label="Clerks & Guards"
                  value={clerksAndGuards}
                  icon={Train}
                  iconBg="bg-cyan-50"
                  iconColor="text-cyan-600"
                  tag="Staffs"
                  tagBg="bg-cyan-50"
                  tagColor="text-cyan-700 border-cyan-200"
                  accentBar=""
                  description="Transit guards and terminal booking clerks"
                  seed={73}
                />
              </div>

              {/* Description blocks */}
              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-white border border-[#E2E2E2] rounded-[20px] p-6 flex flex-col justify-between min-h-[380px]">
                  <div>
                    <div className="h-10 w-10 rounded-xl bg-slate-100 border border-slate-200 flex items-center justify-center mb-6">
                      <Shield className="h-5 w-5 text-slate-600" strokeWidth={2} />
                    </div>
                    <h3 className="text-[20px] font-semibold text-slate-800 mb-2 uppercase">
                      Workspace Directory
                    </h3>
                    <p className="text-[13px] font-medium text-slate-500 leading-relaxed">
                      Manage partner personnel, supervisors, and transit
                      operations workforce. Assign physical branch stations to
                      enable staff access.
                    </p>
                  </div>

                  <div className="space-y-2">
                    <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                      <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                        Managers
                      </span>
                      <span className="text-[14px] font-semibold text-amber-600 tabular-nums">
                        {stationManagers}
                      </span>
                    </div>
                    <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                      <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                        Clerks & Guards
                      </span>
                      <span className="text-[14px] font-semibold text-cyan-600 tabular-nums">
                        {clerksAndGuards}
                      </span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white border border-[#E2E2E2] rounded-[20px] p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-12 h-12 rounded-xl bg-blue-50 border border-blue-200 flex items-center justify-center mb-4">
                    <Activity className="w-6 h-6 text-blue-600" strokeWidth={2} />
                  </div>
                  <h4 className="text-[14px] font-semibold text-slate-800 mb-2 uppercase">
                    Workforce Telemetry
                  </h4>
                  <p className="text-[13px] font-medium text-slate-500 max-w-md">
                    Individual agent activity metrics, cargo dispatch records,
                    and audit summaries will populate here in real time as
                    staff log events.
                  </p>
                </div>
              </div>
            </div>
          )}

          {/* STAFFS DIRECTORY TAB CONTENT */}
          {tab.toLowerCase() === "staffs directory" && (
            <div className="space-y-6 animate-in fade-in duration-500">
              {/* Sub Tabs Toggle */}
              <div className="flex flex-wrap items-center gap-1 p-1 bg-slate-100 w-fit rounded-xl border border-slate-200">
                <button
                  onClick={() => setActiveTab("ADMIN")}
                  className={cn(
                    "flex items-center gap-2 px-4 py-2 rounded-xl text-[12px] font-medium transition-colors",
                    activeTab === "ADMIN"
                      ? "bg-white text-blue-600 border border-slate-200"
                      : "text-slate-500 hover:text-slate-700",
                  )}
                >
                  <Shield className="h-3.5 w-3.5" />
                  Admins
                </button>
                <button
                  onClick={() => setActiveTab("STATION_MASTER")}
                  className={cn(
                    "flex items-center gap-2 px-4 py-2 rounded-xl text-[12px] font-medium transition-colors",
                    activeTab === "STATION_MASTER"
                      ? "bg-white text-blue-600 border border-slate-200"
                      : "text-slate-500 hover:text-slate-700",
                  )}
                >
                  <ShieldAlert className="h-3.5 w-3.5" />
                  Station Managers
                </button>
                <button
                  onClick={() => setActiveTab("CLERK")}
                  className={cn(
                    "flex items-center gap-2 px-4 py-2 rounded-xl text-[12px] font-medium transition-colors",
                    activeTab === "CLERK"
                      ? "bg-white text-blue-600 border border-slate-200"
                      : "text-slate-500 hover:text-slate-700",
                  )}
                >
                  <Users className="h-3.5 w-3.5" />
                  Clerks
                </button>
                <button
                  onClick={() => setActiveTab("TRAIN_GUARD")}
                  className={cn(
                    "flex items-center gap-2 px-4 py-2 rounded-xl text-[12px] font-medium transition-colors",
                    activeTab === "TRAIN_GUARD"
                      ? "bg-white text-blue-600 border border-slate-200"
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
        <div className="flex items-center justify-center min-h-[300px]">
          Loading page...
        </div>
      }
    >
      <AdminUsersPageInner />
    </Suspense>
  );
}
