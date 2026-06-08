"use client";

import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import {
  ChevronRight,
  Settings2,
  Zap,
  Package,
  Activity,
  Box,
} from "lucide-react";
import { MoneyBagIcon } from "../shared/icons";
import { cn } from "@/lib/utils";

const pricingRuleSchema = z.object({
  name: z.string().min(3, "Name is too short"),
  type: z.enum(["MULTIPLIER", "FIXED"]),
  value: z.number().min(0),
  urgency: z.string().optional(),
  package_size: z.string().optional(),
  parcel_type: z.string().optional(),
  item_condition: z.string().optional(),
  description: z.string().optional(),
});

type PricingRuleForm = z.infer<typeof pricingRuleSchema>;

export function PricingRuleBuilder({
  onSave,
  isLoading,
}: {
  onSave: (data: any) => Promise<void>;
  isLoading?: boolean;
}) {
  const {
    register,
    handleSubmit,
    watch,
    setValue,
    formState: { errors },
  } = useForm<PricingRuleForm>({
    resolver: zodResolver(pricingRuleSchema),
    defaultValues: {
      type: "MULTIPLIER",
      value: 1.0,
      urgency: "",
      package_size: "",
      parcel_type: "",
      item_condition: "",
    },
  });

  const ruleType = watch("type");

  const onSubmit = async (data: PricingRuleForm) => {
    // Construct condition string: urgency=EXPRESS&package_size=SIZE_1 etc.
    const conditions = [];
    if (data.urgency) conditions.push(`urgency=${data.urgency}`);
    if (data.package_size) conditions.push(`package_size=${data.package_size}`);
    if (data.parcel_type) conditions.push(`parcel_type=${data.parcel_type}`);
    if (data.item_condition)
      conditions.push(`condition=${data.item_condition}`);

    const payload = {
      name: data.name,
      type: data.type,
      value: data.value,
      condition: conditions.join("&") || null,
      description: data.description,
    };

    await onSave(payload);
  };

  return (
    <form
      onSubmit={handleSubmit(onSubmit)}
      className="space-y-8 animate-in slide-in-from-right-4 duration-300"
    >
      {/* Header Info */}
      <div className="bg-slate-900 rounded-[10px] p-6 text-white flex items-center justify-between border border-slate-800 shadow-2xl">
        <div className="flex items-center gap-4">
          <div className="w-12 h-12 bg-white/10 rounded-[10px] flex items-center justify-center border border-white/10">
            <MoneyBagIcon size={24} className="text-blue-400" />
          </div>
          <div>
            <h3 className="font-black text-lg tracking-tight">
              Strategy Configuration
            </h3>
            <p className="text-white/40 text-[10px] font-black uppercase tracking-widest">
              Global Pricing Engine v2.4
            </p>
          </div>
        </div>
        <div className="flex gap-2">
          <div
            className={cn(
              "px-4 py-1.5 rounded-full text-[10px] font-black uppercase tracking-widest border transition-all",
              ruleType === "MULTIPLIER"
                ? "bg-blue-500/20 border-blue-500/50 text-blue-400"
                : "bg-emerald-500/20 border-emerald-500/50 text-emerald-400",
            )}
          >
            {ruleType}
          </div>
        </div>
      </div>

      {/* Basic Configuration */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8 bg-white p-8 rounded-[10px] border border-slate-100 shadow-sm">
        <div className="flex flex-col gap-2">
          <label className="text-[11px] font-extrabold uppercase tracking-[0.2em] text-slate-400 ml-1">
            Rule Designation
          </label>
          <input
            {...register("name")}
            placeholder="e.g. Express Multiplier"
            className="h-14 px-5 bg-slate-50 border border-slate-200 rounded-[10px] text-sm font-bold focus:ring-2 focus:ring-blue-500 outline-none transition-all placeholder:text-slate-300"
          />
          {errors.name && (
            <p className="text-[10px] text-rose-500 font-bold ml-1">
              {errors.name.message}
            </p>
          )}
        </div>

        <div className="flex flex-col gap-2">
          <label className="text-[11px] font-extrabold uppercase tracking-[0.2em] text-slate-400 ml-1">
            Strategy Type
          </label>
          <div className="grid grid-cols-2 gap-2 p-1.5 bg-slate-100 rounded-[10px] h-14">
            <button
              type="button"
              onClick={() => setValue("type", "MULTIPLIER")}
              className={cn(
                "rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all transition-duration-300",
                ruleType === "MULTIPLIER"
                  ? "bg-white text-blue-600 shadow-md scale-[1.02]"
                  : "text-slate-500 hover:text-slate-700",
              )}
            >
              Multiplier (x)
            </button>
            <button
              type="button"
              onClick={() => setValue("type", "FIXED")}
              className={cn(
                "rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all transition-duration-300",
                ruleType === "FIXED"
                  ? "bg-white text-emerald-600 shadow-md scale-[1.02]"
                  : "text-slate-500 hover:text-slate-700",
              )}
            >
              Fixed Base
            </button>
          </div>
        </div>

        <div className="flex flex-col gap-2 md:col-span-2">
          <label className="text-[11px] font-extrabold uppercase tracking-[0.2em] text-slate-400 ml-1">
            Strategy Value
          </label>
          <div className="relative">
            <input
              type="number"
              step="0.01"
              {...register("value", { valueAsNumber: true })}
              className="h-14 w-full px-5 bg-slate-50 border border-slate-200 rounded-[10px] text-lg font-black text-slate-900 focus:ring-2 focus:ring-blue-500 outline-none transition-all"
            />
            <div className="absolute right-5 top-1/2 -translate-y-1/2 text-[10px] font-black text-slate-400 uppercase tracking-widest">
              {ruleType === "MULTIPLIER" ? "Ratio" : "TZS"}
            </div>
          </div>
          {errors.value && (
            <p className="text-[10px] text-rose-500 font-bold ml-1">
              {errors.value.message}
            </p>
          )}
        </div>
      </div>

      {/* Targeting Configuration */}
      <div className="space-y-6">
        <div className="flex items-center gap-3">
          <div className="h-8 w-8 bg-blue-600 rounded-[10px] flex items-center justify-center text-white shadow-lg shadow-blue-200">
            <Settings2 size={16} />
          </div>
          <h4 className="text-sm font-black text-slate-900 uppercase tracking-tight">
            Parametric Targeting
          </h4>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {/* Urgency */}
          <div className="bg-white p-6 rounded-[10px] border border-slate-100 shadow-sm flex flex-col gap-4">
            <div className="flex items-center gap-2">
              <Zap className="h-4 w-4 text-amber-500" />
              <label className="text-[11px] font-black uppercase tracking-widest text-slate-500">
                Urgency
              </label>
            </div>
            <select
              {...register("urgency")}
              className="h-11 w-full px-4 bg-slate-50 border border-slate-200 rounded-[10px] text-xs font-bold focus:ring-2 focus:ring-blue-500 outline-none transition-all appearance-none"
            >
              <option value="">Any Urgency</option>
              <option value="EXPRESS">Express</option>
              <option value="STANDARD">Standard</option>
              <option value="MGR">MGR</option>
            </select>
          </div>

          {/* Parcel Type */}
          <div className="bg-white p-6 rounded-[10px] border border-slate-100 shadow-sm flex flex-col gap-4">
            <div className="flex items-center gap-2">
              <Package className="h-4 w-4 text-blue-500" />
              <label className="text-[11px] font-black uppercase tracking-widest text-slate-500">
                Parcel Type
              </label>
            </div>
            <select
              {...register("parcel_type")}
              className="h-11 w-full px-4 bg-slate-50 border border-slate-200 rounded-[10px] text-xs font-bold focus:ring-2 focus:ring-blue-500 outline-none transition-all appearance-none"
            >
              <option value="">Any Type</option>
              <option value="PARCEL">Parcel</option>
              <option value="PALLET">Pallet</option>
              <option value="CONTAINER">Container</option>
              <option value="FRAGILE">Fragile</option>
            </select>
          </div>

          {/* Condition */}
          <div className="bg-white p-6 rounded-[10px] border border-slate-100 shadow-sm flex flex-col gap-4">
            <div className="flex items-center gap-2">
              <Activity className="h-4 w-4 text-emerald-500" />
              <label className="text-[11px] font-black uppercase tracking-widest text-slate-500">
                Condition
              </label>
            </div>
            <select
              {...register("item_condition")}
              className="h-11 w-full px-4 bg-slate-50 border border-slate-200 rounded-[10px] text-xs font-bold focus:ring-2 focus:ring-blue-500 outline-none transition-all appearance-none"
            >
              <option value="">Any Condition</option>
              <option value="BRAND_NEW">Brand New</option>
              <option value="REFURBISHED">Refurbished</option>
              <option value="USED">Used</option>
            </select>
          </div>

          {/* Package Size */}
          <div className="bg-white p-6 rounded-[10px] border border-slate-100 shadow-sm flex flex-col gap-4">
            <div className="flex items-center gap-2">
              <Box className="h-4 w-4 text-indigo-500" />
              <label className="text-[11px] font-black uppercase tracking-widest text-slate-500">
                Package Size
              </label>
            </div>
            <select
              {...register("package_size")}
              className="h-11 w-full px-4 bg-slate-50 border border-slate-200 rounded-[10px] text-xs font-bold focus:ring-2 focus:ring-blue-500 outline-none transition-all appearance-none"
            >
              <option value="">Any Size</option>
              <option value="DOCUMENT_A4">Document (A4)</option>
              <option value="A3_NYLON">A3 Nylon</option>
              <option value="SIZE_1">Size 1 (30cm x 30cm)</option>
              <option value="SIZE_2">Size 2 (50cm x 50cm)</option>
              <option value="SIZE_3">Size 3 (70cm x 70cm)</option>
            </select>
          </div>
        </div>
      </div>

      {/* Footer */}
      <div className="pt-8 border-t border-slate-100 flex justify-end">
        <button
          disabled={isLoading}
          className="h-14 px-10 bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] rounded-[10px] shadow-2xl shadow-slate-900/20 hover:bg-slate-800 transition-all active:scale-95 flex items-center gap-3 disabled:opacity-50"
        >
          {isLoading ? (
            <div className="flex items-center gap-2">
              <div className="w-4 h-4 border-2 border-white/20 border-t-white rounded-full animate-spin" />
              Synchronizing...
            </div>
          ) : (
            <>
              Deploy Rule
              <ChevronRight className="h-4 w-4" />
            </>
          )}
        </button>
      </div>
    </form>
  );
}
