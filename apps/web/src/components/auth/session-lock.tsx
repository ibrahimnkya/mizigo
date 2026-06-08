"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import { useSession, signIn, signOut } from "next-auth/react";
import { useUIStore } from "@/store/ui-store";
import {
  Dialog,
  DialogContent,
  DialogTitle,
  DialogDescription,
} from "@repo/ui/dialog";
import { Input } from "@repo/ui/input";
import { Button } from "@repo/ui/button";
import {
  Lock,
  Loader2,
  LogOut,
  CheckCircle2,
  ShieldOff,
  Eye,
  EyeOff,
  TimerOff,
  TimerReset,
} from "lucide-react";
import { cn } from "@/lib/utils";

const LOCK_TIME = 15 * 60 * 1000; // 15 minutes

export function SessionLock() {
  const { data: session, status } = useSession();
  const { isLocked, setLocked } = useUIStore();
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [otp, setOtp] = useState<string[]>(Array(6).fill(""));
  const inputsRef = useRef<(HTMLInputElement | null)[]>([]);

  const handleOtpChange = (value: string, index: number) => {
    if (value && isNaN(Number(value))) return;

    const newOtp = [...otp];
    newOtp[index] = value.substring(value.length - 1);
    setOtp(newOtp);
    setPassword(newOtp.join(""));

    if (value && index < 5) {
      inputsRef.current[index + 1]?.focus();
    }
  };

  const handleOtpKeyDown = (
    e: React.KeyboardEvent<HTMLInputElement>,
    index: number,
  ) => {
    if (e.key === "Backspace") {
      const newOtp = [...otp];
      if (!otp[index] && index > 0) {
        newOtp[index - 1] = "";
        setOtp(newOtp);
        setPassword(newOtp.join(""));
        inputsRef.current[index - 1]?.focus();
      } else {
        newOtp[index] = "";
        setOtp(newOtp);
        setPassword(newOtp.join(""));
      }
    }
  };

  const handleOtpPaste = (e: React.ClipboardEvent<HTMLInputElement>) => {
    e.preventDefault();
    const pasteData = e.clipboardData.getData("text").trim();
    if (pasteData.length === 6 && !isNaN(Number(pasteData))) {
      const newOtp = pasteData.split("");
      setOtp(newOtp);
      setPassword(pasteData);
      inputsRef.current[5]?.focus();
    }
  };

  const handleLock = useCallback(() => {
    if (status === "authenticated" && !isLocked) {
      setLocked(true);
      setPassword("");
      setOtp(Array(6).fill(""));
      setError(null);
    }
  }, [status, isLocked, setLocked]);

  useEffect(() => {
    if (isLocked) {
      setOtp(Array(6).fill(""));
      setPassword("");
      setTimeout(() => inputsRef.current[0]?.focus(), 100);
    }
  }, [isLocked]);

  useEffect(() => {
    if (status !== "authenticated" || isLocked) return;

    let idleTimer: NodeJS.Timeout;

    const resetTimer = () => {
      clearTimeout(idleTimer);
      idleTimer = setTimeout(handleLock, LOCK_TIME);
    };

    const events = [
      "mousedown",
      "mousemove",
      "keypress",
      "scroll",
      "touchstart",
    ];
    events.forEach((event) => document.addEventListener(event, resetTimer));

    resetTimer();

    return () => {
      events.forEach((event) =>
        document.removeEventListener(event, resetTimer),
      );
      clearTimeout(idleTimer);
    };
  }, [status, handleLock, isLocked]);

  // Handle session expiration/errors
  useEffect(() => {
    if (
      (session as any)?.error === "RefreshAccessTokenError" ||
      (session?.user as any)?.error === "RefreshAccessTokenError"
    ) {
      handleLock();
    }
  }, [session, handleLock]);

  const handleUnlock = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError(null);

    try {
      const result = await signIn("credentials", {
        redirect: false,
        email: session?.user?.email,
        otp: password,
      });

      if (result?.error) {
        setError("Incorrect password. Please try again.");
        setOtp(Array(6).fill(""));
        setPassword("");
        setTimeout(() => inputsRef.current[0]?.focus(), 100);
      } else {
        setLocked(false);
        setPassword("");
        setOtp(Array(6).fill(""));
      }
    } catch (err) {
      setError("Service temporarily unavailable.");
    } finally {
      setLoading(false);
    }
  };

  if (status !== "authenticated") return null;

  return (
    <Dialog open={isLocked} onOpenChange={() => {}}>
      <DialogContent
        overlayClassName="backdrop-blur-sm bg-slate-900/30"
        className="max-w-[500px] p-0 overflow-hidden bg-white border border-slate-100 shadow-[0_32px_128px_-16px_rgba(0,0,0,0.3)] rounded-3xl animate-in fade-in zoom-in-95 duration-500 [&>button]:hidden"
        onPointerDownOutside={(e) => e.preventDefault()}
        onEscapeKeyDown={(e) => e.preventDefault()}
      >
        {/* Visual Header */}
        <div className="bg-slate-900 px-10 py-10 flex flex-col items-center text-center relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/20 via-transparent to-indigo-500/10 pointer-events-none" />
          <div className="absolute -top-24 -left-24 w-64 h-64 bg-blue-500/10 rounded-full blur-[100px]" />
          <div className="absolute -bottom-24 -right-24 w-64 h-64 bg-indigo-500/10 rounded-full blur-[100px]" />

          <div className="w-20 h-20 rounded-[1.5rem] bg-white/5 border border-white/10 flex items-center justify-center mb-6 relative z-10 backdrop-blur-2xl shadow-2xl">
            <div className="absolute inset-0 bg-gradient-to-br from-white/10 to-transparent rounded-[1.5rem]" />
            <Lock className="w-10 h-10 text-white" strokeWidth={2.5} />
          </div>

          <div className="relative z-10">
            <DialogTitle className="text-[28px] font-black text-white tracking-tight leading-tight">
              Session Locked
            </DialogTitle>
            <DialogDescription className="text-slate-400 text-[12px] font-bold uppercase tracking-[0.25em] mt-3 flex items-center justify-center gap-2.5">
              <TimerReset
                className="w-3.5 h-3.5 text-slate-400"
                strokeWidth={3}
              />
              Timed out due to inactivity
            </DialogDescription>
          </div>
        </div>

        {/* Authentication Form */}
        <div className="p-8">
          <div className="mb-8 flex items-center gap-5 p-5 bg-slate-50/50 rounded-2xl border border-slate-100 backdrop-blur-sm">
            <div className="w-12 h-12 rounded-xl bg-slate-900 flex items-center justify-center font-black text-white text-md shadow-xl shadow-slate-900/20">
              {session?.user?.name?.substring(0, 2).toUpperCase() || "AD"}
            </div>
            <div className="flex flex-col min-w-0">
              <span className="text-[14px] font-black text-slate-900 truncate uppercase tracking-tight leading-none mb-1.5">
                {session?.user?.name}
              </span>
              <span className="text-[11px] font-bold text-slate-400 truncate tracking-tight opacity-80">
                {session?.user?.email}
              </span>
            </div>
          </div>

          <form onSubmit={handleUnlock} className="space-y-8">
            <div className="space-y-3">
              <div className="flex items-center justify-between ml-1">
                <label className="text-[11px] font-black uppercase tracking-[0.2em] text-slate-400">
                  Enter Password
                </label>
              </div>
              <div className="flex flex-col gap-3">
                <div className="flex justify-between gap-2.5 mx-auto w-full max-w-[360px]">
                  {otp.map((data, index) => (
                    <input
                      key={index}
                      ref={(el) => {
                        inputsRef.current[index] = el;
                      }}
                      type={showPassword ? "text" : "password"}
                      maxLength={1}
                      value={data}
                      onChange={(e) => handleOtpChange(e.target.value, index)}
                      onKeyDown={(e) => handleOtpKeyDown(e, index)}
                      onPaste={handleOtpPaste}
                      className="w-11 h-11 sm:w-12 sm:h-12 text-center text-lg font-black bg-slate-50 border border-slate-200 focus:bg-white focus:ring-4 focus:ring-blue-500/10 focus:border-blue-500 rounded-xl transition-all outline-none text-slate-900"
                      required
                    />
                  ))}
                </div>

                <div className="flex justify-end pr-1">
                  <button
                    type="button"
                    onClick={() => setShowPassword(!showPassword)}
                    className="text-[10px] font-bold uppercase tracking-wider text-slate-400 hover:text-slate-600 transition-colors flex items-center gap-1.5"
                  >
                    {showPassword ? (
                      <>
                        <EyeOff className="w-4 h-4" strokeWidth={2.5} /> Hide
                        Password
                      </>
                    ) : (
                      <>
                        <Eye className="w-4 h-4" strokeWidth={2.5} /> Show
                        Password
                      </>
                    )}
                  </button>
                </div>
              </div>
            </div>

            {error && (
              <div className="bg-rose-50 border border-rose-100 text-rose-600 text-[13px] font-bold p-5 rounded-2xl flex items-center gap-4 animate-in slide-in-from-top-2 duration-300">
                <ShieldOff className="w-5 h-5 shrink-0" strokeWidth={2.5} />
                {error}
              </div>
            )}

            <div className="flex flex-col gap-5">
              <Button
                type="submit"
                disabled={loading || !password}
                className="h-16 w-full bg-slate-900 hover:bg-blue-600 text-white rounded-2xl font-black text-[13px] uppercase tracking-[0.25em] transition-all shadow-2xl shadow-slate-900/10 active:scale-[0.98] flex items-center justify-center gap-3 border-none"
              >
                {loading ? (
                  <Loader2 className="w-6 h-6 animate-spin" strokeWidth={3} />
                ) : (
                  "Resume Session"
                )}
              </Button>

              <button
                type="button"
                onClick={() => signOut({ redirectTo: "/login" })}
                className="h-10 w-full text-[11px] font-black uppercase tracking-[0.2em] text-slate-400 hover:text-rose-600 transition-colors flex items-center justify-center gap-2.5"
              >
                <LogOut className="w-4 h-4" />
                Sign out of account
              </button>
            </div>
          </form>
        </div>
      </DialogContent>
    </Dialog>
  );
}
