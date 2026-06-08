import OTPForm from "@/components/auth/otp-form";
import { ShieldCheck, ChevronLeft } from "lucide-react";
import Image from "next/image";
import Link from "next/link";

export default function OTPPage() {
  return (
    <div className="h-[100dvh] w-screen relative bg-slate-950 text-white selection:bg-blue-500/30 font-sans overflow-hidden">
      <div className="absolute inset-0 z-0 overflow-hidden">
        <Image
          src="/side.png"
          alt="Mizigo Hero"
          fill
          className="object-cover opacity-70 brightness-90 contrast-125"
          priority
        />
        <div className="absolute inset-0 bg-gradient-to-b from-slate-950/30 via-transparent to-slate-950" />
        <div className="absolute inset-0 bg-gradient-to-r from-slate-950/40 via-transparent to-slate-950/40" />
      </div>

      <nav className="relative z-50 flex justify-between items-center px-5 md:px-12 xl:px-24 py-5 md:py-8 max-w-[1920px] mx-auto w-full">
        <Link href="/" className="flex items-center gap-3 cursor-pointer group">
          <div className="h-10 w-10 md:h-11 md:w-11 bg-white/5 rounded-[10px] flex items-center justify-center group-hover:bg-blue-600 group-hover:text-white transition-all border border-white/5 ring-1 ring-white/10 shrink-0">
            <ChevronLeft size={20} strokeWidth={2.5} />
          </div>
          <span className="text-[10px] font-black uppercase tracking-widest hidden md:block text-slate-400 group-hover:text-white transition-colors">
            Return
          </span>
        </Link>

        <div className="flex items-center gap-3">
          <Image
            src="/mono.png"
            alt="Icon"
            width={36}
            height={36}
            className="rounded-[10px] shadow-2xl shadow-blue-500/20 md:w-11 md:h-11 group-hover:scale-105 transition-transform"
          />
          <Image
            src="/word.png"
            alt="Mizigo"
            width={90}
            height={24}
            className="opacity-90 mt-1 md:w-[110px] md:mt-1.5 transition-opacity group-hover:opacity-100"
          />
        </div>
      </nav>

      <main className="relative z-10 w-full max-w-[1920px] mx-auto px-5 md:px-12 xl:px-24 flex flex-col justify-center items-center h-[calc(100vh-120px)]">
        <div className="w-full max-w-[420px] relative animate-in fade-in slide-in-from-bottom-12 duration-1000">
          {/* Security Header */}
          <div className="flex flex-col items-center justify-center mb-8 space-y-4">
            <div className="h-16 w-16 bg-blue-600/20 rounded-[10px] flex items-center justify-center text-blue-500 shadow-[0_0_30px_rgba(59,130,246,0.3)] ring-1 ring-blue-500/50">
              <ShieldCheck size={32} strokeWidth={2} />
            </div>
            <div className="text-center space-y-1">
              <h1 className="text-2xl md:text-3xl font-black tracking-tight text-white">
                Security Check
              </h1>
              <p className="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400">
                Account Identity Verification
              </p>
            </div>
          </div>

          <div className="bg-slate-900/60 backdrop-blur-3xl p-6 md:p-8 rounded-[10px] border border-white/10 shadow-[0_40px_100px_-20px_rgba(0,0,0,0.5)] md:hover:border-blue-500/30 transition-all duration-500">
            <OTPForm />
          </div>

          <div className="mt-8 text-center flex justify-center items-center gap-2 opacity-50">
            <ShieldCheck size={12} className="text-blue-400" />
            <span className="text-[8px] font-black uppercase tracking-widest text-slate-400">
              Encrypted Payload Node v2.1.0
            </span>
          </div>
        </div>
      </main>
    </div>
  );
}
