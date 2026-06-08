"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@repo/ui/button";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetFooter,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import {
  PackagePlus,
  MapPin,
  User,
  Phone,
  Zap,
  CheckCircle2,
  Loader2,
  ArrowRight,
} from "lucide-react";
import { cn } from "@/lib/utils";

export function CreateParcelModal() {
  const router = useRouter();
  const [open, setOpen] = useState(false);
  const [loading, setLoading] = useState(false);

  async function onSubmit(event: React.FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setLoading(true);

    const formData = new FormData(event.currentTarget);
    const data = {
      fromAddress: formData.get("fromAddress"),
      toAddress: formData.get("toAddress"),
      serviceType: formData.get("serviceType"),
      receiverName: formData.get("receiverName"),
      receiverPhone: formData.get("receiverPhone"),
      peopleNeeded: Number(formData.get("peopleNeeded")),
      parcelType: formData.get("parcelType"),
      parcelSize: formData.get("parcelSize"),
      pickupType: formData.get("pickupType"),
    };

    try {
      const response = await fetch("/api/parcel", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
      });

      if (!response.ok) {
        throw new Error("Failed to create request");
      }

      setOpen(false);
      router.refresh();
    } catch (error) {
      console.error(error);
      alert("Failed to create parcel request");
    } finally {
      setLoading(false);
    }
  }

  return (
    <Sheet open={open} onOpenChange={setOpen}>
      <SheetTrigger asChild>
        <button className="h-12 px-6 bg-slate-900 border border-slate-800 hover:bg-slate-800 text-white rounded-[10px] font-black text-[11px] uppercase tracking-widest flex items-center gap-3 transition-all active:scale-95 group shadow-lg shadow-slate-900/10">
          <PackagePlus
            className="w-4 h-4 group-hover:rotate-12 transition-transform duration-300"
            strokeWidth={3}
          />
          New Shipment Request
        </button>
      </SheetTrigger>

      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 shadow-2xl flex flex-col rounded-2xl">
        {/* Premium Header */}
        <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md">
            <PackagePlus className="w-6 h-6 text-white" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10 text-left">
            <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase">
              New Parcel Request
            </SheetTitle>
            <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
              Initialize a new logistics movement node
            </SheetDescription>
          </div>
        </div>

        <form
          id="create-parcel-form"
          onSubmit={onSubmit}
          className="p-8 space-y-10 flex-1 overflow-y-auto custom-scrollbar"
        >
          <div className="grid grid-cols-1 gap-10">
            {/* Section 1: Route */}
            <div className="space-y-6">
              <div className="flex items-center gap-2 text-slate-400">
                <MapPin size={14} strokeWidth={3} />
                <span className="text-[10px] font-black uppercase tracking-[0.2em]">
                  Route Information
                </span>
              </div>
              <div className="grid grid-cols-2 gap-6">
                <div className="space-y-3">
                  <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                    Origin Node
                  </Label>
                  <div className="relative">
                    <div className="absolute left-4 top-1/2 -translate-y-1/2 w-1.5 h-1.5 rounded-full bg-blue-500 shadow-[0_0_8px_rgba(59,130,246,0.5)]" />
                    <Input
                      name="fromAddress"
                      className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] pl-10 text-[14px] font-bold transition-all"
                      placeholder="Origin Station"
                      required
                    />
                  </div>
                </div>
                <div className="space-y-3">
                  <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                    Destination Node
                  </Label>
                  <div className="relative">
                    <div className="absolute left-4 top-1/2 -translate-y-1/2 w-1.5 h-1.5 rounded-full bg-emerald-500 shadow-[0_0_8px_rgba(16,185,129,0.5)]" />
                    <Input
                      name="toAddress"
                      className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] pl-10 text-[14px] font-bold transition-all"
                      placeholder="Destination Station"
                      required
                    />
                  </div>
                </div>
              </div>
            </div>

            {/* Section 2: Consignee */}
            <div className="space-y-6 pt-10 border-t border-slate-100">
              <div className="flex items-center gap-2 text-slate-400">
                <User size={14} strokeWidth={3} />
                <span className="text-[10px] font-black uppercase tracking-[0.2em]">
                  Consignee Details
                </span>
              </div>
              <div className="grid grid-cols-2 gap-6">
                <div className="space-y-3">
                  <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                    Receiver Name
                  </Label>
                  <Input
                    name="receiverName"
                    className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold transition-all"
                    placeholder="Full Name"
                    required
                  />
                </div>
                <div className="space-y-3">
                  <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                    Contact Phone
                  </Label>
                  <div className="relative">
                    <Phone className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-300" />
                    <Input
                      name="receiverPhone"
                      className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] pl-12 text-[14px] font-bold transition-all"
                      placeholder="255..."
                      required
                    />
                  </div>
                </div>
              </div>
            </div>

            {/* Section 3: Service */}
            <div className="space-y-6 pt-10 border-t border-slate-100">
              <div className="flex items-center gap-2 text-slate-400">
                <Zap size={14} strokeWidth={3} />
                <span className="text-[10px] font-black uppercase tracking-[0.2em]">
                  Service Specification
                </span>
              </div>
              <div className="space-y-3">
                <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                  Logistics Service Type
                </Label>
                <Input
                  name="serviceType"
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold transition-all"
                  placeholder="e.g. Express Rail, Standard Freight"
                  required
                />
              </div>
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
            form="create-parcel-form"
            disabled={loading}
            className="flex-[1.5] h-14 rounded-xl bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 flex items-center justify-center gap-3 active:scale-[0.98]"
          >
            {loading ? (
              <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
            ) : (
              <>
                <CheckCircle2 className="w-5 h-5" strokeWidth={3} />
                Create Shipment
              </>
            )}
          </button>
        </div>
      </SheetContent>
    </Sheet>
  );
}
