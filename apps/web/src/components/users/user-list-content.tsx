import { cn } from "@/lib/utils";
import { DataTable } from "@/components/shared/data-table";
import { UserActionMenu } from "./user-action-menu";
import {
  Users,
  Shield,
  Building2,
  Mail,
  Phone,
  CheckCircle2,
} from "lucide-react";

const ROLE_BADGE: Record<string, string> = {
  SUPER_ADMIN:
    "bg-slate-900 text-white border-slate-900 shadow-lg shadow-slate-100",
  ADMIN: "bg-blue-50 text-blue-700 border-blue-100",
  OPERATOR: "bg-emerald-50 text-emerald-700 border-emerald-100",
  AGENT: "bg-amber-50 text-amber-700 border-amber-100",
};

function Avatar({ name }: { name: string }) {
  const initials = name
    .split(" ")
    .map((n) => n[0])
    .join("")
    .slice(0, 2)
    .toUpperCase();
  return (
    <div className="w-10 h-10 rounded-[10px] bg-slate-100 border border-slate-200 flex items-center justify-center text-slate-600 text-[12px] font-black shadow-sm transition-transform group-hover:scale-105 group-hover:bg-blue-600 group-hover:text-white group-hover:border-blue-500">
      {initials}
    </div>
  );
}

interface UserListContentProps {
  users: any[];
  currentUserRole?: string;
}

export function UserListContent({
  users,
  currentUserRole,
}: UserListContentProps) {
  const columns = [
    {
      header: "Identity Member",
      accessor: (user: any) => (
        <div className="flex items-center gap-3.5">
          <Avatar name={user.name} />
          <div className="flex flex-col min-w-0">
            <span className="text-[13px] font-black text-slate-900 truncate group-hover:text-blue-600 transition-colors uppercase tracking-tight">
              {user.name}
            </span>
            <div className="flex items-center gap-1.5 text-slate-400">
              <Mail size={10} strokeWidth={3} />
              <span className="text-[10px] font-bold truncate lowercase tracking-tight">
                {user.email}
              </span>
            </div>
          </div>
        </div>
      ),
    },
    {
      header: "System Authority",
      accessor: (user: any) => (
        <div
          className={cn(
            "inline-flex items-center gap-1.5 px-3 py-1.5 rounded-[10px] text-[10px] font-black border uppercase tracking-[0.12em] shadow-sm transition-all",
            ROLE_BADGE[user.role?.name] ??
              "bg-slate-50 text-slate-600 border-slate-100",
          )}
        >
          <Shield size={12} strokeWidth={2.5} />
          {user.role?.name?.replace("_", " ") || "USER"}
        </div>
      ),
    },
    {
      header: "Network Node / Contact",
      accessor: (user: any) => (
        <div className="flex flex-col gap-1.5">
          <div className="flex items-center gap-2 text-slate-600 font-bold text-[11px] uppercase tracking-tight">
            <div className="w-5 h-5 rounded-[10px] bg-slate-50 border border-slate-100 flex items-center justify-center">
              <Building2 size={10} className="text-slate-400" />
            </div>
            <span className="truncate max-w-[150px]">
              {user.station?.name ||
                user.organization?.name ||
                "Global Headquarters"}
            </span>
          </div>
          <div className="flex items-center gap-2 text-slate-400 font-black text-[10px] tracking-widest pl-1">
            <Phone size={10} strokeWidth={3} className="opacity-40" />
            {user.phone || "STATIONARY"}
          </div>
        </div>
      ),
    },
    {
      header: "Presence",
      accessor: (user: any) => (
        <div
          className={cn(
            "inline-flex items-center gap-2 px-3 py-1.5 rounded-[10px] border text-[10px] font-black uppercase tracking-widest shadow-sm",
            user.isActive
              ? "bg-emerald-50 text-emerald-600 border-emerald-100"
              : "bg-rose-50 text-rose-600 border-rose-100",
          )}
        >
          <div
            className={cn(
              "w-1.5 h-1.5 rounded-full",
              user.isActive ? "bg-emerald-500 animate-pulse" : "bg-rose-500",
            )}
          />
          {user.isActive ? "Online" : "Inactive"}
        </div>
      ),
    },
    {
      header: "Action Suite",
      accessor: (user: any) => (
        <div className="flex items-center justify-end gap-2 pr-4">
          <UserActionMenu user={user} currentUserRole={currentUserRole} />
          <button className="h-9 px-4 bg-slate-900 hover:bg-blue-600 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm">
            View Profile
          </button>
        </div>
      ),
    },
  ];

  return (
    <DataTable
      title="Identity Registry"
      columns={columns}
      data={users || []}
      searchKey="name"
      searchPlaceholder="QUERY USER DIRECTORY..."
      emptyMessage="No personnel records matched"
      hideActions={true}
    />
  );
}
