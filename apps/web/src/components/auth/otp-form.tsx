"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { signIn } from "next-auth/react";
import {
  KeyRound,
  ArrowRight,
  Loader2,
  AlertCircle,
  Eye,
  EyeOff,
  UserCircle,
} from "lucide-react";
import api from "@/lib/api/client";

export default function OTPForm() {
  const router = useRouter();
  const [errorMessage, setErrorMessage] = useState("");
  const [isPending, setIsPending] = useState(false);
  const [phone, setPhone] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [step, setStep] = useState<"phone" | "otp">("phone");

  const handleSendOTP = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setIsPending(true);
    setErrorMessage("");

    try {
      const res = await api.post("/auth/operator/reset-otp", { phone });

      if (!res.data?.success)
        throw new Error(
          res.data?.error?.message || "Failed to send security code",
        );

      setStep("otp");
    } catch (err: any) {
      setErrorMessage(err.message);
    } finally {
      setIsPending(false);
    }
  };

  const handleVerifyOTP = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setIsPending(true);
    setErrorMessage("");

    const formData = new FormData(e.currentTarget);
    const otp = formData.get("otp") as string;

    try {
      const result = await signIn("credentials", {
        email: phone, // In auth.ts, identifier is read from email field
        otp,
        redirect: false,
      });

      if (result?.error) {
        throw new Error("Invalid OTP");
      }

      // Check if temporary PIN and force change
      // This logic usually happens on the backend/session
      window.location.href = "/dashboard";
    } catch (err: any) {
      setErrorMessage(err.message);
    } finally {
      setIsPending(false);
    }
  };

  if (step === "phone") {
    return (
      <form onSubmit={handleSendOTP} className="flex flex-col gap-5 w-full">
        <div className="space-y-2">
          <label className="text-[10px] font-black uppercase tracking-widest text-slate-400 pl-1">
            Phone Number
          </label>
          <div className="relative">
            <UserCircle
              className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-500"
              size={20}
            />
            <input
              type="text"
              required
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              placeholder="255..."
              className="w-full h-14 bg-white/5 border border-white/10 rounded-[10px] pl-12 pr-4 font-black text-white focus:border-blue-500 focus:bg-white/10 focus:ring-1 focus:ring-blue-500/50 outline-none transition-all placeholder:text-slate-600 text-sm md:text-base"
            />
          </div>
        </div>

        {errorMessage && (
          <div className="flex items-center gap-3 px-4 py-3 bg-rose-500/10 border border-rose-500/30 rounded-[10px] animate-in slide-in-from-top-2">
            <AlertCircle size={16} className="text-rose-500 shrink-0" />
            <p className="text-xs font-black text-rose-400 uppercase tracking-widest">
              {errorMessage}
            </p>
          </div>
        )}

        <div className="pt-2">
          <button
            type="submit"
            disabled={isPending || !phone.trim()}
            className="h-14 w-full bg-blue-600 text-white rounded-[10px] text-xs md:text-sm font-black uppercase tracking-[0.2em] shadow-2xl shadow-blue-600/30 hover:bg-blue-500 hover:scale-[1.02] active:scale-95 transition-all flex items-center justify-center gap-3 disabled:opacity-50 disabled:pointer-events-none"
          >
            {isPending ? (
              <Loader2 className="animate-spin" size={20} />
            ) : (
              <>
                Send OTP
                <ArrowRight size={18} strokeWidth={2.5} />
              </>
            )}
          </button>
        </div>
      </form>
    );
  }

  return (
    <form onSubmit={handleVerifyOTP} className="flex flex-col gap-5 w-full">
      <div className="space-y-2">
        <label className="text-[10px] font-black uppercase tracking-widest text-slate-400 pl-1">
          OTP Code
        </label>
        <div className="relative group">
          <KeyRound
            className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-500 group-focus-within:text-blue-500 transition-colors"
            size={20}
          />
          <input
            name="otp"
            type={showPassword ? "text" : "password"}
            required
            placeholder="•••••••••"
            maxLength={6}
            className="w-full h-14 bg-white/5 border border-white/10 rounded-[10px] pl-12 pr-12 font-black text-white focus:border-blue-500 focus:bg-white/10 focus:ring-1 focus:ring-blue-500/50 outline-none transition-all placeholder:text-slate-600 tracking-[0.4em] text-lg"
          />
          <button
            type="button"
            onClick={() => setShowPassword(!showPassword)}
            className="absolute right-4 top-1/2 -translate-y-1/2 text-slate-500 hover:text-white transition-colors"
          >
            {showPassword ? <EyeOff size={18} /> : <Eye size={18} />}
          </button>
        </div>
      </div>

      {errorMessage && (
        <div className="flex items-center gap-3 px-4 py-3 bg-rose-500/10 border border-rose-500/30 rounded-[10px] animate-in slide-in-from-top-2">
          <AlertCircle size={16} className="text-rose-500 shrink-0" />
          <p className="text-xs font-black text-rose-400 uppercase tracking-widest">
            {errorMessage}
          </p>
        </div>
      )}

      <div className="pt-2">
        <button
          type="submit"
          disabled={isPending}
          className="h-14 w-full bg-blue-600 text-white rounded-[10px] text-xs md:text-sm font-black uppercase tracking-[0.2em] shadow-2xl shadow-blue-600/30 hover:bg-blue-500 hover:scale-[1.02] active:scale-95 transition-all flex items-center justify-center gap-3 disabled:opacity-50 disabled:pointer-events-none"
        >
          {isPending ? (
            <Loader2 className="animate-spin" size={20} />
          ) : (
            <>
              Verify & Login
              <ArrowRight size={18} strokeWidth={2.5} />
            </>
          )}
        </button>
      </div>

      <button
        type="button"
        onClick={() => setStep("phone")}
        className="text-[10px] text-blue-400 hover:text-white font-black hover:underline uppercase tracking-widest transition-colors mx-auto mt-2"
      >
        Cancel & Back
      </button>
    </form>
  );
}
