"use client";

import { useParcelList, useDeliverParcel } from "@/modules/parcel/use-parcel";
import { StatusBadge } from "@/components/shared/status-badge";
import {
  PackageCheck,
  MapPin,
  Phone,
  User,
  ArrowRight,
  Loader2,
  AlertCircle,
  Truck,
  CheckCircle,
  X,
  Keyboard,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { toast } from "sonner";
import { useState } from "react";

export default function DeliverPage() {
  const { data: parcel, isLoading } = useParcelList({ status: "IN_TRANSIT" });
  const { mutate: verifyOtp, isPending: isUpdating } = useDeliverParcel();

  const [verifyingParcelId, setVerifyingParcelId] = useState<string | null>(
    null,
  );
  const [otp, setOtp] = useState("");

  const handleDeliver = (e: React.FormEvent) => {
    e.preventDefault();
    if (!verifyingParcelId || otp.length < 6) return;

    verifyOtp(
      { id: verifyingParcelId, otp },
      {
        onSuccess: () => {
          toast.success("Handover confirmed successfully");
          setVerifyingParcelId(null);
          setOtp("");
        },
        onError: (err: any) => {
          toast.error(
            err.response?.data?.error?.message ||
              err.response?.data?.message ||
              err.message ||
              "Invalid OTP verification code",
          );
        },
      },
    );
  };

  return (
    <div className="space-y-10 py-6 animate-in fade-in duration-500">
      {/* Header Area */}
      <div className="flex flex-col md:flex-row md:items-end justify-between gap-6">
        <div>
          <h1 className="text-[26px] font-semibold text-slate-900 tracking-tight">
            Deliver Parcel
          </h1>
          <p className="text-slate-500 font-medium mt-1">
            Finalize the logistics chain by confirming handover to the
            recipient.
          </p>
        </div>

        <div className="flex items-center gap-4 bg-emerald-50 border border-emerald-100 rounded-xl p-3  shadow-emerald-500/5">
          <div className="h-12 w-12 rounded-xl bg-emerald-600 flex items-center justify-center text-white  shadow-emerald-500/20">
            <PackageCheck size={24} />
          </div>
          <div>
            <span className="text-[10px] font-semibold uppercase tracking-[0.05em] text-emerald-700 block mb-0.5">
              Ready for Pickup
            </span>
            <span className="text-xl font-semibold text-slate-900 leading-none">
              {parcel?.length || 0}
            </span>
          </div>
        </div>
      </div>

      {/* Delivery Grid */}
      <div className="grid grid-cols-1 xl:grid-cols-2 gap-6">
        {isLoading ? (
          <div className="col-span-full py-24 text-center">
            <Loader2 className="animate-spin h-8 w-8 mx-auto text-slate-300" />
          </div>
        ) : !parcel || parcel.length === 0 ? (
          <div className="col-span-full p-20 text-center bg-white border-2 border-dashed border-slate-200 rounded-xl">
            <Truck className="h-12 w-12 mx-auto text-slate-200 mb-4" />
            <h3 className="text-lg font-bold text-slate-400">
              No pending deliveries for this terminal.
            </h3>
          </div>
        ) : (
          parcel.map((item: any) => (
            <div
              key={item.id}
              className="bg-white rounded-[20px] border border-[#E2E2E2] p-8 hover:border-blue-500  transition-all group relative overflow-hidden"
            >
              <div className="absolute top-0 right-0 p-8 opacity-5">
                <PackageCheck size={120} />
              </div>

              <div className="relative z-10 flex flex-col gap-6">
                <div className="flex items-center justify-between">
                  <span className="font-mono font-semibold text-blue-600 bg-blue-50 px-2 py-1 rounded-xl text-xs">
                    ID: #{item.id.slice(-8).toUpperCase()}
                  </span>
                  <div className="flex items-center gap-2">
                    <StatusBadge status="IN_TRANSIT" />
                    <span
                      className={cn(
                        "text-[10px] font-semibold px-2 py-1 rounded-xl border uppercase tracking-tight",
                        item.urgency === "Express"
                          ? "bg-amber-100 text-amber-700 border-amber-200"
                          : "bg-slate-100 text-slate-500 border-slate-200",
                      )}
                    >
                      {item.urgency}
                    </span>
                  </div>
                </div>

                <div className="grid grid-cols-2 gap-8">
                  {/* Recipient Info */}
                  <div className="space-y-4">
                    <div className="flex items-center gap-2">
                      <div className="h-6 w-6 rounded-xl bg-slate-50 flex items-center justify-center border border-slate-100 ">
                        <User size={12} className="text-slate-400" />
                      </div>
                      <span className="text-[10px] font-semibold uppercase tracking-[0.05em] text-slate-400">
                        Recipient Details
                      </span>
                    </div>
                    <div className="flex flex-col">
                      <span className="text-base font-semibold text-slate-800">
                        {item.receiverName}
                      </span>
                      <span className="text-xs font-bold text-blue-500 mt-1 flex items-center gap-1">
                        <Phone size={10} />
                        {item.receiverPhone}
                      </span>
                    </div>
                  </div>

                  {/* Package Info */}
                  <div className="space-y-4">
                    <div className="flex items-center gap-2">
                      <div className="h-6 w-6 rounded-xl bg-slate-50 flex items-center justify-center border border-slate-100 ">
                        <AlertCircle size={12} className="text-slate-400" />
                      </div>
                      <span className="text-[10px] font-semibold uppercase tracking-[0.05em] text-slate-400">
                        Logistics Info
                      </span>
                    </div>
                    <div className="flex flex-col">
                      <span className="text-sm font-bold text-slate-700">
                        {item.weight} kg {item.parcelType}
                      </span>
                      <span className="text-[10px] text-slate-400 font-bold uppercase tracking-wider mt-1">
                        {item.toAddress}
                      </span>
                    </div>
                  </div>
                </div>

                {/* Delivery Footer */}
                <div className="pt-6 border-t border-slate-50 flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <div className="h-2 w-2 rounded-full bg-emerald-500 animate-pulse" />
                    <span className="text-[10px] font-semibold text-emerald-600 uppercase tracking-[0.05em]">
                      Awaiting Verification
                    </span>
                  </div>
                  <button
                    onClick={() => setVerifyingParcelId(item.id)}
                    className="h-11 px-6 bg-[#5C0B19] text-white rounded-xl text-xs font-semibold  shadow-[#5C0B19]/15 hover:bg-[#4F0A0C] transition-all active:scale-95 flex items-center gap-2"
                  >
                    <PackageCheck size={14} />
                    Finalize Handover
                  </button>
                </div>
              </div>
            </div>
          ))
        )}
      </div>

      <div className="flex justify-center">
        <p className="text-[10px] font-semibold text-slate-300 uppercase tracking-[0.05em] bg-white border border-slate-100 px-4 py-2 rounded-full ">
          Operational Layer 5 · Multi-Node Handover
        </p>
      </div>

      {/* OTP Verification Modal */}
      {verifyingParcelId && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-6 bg-slate-900/60  animate-in fade-in duration-300">
          <div className="bg-white w-full max-w-md rounded-xl  overflow-hidden border border-slate-100 flex flex-col p-10 gap-8 animate-in zoom-in-95 duration-300">
            <div className="flex items-center justify-between">
              <div className="h-14 w-14 rounded-xl bg-blue-600 flex items-center justify-center text-white  shadow-blue-500/20">
                <Keyboard size={28} />
              </div>
              <button
                onClick={() => setVerifyingParcelId(null)}
                className="h-10 w-10 rounded-xl bg-slate-50 flex items-center justify-center text-slate-400 hover:bg-slate-100 transition-colors"
              >
                <X size={20} />
              </button>
            </div>

            <div>
              <h2 className="text-[20px] font-semibold text-slate-800">
                Secure Handover
              </h2>
              <p className="text-slate-500 font-medium mt-2 leading-relaxed">
                Enter the 6-digit verification code sent to{" "}
                <span className="text-blue-600 font-bold">
                  {
                    parcel?.find((c: any) => c.id === verifyingParcelId)
                      ?.receiverPhone
                  }
                </span>
              </p>
            </div>

            <form onSubmit={handleDeliver} className="space-y-6">
              <input
                autoFocus
                type="text"
                maxLength={6}
                value={otp}
                onChange={(e) => setOtp(e.target.value.replace(/\D/g, ""))}
                placeholder="0 0 0 0 0 0"
                className="w-full h-20 text-center text-[26px] font-semibold tracking-[0.5em] text-slate-900 bg-slate-50 border-2 border-slate-100 rounded-xl focus:border-blue-500 focus:bg-white outline-none transition-all placeholder:text-slate-200"
              />

              <button
                type="submit"
                disabled={isUpdating || otp.length < 6}
                className="w-full h-16 bg-[#5C0B19] text-white rounded-xl font-semibold text-lg  shadow-[#5C0B19]/15 hover:bg-[#4F0A0C] disabled:opacity-50 flex items-center justify-center gap-3 transition-all active:scale-95"
              >
                {isUpdating ? (
                  <Loader2 className="animate-spin" />
                ) : (
                  <CheckCircle size={18} />
                )}
                Verify & Complete Delivery
              </button>
            </form>

            <div className="text-center">
              <p className="text-[10px] font-semibold text-slate-300 uppercase tracking-[0.05em]">
                Identity Enforcement Layer Active
              </p>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
