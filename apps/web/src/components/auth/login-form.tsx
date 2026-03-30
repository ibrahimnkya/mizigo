"use client";

import { useState } from "react";
import { signIn } from "next-auth/react";
import { Eye, EyeOff, Mail, Lock, ArrowRight, XCircle, Loader2, Phone } from "lucide-react";
import { cn } from "@/lib/utils";

function LoginButton({ pending }: { pending: boolean }) {
    return (
        <button
            type="submit"
            aria-disabled={pending}
            disabled={pending}
            className="w-full h-11 bg-slate-900 hover:bg-slate-800 disabled:opacity-60 text-white text-[13px] font-extrabold rounded-sm flex items-center justify-center gap-2 transition-all hover:-translate-y-0.5 active:translate-y-0 shadow-lg shadow-slate-900/20"
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
                identifier,
                secret
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
                <label htmlFor="identifier" className="text-[11px] font-extrabold uppercase tracking-[0.12em] text-blue-200/70">
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
                        className="w-full h-11 pl-10 pr-4 bg-slate-50 border border-slate-200 rounded-sm text-[13px] font-medium text-slate-900 placeholder:text-slate-300 focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:bg-white focus:border-transparent transition-all"
                    />
                </div>
            </div>

            {/* Secret (Password or PIN) */}
            <div className="flex flex-col gap-1.5">
                <div className="flex items-center justify-between">
                    <label htmlFor="secret" className="text-[11px] font-extrabold uppercase tracking-[0.12em] text-blue-200/70">
                        Password or PIN
                    </label>
                    <a href="/forgot-password" className="text-[11px] font-bold text-sky-400 hover:text-sky-300 transition-colors">
                        Forgot password?
                    </a>
                </div>
                <div className="relative group">
                    <div className="absolute left-3.5 top-1/2 -translate-y-1/2 text-slate-300 group-focus-within:text-indigo-500 transition-colors pointer-events-none">
                        <Lock size={14} strokeWidth={2.5} />
                    </div>
                    <input
                        id="secret"
                        type={showPassword ? "text" : "password"}
                        name="secret"
                        required
                        placeholder="••••••••"
                        className="w-full h-11 pl-10 pr-10 bg-slate-50 border border-slate-200 rounded-sm text-[13px] font-medium text-slate-900 placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:bg-white focus:border-transparent transition-all"
                    />
                    <button
                        type="button"
                        onClick={() => setShowPassword(!showPassword)}
                        className="absolute right-3.5 top-1/2 -translate-y-1/2 text-slate-300 hover:text-slate-600 transition-colors"
                    >
                        {showPassword ? <EyeOff size={14} /> : <Eye size={14} />}
                    </button>
                </div>
            </div>

            {/* Error */}
            {errorMessage && (
                <div className="flex items-center gap-2 px-3 py-2.5 bg-rose-50 border border-rose-200/60 rounded-sm" aria-live="polite">
                    <XCircle size={13} className="text-rose-500 shrink-0" />
                    <p className="text-[12px] text-rose-600 font-semibold">{errorMessage}</p>
                </div>
            )}

            <LoginButton pending={isPending} />
        </form>
    );
}