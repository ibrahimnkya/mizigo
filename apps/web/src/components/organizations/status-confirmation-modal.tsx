"use client";

import { useState } from "react";
import {
  AlertTriangle,
  CheckCircle2,
  Loader2,
  Power,
  Globe,
} from "lucide-react";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@repo/ui/sheet";
import { Button } from "@repo/ui/button";
import { useUpdateOrganization } from "@/modules/organizations/use-organizations";
import { cn } from "@/lib/utils";

interface StatusConfirmationModalProps {
  organization: any;
  onSuccess: () => void;
}

export function StatusConfirmationModal({
  organization,
  onSuccess,
}: StatusConfirmationModalProps) {
  const [open, setOpen] = useState(false);
  const { mutate: updateOrg, isPending: loading } = useUpdateOrganization();
  const [error, setError] = useState<string | null>(null);

  const isDeactivating = organization.isActive;

  const handleToggle = async () => {
    setError(null);

    updateOrg(
      {
        ...organization,
        isActive: !organization.isActive,
      },
      {
        onSuccess: () => {
          setOpen(false);
          onSuccess();
        },
        onError: (err: any) => {
          setError(err.message);
        },
      },
    );
  };

  return (
    <Sheet open={open} onOpenChange={setOpen}>
      <SheetTrigger asChild>
        <button
          className={cn(
            "w-10 h-10 rounded-[10px] flex items-center justify-center transition-all duration-300 shadow-sm border active:scale-90",
            organization.isActive
              ? "bg-slate-50 text-slate-400 border-slate-100 hover:bg-rose-600 hover:text-white"
              : "bg-emerald-600 text-white border-emerald-500 hover:bg-emerald-700 shadow-xl shadow-emerald-500/20",
          )}
        >
          <Power size={16} strokeWidth={3} />
        </button>
      </SheetTrigger>

      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 shadow-2xl flex flex-col rounded-2xl">
        {/* Header Section */}
        <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div
            className={cn(
              "w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md",
              isDeactivating ? "text-rose-400" : "text-emerald-400",
            )}
          >
            {isDeactivating ? (
              <AlertTriangle className="w-6 h-6" strokeWidth={2.5} />
            ) : (
              <CheckCircle2 className="w-6 h-6" strokeWidth={2.5} />
            )}
          </div>
          <div className="flex flex-col relative z-10 text-left">
            <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase">
              {isDeactivating ? "Deactivate" : "Reactivate"}
            </SheetTitle>
            <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
              Status Management Protocol
            </SheetDescription>
          </div>
        </div>

        <div className="p-8 pb-4">
          <p className="text-slate-600 font-medium text-[14px] leading-relaxed">
            {isDeactivating
              ? `Are you sure you want to deactivate ${organization.name.toUpperCase()}?`
              : `Are you sure you want to reactivate ${organization.name.toUpperCase()}?`}
          </p>
        </div>

        <div className="p-8 space-y-4">
          {error && (
            <div className="flex items-center gap-2 p-3 bg-rose-100/50 text-rose-600 text-[11px] font-black uppercase tracking-widest border border-rose-200 rounded-[10px]">
              <AlertTriangle size={14} />
              {error}
            </div>
          )}

          <div className="flex flex-col gap-3">
            <Button
              onClick={handleToggle}
              disabled={loading}
              className={cn(
                "h-14 font-black text-[12px] uppercase tracking-[0.2em] shadow-lg transition-all active:scale-95",
                isDeactivating
                  ? "bg-rose-600 hover:bg-rose-700 text-white shadow-rose-500/20"
                  : "bg-emerald-600 hover:bg-emerald-700 text-white shadow-emerald-500/20",
              )}
            >
              {loading ? (
                <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
              ) : isDeactivating ? (
                "Deactivate"
              ) : (
                "Reactivate"
              )}
            </Button>
            <Button
              variant="ghost"
              onClick={() => setOpen(false)}
              disabled={loading}
              className="h-12 font-black text-[11px] uppercase tracking-widest text-slate-400 hover:text-slate-900 transition-all"
            >
              Cancel
            </Button>
          </div>
        </div>
      </SheetContent>
    </Sheet>
  );
}
