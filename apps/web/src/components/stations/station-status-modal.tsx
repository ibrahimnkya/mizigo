"use client";

import { useState } from "react";
import { AlertCircle, Loader2, CheckCircle2 } from "lucide-react";
import { Button } from "@repo/ui/button";
import {
  Sheet,
  SheetContent,
  SheetTitle,
  SheetDescription,
  SheetHeader,
} from "@repo/ui/sheet";
import { useUpdateStation } from "@/modules/stations/use-stations";
import { cn } from "@/lib/utils";

interface StationStatusModalProps {
  station: any;
  open: boolean;
  onOpenChange: (open: boolean) => void;
  onSuccess: () => void;
}

export function StationStatusModal({
  station,
  open,
  onOpenChange,
  onSuccess,
}: StationStatusModalProps) {
  const { mutate: updateStation, isPending: loading } = useUpdateStation();
  const [error, setError] = useState<string | null>(null);

  if (!station) return null;

  const isActive = station.isActive;
  const action = isActive ? "Deactivate" : "Reactivate";

  const handleToggle = async () => {
    setError(null);

    updateStation(
      {
        ...station,
        isActive: !isActive,
      },
      {
        onSuccess: () => {
          onOpenChange(false);
          onSuccess();
        },
        onError: (err: any) => {
          setError(err.message);
        },
      },
    );
  };

  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 shadow-2xl flex flex-col rounded-2xl">
        {/* Header Section */}
        <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div
            className={cn(
              "w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md",
              isActive ? "text-rose-400" : "text-emerald-400",
            )}
          >
            <AlertCircle className="w-6 h-6" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10 text-left">
            <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase">
              Update Status
            </SheetTitle>
            <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
              Network Availability Protocol
            </SheetDescription>
          </div>
        </div>

        {/* Content */}
        <div className="p-8 text-center space-y-6">
          <p className="text-slate-900 font-bold text-[15px]">
            {isActive
              ? `Do you want to deactivate '${station.name}'?`
              : `Do you want to reactivate '${station.name}'?`}
          </p>
          <p className="text-slate-400 text-[12px] leading-relaxed px-4">
            {isActive
              ? "Deactivating will stop new assignments and access for this station."
              : "Reactivating will restore all assignments and access immediately."}
          </p>

          {error && (
            <div className="bg-rose-50 border border-rose-100 text-rose-600 text-[12px] font-bold p-3 rounded-[10px] flex items-center gap-2 justify-center">
              <span className="w-1.5 h-1.5 rounded-full bg-rose-500 animate-pulse" />
              {error}
            </div>
          )}

          <div className="flex flex-col gap-3 pt-2">
            <Button
              onClick={handleToggle}
              disabled={loading}
              className={cn(
                "h-14 w-full rounded-[10px] font-black text-[11px] uppercase flex items-center justify-center gap-2",
                isActive
                  ? "bg-rose-600 hover:bg-rose-700 text-white shadow-rose-200"
                  : "bg-emerald-600 hover:bg-emerald-700 text-white shadow-emerald-200",
              )}
            >
              {loading ? (
                <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
              ) : (
                <>
                  <CheckCircle2 className="w-5 h-5" strokeWidth={3} />
                  {action}
                </>
              )}
            </Button>
            <Button
              variant="ghost"
              onClick={() => onOpenChange(false)}
              className="h-12 w-full rounded-[10px] font-black text-[11px] uppercase text-slate-400 hover:text-slate-900 border border-slate-50 hover:bg-slate-50"
              disabled={loading}
            >
              Keep Status
            </Button>
          </div>
        </div>
      </SheetContent>
    </Sheet>
  );
}
