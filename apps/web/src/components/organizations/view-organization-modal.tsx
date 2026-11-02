"use client";

import { useState } from "react";
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
  Palette,
  Link2,
  Copy,
  Check,
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
  const [copied, setCopied] = useState(false);

  const loginLink =
    typeof window !== "undefined" && organization.slug
      ? `${window.location.origin}/login?org=${organization.slug}`
      : "";

  const copyLoginLink = () => {
    if (!loginLink) return;
    navigator.clipboard.writeText(loginLink);
    setCopied(true);
    setTimeout(() => setCopied(false), 1800);
  };

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
        <button className="w-10 h-10 rounded-xl bg-slate-50 text-slate-400 flex items-center justify-center hover:bg-[#5C0B19] hover:text-white transition-all duration-300  border border-slate-100 active:scale-90">
          <ShieldCheck size={16} strokeWidth={3} />
        </button>
      </SheetTrigger>

      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100  flex flex-col rounded-xl">
        {/* Header Section */}
        <div className="bg-[#5C0B19] px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="w-12 h-12 rounded-xl bg-white/10 border border-slate-200 flex items-center justify-center shrink-0 relative z-10   overflow-hidden">
            {organization.logoUrl ? (
              // eslint-disable-next-line @next/next/no-img-element
              <img
                src={organization.logoUrl}
                alt={`${organization.name} logo`}
                className="w-full h-full object-contain p-1.5"
              />
            ) : (
              <Building2 className="w-6 h-6 text-white" strokeWidth={2.5} />
            )}
          </div>
          <div className="flex flex-col relative z-10 text-left">
            <div className="flex items-center gap-3 mb-1">
              <SheetTitle className="text-[20px] font-semibold text-white tracking-tight leading-none uppercase">
                {organization.name}
              </SheetTitle>
              <div
                className={cn(
                  "px-2 py-0.5 rounded text-[9px] font-semibold uppercase tracking-[0.05em]",
                  organization.isActive
                    ? "bg-emerald-500 text-white"
                    : "bg-rose-500 text-white",
                )}
              >
                {organization.isActive ? "Active" : "Inactive"}
              </div>
            </div>
            <SheetDescription className="text-slate-500 text-[11px] font-bold uppercase tracking-[0.05em] mt-0.5">
              Organization Protocol ·{" "}
              {organization.id?.slice(0, 8).toUpperCase()}
            </SheetDescription>
          </div>
        </div>

        {/* Metadata Grid */}
        <div className="p-10 grid grid-cols-1 md:grid-cols-2 gap-10 bg-slate-50/30 flex-1 overflow-y-auto custom-scrollbar">
          {/* Left Column: Configuration */}
          <div className="space-y-8">
            <div>
              <h3 className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-4 flex items-center gap-2">
                <Hash className="w-3 h-3 text-blue-600" strokeWidth={4} />
                Organization ID
              </h3>
              <div className="p-4 bg-white rounded-[20px] border border-[#E2E2E2]  flex items-center justify-between">
                <span className="font-mono text-[13px] font-bold text-slate-600">
                  {organization.id}
                </span>
              </div>
            </div>

            <div>
              <h3 className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-4 flex items-center gap-2">
                <FileText className="w-3 h-3 text-blue-600" strokeWidth={4} />
                Description
              </h3>
              <div className="p-6 bg-white rounded-[20px] border border-[#E2E2E2] ">
                <p className="text-[14px] text-slate-700 font-bold leading-relaxed italic">
                  "{organization.description || "No description provided."}"
                </p>
              </div>
            </div>

            <div>
              <h3 className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-4 flex items-center gap-2">
                <Globe className="w-3 h-3 text-blue-600" strokeWidth={4} />
                Support URL
              </h3>
              <div className="p-4 bg-white rounded-[20px] border border-[#E2E2E2]  flex items-center justify-between">
                <span className="text-[13px] font-semibold text-blue-600 uppercase tracking-[0.05em]">
                  {organization.supportUrl || "Not configured"}
                </span>
              </div>
            </div>
          </div>

          {/* Right Column: Protocols */}
          <div className="space-y-8">
            <div>
              <h3 className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-4 flex items-center gap-2">
                <BadgePercent
                  className="w-3 h-3 text-blue-600"
                  strokeWidth={4}
                />
                Commission Details
              </h3>
              <div className="p-6 bg-white rounded-[20px] border border-[#E2E2E2]  space-y-4">
                <div className="flex items-center justify-between">
                  <span className="text-[12px] font-semibold text-slate-400 uppercase tracking-[0.05em]">
                    Commission Rate
                  </span>
                  <span className="text-[24px] font-semibold text-slate-900 tracking-tighter">
                    {(organization.commissionRate * 100).toFixed(2)}%
                  </span>
                </div>
                <div className="pt-4 border-t border-slate-50">
                  <p className="text-[11px] font-bold text-slate-400 uppercase tracking-[0.05em] leading-relaxed">
                    {organization.commissionNotes ||
                      "No specific commission notes provided."}
                  </p>
                </div>
              </div>
            </div>

            <div>
              <h3 className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-4 flex items-center gap-2">
                <Palette className="w-3 h-3 text-blue-600" strokeWidth={4} />
                Whitelabel Branding
              </h3>
              <div className="p-6 bg-white rounded-[20px] border border-[#E2E2E2]  space-y-4">
                <div className="flex items-center gap-4">
                  <div className="flex flex-col items-center gap-1.5">
                    <div
                      className="w-8 h-8 rounded-full border border-slate-200 "
                      style={{
                        backgroundColor: organization.primaryColor || "#e2e8f0",
                      }}
                    />
                    <span className="text-[8px] font-semibold text-slate-300 uppercase tracking-[0.05em]">
                      Primary
                    </span>
                  </div>
                  <div className="flex flex-col items-center gap-1.5">
                    <div
                      className="w-8 h-8 rounded-full border border-slate-200 "
                      style={{
                        backgroundColor:
                          organization.secondaryColor || "#e2e8f0",
                      }}
                    />
                    <span className="text-[8px] font-semibold text-slate-300 uppercase tracking-[0.05em]">
                      Secondary
                    </span>
                  </div>
                  <div className="flex-1 space-y-1 pl-2">
                    <span className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] block">
                      Colors
                    </span>
                    <span className="text-[11px] font-bold text-slate-600 font-mono">
                      {organization.primaryColor || "—"}
                      {organization.secondaryColor
                        ? ` / ${organization.secondaryColor}`
                        : ""}
                    </span>
                  </div>
                </div>

                <div className="pt-4 border-t border-slate-50 flex items-center justify-between">
                  <div className="flex items-center gap-2 min-w-0">
                    <Link2 className="w-3.5 h-3.5 text-blue-600 shrink-0" />
                    <span className="text-[11px] font-bold text-slate-600 truncate">
                      {organization.slug
                        ? `/login?org=${organization.slug}`
                        : "No branded login link configured"}
                    </span>
                  </div>
                  {loginLink && (
                    <button
                      type="button"
                      onClick={copyLoginLink}
                      className="shrink-0 w-7 h-7 rounded-xl bg-slate-50 border border-slate-100 text-slate-400 hover:text-blue-600 hover:border-blue-200 flex items-center justify-center transition-colors"
                    >
                      {copied ? (
                        <Check className="w-3.5 h-3.5 text-emerald-500" />
                      ) : (
                        <Copy className="w-3.5 h-3.5" />
                      )}
                    </button>
                  )}
                </div>
              </div>
            </div>

            <div>
              <h3 className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-4 flex items-center gap-2">
                <Clock className="w-3 h-3 text-blue-600" strokeWidth={4} />
                Dates
              </h3>
              <div className="space-y-3">
                <div className="p-4 bg-white rounded-[20px] border border-[#E2E2E2]  flex items-center justify-between">
                  <div className="flex items-center gap-3">
                    <div className="w-8 h-8 rounded-full bg-blue-50 flex items-center justify-center text-blue-500">
                      <Calendar size={14} />
                    </div>
                    <span className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em]">
                      Created
                    </span>
                  </div>
                  <span className="text-[11px] font-semibold text-slate-900 uppercase tracking-[0.05em]">
                    {formatDate(organization.createdAt)}
                  </span>
                </div>
                <div className="p-4 bg-white rounded-[20px] border border-[#E2E2E2]  flex items-center justify-between">
                  <div className="flex items-center gap-3">
                    <div className="w-8 h-8 rounded-full bg-slate-50 flex items-center justify-center text-slate-400">
                      <Activity size={14} />
                    </div>
                    <span className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em]">
                      Updated
                    </span>
                  </div>
                  <span className="text-[11px] font-semibold text-slate-900 uppercase tracking-[0.05em]">
                    {formatDate(organization.updatedAt)}
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="bg-[#5C0B19] p-6 flex items-center justify-between mt-auto">
          <div className="flex items-center gap-2">
            <UserCircle className="w-5 h-5 text-slate-500" />
            <span className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em]">
              Admin access verified
            </span>
          </div>
        </div>
      </SheetContent>
    </Sheet>
  );
}
