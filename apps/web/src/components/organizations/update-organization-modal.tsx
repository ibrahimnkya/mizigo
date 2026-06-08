"use client";

import { useState, useEffect } from "react";
import {
  Building2,
  Save,
  Loader2,
  AlertCircle,
  CheckCircle2,
  MoreHorizontal,
  Edit3,
} from "lucide-react";
import { Button } from "@repo/ui/button";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import { useUpdateOrganization } from "@/modules/organizations/use-organizations";
import { cn } from "@/lib/utils";

interface UpdateOrganizationModalProps {
  organization: any;
  onSuccess: () => void;
}

export function UpdateOrganizationModal({
  organization,
  onSuccess,
}: UpdateOrganizationModalProps) {
  const [open, setOpen] = useState(false);
  const { mutate: updateOrg, isPending: loading } = useUpdateOrganization();
  const [error, setError] = useState<string | null>(null);

  const [name, setName] = useState(organization.name || "");
  const [description, setDescription] = useState(
    organization.description || "",
  );
  const [supportUrl, setSupportUrl] = useState(organization.supportUrl || "");
  const [commissionRate, setCommissionRate] = useState<string>(
    (organization.commissionRate * 100).toString() || "0",
  );
  const [commissionNotes, setCommissionNotes] = useState(
    organization.commissionNotes || "",
  );
  const [isActive, setIsActive] = useState(organization.isActive);

  // Sync state if prop changes
  useEffect(() => {
    if (open) {
      setName(organization.name || "");
      setDescription(organization.description || "");
      setSupportUrl(organization.supportUrl || "");
      setCommissionRate(((organization.commissionRate || 0) * 100).toString());
      setCommissionNotes(organization.commissionNotes || "");
      setIsActive(organization.isActive);
    }
  }, [open, organization]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);

    const payload = {
      id: organization.id,
      name,
      description,
      supportUrl,
      commissionRate: parseFloat(commissionRate) / 100,
      commissionNotes,
      isActive,
    };

    updateOrg(payload, {
      onSuccess: () => {
        setOpen(false);
        onSuccess();
      },
      onError: (err: any) => {
        setError(err.message);
      },
    });
  };

  return (
    <Sheet open={open} onOpenChange={setOpen}>
      <SheetTrigger asChild>
        <button className="w-10 h-10 rounded-[10px] bg-slate-50 text-slate-400 flex items-center justify-center hover:bg-slate-900 hover:text-white transition-all duration-300 shadow-sm border border-slate-100 active:scale-90">
          <Edit3 size={16} strokeWidth={3} />
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
            <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase">
              Edit Organization
            </SheetTitle>
            <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
              ID: {organization.id.substring(0, 8).toUpperCase()} · Management
              Portal
            </SheetDescription>
          </div>
        </div>

        <form
          id="update-org-form"
          onSubmit={handleSubmit}
          className="p-8 space-y-10 flex-1 overflow-y-auto custom-scrollbar"
        >
          {error && (
            <div className="bg-rose-50 border border-rose-100 text-rose-600 text-[13px] font-bold p-4 rounded-[10px] flex items-center gap-3">
              <AlertCircle className="w-5 h-5" />
              {error}
            </div>
          )}

          <div className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-10">
            <div className="space-y-8">
              <div className="space-y-3">
                <Label
                  htmlFor="edit-name"
                  className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1"
                >
                  Organization Name
                </Label>
                <Input
                  id="edit-name"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold transition-all text-slate-900"
                  required
                />
              </div>

              <div className="space-y-3">
                <Label
                  htmlFor="edit-description"
                  className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1"
                >
                  Description
                </Label>
                <Input
                  id="edit-description"
                  value={description}
                  onChange={(e) => setDescription(e.target.value)}
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold transition-all text-slate-900"
                />
              </div>

              <div className="space-y-3">
                <Label
                  htmlFor="edit-supportUrl"
                  className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1"
                >
                  Support URL
                </Label>
                <Input
                  id="edit-supportUrl"
                  value={supportUrl}
                  onChange={(e) => setSupportUrl(e.target.value)}
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold transition-all text-slate-900"
                />
              </div>

              <div className="flex items-center justify-between p-4 bg-slate-50 rounded-xl border border-slate-100">
                <div className="flex flex-col gap-0.5">
                  <span className="text-[11px] font-black text-slate-900 uppercase tracking-tight">
                    Active Status
                  </span>
                  <span className="text-[9px] font-bold text-slate-400 uppercase tracking-widest">
                    Public availability
                  </span>
                </div>
                <button
                  type="button"
                  onClick={() => setIsActive(!isActive)}
                  className={cn(
                    "h-7 w-12 rounded-full transition-all relative",
                    isActive
                      ? "bg-emerald-500 shadow-[0_0_15px_rgba(16,185,129,0.3)]"
                      : "bg-slate-200",
                  )}
                >
                  <div
                    className={cn(
                      "absolute top-1 w-5 h-5 rounded-full bg-white shadow-sm transition-all",
                      isActive ? "left-6" : "left-1",
                    )}
                  />
                </button>
              </div>
            </div>

            <div className="space-y-8">
              <div className="space-y-3">
                <Label
                  htmlFor="edit-commissionRate"
                  className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1"
                >
                  Commission Rate (%)
                </Label>
                <div className="relative">
                  <Input
                    id="edit-commissionRate"
                    type="number"
                    min="0"
                    max="100"
                    step="0.01"
                    value={commissionRate}
                    onChange={(e) => setCommissionRate(e.target.value)}
                    className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold transition-all text-slate-900 pr-12"
                  />
                  <span className="absolute right-5 top-1/2 -translate-y-1/2 font-black text-[12px] text-blue-600">
                    %
                  </span>
                </div>
              </div>

              <div className="space-y-3">
                <Label
                  htmlFor="edit-commissionNotes"
                  className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1"
                >
                  Commission Notes
                </Label>
                <textarea
                  id="edit-commissionNotes"
                  value={commissionNotes}
                  onChange={(e) => setCommissionNotes(e.target.value)}
                  className="w-full h-[184px] py-4 bg-slate-50 border border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold transition-all text-slate-900 resize-none custom-scrollbar"
                />
              </div>
            </div>
          </div>

          {/* Metadata */}
          <div className="pt-8 border-t border-slate-100 flex items-center justify-between">
            <div className="flex flex-col gap-1">
              <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                Governance
              </span>
              <p className="text-[10px] font-bold text-slate-400 leading-tight max-w-[280px]">
                Configuration changes are applied instantly.
              </p>
            </div>
            <div className="flex items-center gap-1.5 px-3 py-1.5 bg-emerald-50 text-emerald-600 rounded-lg border border-emerald-100">
              <CheckCircle2 size={12} strokeWidth={3} />
              <span className="text-[9px] font-black uppercase tracking-widest">
                Authorized Entry
              </span>
            </div>
          </div>
        </form>

        {/* Action Footer */}
        <div className="p-6 bg-slate-50 border-t border-slate-100 flex gap-3">
          <button
            type="button"
            onClick={() => setOpen(false)}
            className="flex-1 h-14 rounded-xl bg-white border border-slate-200 text-slate-400 text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-50 transition-all active:scale-[0.98]"
          >
            Cancel
          </button>
          <button
            type="submit"
            form="update-org-form"
            disabled={loading || !name}
            className="flex-[1.5] h-14 rounded-xl bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 flex items-center justify-center gap-3 active:scale-[0.98]"
          >
            {loading ? (
              <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
            ) : (
              <>
                <Save className="w-5 h-5" strokeWidth={3} />
                Save Changes
              </>
            )}
          </button>
        </div>
      </SheetContent>
    </Sheet>
  );
}
