"use client";

import { useState, useRef } from "react";
import { signIn } from "next-auth/react";
import {
  Eye,
  EyeOff,
  Mail,
  Lock,
  ArrowRight,
  XCircle,
  Loader2,
  Phone,
} from "lucide-react";
import { cn } from "@/lib/utils";

function LoginButton({ pending }: { pending: boolean }) {
  return (
    <button
      type="submit"
      aria-disabled={pending}
      disabled={pending}
      className="w-full h-11 bg-slate-900 hover:bg-slate-800 disabled:opacity-60 text-white text-[13px] font-extrabold rounded-[10px] flex items-center justify-center gap-2 transition-all hover:-translate-y-0.5 active:translate-y-0 shadow-lg shadow-slate-900/20"
    >
      {pending ? (
        <>
          <Loader2 size={14} className="animate-spin" />
          Signing in…
        </>
      ) : (
        <>
          Sign In
          <ArrowRight size={14} strokeWidth={2.5} />
        </>
      )}
    </button>
  );
}

export default function LoginForm() {
  const [errorMessage, setErrorMessage] = useState("");
  const [isPending, setIsPending] = useState(false);
  const [showPassword, setShowPassword] = useState(false);
  const [otp, setOtp] = useState<string[]>(Array(6).fill(""));
  const inputsRef = useRef<(HTMLInputElement | null)[]>([]);

  const handleOtpChange = (value: string, index: number) => {
    if (value && isNaN(Number(value))) return;

    const newOtp = [...otp];
    newOtp[index] = value.substring(value.length - 1);
    setOtp(newOtp);

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
        inputsRef.current[index - 1]?.focus();
      } else {
        newOtp[index] = "";
        setOtp(newOtp);
      }
    }
  };

  const handleOtpPaste = (e: React.ClipboardEvent<HTMLInputElement>) => {
    e.preventDefault();
    const pasteData = e.clipboardData.getData("text").trim();
    if (pasteData.length === 6 && !isNaN(Number(pasteData))) {
      const newOtp = pasteData.split("");
      setOtp(newOtp);
      inputsRef.current[5]?.focus();
    }
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setIsPending(true);
    setErrorMessage("");

    const formData = new FormData(e.currentTarget);
    const identifier = formData.get("identifier") as string;
    const secret = formData.get("secret") as string;

    try {
      const result = await signIn("credentials", {
        redirect: false,
        email: identifier,
        otp: secret,
        deviceId: "web-portal-default",
      });

      if (result?.error) {
        setErrorMessage("Invalid credentials");
        setIsPending(false);
      } else {
        window.location.href = "/dashboard";
      }
    } catch (error) {
      setErrorMessage("Something went wrong");
      setIsPending(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="flex flex-col gap-4">
      {/* Identifier (Phone or Email) */}
      <div className="flex flex-col gap-1.5">
        <label
          htmlFor="identifier"
          className="text-[11px] font-extrabold uppercase tracking-[0.12em] text-blue-200/70"
        >
          Phone Number
        </label>
        <div className="relative group">
          <div className="absolute left-3.5 top-1/2 -translate-y-1/2 text-slate-300 group-focus-within:text-indigo-500 transition-colors pointer-events-none">
            <Phone size={14} strokeWidth={2.5} />
          </div>
          <input
            id="identifier"
            type="text"
            name="identifier"
            placeholder="0700000000 or email"
            required
            className="w-full h-11 pl-10 pr-4 bg-slate-50 border border-slate-200 rounded-[10px] text-[13px] font-medium text-slate-900 placeholder:text-slate-300 focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:bg-white focus:border-transparent transition-all"
          />
        </div>
      </div>

      {/* Secret (Password or PIN) */}
      <div className="flex flex-col gap-2">
        <div className="flex items-center justify-between">
          <label
            htmlFor="otp-0"
            className="text-[11px] font-extrabold uppercase tracking-[0.12em] text-blue-200/70"
          >
            Enter 6-Digit Access Code
          </label>
          <a
            href="/forgot-password"
            className="text-[11px] font-bold text-sky-400 hover:text-sky-300 transition-colors"
          >
            Forgot password?
          </a>
        </div>
        <div className="flex flex-col gap-3">
          <div className="flex justify-between gap-2.5 mx-auto w-full max-w-[360px]">
            {otp.map((data, index) => (
              <input
                key={index}
                id={`otp-${index}`}
                ref={(el) => {
                  inputsRef.current[index] = el;
                }}
                type={showPassword ? "text" : "password"}
                maxLength={1}
                value={data}
                onChange={(e) => handleOtpChange(e.target.value, index)}
                onKeyDown={(e) => handleOtpKeyDown(e, index)}
                onPaste={handleOtpPaste}
                className="w-11 h-11 sm:w-12 sm:h-12 text-center text-lg font-black bg-slate-50 border border-slate-200 focus:bg-white focus:ring-4 focus:ring-indigo-400/20 focus:border-indigo-400 rounded-[10px] transition-all outline-none text-slate-900"
                required
                autoFocus={index === 0}
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
                  <EyeOff size={12} strokeWidth={2.5} /> Hide Code
                </>
              ) : (
                <>
                  <Eye size={12} strokeWidth={2.5} /> Show Code
                </>
              )}
            </button>
          </div>
        </div>

        <input type="hidden" name="secret" value={otp.join("")} />
      </div>

      {/* Error */}
      {errorMessage && (
        <div
          className="flex items-center gap-2 px-3 py-2.5 bg-rose-50 border border-rose-200/60 rounded-[10px]"
          aria-live="polite"
        >
          <XCircle size={13} className="text-rose-500 shrink-0" />
          <p className="text-[12px] text-rose-600 font-semibold">
            {errorMessage}
          </p>
        </div>
      )}

      <LoginButton pending={isPending} />
    </form>
  );
}
