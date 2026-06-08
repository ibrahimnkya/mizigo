import React from "react";
import Link from "next/link";
import Image from "next/image";
import { ChevronLeft, Activity } from "lucide-react";
import { cn } from "@/lib/utils";

interface LegalLayoutProps {
  title: string;
  activeTab: "terms" | "privacy";
  children: React.ReactNode;
}

export default function LegalLayout({
  title,
  activeTab,
  children,
}: LegalLayoutProps) {
  return (
    <div className="min-h-screen w-screen relative bg-slate-950 text-white selection:bg-blue-500/30 font-sans overflow-x-hidden pb-20">
      {/* Immersive Background Layer - Consistent with track/home */}
      <div className="absolute inset-0 z-0 h-[600px] pointer-events-none">
        <Image
          src="/side.png"
          alt="Mizigo Hero"
          fill
          className="object-cover opacity-70 brightness-90 contrast-125"
          priority
        />
        <div className="absolute inset-0 bg-gradient-to-b from-slate-950/30 via-transparent to-slate-950" />
      </div>

      {/* Floating Navbar */}
      <nav className="sticky top-0 z-50 h-24 w-full px-5 md:px-12 xl:px-24 flex items-center justify-between border-b border-white/5 bg-slate-950/80 backdrop-blur-2xl">
        <div className="flex items-center gap-6">
          <Link href="/" className="flex items-center gap-3 cursor-pointer">
            <Image
              src="/mono.png"
              alt="Icon"
              width={36}
              height={36}
              className="rounded-[10px] shadow-2xl shadow-blue-500/20 md:w-11 md:h-11"
            />
            <Image
              src="/word.png"
              alt="Mizigo"
              width={90}
              height={24}
              className="opacity-90 mt-1 md:w-[110px]"
            />
          </Link>
          <div className="h-10 w-[1px] bg-white/10 hidden md:block" />
          <div className="hidden sm:flex flex-col">
            <span className="text-[10px] font-black text-slate-500 uppercase tracking-[0.2em]">
              Documentation
            </span>
            <span className="text-sm font-mono font-black text-blue-400 tracking-widest uppercase">
              {title}
            </span>
          </div>
        </div>
        <div className="flex items-center gap-4">
          <Link
            href="/"
            className="h-12 px-6 bg-blue-600/10 hover:bg-blue-600 rounded-[10px] border border-blue-500/20 text-[10px] font-black uppercase tracking-widest text-white transition-all shadow-xl flex items-center gap-3 group"
          >
            <ChevronLeft
              size={16}
              className="text-blue-400 group-hover:text-white transition-colors"
            />
            Back to Home
          </Link>
        </div>
      </nav>

      <main className="max-w-[1200px] mx-auto px-5 md:px-12 py-12 relative z-10">
        {/* Main Card Container */}
        <div className="bg-slate-900/60 backdrop-blur-3xl border border-white/10 rounded-[10px] p-8 md:p-12 shadow-[0_40px_100px_-20px_rgba(0,0,0,0.5)] relative overflow-hidden">
          <div className="absolute right-0 top-0 h-full w-1/3 bg-gradient-to-l from-blue-500/5 to-transparent pointer-events-none" />

          {/* Header / Tabs */}
          <div className="border-b border-white/5 pb-8 mb-8 flex flex-col md:flex-row justify-between items-start md:items-center gap-6">
            <div>
              <span className="text-[10px] font-black text-blue-500 uppercase tracking-[0.25em] mb-2 block">
                Mizigo Platform Rules
              </span>
              <h1 className="text-4xl md:text-5xl font-black tracking-tighter text-white uppercase leading-none">
                Legal{" "}
                <span className="text-blue-500 drop-shadow-[0_0_20px_rgba(59,130,246,0.4)]">
                  Center
                </span>
              </h1>
            </div>

            <div className="flex bg-white/5 p-1 rounded-[10px] border border-white/10 w-full md:w-auto">
              <Link
                href="/terms"
                className={cn(
                  "flex-1 md:flex-initial text-center px-6 py-2.5 rounded-[8px] text-[10px] font-black uppercase tracking-widest transition-all",
                  activeTab === "terms"
                    ? "bg-blue-600 text-white shadow-lg shadow-blue-600/20"
                    : "text-slate-400 hover:text-white hover:bg-white/5",
                )}
              >
                Terms of Service
              </Link>
              <Link
                href="/privacy"
                className={cn(
                  "flex-1 md:flex-initial text-center px-6 py-2.5 rounded-[8px] text-[10px] font-black uppercase tracking-widest transition-all",
                  activeTab === "privacy"
                    ? "bg-blue-600 text-white shadow-lg shadow-blue-600/20"
                    : "text-slate-400 hover:text-white hover:bg-white/5",
                )}
              >
                Privacy Policy
              </Link>
            </div>
          </div>

          {/* Document Content */}
          <div className="relative z-10 min-h-[400px]">{children}</div>
        </div>
      </main>

      {/* Footer */}
      <footer className="max-w-[1200px] mx-auto px-5 md:px-12 py-10 flex flex-col sm:flex-row justify-between items-center gap-8 border-t border-white/5 mt-20 opacity-50">
        <div className="flex items-center gap-8">
          <span className="text-[10px] font-black text-slate-600 uppercase tracking-widest">
            © 2026 MIZIGO CORE
          </span>
          <div className="flex gap-6">
            <Link
              href="/terms"
              className="text-[9px] font-black text-slate-700 hover:text-blue-400 transition-colors uppercase tracking-[0.2em]"
            >
              Terms
            </Link>
            <Link
              href="/privacy"
              className="text-[9px] font-black text-slate-700 hover:text-blue-400 transition-colors uppercase tracking-[0.2em]"
            >
              Privacy
            </Link>
          </div>
        </div>
        <div className="flex items-center gap-3">
          <Activity size={14} className="text-blue-600" />
          <span className="text-[9px] font-black uppercase tracking-[0.3em] text-slate-600">
            National Logistics Network
          </span>
        </div>
      </footer>
    </div>
  );
}
