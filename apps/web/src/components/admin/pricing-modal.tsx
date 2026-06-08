"use client";

import { useState, useEffect } from "react";
import {
  Calculator,
  Plus,
  Loader2,
  CheckCircle2,
  Zap,
  TrendingUp,
  Percent,
} from "lucide-react";
import { Button } from "@repo/ui/button";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetTitle,
  SheetTrigger,
  SheetHeader,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import {
  useCreatePricingRule,
  useUpdatePricingRule,
} from "@/modules/pricing/use-pricing";
import { cn } from "@/lib/utils";

interface PricingModalProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  rule?: any; // If present, we're in Edit mode
}

export function PricingModal({ open, onOpenChange, rule }: PricingModalProps) {
  const createMutation = useCreatePricingRule();
  const updateMutation = useUpdatePricingRule();
  const [error, setError] = useState<string | null>(null);

  const isLoading = createMutation.isPending || updateMutation.isPending;

  // Form State
  const [name, setName] = useState("");
  const [type, setType] = useState<"FIXED" | "MULTIPLIER">("FIXED");
  const [value, setValue] = useState("");
  const [condition, setCondition] = useState("");
  const [isActive, setIsActive] = useState(true);

  useEffect(() => {
    if (rule) {
      setName(rule.name || "");
      setType(rule.type || "FIXED");
      setValue(rule.value?.toString() || "");
      setCondition(rule.condition || "");
      setIsActive(rule.isActive ?? true);
    } else {
      resetForm();
    }
  }, [rule, open]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);

    const payload = {
      name,
      type,
      value: Number(value),
      condition: condition || null,
      isActive,
    };

    try {
      if (rule) {
        await updateMutation.mutateAsync({ id: rule.id, ...payload });
      } else {
        await createMutation.mutateAsync(payload);
      }
      onOpenChange(false);
      resetForm();
    } catch (err: any) {
      setError(
        err.response?.data?.error?.message ||
          err.message ||
          "Failed to save pricing rule",
      );
    }
  };

  const resetForm = () => {
    setName("");
    setType("FIXED");
    setValue("");
    setCondition("");
    setIsActive(true);
    setError(null);
  };

  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 shadow-2xl flex flex-col rounded-2xl">
        {/* Header Section */}
        <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10">
            <Calculator className="w-6 h-6 text-white" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10">
            <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase">
              {rule ? "Edit Price Rule" : "Create Price Rule"}
            </SheetTitle>
            <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
              Manage automated shipping calculations
            </SheetDescription>
          </div>
        </div>

        <form
          id="pricing-form"
          onSubmit={handleSubmit}
          className="p-8 space-y-8"
        >
          {error && (
            <div className="bg-rose-50 border border-rose-100 text-rose-600 text-[13px] font-bold p-4 rounded-[10px] flex items-center gap-3 animate-in fade-in slide-in-from-top-2">
              <div className="w-2 h-2 rounded-full bg-rose-500 shadow-[0_0_10px_rgba(244,63,94,0.5)]" />
              {error}
            </div>
          )}

          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="space-y-6 md:col-span-2">
              <div className="relative">
                <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-3 block ml-1 hover:text-blue-600 transition-colors cursor-default">
                  Rule Name
                </Label>
                <Input
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  placeholder="Express Delivery Premium"
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold transition-all"
                  required
                />
              </div>
            </div>

            <div>
              <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-3 block ml-1">
                Type
              </Label>
              <div className="grid grid-cols-2 gap-2">
                <button
                  type="button"
                  onClick={() => setType("FIXED")}
                  className={cn(
                    "h-12 rounded-[10px] text-[11px] font-black uppercase tracking-widest border transition-all flex items-center justify-center gap-2",
                    type === "FIXED"
                      ? "bg-slate-900 text-white border-slate-900 shadow-lg"
                      : "bg-slate-50 text-slate-400 border-slate-100 hover:bg-slate-100",
                  )}
                >
                  Fixed TSh
                </button>
                <button
                  type="button"
                  onClick={() => setType("MULTIPLIER")}
                  className={cn(
                    "h-12 rounded-[10px] text-[11px] font-black uppercase tracking-widest border transition-all flex items-center justify-center gap-2",
                    type === "MULTIPLIER"
                      ? "bg-slate-900 text-white border-slate-900 shadow-lg"
                      : "bg-slate-50 text-slate-400 border-slate-100 hover:bg-slate-100",
                  )}
                >
                  Multiplier
                </button>
              </div>
            </div>

            <div>
              <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-3 block ml-1">
                Value
              </Label>
              <div className="relative">
                <Input
                  type="number"
                  step={type === "MULTIPLIER" ? "0.01" : "1"}
                  value={value}
                  onChange={(e) => setValue(e.target.value)}
                  placeholder={type === "MULTIPLIER" ? "1.25" : "5000"}
                  className="h-12 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold transition-all"
                  required
                />
                <div className="absolute right-4 top-1/2 -translate-y-1/2 text-[11px] font-black text-slate-300 pointer-events-none">
                  {type === "MULTIPLIER" ? "X" : "TZS"}
                </div>
              </div>
            </div>

            <div className="md:col-span-2">
              <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-3 block ml-1">
                Condition{" "}
                <span className="opacity-40 italic lowercase tracking-tight font-bold">
                  (Optional)
                </span>
              </Label>
              <Input
                value={condition}
                onChange={(e) => setCondition(e.target.value)}
                placeholder="weight > 50 or is_hazardous"
                className="h-12 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold transition-all font-mono"
              />
            </div>

            <div className="md:col-span-2 flex items-center justify-between p-4 bg-slate-50 rounded-[10px] border border-slate-100">
              <div className="flex flex-col">
                <span className="text-[12px] font-black text-slate-900 uppercase tracking-tight">
                  Active Status
                </span>
                <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">
                  Enable this pricing rule
                </span>
              </div>
              <button
                type="button"
                onClick={() => setIsActive(!isActive)}
                className={cn(
                  "h-8 w-14 rounded-full transition-all relative",
                  isActive
                    ? "bg-emerald-500 shadow-[0_0_15px_rgba(16,185,129,0.3)]"
                    : "bg-slate-200",
                )}
              >
                <div
                  className={cn(
                    "absolute top-1 w-6 h-6 rounded-full bg-white shadow-sm transition-all",
                    isActive ? "left-7" : "left-1",
                  )}
                />
              </button>
            </div>
          </div>

          <div className="pt-8 border-t border-slate-100 flex items-center justify-between">
            <div className="flex flex-col gap-1">
              <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                Calculation Protocol
              </span>
              <p className="text-[10px] font-bold text-slate-400 leading-tight max-w-[280px]">
                Rules are applied to all relevant shipment manifests.
              </p>
            </div>
            <div className="flex items-center gap-1.5 px-3 py-1.5 bg-blue-50 text-blue-600 rounded-lg border border-blue-100">
              <TrendingUp size={12} strokeWidth={3} />
              <span className="text-[9px] font-black uppercase tracking-widest">
                Revenue Opt
              </span>
            </div>
          </div>
        </form>

        {/* Action Footer */}
        <div className="p-6 bg-slate-50 border-t border-slate-100 flex gap-3">
          <button
            type="button"
            onClick={() => onOpenChange(false)}
            className="flex-1 h-14 rounded-xl bg-white border border-slate-200 text-slate-400 text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-50 transition-all active:scale-[0.98]"
          >
            Cancel
          </button>
          <button
            type="submit"
            form="pricing-form"
            disabled={isLoading || !name || !value}
            className="flex-[1.5] h-14 rounded-xl bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 flex items-center justify-center gap-3 active:scale-[0.98]"
          >
            {isLoading ? (
              <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
            ) : (
              <>
                <CheckCircle2 className="w-5 h-5" strokeWidth={3} />
                {rule ? "Save Changes" : "Create Rule"}
              </>
            )}
          </button>
        </div>
      </SheetContent>
    </Sheet>
  );
}
