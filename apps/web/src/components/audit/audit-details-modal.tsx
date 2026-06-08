"use client";

import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetDescription,
} from "@repo/ui/sheet";
import {
  Terminal,
  Fingerprint,
  Activity,
  Clock,
  User as UserIcon,
  Database,
  ShieldCheck,
  Code2,
  Globe,
  Cpu,
  Target,
  Hash,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { format } from "date-fns";

interface AuditDetailsModalProps {
  log: any;
  open: boolean;
  onOpenChange: (open: boolean) => void;
}

export function AuditDetailsModal({
  log,
  open,
  onOpenChange,
}: AuditDetailsModalProps) {
  if (!log) return null;

  const isSystem = !log.user;
  const createdAt = new Date(log.createdAt || Date.now());

  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 shadow-2xl flex flex-col rounded-2xl">
        {/* Header Section - Brief as requested */}
        <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md">
            <Terminal className="w-6 h-6 text-white" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10 text-left">
            <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-none uppercase">
              {log.action?.replace(/_/g, " ")}
            </SheetTitle>
            <SheetDescription className="text-white/40 text-[10px] font-bold uppercase tracking-[0.2em] mt-1.5">
              Protocol Execution Audit Trace
            </SheetDescription>
          </div>
        </div>

        {/* Content Section */}
        <div className="flex-1 overflow-y-auto p-8 space-y-10 custom-scrollbar">
          {/* Target & Activity Grid - New focused section */}
          <div className="grid grid-cols-2 gap-4">
            <div className="p-5 bg-slate-50 border border-slate-100 rounded-2xl flex flex-col gap-3 group hover:bg-white hover:shadow-xl hover:shadow-slate-200/50 transition-all duration-300">
              <div className="flex items-center gap-2 text-slate-400">
                <Target size={14} strokeWidth={3} />
                <span className="text-[9px] font-black uppercase tracking-widest">
                  Resource Target
                </span>
              </div>
              <div className="flex flex-col">
                <span className="text-[14px] font-black uppercase tracking-tight text-slate-900">
                  {log.resource}
                </span>
                <span className="text-[9px] font-bold text-slate-400 uppercase tracking-widest mt-0.5">
                  Affected Entity
                </span>
              </div>
            </div>
            <div className="p-5 bg-slate-50 border border-slate-100 rounded-2xl flex flex-col gap-3 group hover:bg-white hover:shadow-xl hover:shadow-slate-200/50 transition-all duration-300">
              <div className="flex items-center gap-2 text-slate-400">
                <Hash size={14} strokeWidth={3} />
                <span className="text-[9px] font-black uppercase tracking-widest">
                  Activity Trace ID
                </span>
              </div>
              <div className="flex flex-col">
                <span className="text-[14px] font-black uppercase tracking-tight text-slate-900">
                  {log.id?.slice(0, 12).toUpperCase()}
                </span>
                <span className="text-[9px] font-bold text-slate-400 uppercase tracking-widest mt-0.5">
                  Immutable Reference
                </span>
              </div>
            </div>
          </div>

          {/* Status & Time Grid */}
          <div className="grid grid-cols-2 gap-4">
            <div className="p-5 bg-slate-50 border border-slate-100 rounded-2xl flex flex-col gap-3">
              <div className="flex items-center gap-2 text-slate-400">
                <Activity size={14} strokeWidth={3} />
                <span className="text-[9px] font-black uppercase tracking-widest">
                  Execution Status
                </span>
              </div>
              <div className="flex items-center gap-2 text-emerald-600">
                <div className="w-1.5 h-1.5 rounded-full bg-emerald-500 shadow-[0_0_8px_rgba(16,185,129,0.5)]" />
                <span className="text-[14px] font-black uppercase tracking-tight">
                  Verified Success
                </span>
              </div>
            </div>
            <div className="p-5 bg-slate-50 border border-slate-100 rounded-2xl flex flex-col gap-3">
              <div className="flex items-center gap-2 text-slate-400">
                <Clock size={14} strokeWidth={3} />
                <span className="text-[9px] font-black uppercase tracking-widest">
                  Trace Timestamp
                </span>
              </div>
              <div className="flex flex-col">
                <span className="text-[14px] font-black uppercase tracking-tight text-slate-900">
                  {format(createdAt, "HH:mm:ss")}
                </span>
                <span className="text-[9px] font-bold text-slate-400 uppercase tracking-widest mt-0.5">
                  {format(createdAt, "MMM dd, yyyy")}
                </span>
              </div>
            </div>
          </div>

          {/* Actor Section */}
          <div className="space-y-4">
            <div className="flex items-center gap-2 text-slate-400">
              <Fingerprint size={14} strokeWidth={3} />
              <span className="text-[10px] font-black uppercase tracking-[0.2em]">
                Authorized Initiator
              </span>
            </div>
            <div className="flex items-center gap-4 p-5 bg-white border border-slate-100 rounded-2xl shadow-sm hover:shadow-md transition-shadow">
              <div className="w-12 h-12 rounded-xl bg-slate-900 flex items-center justify-center shrink-0 shadow-lg shadow-slate-200">
                {isSystem ? (
                  <Cpu size={24} className="text-white" />
                ) : (
                  <UserIcon size={24} className="text-white" />
                )}
              </div>
              <div className="flex flex-col">
                <span className="text-[16px] font-black text-slate-900 tracking-tight uppercase">
                  {log.user?.name || "System Auto-Process"}
                </span>
                <span className="text-[11px] font-bold text-slate-400 uppercase tracking-widest mt-0.5">
                  {log.user?.role?.replace(/_/g, " ") ||
                    "Internal Core Service"}
                </span>
              </div>
              <div className="ml-auto">
                <div className="flex items-center gap-1.5 px-3 py-1 bg-blue-50 text-blue-600 rounded-full border border-blue-100">
                  <span className="text-[9px] font-black uppercase tracking-widest">
                    Authenticated
                  </span>
                </div>
              </div>
            </div>
          </div>

          {/* Data Payload */}
          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-2 text-slate-400">
                <Code2 size={14} strokeWidth={3} />
                <span className="text-[10px] font-black uppercase tracking-[0.2em]">
                  Activity Payload
                </span>
              </div>
              <div className="flex items-center gap-2">
                <div className="w-2 h-2 rounded-full bg-blue-500 animate-pulse" />
                <span className="text-[9px] font-black text-blue-600 uppercase tracking-widest">
                  Secure View
                </span>
              </div>
            </div>
            <div className="relative group">
              <div className="absolute inset-0 bg-blue-500/5 rounded-2xl blur-xl opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none" />
              <pre className="relative text-[12px] font-mono text-slate-300 bg-slate-900 p-8 rounded-2xl border border-slate-800 overflow-x-auto leading-relaxed shadow-2xl custom-scrollbar max-h-[300px]">
                {JSON.stringify(
                  log.details || { info: "No extended metadata recorded." },
                  null,
                  2,
                )}
              </pre>
            </div>
          </div>

          {/* Verification Protocol */}
          <div className="pt-6 border-t border-slate-100 space-y-4">
            <div className="flex items-center justify-between text-slate-400">
              <div className="flex items-center gap-2">
                <Globe size={12} strokeWidth={3} />
                <span className="text-[10px] font-black uppercase tracking-widest">
                  Network Protocol Node
                </span>
              </div>
              <div className="flex items-center gap-2">
                <Database size={12} strokeWidth={3} />
                <span className="text-[10px] font-black uppercase tracking-widest">
                  Encrypted Storage
                </span>
              </div>
            </div>
            <div className="flex items-center justify-center p-4 bg-slate-50 rounded-2xl gap-3 border border-slate-100 border-dashed">
              <ShieldCheck
                size={16}
                className="text-emerald-500"
                strokeWidth={3}
              />
              <span className="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 italic">
                This trace has been validated by the core platform security
                protocol
              </span>
            </div>
          </div>
        </div>

        {/* Action Footer */}
        <div className="p-6 bg-slate-50 border-t border-slate-100">
          <button
            onClick={() => onOpenChange(false)}
            className="w-full h-14 rounded-xl bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 active:scale-[0.98]"
          >
            Dismiss Audit Trace
          </button>
        </div>
      </SheetContent>
    </Sheet>
  );
}
