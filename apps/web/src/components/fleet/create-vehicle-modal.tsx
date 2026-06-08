"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { useSession } from "next-auth/react";
import {
  Plus,
  Loader2,
  TrainFront,
  ShieldCheck,
  Globe,
  Database,
  X,
  Building2,
  CheckCircle2,
  Zap,
  Scale,
} from "lucide-react";
import { useCreateVehicle } from "@/modules/fleet/use-fleet";
import { useOrganizations } from "@/modules/organizations/use-organizations";
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
  SheetDescription,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import { Button } from "@repo/ui/button";
import { cn } from "@/lib/utils";
import { EntitySelect } from "@/components/shared/entity-select";

const VEHICLE_TYPES = ["Premium", "Standard", "Economy", "Heavy Duty"];
const VEHICLE_CLASSES = [
  "Locomotive",
  "Cargo Wagon",
  "Tanker",
  "Flatbed",
  "Container Carrier",
];

export function CreateVehicleModal() {
  const router = useRouter();
  const { data: session } = useSession();
  const [open, setOpen] = useState(false);
  const { mutate: createVehicle, isPending } = useCreateVehicle();
  const { data: orgs } = useOrganizations();
  const [error, setError] = useState<string | null>(null);

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setError(null);
    const formData = new FormData(e.currentTarget);
    const data = Object.fromEntries(formData.entries());

    createVehicle(data as any, {
      onSuccess: () => {
        setOpen(false);
        router.refresh();
      },
      onError: (err: any) => {
        setError(err.message || "Failed to register asset");
      },
    });
  };

  return (
    <Sheet open={open} onOpenChange={setOpen}>
      <SheetTrigger asChild>
        <button className="h-12 px-6 bg-slate-900 border border-slate-800 hover:bg-slate-800 text-white rounded-[10px] font-black text-[11px] uppercase tracking-widest flex items-center gap-3 transition-all active:scale-95 group shadow-lg shadow-slate-900/10">
          <Plus
            size={14}
            strokeWidth={3}
            className="group-hover:rotate-90 transition-transform duration-300"
          />
          Register Rail Asset
        </button>
      </SheetTrigger>

      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden border border-slate-100 bg-white shadow-2xl rounded-2xl flex flex-col">
        {/* Header Section */}
        <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md">
            <TrainFront className="w-6 h-6 text-white" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10 text-left">
            <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase">
              Rail Asset Registration
            </SheetTitle>
            <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
              Add a new wagon to the tracking network
            </SheetDescription>
          </div>
        </div>

        {/* Form Section */}
        <form
          id="rail-asset-form"
          onSubmit={handleSubmit}
          className="p-8 space-y-10 flex-1 overflow-y-auto custom-scrollbar"
        >
          {error && (
            <div className="p-4 bg-rose-50 border border-rose-100 rounded-[10px] text-rose-600 text-[12px] font-bold flex items-center gap-3">
              <div className="w-2 h-2 rounded-full bg-rose-500 shadow-[0_0_10px_rgba(244,63,94,0.5)]" />
              {error}
            </div>
          )}

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-8 gap-y-10">
            <div className="space-y-3">
              <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                Asset Serial Number
              </Label>
              <Input
                name="plateNumber"
                className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-[14px] font-bold focus:ring-4 focus:ring-blue-50 focus:border-blue-500 transition-all uppercase"
                placeholder="e.g. TRC-9021"
                required
              />
            </div>

            <div className="space-y-3">
              <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                Service Tier
              </Label>
              <SelectInput name="type" required>
                <option value="">Select tier...</option>
                {VEHICLE_TYPES.map((t) => (
                  <option key={t} value={t}>
                    {t}
                  </option>
                ))}
              </SelectInput>
            </div>

            <div className="space-y-3">
              <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                Asset Classification
              </Label>
              <SelectInput name="class" required>
                <option value="">Select class...</option>
                {VEHICLE_CLASSES.map((c) => (
                  <option key={c} value={c}>
                    {c}
                  </option>
                ))}
              </SelectInput>
            </div>

            <div className="space-y-3">
              <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                Operator (Optional)
              </Label>
              <Input
                name="carrier"
                className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-[14px] font-bold transition-all focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50"
                placeholder="e.g. TRC, TAZARA"
              />
            </div>

            {session?.user?.role === "SUPER_ADMIN" && (
              <div className="md:col-span-2 space-y-3">
                <EntitySelect
                  label="Owner Organization"
                  icon={Building2}
                  placeholder="Platform Asset (Internal)"
                  name="organizationId"
                  options={
                    orgs?.map((org: any) => ({
                      id: org.id,
                      name: org.name,
                      description: "Railway Operator",
                      icon: Building2,
                    })) || []
                  }
                />
              </div>
            )}
          </div>

          {/* Metadata */}
          <div className="pt-8 border-t border-slate-100 flex items-center justify-between">
            <div className="flex flex-col gap-1">
              <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                Asset Security
              </span>
              <p className="text-[10px] font-bold text-slate-400 leading-tight max-w-[280px]">
                Assets are immediately available for cargo assignment after
                registration.
              </p>
            </div>
            <div className="flex items-center gap-1.5 px-3 py-1.5 bg-emerald-50 text-emerald-600 rounded-lg border border-emerald-100">
              <ShieldCheck size={12} strokeWidth={3} />
              <span className="text-[9px] font-black uppercase tracking-widest">
                Verified Entry
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
            form="rail-asset-form"
            disabled={isPending}
            className="flex-[1.5] h-14 rounded-xl bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 flex items-center justify-center gap-3 active:scale-[0.98]"
          >
            {isPending ? (
              <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
            ) : (
              <>
                <Plus size={16} strokeWidth={3} />
                Register Asset
              </>
            )}
          </button>
        </div>
      </SheetContent>
    </Sheet>
  );
}

function SelectInput({
  children,
  name,
  required,
}: {
  children: React.ReactNode;
  name: string;
  required?: boolean;
}) {
  return (
    <div className="relative">
      <select
        name={name}
        required={required}
        className="w-full h-14 px-5 rounded-[10px] border border-slate-100 bg-slate-50 text-[14px] font-bold text-slate-900 focus:outline-none focus:ring-4 focus:ring-blue-50 focus:border-blue-500 transition-all appearance-none cursor-pointer uppercase tracking-widest"
      >
        {children}
      </select>
      <div className="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none text-slate-400">
        <svg
          width="12"
          height="12"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          strokeWidth="3"
          strokeLinecap="round"
          strokeLinejoin="round"
        >
          <polyline points="6 9 12 15 18 9" />
        </svg>
      </div>
    </div>
  );
}
