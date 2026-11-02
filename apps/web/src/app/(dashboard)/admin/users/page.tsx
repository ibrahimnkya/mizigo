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
import { PeopleOverview } from "@/components/users/people-overview";
import { CreateUserModal } from "@/components/users/create-user-modal";
import { StaffDetailModal } from "@/components/users/staff-detail-modal";
import { useSession } from "next-auth/react";
import { useRouter, useSearchParams } from "next/navigation";
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
  const router = useRouter();
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  // Sub-role Tab State (within staffs tab)
  const [activeTab, setActiveTab] = useState<
    "ADMIN" | "STATION_MASTER" | "CLERK" | "TRAIN_GUARD"
  >("ADMIN");

  // Fetch filtered users for current active sub-role tab
  const { data: users, isLoading } = useUsers({ role: activeTab });
  // Overview covers everyone in the organization, not just the selected role tab.
  const { data: allStaff, isLoading: allStaffLoading } = useUsers({});

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

  const ROLE_TONES: Record<string, { label: string; tone: string }> = {
    SUPER_ADMIN: { label: "Super admin", tone: "bg-[#FBF1F2] text-[#5C0B19]" },
    ADMIN: { label: "Admin", tone: "bg-[#FBF1F2] text-[#5C0B19]" },
    ORG_ADMIN: { label: "Admin", tone: "bg-[#FBF1F2] text-[#5C0B19]" },
    STATION_MASTER: { label: "Station master", tone: "bg-orange-50 text-orange-700" },
    CLERK: { label: "Clerk", tone: "bg-amber-50 text-amber-700" },
    TRAIN_GUARD: { label: "Train guard", tone: "bg-slate-100 text-slate-600" },
    AGENT: { label: "Agent", tone: "bg-slate-100 text-slate-600" },
  };

  const columns = [
    {
      header: "Staff member",
      accessor: (user: any) => {
        const r = ROLE_TONES[user.role?.name] ?? { label: user.role?.name ?? "—", tone: "bg-slate-100 text-slate-600" };
        return (
          <div className="flex items-center gap-3">
            <span
              className={cn(
                "flex h-10 w-10 shrink-0 items-center justify-center rounded-full text-[14px] font-semibold",
                user.isActive ? "bg-[#5C0B19] text-white" : "bg-slate-100 text-slate-400",
              )}
            >
              {(user.name || "?").charAt(0).toUpperCase()}
            </span>
            <div className="min-w-0">
              <div className="flex items-center gap-2">
                <span className="truncate text-[14px] font-semibold text-[#1C1C1E]">{user.name}</span>
                <span className={cn("shrink-0 rounded-full px-2 py-0.5 text-[11px] font-semibold", r.tone)}>{r.label}</span>
              </div>
              <p className="truncate text-[12px] text-slate-400">{user.email || user.phone}</p>
            </div>
          </div>
        );
      },
    },
    {
      header: "Phone",
      accessor: (user: any) => <span className="text-[13px] tabular-nums text-slate-600">{user.phone || "—"}</span>,
    },
    {
      header: "Station",
      accessor: (user: any) => (
        <span className="text-[13px] text-slate-700">
          {user.station?.name ?? (["ADMIN", "SUPER_ADMIN", "ORG_ADMIN"].includes(user.role?.name) ? "All stations" : "Not assigned")}
        </span>
      ),
    },
    {
      header: "Status",
      accessor: (user: any) => (
        <span
          className={cn(
            "inline-flex items-center gap-1.5 rounded-full px-2.5 py-1 text-[12px] font-semibold",
            user.isActive ? "bg-emerald-50 text-emerald-700" : "bg-slate-100 text-slate-500",
          )}
        >
          <span className={cn("h-1.5 w-1.5 rounded-full", user.isActive ? "bg-emerald-500" : "bg-slate-400")} />
          {user.isActive ? "Active" : "Disabled"}
        </span>
      ),
    },
    {
      header: "Joined",
      accessor: (user: any) => (
        <span className="text-[13px] text-slate-500">{user.createdAt ? format(new Date(user.createdAt), "d MMM yyyy") : "—"}</span>
      ),
    },
    {
      header: "",
      align: "right" as const,
      accessor: (user: any) => (
        <button
          onClick={(e) => {
            e.stopPropagation();
            setSelectedStaffId(user.id);
          }}
          className="inline-flex h-9 items-center rounded-full bg-[#5C0B19] px-4 text-[13px] font-semibold text-white transition hover:bg-[#4F0A0C]"
        >
          View
        </button>
      ),
    },
  ];

  return (
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="Staff"
          subtitle="Everyone who works at your stations and offices"
          iconName="Users"
          action={<CreateUserModal currentUserRole={currentUserRole} />}
          tabs={["Overview", "Staffs Directory"]}
          tabParamName="tab"
          activeTab={tab}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          {/* OVERVIEW TAB CONTENT */}
          {tab.toLowerCase() === "overview" && (
            <PeopleOverview
              users={(Array.isArray(allStaff) ? allStaff : (allStaff as any)?.data ?? []).filter(
                (u: any) => String(u?.role?.name ?? u?.role ?? "") !== "CUSTOMER",
              )}
              loading={allStaffLoading}
              title="Staff"
              manageLabel="Manage staff"
              onManage={() => router.push("?tab=staffs+directory")}
            />
          )}

          {tab.toLowerCase() === "staffs directory" && (
            <div className="space-y-6 animate-in fade-in duration-500">
              {/* Role tabs */}
              <div className="flex w-fit max-w-full gap-1 overflow-x-auto rounded-full border border-[#E2E2E2] bg-white p-1">
                {(
                  [
                    ["ADMIN", "Admins"],
                    ["STATION_MASTER", "Station masters"],
                    ["CLERK", "Clerks"],
                    ["TRAIN_GUARD", "Train guards"],
                  ] as const
                ).map(([key, label]) => {
                  const count = (Array.isArray(allStaff) ? allStaff : []).filter((u: any) =>
                    key === "ADMIN" ? ["ADMIN", "ORG_ADMIN"].includes(u.role?.name) : u.role?.name === key,
                  ).length;
                  return (
                    <button
                      key={key}
                      onClick={() => setActiveTab(key)}
                      className={cn(
                        "flex shrink-0 items-center gap-2 rounded-full px-4 py-2 text-[13px] font-semibold transition",
                        activeTab === key ? "bg-orange-500 text-white" : "text-slate-500 hover:bg-slate-50 hover:text-[#1C1C1E]",
                      )}
                    >
                      {label}
                      <span
                        className={cn(
                          "rounded-full px-1.5 text-[11px] tabular-nums",
                          activeTab === key ? "bg-white/25 text-white" : "bg-slate-100 text-slate-500",
                        )}
                      >
                        {count}
                      </span>
                    </button>
                  );
                })}
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
                onRowClick={(u: any) => setSelectedStaffId(u.id)}
                emptyMessage="No one in this role yet."
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
