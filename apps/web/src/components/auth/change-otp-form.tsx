"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import {
  ArrowRight,
  Loader2,
  KeyRound,
  Eye,
  EyeOff,
  AlertCircle,
} from "lucide-react";
import { useSession, signOut } from "next-auth/react";

export default function ChangeOtpForm() {
  const { update } = useSession();
  const router = useRouter();
  const [errorMessage, setErrorMessage] = useState("");
  const [isPending, setIsPending] = useState(false);

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setIsPending(true);
    setErrorMessage("");

    const formData = new FormData(e.currentTarget);
    const newCode = formData.get("newCode") as string;
    const confirmCode = formData.get("confirmCode") as string;

    if (newCode !== confirmCode) {
      setErrorMessage("Codes do not match.");
      setIsPending(false);
      return;
    }

    try {
      const response = await fetch("/api/users/change-otp", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ newCode }),
      });

      if (!response.ok) {
        const data = await response.json();
        throw new Error(data.error || "Failed to change code");
      }

      // Sign out the user and redirect to login so they can log in with their new PIN
      await signOut({ redirectTo: "/login" });
    } catch (error: any) {
      setErrorMessage(error.message || "An error occurred.");
      setIsPending(false);
    }
  };

  const [showNew, setShowNew] = useState(false);
  const [showConfirm, setShowConfirm] = useState(false);

  return (
    <form onSubmit={handleSubmit} className="flex flex-col gap-5">
      {/* New PIN */}
      <div className="space-y-2">
        <label className="text-[10px] font-black uppercase tracking-widest text-slate-400 pl-1">
          New 6-Digit Code
        </label>
        <div className="relative group">
          <KeyRound
            className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-500 group-focus-within:text-blue-500 transition-colors"
            size={20}
          />
          <input
            id="newCode"
            name="newCode"
            type={showNew ? "text" : "password"}
            required
            placeholder="•••••••••"
            maxLength={6}
            minLength={6}
            className="w-full h-14 bg-white/5 border border-white/10 rounded-[10px] pl-12 pr-12 font-black text-white focus:border-blue-500 focus:bg-white/10 focus:ring-1 focus:ring-blue-500/50 outline-none transition-all placeholder:text-slate-600 tracking-[0.4em] text-lg"
          />
          <button
            type="button"
            onClick={() => setShowNew(!showNew)}
            className="absolute right-4 top-1/2 -translate-y-1/2 text-slate-500 hover:text-white transition-colors"
          >
            {showNew ? <EyeOff size={18} /> : <Eye size={18} />}
          </button>
        </div>
      </div>

      {/* Confirm PIN */}
      <div className="space-y-2">
        <label className="text-[10px] font-black uppercase tracking-widest text-slate-400 pl-1">
          Confirm 6-Digit Code
        </label>
        <div className="relative group">
          <KeyRound
            className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-500 group-focus-within:text-blue-500 transition-colors"
            size={20}
          />
          <input
            id="confirmCode"
            name="confirmCode"
            type={showConfirm ? "text" : "password"}
            required
            placeholder="•••••••••"
            maxLength={6}
            minLength={6}
            className="w-full h-14 bg-white/5 border border-white/10 rounded-[10px] pl-12 pr-12 font-black text-white focus:border-blue-500 focus:bg-white/10 focus:ring-1 focus:ring-blue-500/50 outline-none transition-all placeholder:text-slate-600 tracking-[0.4em] text-lg"
          />
          <button
            type="button"
            onClick={() => setShowConfirm(!showConfirm)}
            className="absolute right-4 top-1/2 -translate-y-1/2 text-slate-500 hover:text-white transition-colors"
          >
            {showConfirm ? <EyeOff size={18} /> : <Eye size={18} />}
          </button>
        </div>
      </div>

      {/* Error Message Display */}
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
              Set Permanent PIN
              <ArrowRight size={18} strokeWidth={2.5} />
            </>
          )}
        </button>
      </div>
    </form>
  );
}
