"use client";

import { useState, useRef, useEffect } from "react";
import { useRouter } from "next/navigation";
import Image from "next/image";
import { signIn } from "next-auth/react";
import {
  Loader2,
  ArrowRight,
  ShieldCheck,
  UserCircle,
  AlertCircle,
  Eye,
  EyeOff,
  Activity,
  Search,
} from "lucide-react";
import api from "@/lib/api/client";

export default function LoginPage() {
  const router = useRouter();
  const [identifier, setIdentifier] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);
  const [showPassword, setShowPassword] = useState(false);
  const [errorMessage, setErrorMessage] = useState("");
  const [resendStatus, setResendStatus] = useState<"idle" | "sending" | "success" | "error">("idle");

  const [otp, setOtp] = useState<string[]>(Array(6).fill(""));
  const inputsRef = useRef<(HTMLInputElement | null)[]>([]);
  const formRef = useRef<HTMLFormElement>(null);
  const otpComplete = otp.join("").length === 6 && identifier.trim().length > 0;

  useEffect(() => {
    const filled = otp.join("");
    if (filled.length === 6 && identifier.trim() && !loading) {
      const timer = setTimeout(() => formRef.current?.requestSubmit(), 120);
      return () => clearTimeout(timer);
    }
  }, [otp, identifier, loading]);

  const handleOtpChange = (value: string, index: number) => {
    if (value && isNaN(Number(value))) return;
    const newOtp = [...otp];
    newOtp[index] = value.substring(value.length - 1);
    setOtp(newOtp);
    setPassword(newOtp.join(""));
    if (value && index < 5) inputsRef.current[index + 1]?.focus();
  };

  const handleOtpKeyDown = (e: React.KeyboardEvent<HTMLInputElement>, index: number) => {
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

  const handleAuth = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setErrorMessage("");
    try {
      const result = await signIn("credentials", {
        redirect: false,
        email: identifier,
        otp: password,
        deviceId: "web-portal-local",
      });
      if (result?.error) {
        if (result.error === "CredentialsSignin") {
          setErrorMessage("Invalid credentials. Please check your details.");
        } else if (result.error.includes("THROTTLED") || result.error.includes("429")) {
          setErrorMessage("Too many login attempts. Please wait a few minutes.");
        } else {
          setErrorMessage(result.error || "Authentication failed.");
        }
        setLoading(false);
      } else {
        window.location.href = "/dashboard";
      }
    } catch {
      setErrorMessage("Authentication encountered a system error.");
      setLoading(false);
    }
  };

  const handleResend = async () => {
    if (!identifier.trim()) return;
    setResendStatus("sending");
    try {
      const isEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(identifier);
      await api.post("/auth/operator/reset-otp", isEmail ? { email: identifier } : { phone: identifier });
      setResendStatus("success");
      setTimeout(() => setResendStatus("idle"), 5000);
    } catch {
      setResendStatus("error");
    }
  };

  return (
    <div className="min-h-screen w-full bg-[#F0F2F5] text-slate-800 font-sans flex items-center justify-center p-3 sm:p-5 lg:p-8">
      {/* Card wrapper */}
      <div className="w-full max-w-[1100px] bg-white rounded-[24px] sm:rounded-[32px] border border-slate-100 shadow-[0_24px_80px_rgba(0,0,0,0.07)] overflow-hidden flex flex-col lg:flex-row lg:p-3 lg:gap-3 relative">

        {/* LEFT: Branding panel — desktop only */}
        <div className="hidden lg:flex w-[46%] min-h-[680px] relative overflow-hidden bg-[#090d16] rounded-[24px] flex-col justify-between p-10 xl:p-12 shrink-0 select-none">
          <div className="absolute inset-0 z-0">
            <Image
              src="/side.png"
              alt="Mizigo Ambient"
              fill
              className="object-cover opacity-20 brightness-75 contrast-125 mix-blend-overlay"
              priority
            />
            <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 via-transparent to-indigo-500/10" />
            <div className="absolute -top-40 -left-40 w-96 h-96 bg-blue-500/10 rounded-full blur-[120px]" />
            <div className="absolute -bottom-40 -right-40 w-96 h-96 bg-indigo-500/10 rounded-full blur-[120px]" />
            <div className="absolute inset-0 bg-[radial-gradient(circle_at_2px_2px,rgba(255,255,255,0.03)_1px,transparent_0)] bg-[length:24px_24px]" />
          </div>
          <div className="relative z-10 flex items-center gap-3">
            <div className="w-10 h-10 rounded-[10px] bg-white/5 border border-white/10 flex items-center justify-center backdrop-blur-md">
              <Image src="/mono.png" alt="Logo" width={24} height={24} />
            </div>
            <Image src="/word.png" alt="Mizigo" width={80} height={20} className="opacity-90 mt-0.5" />
          </div>
          <div className="relative z-10 space-y-5 my-auto">
            <div className="inline-flex items-center gap-2 px-3 py-1.5 bg-blue-500/10 border border-blue-500/20 rounded-[8px]">
              <Activity size={11} className="text-blue-400 animate-pulse" />
              <span className="text-[9px] font-black uppercase tracking-[0.2em] text-blue-200">Live Network System</span>
            </div>
            <h1 className="text-4xl xl:text-5xl font-black tracking-tight leading-tight uppercase text-white">
              The Future of{" "}
              <span className="text-blue-500 drop-shadow-[0_0_20px_rgba(59,130,246,0.3)]">Cargo</span>{" "}
              Telemetry
            </h1>
            <p className="text-slate-400 font-medium text-sm xl:text-base leading-relaxed">
              Mizigo provides real-time logistics mapping, cargo routing analytics, and workforce automation for national rail cargo operations.
            </p>
          </div>
          <div className="relative z-10 flex items-center gap-5 opacity-30 text-[10px] font-bold tracking-widest text-slate-400">
            <span>SECURE PROTOCOL v2.1.0</span>
            <span className="h-3 w-px bg-white/20" />
            <span>© 2026 MIZIGO</span>
          </div>
        </div>

        {/* RIGHT: Auth form */}
        <div className="flex-1 flex flex-col bg-white relative overflow-hidden">
          {/* Ambient glow on mobile */}
          <div className="absolute inset-0 z-0 lg:hidden pointer-events-none">
            <div className="absolute -top-32 -right-32 w-80 h-80 bg-blue-500/5 rounded-full blur-[100px]" />
            <div className="absolute -bottom-32 -left-32 w-80 h-80 bg-indigo-500/5 rounded-full blur-[100px]" />
          </div>

          {/* Top bar */}
          <header className="relative z-10 flex justify-between items-center px-6 sm:px-10 py-5 shrink-0">
            <div className="lg:hidden flex items-center gap-2.5">
              <Image src="/mono.png" alt="Icon" width={28} height={28} className="rounded-[8px]" />
              <Image src="/word.png" alt="Mizigo" width={66} height={17} className="opacity-90" />
            </div>
            <div className="hidden lg:block" />
            <button
              onClick={() => router.push("/")}
              className="h-9 px-4 bg-slate-50 hover:bg-slate-100 text-slate-600 rounded-[10px] text-[9px] font-black border border-slate-100 transition-all flex items-center gap-2 uppercase tracking-widest"
            >
              <Search size={11} className="text-blue-500" />
              Track
            </button>
          </header>

          {/* Form area — scrollable on small screens */}
          <div className="relative z-10 flex-1 flex flex-col justify-center items-center px-6 sm:px-10 py-6 overflow-y-auto">
            <div className="w-full max-w-[400px] space-y-7 animate-in fade-in slide-in-from-bottom-6 duration-700">
              {/* Heading */}
              <div className="space-y-3">
                <div className="inline-flex items-center gap-2 px-3 py-1.5 bg-blue-50 border border-blue-100 rounded-[8px]">
                  <ShieldCheck size={12} className="text-blue-600" />
                  <span className="text-[9px] font-black uppercase tracking-widest text-blue-700">Secure Access Portal</span>
                </div>
                <div>
                  <h2 className="text-2xl sm:text-[28px] font-black tracking-tight text-slate-900 uppercase leading-none">
                    Access Portal
                  </h2>
                  <p className="text-slate-500 font-semibold text-xs mt-2 leading-relaxed">
                    Enter your account details to receive your access OTP.
                  </p>
                </div>
              </div>

              {/* Form */}
              <form ref={formRef} onSubmit={handleAuth} className="space-y-5">
                {/* Identifier */}
                <div className="space-y-2">
                  <label className="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 ml-0.5">
                    Email or Phone
                  </label>
                  <div className="relative group">
                    <UserCircle
                      className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-blue-500 transition-colors pointer-events-none"
                      size={17}
                    />
                    <input
                      type="text"
                      required
                      value={identifier}
                      onChange={(e) => setIdentifier(e.target.value)}
                      placeholder="e.g. operator@mizigo.com"
                      className="w-full h-12 sm:h-14 bg-slate-50 border border-slate-100 focus:border-blue-500/80 rounded-[12px] pl-11 pr-4 font-semibold text-slate-900 focus:bg-white outline-none transition-all placeholder:text-slate-300 text-sm tracking-wide focus:ring-4 focus:ring-blue-500/5"
                    />
                  </div>
                </div>

                {/* OTP */}
                <div className="space-y-2">
                  <div className="flex justify-between items-center">
                    <label className="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400">Access Code</label>
                    <button
                      type="button"
                      onClick={handleResend}
                      disabled={resendStatus === "sending" || !identifier.trim()}
                      className="text-[9px] font-black uppercase tracking-widest text-blue-600 hover:text-blue-500 disabled:opacity-30 transition-opacity"
                    >
                      {resendStatus === "sending" ? "Sending..." : resendStatus === "success" ? "Sent ✓" : "Resend Code"}
                    </button>
                  </div>

                  {/* OTP inputs — full width, equal sizing */}
                  <div className="flex justify-between gap-1.5 sm:gap-2">
                    {otp.map((data, index) => (
                      <input
                        key={index}
                        ref={(el) => { inputsRef.current[index] = el; }}
                        type={showPassword ? "text" : "password"}
                        inputMode="numeric"
                        maxLength={1}
                        value={data}
                        onChange={(e) => handleOtpChange(e.target.value, index)}
                        onKeyDown={(e) => handleOtpKeyDown(e, index)}
                        onPaste={handleOtpPaste}
                        className={[
                          "flex-1 min-w-0 aspect-square text-center text-lg sm:text-xl font-black rounded-[12px] transition-all outline-none",
                          otpComplete
                            ? "bg-emerald-50 border border-emerald-400 ring-4 ring-emerald-500/10 text-emerald-700 scale-[1.04]"
                            : "bg-slate-50 border border-slate-200 focus:bg-white focus:ring-4 focus:ring-blue-500/10 focus:border-blue-500 text-slate-900",
                        ].join(" ")}
                        required
                      />
                    ))}
                  </div>

                  {otpComplete && (
                    <div className="flex items-center justify-center gap-1.5 animate-in fade-in duration-200 pt-1">
                      <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-ping" />
                      <span className="text-[9px] font-black uppercase tracking-widest text-emerald-600">
                        {loading ? "Signing in…" : "Verifying…"}
                      </span>
                    </div>
                  )}

                  <div className="flex justify-end">
                    <button
                      type="button"
                      onClick={() => setShowPassword(!showPassword)}
                      className="text-[9px] font-bold uppercase tracking-wider text-slate-400 hover:text-slate-600 transition-colors flex items-center gap-1.5"
                    >
                      {showPassword ? <><EyeOff size={10} strokeWidth={2.5} /> Hide</> : <><Eye size={10} strokeWidth={2.5} /> Show</>}
                    </button>
                  </div>
                </div>

                {/* Error */}
                {errorMessage && (
                  <div className="flex items-start gap-3 px-4 py-3 bg-rose-50 border border-rose-100 rounded-[12px] animate-in slide-in-from-top-2">
                    <AlertCircle size={15} className="text-rose-500 shrink-0 mt-0.5" />
                    <p className="text-[10px] font-black text-rose-600 uppercase tracking-widest leading-relaxed">
                      {errorMessage}
                    </p>
                  </div>
                )}

                {/* Submit */}
                <button
                  type="submit"
                  disabled={loading || !identifier.trim() || password.length < 6}
                  className="h-12 sm:h-14 w-full bg-slate-900 text-white rounded-[12px] text-[11px] font-black uppercase tracking-[0.25em] shadow-lg shadow-slate-900/10 hover:bg-slate-800 hover:scale-[1.01] active:scale-95 transition-all flex items-center justify-center gap-3 disabled:opacity-50 disabled:pointer-events-none group mt-1"
                >
                  {loading ? (
                    <Loader2 className="animate-spin" size={15} strokeWidth={3} />
                  ) : (
                    <>
                      Sign In
                      <ArrowRight size={13} strokeWidth={3} className="group-hover:translate-x-0.5 transition-transform" />
                    </>
                  )}
                </button>
              </form>
            </div>
          </div>

          {/* Mobile footer */}
          <footer className="relative z-10 lg:hidden py-5 text-center text-[9px] font-black uppercase tracking-widest text-slate-400 shrink-0 border-t border-slate-100 px-6">
            Mizigo Logistics · Secure Encryption Portal
          </footer>
        </div>
      </div>
    </div>
  );
}
