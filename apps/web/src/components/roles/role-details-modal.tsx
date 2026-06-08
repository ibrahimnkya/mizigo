"use client";

import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetDescription,
} from "@repo/ui/sheet";
import {
  Shield,
  ShieldCheck,
  Terminal,
  Fingerprint,
  Activity,
  Clock,
  ShieldAlert,
  Key,
} from "lucide-react";
import { cn } from "@/lib/utils";

interface RoleDetailsModalProps {
  role: any;
  open: boolean;
  onOpenChange: (open: boolean) => void;
}

export function RoleDetailsModal({
  role,
  open,
  onOpenChange,
}: RoleDetailsModalProps) {
  if (!role) return null;

  const permissions =
    role.permissions?.map((p: any) => p.permission?.name) || [];

  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 shadow-2xl flex flex-col rounded-2xl">
        {/* Header Section */}
        <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl">
            <Shield className="w-6 h-6 text-white" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10 text-left">
            <div className="flex items-center gap-3 mb-1">
              <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-none uppercase">
                {role.name?.replace("_", " ")}
              </SheetTitle>
              <div className="px-2 py-0.5 bg-emerald-500 text-white rounded text-[9px] font-black uppercase tracking-widest">
                Active
              </div>
            </div>
            <SheetDescription className="text-slate-400 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
              Role Information · {role.id?.slice(0, 8).toUpperCase()}
            </SheetDescription>
          </div>
        </div>

        {/* Content Section */}
        <div className="flex-1 overflow-y-auto p-8 space-y-10 custom-scrollbar">
          {/* Quick Stats */}
          <div className="grid grid-cols-3 gap-4">
            {[
              {
                label: "Security Level",
                value: "High",
                icon: ShieldAlert,
                color: "text-rose-500",
                bg: "bg-rose-50",
              },
              {
                label: "Permissions",
                value: permissions.length,
                icon: Key,
                color: "text-blue-500",
                bg: "bg-blue-50",
              },
              {
                label: "Status",
                value: "Active",
                icon: Activity,
                color: "text-emerald-500",
                bg: "bg-emerald-50",
              },
            ].map((stat, i) => (
              <div
                key={i}
                className="flex flex-col p-4 bg-slate-50 border border-slate-100 rounded-xl group hover:bg-white hover:shadow-xl hover:shadow-slate-200/50 transition-all duration-300"
              >
                <stat.icon
                  className={cn("w-4 h-4 mb-3", stat.color)}
                  strokeWidth={3}
                />
                <span className="text-[9px] font-black text-slate-400 uppercase tracking-widest mb-1">
                  {stat.label}
                </span>
                <span className="text-[14px] font-black text-slate-900 uppercase tracking-tight">
                  {stat.value}
                </span>
              </div>
            ))}
          </div>

          {/* Core Description */}
          <div className="space-y-4">
            <div className="flex items-center gap-2 text-slate-400">
              <Terminal size={14} strokeWidth={3} />
              <span className="text-[10px] font-black uppercase tracking-[0.2em]">
                About this Role
              </span>
            </div>
            <p className="text-[14px] font-medium text-slate-600 leading-relaxed bg-slate-50 p-6 rounded-2xl border border-dashed border-slate-200">
              {role.description ||
                "This role defines a specific set of activities and access levels within the platform. All actions performed under this role are monitored for security."}
            </p>
          </div>

          {/* Permissions Matrix */}
          <div className="space-y-6">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-2 text-slate-400">
                <Fingerprint size={14} strokeWidth={3} />
                <span className="text-[10px] font-black uppercase tracking-[0.2em]">
                  Assigned Permissions
                </span>
              </div>
              <span className="text-[10px] font-black text-blue-600 uppercase tracking-widest bg-blue-50 px-2 py-1 rounded-md">
                {permissions.length} items
              </span>
            </div>

            <div className="grid grid-cols-1 gap-2">
              {permissions.length > 0 ? (
                permissions.map((p: string, i: number) => (
                  <div
                    key={i}
                    className="group flex items-center justify-between p-4 bg-white border border-slate-100 rounded-xl hover:border-blue-200 transition-all hover:shadow-sm"
                  >
                    <div className="flex items-center gap-3">
                      <div className="w-8 h-8 rounded-lg bg-slate-50 flex items-center justify-center border border-slate-100 group-hover:bg-blue-50 group-hover:border-blue-100 transition-all">
                        <ShieldCheck
                          size={14}
                          className="text-slate-400 group-hover:text-blue-500"
                          strokeWidth={3}
                        />
                      </div>
                      <span className="text-[12px] font-black text-slate-700 uppercase tracking-tight">
                        {p.replace(/:/g, " ")}
                      </span>
                    </div>
                    <div className="flex items-center gap-1.5 opacity-0 group-hover:opacity-100 transition-opacity">
                      <div className="h-1.5 w-1.5 rounded-full bg-emerald-500" />
                      <span className="text-[9px] font-black text-slate-400 uppercase">
                        Enabled
                      </span>
                    </div>
                  </div>
                ))
              ) : (
                <div className="p-8 text-center border-2 border-dashed border-slate-100 rounded-2xl">
                  <ShieldAlert className="w-8 h-8 text-slate-200 mx-auto mb-3" />
                  <p className="text-[12px] font-bold text-slate-400 uppercase tracking-widest">
                    No permissions assigned
                  </p>
                </div>
              )}
            </div>
          </div>

          {/* Metadata */}
          <div className="pt-6 border-t border-slate-100 flex items-center justify-between text-slate-400">
            <div className="flex items-center gap-2">
              <Clock size={12} strokeWidth={3} />
              <span className="text-[10px] font-black uppercase tracking-widest">
                Last Updated: {new Date().toLocaleDateString()}
              </span>
            </div>
            <div className="flex items-center gap-1.5">
              <div className="w-2 h-2 rounded-full bg-blue-500 animate-pulse" />
              <span className="text-[10px] font-black uppercase tracking-widest text-slate-900">
                System Protected
              </span>
            </div>
          </div>
        </div>

        {/* Action Footer */}
        <div className="p-6 bg-slate-50 border-t border-slate-100 flex gap-3">
          <button
            onClick={() => onOpenChange(false)}
            className="flex-1 h-14 rounded-xl bg-white border border-slate-200 text-slate-400 text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-50 transition-all"
          >
            Close View
          </button>
          <button className="flex-[1.5] h-14 rounded-xl bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 flex items-center justify-center gap-3">
            <Settings size={16} strokeWidth={2.5} />
            Update Role
          </button>
        </div>
      </SheetContent>
    </Sheet>
  );
}

import { Settings } from "lucide-react";
