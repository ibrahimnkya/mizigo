"use client";

import {
  Building2,
  Globe,
  Activity,
  Calendar,
  Hash,
  FileText,
  ShieldCheck,
  Clock,
  UserCircle,
  BadgePercent,
} from "lucide-react";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@repo/ui/sheet";
import { cn } from "@/lib/utils";

interface ViewOrganizationModalProps {
  organization: any;
}

export function ViewOrganizationModal({
  organization,
}: ViewOrganizationModalProps) {
  const formatDate = (dateString: string) => {
    if (!dateString) return "N/A";
    return new Date(dateString).toLocaleDateString("en-GB", {
      day: "2-digit",
      month: "long",
      year: "numeric",
      hour: "2-digit",
      minute: "2-digit",
    });
  };

  return (
    <Sheet>
      <SheetTrigger asChild>
        <button className="w-10 h-10 rounded-[10px] bg-slate-50 text-slate-400 flex items-center justify-center hover:bg-slate-900 hover:text-white transition-all duration-300 shadow-sm border border-slate-100 active:scale-90">
          <ShieldCheck size={16} strokeWidth={3} />
        </button>
      </SheetTrigger>

      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 shadow-2xl flex flex-col rounded-2xl">
        {/* Header Section */}
        <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md">
            <Building2 className="w-6 h-6 text-white" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10 text-left">
            <div className="flex items-center gap-3 mb-1">
              <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-none uppercase">
                {organization.name}
              </SheetTitle>
              <div
                className={cn(
                  "px-2 py-0.5 rounded text-[9px] font-black uppercase tracking-widest",
                  organization.isActive
                    ? "bg-emerald-500 text-white"
                    : "bg-rose-500 text-white",
                )}
              >
                {organization.isActive ? "Active" : "Inactive"}
              </div>
            </div>
            <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
              Organization Protocol ·{" "}
              {organization.id?.slice(0, 8).toUpperCase()}
            </SheetDescription>
          </div>
        </div>

        {/* Metadata Grid */}
        <div className="p-10 grid grid-cols-1 md:grid-cols-2 gap-10 bg-slate-50/30">
          {/* Left Column: Configuration */}
          <div className="space-y-8">
            <div>
              <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em] mb-4 flex items-center gap-2">
                <Hash className="w-3 h-3 text-blue-600" strokeWidth={4} />
                Organization ID
              </h3>
              <div className="p-4 bg-white rounded-[10px] border border-slate-100 shadow-sm flex items-center justify-between">
                <span className="font-mono text-[13px] font-bold text-slate-600">
                  {organization.id}
                </span>
              </div>
            </div>

            <div>
              <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em] mb-4 flex items-center gap-2">
                <FileText className="w-3 h-3 text-blue-600" strokeWidth={4} />
                Description
              </h3>
              <div className="p-6 bg-white rounded-[10px] border border-slate-100 shadow-sm">
                <p className="text-[14px] text-slate-700 font-bold leading-relaxed italic">
                  "{organization.description || "No description provided."}"
                </p>
              </div>
            </div>

            <div>
              <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em] mb-4 flex items-center gap-2">
                <Globe className="w-3 h-3 text-blue-600" strokeWidth={4} />
                Support URL
              </h3>
              <div className="p-4 bg-white rounded-[10px] border border-slate-100 shadow-sm flex items-center justify-between">
                <span className="text-[13px] font-black text-blue-600 uppercase tracking-widest">
                  {organization.supportUrl || "Not configured"}
                </span>
              </div>
            </div>
          </div>

          {/* Right Column: Protocols */}
          <div className="space-y-8">
            <div>
              <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em] mb-4 flex items-center gap-2">
                <BadgePercent
                  className="w-3 h-3 text-blue-600"
                  strokeWidth={4}
                />
                Commission Details
              </h3>
              <div className="p-6 bg-white rounded-[10px] border border-slate-100 shadow-sm space-y-4">
                <div className="flex items-center justify-between">
                  <span className="text-[12px] font-black text-slate-400 uppercase tracking-widest">
                    Commission Rate
                  </span>
                  <span className="text-[24px] font-black text-slate-900 tracking-tighter">
                    {(organization.commissionRate * 100).toFixed(2)}%
                  </span>
                </div>
                <div className="pt-4 border-t border-slate-50">
                  <p className="text-[11px] font-bold text-slate-400 uppercase tracking-widest leading-relaxed">
                    {organization.commissionNotes ||
                      "No specific commission notes provided."}
                  </p>
                </div>
              </div>
            </div>

            <div>
              <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em] mb-4 flex items-center gap-2">
                <Clock className="w-3 h-3 text-blue-600" strokeWidth={4} />
                Dates
              </h3>
              <div className="space-y-3">
                <div className="p-4 bg-white rounded-[10px] border border-slate-100 shadow-sm flex items-center justify-between">
                  <div className="flex items-center gap-3">
                    <div className="w-8 h-8 rounded-full bg-blue-50 flex items-center justify-center text-blue-500">
                      <Calendar size={14} />
                    </div>
                    <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                      Created
                    </span>
                  </div>
                  <span className="text-[11px] font-black text-slate-900 uppercase tracking-widest">
                    {formatDate(organization.createdAt)}
                  </span>
                </div>
                <div className="p-4 bg-white rounded-[10px] border border-slate-100 shadow-sm flex items-center justify-between">
                  <div className="flex items-center gap-3">
                    <div className="w-8 h-8 rounded-full bg-slate-50 flex items-center justify-center text-slate-400">
                      <Activity size={14} />
                    </div>
                    <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                      Updated
                    </span>
                  </div>
                  <span className="text-[11px] font-black text-slate-900 uppercase tracking-widest">
                    {formatDate(organization.updatedAt)}
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="bg-slate-900 p-6 flex items-center justify-between mt-auto">
          <div className="flex items-center gap-2">
            <UserCircle className="w-5 h-5 text-slate-500" />
            <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
              Admin access verified
            </span>
          </div>
        </div>
      </SheetContent>
    </Sheet>
  );
}
