import ChangeOtpForm from "@/components/auth/change-otp-form";
import { Truck, MapPin, BarChart3, Shield, Zap } from "lucide-react";
import Image from "next/image";

const features = [
    { icon: Truck,     label: "Real-time cargo tracking across all terminals" },
    { icon: BarChart3, label: "Live financial dashboards and revenue analytics" },
    { icon: MapPin,    label: "Multi-terminal SGR station management" },
    { icon: Shield,    label: "Role-based access and full audit trail" },
]

const stats = [
    { value: "12+",  label: "Terminals" },
    { value: "98%",  label: "Uptime" },
    { value: "50K+", label: "Shipments" },
]

export default function ChangeOtpPage() {
    return (
        <div className="h-screen w-full flex">
            {/* ── Left panel: form ── */}
            <div className="w-full lg:w-1/2 flex flex-col items-center justify-center bg-[#1A2751] shrink-0 px-8 py-12 relative">

                {/* Centered form card */}
                <div className="w-full max-w-[360px] flex flex-col items-center">

                    {/* Logo — centered at top of form */}
                    <div className="flex flex-col items-center gap-4 mb-8">
                        <div className="flex items-center gap-3">
                            <Image 
                                src="/mono.png" 
                                alt="Mizigo Icon" 
                                width={80} 
                                height={80} 
                                className="h-16 w-auto" 
                                priority 
                            />
                            <Image 
                                src="/word.png" 
                                alt="Mizigo Wordmark" 
                                width={200} 
                                height={60} 
                                className="h-14 w-auto dark:hidden" 
                                priority 
                            />
                            <Image 
                                src="/logo-light.png" 
                                alt="Mizigo Wordmark" 
                                width={200} 
                                height={60} 
                                className="h-14 w-auto hidden dark:block" 
                                priority 
                            />
                        </div>
                        <div className="text-center mt-2">
                            <p className="text-[11px] text-blue-200/60 font-medium mt-0.5">Enterprise Logistics Platform</p>
                        </div>
                    </div>

                    {/* Heading */}
                    <div className="mb-7 text-center">
                        <h1 className="text-[22px] font-extrabold text-white tracking-tight">
                            Complete Setup
                        </h1>
                        <p className="text-[13px] text-blue-200/70 font-medium mt-1.5 px-4">
                            For security purposes, you must change your auto-generated PIN.
                        </p>
                    </div>

                    {/* Form */}
                    <div className="w-full">
                        <ChangeOtpForm />
                    </div>

                    <p className="text-[11px] text-blue-200/60 font-medium text-center mt-6 leading-relaxed">
                        Secure your account to access operations.<br />Contact your system administrator for assistance.
                    </p>
                </div>

                {/* Bottom version */}
                <p className="absolute bottom-6 text-[10px] font-bold text-white/30 uppercase tracking-[0.18em]">
                    Mizigo · v2.4
                </p>
            </div>

            {/* ── Right panel: brand ── */}
            <div className="hidden lg:flex lg:w-1/2 bg-slate-900 flex-col relative overflow-hidden">

                {/* Side image background with dark blue overlay */}
                <div className="absolute inset-0 z-0 bg-cover bg-center bg-side-image" />
                <div className="absolute inset-0 z-0 bg-black/20 mix-blend-multiply" />
                <div className="absolute inset-0 z-0 bg-blue-900/50" />

                {/* Background grid pattern */}
                <div
                    className="absolute inset-0 opacity-[0.04]"
                    style={{
                        backgroundImage: `linear-gradient(rgba(255,255,255,0.8) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,0.8) 1px, transparent 1px)`,
                        backgroundSize: "48px 48px",
                    }}
                />

                {/* Gradient orbs */}
                <div className="absolute top-[-80px] right-[-80px] w-[400px] h-[400px] rounded-full bg-indigo-600 opacity-20 blur-[80px] pointer-events-none" />
                <div className="absolute bottom-[-60px] left-[-60px] w-[320px] h-[320px] rounded-full bg-violet-600 opacity-15 blur-[80px] pointer-events-none" />
                <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[500px] h-[500px] rounded-full bg-indigo-900 opacity-30 blur-[100px] pointer-events-none" />

                {/* Content */}
                <div className="relative z-10 flex flex-col justify-between h-full px-14 py-14">

                    {/* Top: headline */}
                    <div className="max-w-md">
                        <div className="inline-flex items-center gap-2 bg-white/10 border border-white/10 rounded-full px-3 py-1.5 mb-6">
                            <Zap size={11} className="text-amber-400" strokeWidth={2.5} />
                            <span className="text-[10px] font-extrabold uppercase tracking-[0.15em] text-white/70">
                                SGR Logistics Platform
                            </span>
                        </div>
                        <h2 className="text-[36px] font-extrabold text-white tracking-tight leading-[1.15]">
                            Manage cargo.<br />
                            <span className="text-indigo-400">At scale.</span>
                        </h2>
                        <p className="text-[14px] text-slate-400 font-medium mt-4 leading-relaxed max-w-sm">
                            Streamline your logistics operations across all SGR terminals with real-time visibility and smart automation.
                        </p>
                    </div>

                    {/* Middle: feature list */}
                    <div className="flex flex-col gap-3 my-auto pt-12">
                        {features.map((f) => (
                            <div key={f.label} className="flex items-center gap-3">
                                <div className="w-8 h-8 rounded-lg bg-white/8 border border-white/10 flex items-center justify-center shrink-0">
                                    <f.icon size={13} className="text-indigo-400" strokeWidth={2.5} />
                                </div>
                                <p className="text-[13px] text-slate-300 font-medium">{f.label}</p>
                            </div>
                        ))}
                    </div>

                    {/* Bottom: stats */}
                    <div className="flex items-center gap-8 pt-10 border-t border-white/10">
                        {stats.map((s, i) => (
                            <div key={s.label}>
                                <p className="text-[22px] font-extrabold text-white tabular-nums">{s.value}</p>
                                <p className="text-[10px] font-bold uppercase tracking-widest text-slate-500 mt-0.5">{s.label}</p>
                            </div>
                        ))}
                    </div>
                </div>

            </div>
        </div>
    );
}
