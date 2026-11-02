"use client";

import { useState } from "react";
import { MapPin, Plus, Loader2, Building2, CheckCircle2 } from "lucide-react";
import { Button } from "@repo/ui/button";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@repo/ui/sheet";
import { useCreateStation } from "@/modules/stations/use-stations";
import { useOrganizations } from "@/modules/organizations/use-organizations";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import { EntitySelect } from "@/components/shared/entity-select";
import { cn } from "@/lib/utils";

interface CreateStationModalProps {
  onSuccess: () => void;
}

export function CreateStationModal({ onSuccess }: CreateStationModalProps) {
  const [open, setOpen] = useState(false);
  const { mutate: createStation, isPending: loading } = useCreateStation();
  const { data: organizations = [] } = useOrganizations();
  const [error, setError] = useState<string | null>(null);

  // Form fields
  const [name, setName] = useState("");
  const [code, setCode] = useState("");
  const [location, setLocation] = useState("");
  const [organizationId, setOrganizationId] = useState("");

  // Handle form submission
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);

    const payload = {
      name,
      code: code.toUpperCase(),
      location,
      organizationId,
    };

    createStation(payload, {
      onSuccess: () => {
        setOpen(false);
        resetForm();
        onSuccess();
      },
      onError: (err: any) => {
        setError(err.message || "Failed to create station");
      },
    });
  };

  const resetForm = () => {
    setName("");
    setCode("");
    setLocation("");
    setOrganizationId("");
    setError(null);
  };

  return (
    <Sheet open={open} onOpenChange={setOpen}>
      <SheetTrigger asChild>
        <button className="group flex h-10 items-center gap-2 rounded-full bg-[#5C0B19] px-5 text-[13px] font-semibold text-white transition hover:bg-[#4F0A0C] active:scale-95">
          <Plus
            className="w-4 h-4 group-hover:rotate-90 transition-transform duration-300"
            strokeWidth={3}
          />
          Create Station
        </button>
      </SheetTrigger>

      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100  flex flex-col rounded-xl">
        {/* Header Section */}
        <div className="bg-[#5C0B19] px-8 py-7 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="w-12 h-12 rounded-xl bg-white/10 border border-slate-200 flex items-center justify-center shrink-0 relative z-10">
            <MapPin className="w-6 h-6 text-white" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10 text-left">
            <SheetTitle className="text-[20px] font-semibold text-white tracking-tight leading-tight uppercase">
              Register Station
            </SheetTitle>
            <SheetDescription className="text-slate-400 text-[11px] font-bold uppercase tracking-[0.05em] mt-0.5">
              Add a new facility to the transport network
            </SheetDescription>
          </div>
        </div>

        {/* Form Section */}
        <form
          onSubmit={handleSubmit}
          className="p-8 space-y-8 flex-1 overflow-y-auto"
        >
          {error && (
            <div className="bg-rose-50 border border-rose-100 text-rose-600 text-[13px] font-bold p-4 rounded-xl flex items-center gap-3 animate-in fade-in slide-in-from-top-2">
              <div className="w-2 h-2 rounded-full bg-rose-500 animate-pulse" />
              {error}
            </div>
          )}

          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="space-y-6 md:col-span-2">
              <div className="relative">
                <Label className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-3 block ml-1">
                  Station Name
                </Label>
                <div className="relative">
                  <Building2 className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-300" />
                  <Input
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    placeholder="Central Hub"
                    className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl pl-12 text-[14px] font-bold transition-all"
                    required
                  />
                </div>
              </div>
            </div>

            <div className="relative">
              <Label className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-3 block ml-1">
                Station Code{" "}
                <span className="opacity-40 italic lowercase tracking-tight font-bold">
                  (Ex: DAR, MOR)
                </span>
              </Label>
              <Input
                value={code}
                onChange={(e) => setCode(e.target.value)}
                placeholder="DAR"
                maxLength={5}
                className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-5 text-[14px] font-bold uppercase transition-all"
                required
              />
            </div>

            <div className="relative">
              <Label className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] mb-3 block ml-1">
                Location / Region
              </Label>
              <div className="relative">
                <MapPin className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-300" />
                <Input
                  value={location}
                  onChange={(e) => setLocation(e.target.value)}
                  placeholder="City or Region"
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl pl-12 text-[14px] font-bold transition-all"
                />
              </div>
            </div>

            <EntitySelect
              label="Parent Organization"
              icon={Building2}
              placeholder="Select parent entity"
              value={organizationId}
              onChange={setOrganizationId}
              options={organizations.map((org: any) => ({
                id: org.id,
                name: org.name,
                description: org.code || "Registered Entity",
                icon: Building2,
              }))}
            />
          </div>

          <div className="pt-4 flex flex-col md:flex-row items-center justify-between text-slate-400 border-t border-slate-50 pt-8 mt-4">
            <div className="flex flex-col gap-1 mb-4 md:mb-0">
              <span className="text-[10px] font-semibold uppercase tracking-[0.05em]">
                Network Compliance
              </span>
              <p className="text-[10px] font-bold leading-tight max-w-[280px]">
                The station will be visible in the tracking network immediately
                after registration.
              </p>
            </div>

            <div className="flex gap-3 w-full md:w-auto">
              <Button
                type="button"
                variant="ghost"
                onClick={() => setOpen(false)}
                className="h-14 px-8 rounded-xl font-semibold text-[11px] uppercase tracking-[0.05em] text-slate-400 hover:text-slate-900 transition-all border border-transparent hover:border-slate-100 flex-1 md:flex-none"
                disabled={loading}
              >
                Cancel
              </Button>
              <Button
                type="submit"
                disabled={loading || !name || !code || !organizationId}
                className="h-14 px-10 rounded-xl font-semibold text-[11px] uppercase tracking-[0.05em] bg-[#5C0B19] hover:bg-[#4F0A0C] text-white transition-all active:scale-95 flex items-center justify-center gap-2 flex-1 md:flex-none"
              >
                {loading ? (
                  <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
                ) : (
                  <>
                    <CheckCircle2 className="w-5 h-5" strokeWidth={3} />
                    Add Station
                  </>
                )}
              </Button>
            </div>
          </div>
        </form>
      </SheetContent>
    </Sheet>
  );
}
