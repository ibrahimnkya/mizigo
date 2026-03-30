"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Lock, ArrowRight, Loader2, XCircle } from "lucide-react";
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
            await signOut({ callbackUrl: "/login" });

        } catch (error: any) {
            setErrorMessage(error.message || "An error occurred.");
            setIsPending(false);
        }
    };

    return (
        <form onSubmit={handleSubmit} className="flex flex-col gap-4">
            {/* New PIN */}
            <div className="flex flex-col gap-1.5">
                <label htmlFor="newCode" className="text-[11px] font-extrabold uppercase tracking-[0.12em] text-blue-200/70">
                    New 4-Digit Code
                </label>
                <div className="relative group">
                    <div className="absolute left-3.5 top-1/2 -translate-y-1/2 text-slate-300 group-focus-within:text-indigo-500 transition-colors pointer-events-none">
                        <Lock size={14} strokeWidth={2.5} />
                    </div>
                    <input
                        id="newCode"
                        type="password"
                        name="newCode"
                        required
                        minLength={4}
                        maxLength={4}
                        placeholder="••••"
                        className="w-full h-11 pl-10 pr-4 bg-slate-50 border border-slate-200 rounded-sm text-[13px] font-medium text-slate-900 placeholder:text-slate-300 focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:bg-white focus:border-transparent transition-all tracking-widest font-mono"
                    />
                </div>
            </div>

            {/* Confirm PIN */}
            <div className="flex flex-col gap-1.5">
                <label htmlFor="confirmCode" className="text-[11px] font-extrabold uppercase tracking-[0.12em] text-blue-200/70">
                    Confirm 4-Digit Code
                </label>
                <div className="relative group">
                    <div className="absolute left-3.5 top-1/2 -translate-y-1/2 text-slate-300 group-focus-within:text-indigo-500 transition-colors pointer-events-none">
                        <Lock size={14} strokeWidth={2.5} />
                    </div>
                    <input
                        id="confirmCode"
                        type="password"
                        name="confirmCode"
                        required
                        minLength={4}
                        maxLength={4}
                        placeholder="••••"
                        className="w-full h-11 pl-10 pr-4 bg-slate-50 border border-slate-200 rounded-sm text-[13px] font-medium text-slate-900 placeholder:text-slate-300 focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:bg-white focus:border-transparent transition-all tracking-widest font-mono"
                    />
                </div>
            </div>

            {/* Error */}
            {errorMessage && (
                <div className="flex items-center gap-2 px-3 py-2.5 bg-rose-50 border border-rose-200/60 rounded-sm mt-2" aria-live="polite">
                    <XCircle size={13} className="text-rose-500 shrink-0" />
                    <p className="text-[12px] text-rose-600 font-semibold">{errorMessage}</p>
                </div>
            )}

            <button
                type="submit"
                aria-disabled={isPending}
                disabled={isPending}
                className="w-full h-11 mt-2 bg-slate-900 hover:bg-slate-800 disabled:opacity-60 text-white text-[13px] font-extrabold rounded-sm flex items-center justify-center gap-2 transition-all hover:-translate-y-0.5 active:translate-y-0 shadow-lg shadow-slate-900/20"
            >
                {isPending ? (
                    <>
                        <Loader2 size={14} className="animate-spin" />
                        Updating...
                    </>
                ) : (
                    <>
                        Set Permanent PIN
                        <ArrowRight size={14} strokeWidth={2.5} />
                    </>
                )}
            </button>
        </form>
    );
}
