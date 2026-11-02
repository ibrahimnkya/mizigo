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
    const newPassword = newOtp.join("");
    setPassword(newPassword);

    if (value && index < 5) {
      inputsRef.current[index + 1]?.focus();
    }

    // Auto-submit when last digit is filled
    if (index === 5 && value) {
      const fullOtp = [...otp];
      fullOtp[5] = value.substring(value.length - 1);
      const pin = fullOtp.join("");
      if (pin.length === 6) {
        setTimeout(() => autoSubmit(pin), 50);
      }
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

  const autoSubmit = async (pin: string) => {
    setLoading(true);
    setError(null);

    try {
      const result = await signIn("credentials", {
        redirect: false,
        email: session?.user?.email,
        otp: pin,
      });

      if (result?.error) {
        setError("Incorrect PIN. Please try again.");
        setOtp(Array(6).fill(""));
        setPassword("");
        setTimeout(() => inputsRef.current[0]?.focus(), 100);
      } else {
        setLocked(false);
        setPassword("");
        setOtp(Array(6).fill(""));
      }
    } catch (err) {
      setError("Something went wrong. Please try again.");
    } finally {
      setLoading(false);
    }
  };

  const handleUnlock = async (e: React.FormEvent) => {
    e.preventDefault();
    await autoSubmit(password);
  };

  if (status !== "authenticated") return null;

  const user = session?.user as { name?: string | null; email?: string | null } | undefined;
  const filled = otp.join("").length === 6;

  return (
    <Dialog open={isLocked} onOpenChange={() => {}}>
      <DialogContent
        overlayClassName="bg-[#2A0508]/50 backdrop-blur-md"
        className="w-[calc(100%-2rem)] max-w-[420px] grid-cols-1 gap-0 overflow-hidden rounded-[32px] border-0 bg-white p-0 shadow-[0_40px_120px_-20px_rgba(0,0,0,0.5)] sm:rounded-[32px] [&>button]:hidden"
        onPointerDownOutside={(e) => e.preventDefault()}
        onEscapeKeyDown={(e) => e.preventDefault()}
      >
        {/* Header — maroon bridge card, like the app */}
        <div className="bridge-card rounded-none px-8 pb-9 pt-7 text-center">
          <div className="flex items-center justify-center gap-2">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src="/brand/logo_icon.png" alt="" className="h-8 w-8" />
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src="/brand/logo_text.png" alt="MiziGO" className="h-5 w-auto" />
          </div>
          <div className="relative mx-auto mt-7 h-[72px] w-[72px]">
            <span className="absolute inset-0 animate-ping rounded-full bg-orange-400/20 [animation-duration:2.5s]" />
            <span className="relative flex h-full w-full items-center justify-center rounded-full bg-gradient-to-br from-[#F78A1F] to-[#D9620B] shadow-[0_12px_30px_-8px_rgba(247,138,31,0.7)] ring-[6px] ring-white/10">
              <Lock className="h-8 w-8 text-white" strokeWidth={2.2} />
            </span>
          </div>
          <DialogTitle className="mt-4 text-[22px] font-semibold text-white">Screen locked</DialogTitle>
          <DialogDescription className="mx-auto mt-1 max-w-[280px] text-[14px] leading-snug text-white/70">
            Locked to keep your account safe. Enter your 6-digit access code to continue.
          </DialogDescription>
        </div>

        <form onSubmit={handleUnlock} className="relative z-[2] -mt-5 flex min-w-0 flex-col gap-5 rounded-t-[28px] bg-white px-6 pb-6 pt-6 sm:px-7">
          {/* Who */}
          <div className="flex items-center gap-3 rounded-2xl border border-[#E2E2E2] bg-[#F7F5F4] px-4 py-3">
            <span className="flex h-11 w-11 shrink-0 items-center justify-center rounded-full bg-[#5C0B19] text-[15px] font-semibold text-white">
              {(user?.name || "U").charAt(0).toUpperCase()}
            </span>
            <div className="min-w-0">
              <p className="truncate text-[15px] font-semibold text-[#1C1C1E]">{user?.name || "Signed-in user"}</p>
              <p className="truncate text-[13px] text-slate-500">{user?.email}</p>
            </div>
          </div>

          {/* Code */}
          <div>
            <div className="mb-2 flex items-center justify-between">
              <span className="text-[14px] font-medium text-slate-600">Access code</span>
              <button
                type="button"
                onClick={() => setShowPassword(!showPassword)}
                className="flex items-center gap-1.5 text-[13px] text-slate-500 transition hover:text-slate-800"
              >
                {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                {showPassword ? "Hide" : "Show"}
              </button>
            </div>
            <div className="grid grid-cols-6 gap-2 sm:gap-2.5">
              {otp.map((digit, index) => (
                <input
                  key={index}
                  ref={(el) => {
                    inputsRef.current[index] = el;
                  }}
                  type={showPassword ? "text" : "password"}
                  inputMode="numeric"
                  autoComplete={index === 0 ? "one-time-code" : "off"}
                  aria-label={`Digit ${index + 1}`}
                  maxLength={1}
                  size={1}
                  value={digit}
                  onChange={(e) => handleOtpChange(e.target.value, index)}
                  onKeyDown={(e) => handleOtpKeyDown(e, index)}
                  onPaste={handleOtpPaste}
                  disabled={loading}
                  required
                  className={[
                    "h-14 w-full min-w-0 rounded-2xl border p-0 text-center text-[22px] font-semibold text-[#1C1C1E] outline-none transition disabled:opacity-60",
                    error
                      ? "border-rose-300 bg-rose-50"
                      : filled
                        ? "border-orange-500 bg-orange-50 text-orange-700 ring-4 ring-orange-500/10"
                        : "border-[#E2E2E2] bg-white focus:border-orange-500 focus:ring-4 focus:ring-orange-500/10",
                  ].join(" ")}
                />
              ))}
            </div>
          </div>

          {error && (
            <div className="flex items-center gap-3 rounded-2xl border border-rose-100 bg-rose-50 px-4 py-3 text-[14px] text-rose-700">
              <ShieldOff className="h-5 w-5 shrink-0 text-rose-500" />
              {error}
            </div>
          )}

          <Button
            type="submit"
            disabled={loading || !password}
            className="flex h-14 w-full items-center justify-center gap-2 rounded-full border-0 bg-[#5C0B19] text-[16px] font-semibold text-white transition hover:bg-[#4F0A0C] active:scale-[0.99] disabled:opacity-50"
          >
            {loading ? <Loader2 className="h-5 w-5 animate-spin" /> : "Unlock"}
          </Button>

          <p className="text-center text-[14px] text-slate-500">
            Not you?{" "}
            <button
              type="button"
              onClick={() => signOut({ redirectTo: "/login" })}
              className="font-semibold text-orange-600 transition hover:text-orange-700"
            >
              Sign out
            </button>
          </p>
        </form>
      </DialogContent>
    </Dialog>
  );
}
