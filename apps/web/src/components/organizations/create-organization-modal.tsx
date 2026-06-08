"use client";

import { useState } from "react";
import { Building2, Plus, Loader2, Info, CheckCircle2 } from "lucide-react";
import { Button } from "@repo/ui/button";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
  SheetFooter,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import { useCreateOrganization } from "@/modules/organizations/use-organizations";
import { cn } from "@/lib/utils";

interface CreateOrganizationModalProps {
  onSuccess: () => void;
}

export function CreateOrganizationModal({
  onSuccess,
}: CreateOrganizationModalProps) {
  const [open, setOpen] = useState(false);
  const { mutate: createOrg, isPending: loading } = useCreateOrganization();
  const [error, setError] = useState<string | null>(null);

  const [name, setName] = useState("");
  const [description, setDescription] = useState("");
  const [supportUrl, setSupportUrl] = useState("");
  const [commissionRate, setCommissionRate] = useState<string>("0");
  const [commissionNotes, setCommissionNotes] = useState("");

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);

    const payload = {
      name,
      description,
      supportUrl,
      commissionRate: parseFloat(commissionRate) / 100,
      commissionNotes,
    };

    createOrg(payload, {
      onSuccess: () => {
        setOpen(false);
        setName("");
        setDescription("");
        setSupportUrl("");
        setCommissionRate("0");
        setCommissionNotes("");
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
        <button className="h-12 px-6 bg-slate-900 hover:bg-slate-800 text-white rounded-[10px] font-black text-[13px] uppercase tracking-widest flex items-center gap-2 transition-all active:scale-95 group">
          <Plus
            className="w-4 h-4 group-hover:rotate-90 transition-transform duration-300"
            strokeWidth={3}
          />
          Register Organization
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
              Register Organization
            </SheetTitle>
            <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
              Add a new service provider entity
            </SheetDescription>
          </div>
        </div>

        <form
          id="create-org-form"
          onSubmit={handleSubmit}
          className="p-8 space-y-10 flex-1 overflow-y-auto custom-scrollbar"
        >
          {error && (
            <div className="bg-rose-50 border border-rose-100 text-rose-600 text-[13px] font-bold p-4 rounded-[10px] flex items-center gap-3">
              <div className="w-2 h-2 rounded-full bg-rose-500 shadow-[0_0_10px_rgba(244,63,94,0.5)]" />
              {error}
            </div>
          )}

          <div className="flex flex-col gap-10">
            {/* Section 1: Identity */}
            <div className="space-y-8">
              <div className="space-y-3">
                <Label
                  htmlFor="name"
                  className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1"
                >
                  Organization Name
                </Label>
                <Input
                  id="name"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  placeholder="Acme Global Logistics"
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold placeholder:text-slate-300 transition-all text-slate-900"
                  required
                />
              </div>

              <div className="space-y-3">
                <Label
                  htmlFor="description"
                  className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1"
                >
                  Description
                </Label>
                <Input
                  id="description"
                  value={description}
                  onChange={(e) => setDescription(e.target.value)}
                  placeholder="High-level summary of services..."
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold placeholder:text-slate-300 transition-all text-slate-900"
                />
              </div>

              <div className="space-y-3">
                <Label
                  htmlFor="supportUrl"
                  className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1"
                >
                  Support URL
                </Label>
                <Input
                  id="supportUrl"
                  value={supportUrl}
                  onChange={(e) => setSupportUrl(e.target.value)}
                  placeholder="https://support.acme.com"
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold placeholder:text-slate-300 transition-all text-slate-900"
                />
              </div>
            </div>

            {/* Section 2: Platform Logic */}
            <div className="space-y-8">
              <div className="space-y-3">
                <Label
                  htmlFor="commissionRate"
                  className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1"
                >
                  Commission Rate{" "}
                  <span className="opacity-50 tracking-normal font-bold lowercase ml-1">
                    (Percentage %)
                  </span>
                </Label>
                <div className="relative">
                  <Input
                    id="commissionRate"
                    type="number"
                    min="0"
                    max="100"
                    step="0.01"
                    value={commissionRate}
                    onChange={(e) => setCommissionRate(e.target.value)}
                    className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold placeholder:text-slate-300 transition-all text-slate-900 pr-12"
                  />
                  <span className="absolute right-5 top-1/2 -translate-y-1/2 font-black text-[12px] text-blue-600">
                    %
                  </span>
                </div>
              </div>

              <div className="space-y-3">
                <Label
                  htmlFor="commissionNotes"
                  className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1"
                >
                  Commission Notes
                </Label>
                <textarea
                  id="commissionNotes"
                  value={commissionNotes}
                  onChange={(e) => setCommissionNotes(e.target.value)}
                  placeholder="Special commission logic agreements..."
                  className="w-full h-32 py-4 bg-slate-50 border border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold placeholder:text-slate-300 transition-all text-slate-900 resize-none custom-scrollbar"
                />
              </div>
            </div>
          </div>

          {/* Metadata */}
          <div className="pt-8 border-t border-slate-100 flex items-center justify-between">
            <div className="flex flex-col gap-1">
              <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                Security Protocol
              </span>
              <p className="text-[10px] font-bold text-slate-400 leading-tight max-w-[220px]">
                Organizations are subject to platform vetting.
              </p>
            </div>
            <div className="flex items-center gap-1.5 px-3 py-1.5 bg-blue-50 text-blue-600 rounded-lg border border-blue-100">
              <Info size={12} strokeWidth={3} />
              <span className="text-[9px] font-black uppercase tracking-widest">
                Awaiting Verification
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
            form="create-org-form"
            disabled={loading || !name}
            className="flex-[1.5] h-14 rounded-xl bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 flex items-center justify-center gap-3 active:scale-[0.98]"
          >
            {loading ? (
              <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
            ) : (
              <>
                <CheckCircle2 className="w-5 h-5" strokeWidth={3} />
                Register Org
              </>
            )}
          </button>
        </div>
      </SheetContent>
    </Sheet>
  );
}
