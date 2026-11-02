"use client";

import { Suspense, useState, useRef, useEffect } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import { useQuery } from "@tanstack/react-query";
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
  Search,
} from "lucide-react";
import api from "@/lib/api/client";

interface PublicBranding {
  name?: string;
  logoUrl?: string | null;
  faviconUrl?: string | null;
  primaryColor?: string | null;
  secondaryColor?: string | null;
}

function LoginPageInner() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const orgSlug = searchParams.get("org");

  const { data: branding } = useQuery({
    queryKey: ["public-org-branding", orgSlug],
    queryFn: async (): Promise<PublicBranding> => {
      const { data } = await api.get(`/organizations/branding/public/${orgSlug}`);
      return data.data;
    },
    enabled: !!orgSlug,
    retry: false,
  });

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

  const orgLogo = branding?.logoUrl;
  const orgName = branding?.name;

  const Brand = ({ light }: { light?: boolean }) =>
    orgLogo ? (
      // eslint-disable-next-line @next/next/no-img-element
      <img src={orgLogo} alt={orgName || "Logo"} className="h-10 w-auto max-w-[10rem] object-contain" />
    ) : (
      <span className="flex items-center gap-2.5">
        <Image src="/brand/logo_icon.png" alt="" width={40} height={40} className="h-10 w-10" priority />
        <Image
          src={light ? "/brand/logo_text.png" : "/brand/logo_text_dark.png"}
          alt="MiziGO"
          width={110}
          height={34}
          className="h-7 w-auto"
          priority
        />
      </span>
    );

  return (
    <div className="flex min-h-screen w-full bg-[#F3F3F3] text-[#1C1C1E] lg:p-4">
      {/* Brand panel */}
      <aside className="relative hidden w-[46%] shrink-0 flex-col justify-between overflow-hidden rounded-[32px] bg-gradient-to-br from-[#5C0B19] to-[#4F0A0C] p-10 text-white lg:flex xl:p-12">
        <div className="pointer-events-none absolute inset-x-0 bottom-0 h-[60%] bg-bridge bg-cover bg-bottom opacity-30" />
        <div className="pointer-events-none absolute inset-0 bg-gradient-to-b from-transparent to-[#4F0A0C]/60" />
        <div className="pointer-events-none absolute -right-24 -top-24 h-80 w-80 rounded-full bg-orange-500/20 blur-[100px]" />

        <a href="/" className="relative z-10 w-fit" aria-label="MiziGO home">
          <Brand light />
        </a>

        <div className="relative z-10">
          <h1 className="text-[40px] font-semibold leading-[1.1] tracking-tight xl:text-[46px]">
            Welcome to the <span className="text-orange-400">staff portal</span>
          </h1>
          <p className="mt-3 max-w-md text-[16px] leading-relaxed text-white/70">
            Everything your station needs to move parcels across the SGR.
          </p>
        </div>

        <p className="relative z-10 text-[13px] text-white/45">© {new Date().getFullYear()} MiziGO</p>
      </aside>

      {/* Form */}
      <main className="flex flex-1 flex-col">
        <header className="flex items-center justify-between px-6 py-5 sm:px-10">
          <a href="/" className="lg:hidden" aria-label="MiziGO home">
            <Brand />
          </a>
          <span className="hidden lg:block" />
          <a
            href="/"
            className="flex h-10 items-center gap-2 rounded-full border border-[#E2E2E2] bg-white px-4 text-[14px] font-medium text-slate-600 transition hover:border-orange-200 hover:bg-orange-50 hover:text-orange-600"
          >
            <Search size={15} /> Track a parcel
          </a>
        </header>

        <div className="flex flex-1 items-center justify-center px-6 pb-10 sm:px-10">
          <div className="w-full max-w-[400px]">
            <h2 className="text-[30px] font-semibold tracking-tight">Sign in</h2>
            <p className="mt-1 text-[15px] text-slate-500">
              {orgName ? `Sign in to ${orgName}.` : "Use your email or phone and your 6-digit access code."}
            </p>

            <form ref={formRef} onSubmit={handleAuth} className="mt-8 space-y-5">
              {/* Identifier */}
              <div>
                <label htmlFor="identifier" className="text-[14px] font-medium text-slate-600">
                  Email or phone
                </label>
                <div className="relative mt-1.5">
                  <UserCircle
                    size={18}
                    className="pointer-events-none absolute left-4 top-1/2 -translate-y-1/2 text-slate-400"
                  />
                  <input
                    id="identifier"
                    type="text"
                    required
                    autoComplete="username"
                    value={identifier}
                    onChange={(e) => setIdentifier(e.target.value)}
                    placeholder="e.g. clerk@mizigo.co.tz"
                    className="h-14 w-full rounded-2xl border border-[#E2E2E2] bg-white pl-12 pr-4 text-[15px] outline-none transition placeholder:text-slate-400 focus:border-orange-500 focus:ring-4 focus:ring-orange-500/10"
                  />
                </div>
              </div>

              {/* Access code */}
              <div>
                <div className="flex items-center justify-between">
                  <label className="text-[14px] font-medium text-slate-600">Access code</label>
                  <button
                    type="button"
                    onClick={() => setShowPassword(!showPassword)}
                    className="flex items-center gap-1.5 text-[13px] text-slate-500 transition hover:text-slate-800"
                  >
                    {showPassword ? <EyeOff size={14} /> : <Eye size={14} />}
                    {showPassword ? "Hide" : "Show"}
                  </button>
                </div>
                <div className="mt-1.5 flex justify-between gap-2">
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
                      required
                      className={[
                        "aspect-square min-w-0 flex-1 rounded-2xl border text-center text-[22px] font-semibold outline-none transition",
                        otpComplete
                          ? "border-orange-500 bg-orange-50 text-orange-700 ring-4 ring-orange-500/10"
                          : "border-[#E2E2E2] bg-white focus:border-orange-500 focus:ring-4 focus:ring-orange-500/10",
                      ].join(" ")}
                    />
                  ))}
                </div>
                <div className="mt-2 flex items-center justify-between text-[13px]">
                  <span className="text-slate-400">
                    {otpComplete ? (loading ? "Signing in…" : "Checking…") : "Didn't get a code?"}
                  </span>
                  <button
                    type="button"
                    onClick={handleResend}
                    disabled={resendStatus === "sending" || !identifier.trim()}
                    className="font-semibold text-orange-600 transition hover:text-orange-700 disabled:opacity-40"
                  >
                    {resendStatus === "sending"
                      ? "Sending…"
                      : resendStatus === "success"
                        ? "Code sent ✓"
                        : resendStatus === "error"
                          ? "Try again"
                          : "Send a new code"}
                  </button>
                </div>
              </div>

              {errorMessage && (
                <div className="flex items-start gap-3 rounded-2xl border border-rose-100 bg-rose-50 px-4 py-3">
                  <AlertCircle size={17} className="mt-0.5 shrink-0 text-rose-500" />
                  <p className="text-[14px] text-rose-700">{errorMessage}</p>
                </div>
              )}

              <button
                type="submit"
                disabled={loading}
                className="flex h-14 w-full items-center justify-center gap-2 rounded-full bg-[#5C0B19] text-[16px] font-semibold text-white transition hover:bg-[#4F0A0C] active:scale-[0.99] disabled:opacity-60"
              >
                {loading ? <Loader2 size={18} className="animate-spin" /> : <>Sign in <ArrowRight size={18} /></>}
              </button>
            </form>

            <p className="mt-8 flex items-center justify-center gap-2 text-[13px] text-slate-400">
              <ShieldCheck size={15} className="text-orange-500" /> Your session locks automatically when you step away.
            </p>
          </div>
        </div>
      </main>
    </div>
  );
}

export default function LoginPage() {
  // useSearchParams (for ?org=) needs a Suspense boundary for static rendering.
  return (
    <Suspense fallback={<div className="min-h-screen bg-[#F3F3F3]" />}>
      <LoginPageInner />
    </Suspense>
  );
}
