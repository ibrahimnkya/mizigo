"use client";

import { useState, useEffect, useRef } from "react";
import { useRouter } from "next/navigation";
import Image from "next/image";
import Link from "next/link";
import {
  Search,
  ShieldCheck,
  ChevronRight,
  Loader2,
  ArrowRight,
  Package,
  Clock,
  Zap,
  Globe,
  Plane,
  Monitor,
  Activity,
  Box,
  MapPin,
  TrainFront,
} from "lucide-react";
import { cn } from "@/lib/utils";

export default function LandingPage() {
  const [trackingNumber, setTrackingNumber] = useState("");
  const [loading, setLoading] = useState(false);
  const [recentTracking, setRecentTracking] = useState<string[]>([]);
  const inputRef = useRef<HTMLInputElement>(null);
  const router = useRouter();

  const [transitPairs] = useState([
    {
      from: "DAR",
      to: "MOR",
      fromName: "DAR ES SALAAM",
      toName: "MOROGORO",
      id: "TR-4402",
    },
    {
      from: "MOR",
      to: "DAR",
      fromName: "MOROGORO",
      toName: "DAR ES SALAAM",
      id: "TR-4403",
    },
    {
      from: "DAR",
      to: "DOM",
      fromName: "DAR ES SALAAM",
      toName: "DODOMA",
      id: "TR-8812",
    },
    {
      from: "DOM",
      to: "DAR",
      fromName: "DODOMA",
      toName: "DAR ES SALAAM",
      id: "TR-8813",
    },
  ]);
  const [currentPairIdx, setCurrentPairIdx] = useState(0);

  const [heroWordIdx, setHeroWordIdx] = useState(0);
  const heroWords = ["Parcels", "Shipments", "Goods", "Packages", "Everything"];
  const [displayedText, setDisplayedText] = useState("");
  const [isDeleting, setIsDeleting] = useState(false);

  useEffect(() => {
    const currentWord = heroWords[heroWordIdx] || "";
    const typingSpeed = isDeleting ? 75 : 150;

    const timeout = setTimeout(() => {
      if (!isDeleting && displayedText !== currentWord) {
        setDisplayedText(currentWord.substring(0, displayedText.length + 1));
      } else if (isDeleting && displayedText !== "") {
        setDisplayedText(currentWord.substring(0, displayedText.length - 1));
      } else if (!isDeleting && displayedText === currentWord) {
        setTimeout(() => setIsDeleting(true), 2000);
      } else if (isDeleting && displayedText === "") {
        setIsDeleting(false);
        setHeroWordIdx((prev) => (prev + 1) % heroWords.length);
      }
    }, typingSpeed);

    return () => clearTimeout(timeout);
  }, [displayedText, isDeleting, heroWordIdx]);

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentPairIdx((prev) => (prev + 1) % transitPairs.length);
    }, 4000);
    return () => clearInterval(interval);
  }, [transitPairs.length]);

  useEffect(() => {
    inputRef.current?.focus();
    const saved = localStorage.getItem("mzg_recent_tracking");
    if (saved) {
      try {
        setRecentTracking(JSON.parse(saved).slice(0, 3));
      } catch (e) {
        console.error("Failed to parse recent tracking history");
      }
    }
  }, []);

  const handleTrack = async (e?: React.FormEvent) => {
    e?.preventDefault();
    const cleanId = trackingNumber.trim();
    if (!cleanId) return;

    setLoading(true);
    const mzgId = cleanId.toUpperCase();
    const updated = [
      mzgId,
      ...recentTracking.filter((id) => id !== mzgId),
    ].slice(0, 3);
    localStorage.setItem("mzg_recent_tracking", JSON.stringify(updated));
    setRecentTracking(updated);
    router.push(`/track/${mzgId}`);
  };

  const handlePaste = (e: React.ClipboardEvent) => {
    const pasted = e.clipboardData.getData("text");
    if (pasted) {
      setTrackingNumber(pasted.trim().toUpperCase());
    }
  };

  return (
    <div className="min-h-screen w-screen relative bg-slate-950 text-white selection:bg-blue-500/30 font-sans overflow-x-hidden">
      {/* Immersive Background Layer - Enhanced Visibility */}
      <div className="absolute inset-0 z-0">
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

      {/* Floating Navbar - Simplified */}
      <nav className="relative z-50 flex justify-between items-center px-5 md:px-12 xl:px-24 py-5 md:py-8 max-w-[1920px] mx-auto w-full">
        <div
          className="flex items-center gap-3 cursor-pointer"
          onClick={() => router.push("/")}
        >
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
            height={25}
            className="mb-1 md:w-[110px]"
          />
        </div>

        <button
          onClick={() => router.push("/login")}
          className="h-10 md:h-12 px-5 md:px-8 bg-white/5 backdrop-blur-md text-white rounded-[10px] text-[9px] md:text-[10px] font-black border border-white/10 hover:bg-blue-600 hover:border-blue-500 transition-all flex items-center gap-2 md:gap-3 uppercase tracking-widest shadow-xl"
        >
          Portal Access
          <ArrowRight
            size={12}
            className="text-blue-400 md:w-[14px] md:h-[14px]"
          />
        </button>
      </nav>

      {/* Main Hero Engine */}
      <main className="relative z-10 w-full max-w-[1920px] mx-auto px-5 md:px-12 xl:px-24 flex flex-col justify-center items-center pt-8 pb-32 md:pb-16 xl:pb-0 xl:min-h-[calc(100vh-180px)] xl:py-0">
        {/* Central Headline */}
        <div className="text-center space-y-5 md:space-y-8 mb-10 md:mb-20 animate-in fade-in zoom-in-95 duration-1000 fill-mode-both">
          <div className="inline-flex items-center gap-2 md:gap-3 px-3 md:px-4 py-1.5 md:py-2 bg-blue-500/10 border border-blue-500/20 rounded-[10px] backdrop-blur-sm">
            <Activity
              size={12}
              className="text-blue-400 animate-pulse md:w-[14px] md:h-[14px]"
            />
            <span className="text-[9px] md:text-[10px] font-black uppercase tracking-[0.2em] md:tracking-[0.3em] text-blue-200">
              National Rail Logistics
            </span>
          </div>

          <h1 className="text-4xl sm:text-6xl md:text-7xl xl:text-[140px] font-black tracking-tighter leading-[0.85] text-white flex flex-col items-center justify-center text-center">
            <div className="flex items-center w-full min-h-[1.2em]">
              <div className="w-1/2 flex justify-end pr-2 md:pr-3">
                <span>Moving</span>
              </div>
              <div className="w-1/2 flex justify-start pl-2 md:pl-3">
                <span className="text-blue-500 drop-shadow-[0_0_30px_rgba(59,130,246,0.5)] text-left whitespace-nowrap flex items-center relative">
                  {displayedText}
                  <span className="w-[2px] md:w-[3px] h-[0.85em] bg-blue-500 animate-[pulse_1s_ease-in-out_infinite] ml-1 md:ml-2 rounded-full" />
                </span>
              </div>
            </div>

            <span className="pt-2 md:pt-4">Everywhere.</span>
          </h1>

          <p className="text-slate-200 font-medium text-base md:text-xl max-w-xs sm:max-w-lg md:max-w-2xl mx-auto leading-relaxed drop-shadow-xl px-2">
            Fast shipment tracking for Tanzanian regions. Real-time updates for
            local parcel rail.
          </p>
        </div>

        {/* Global Search Interface */}
        <div className="w-full max-w-3xl relative animate-in fade-in slide-in-from-bottom-12 duration-1000 delay-300 px-0">
          <form
            onSubmit={handleTrack}
            className="bg-slate-900/60 backdrop-blur-3xl p-2 md:p-3 rounded-[10px] border border-white/10 shadow-[0_40px_100px_-20px_rgba(0,0,0,0.5)] hover:border-blue-500/40 transition-all duration-500 group"
          >
            <div className="flex flex-col md:flex-row items-center gap-2">
              <div className="flex-1 relative w-full">
                <Search className="absolute left-4 md:left-6 top-1/2 -translate-y-1/2 text-blue-400 group-hover:scale-110 transition-transform w-5 h-5 md:w-6 md:h-6" />
                <input
                  ref={inputRef}
                  type="text"
                  placeholder="enter Parcel number"
                  value={trackingNumber}
                  onChange={(e) =>
                    setTrackingNumber(e.target.value.toUpperCase())
                  }
                  onPaste={handlePaste}
                  className="w-full h-14 md:h-16 pl-12 md:pl-16 pr-4 md:pr-8 bg-transparent border-none focus:ring-0 outline-none text-base md:text-xl font-black text-white placeholder:text-slate-600 font-mono tracking-widest uppercase"
                />
              </div>
              <button
                disabled={loading || !trackingNumber.trim()}
                className="h-14 md:h-16 px-8 md:px-12 bg-blue-600 text-white rounded-[10px] text-xs md:text-sm font-black uppercase tracking-[0.2em] shadow-2xl shadow-blue-600/30 hover:bg-blue-500 hover:scale-[1.02] active:scale-95 transition-all flex items-center justify-center gap-3 md:gap-4 w-full md:w-auto disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {loading ? (
                  <Loader2 className="animate-spin" />
                ) : (
                  "Trace Parcel"
                )}
                <ChevronRight
                  size={18}
                  strokeWidth={3}
                  className="md:w-5 md:h-5"
                />
              </button>
            </div>
          </form>

          {/* Live Node Count */}
          <div className="mt-6 md:mt-8 flex flex-wrap justify-center items-center gap-6 md:gap-10">
            <div className="flex flex-col items-center">
              <span className="text-[9px] font-black text-slate-500 uppercase tracking-widest mb-1">
                Active Routes
              </span>
              <span className="text-xl md:text-2xl font-black text-white">
                06
              </span>
            </div>
            <div className="h-8 w-[1px] bg-white/10" />
            <div className="flex flex-col items-center">
              <span className="text-[9px] font-black text-slate-500 uppercase tracking-widest mb-1">
                Node Latency
              </span>
              <span className="text-xl md:text-2xl font-black text-blue-400">
                2.4ms
              </span>
            </div>
          </div>
        </div>

        {/* Mobile Transit Widget */}
        <div className="mt-10 w-full xl:hidden animate-in fade-in slide-in-from-bottom-8 duration-1000 delay-500">
          <div className="bg-slate-900/60 backdrop-blur-2xl p-6 rounded-[10px] border border-white/10 shadow-2xl transition-all duration-700">
            <div className="flex justify-between items-center mb-5">
              <span className="text-[9px] font-black uppercase tracking-[0.2em] text-slate-400">
                Transit Terminal
              </span>
              <div className="px-2 py-1 bg-emerald-500/10 rounded text-emerald-400 text-[8px] font-black uppercase tracking-widest">
                Active Sync
              </div>
            </div>
            <div
              key={currentPairIdx}
              className="flex items-center justify-between gap-4 animate-in slide-in-from-right-4 duration-500"
            >
              <div className="flex flex-col">
                <span className="text-xl font-black text-white">
                  {transitPairs[currentPairIdx]?.from}
                </span>
                <span className="text-[9px] font-bold text-slate-500">
                  {transitPairs[currentPairIdx]?.fromName}
                </span>
              </div>
              <div className="flex-1 relative h-6 flex items-center justify-center">
                <div className="absolute top-1/2 left-0 right-0 h-[2px] bg-white/5 rounded-[10px]" />
                <div className="absolute top-1/2 left-0 w-2/3 h-[2px] bg-blue-500 rounded-[10px]" />
                <div className="h-8 w-8 bg-slate-800 rounded-[10px] flex items-center justify-center shadow-lg border border-white/5 relative z-10 -mt-1">
                  <TrainFront size={14} className="text-blue-400" />
                </div>
              </div>
              <div className="flex flex-col items-end">
                <span className="text-xl font-black text-white">
                  {transitPairs[currentPairIdx]?.to}
                </span>
                <span className="text-[9px] font-bold text-slate-500 text-right">
                  {transitPairs[currentPairIdx]?.toName}
                </span>
              </div>
            </div>
            <div className="mt-5 pt-4 border-t border-white/5 grid grid-cols-2 gap-4">
              <div className="flex flex-col">
                <span className="text-[8px] font-bold text-slate-600 uppercase">
                  Rail ID
                </span>
                <span className="text-xs font-black text-blue-200">
                  {transitPairs[currentPairIdx]?.id}
                </span>
              </div>
              <div className="flex flex-col items-end">
                <span className="text-[8px] font-bold text-slate-600 uppercase">
                  ETA
                </span>
                <span className="text-xs font-black text-white">45 MIN</span>
              </div>
            </div>
          </div>
        </div>

        {/* Floating Design Widgets */}
        <div className="absolute bottom-16 left-12 hidden xl:flex animate-in fade-in slide-in-from-left-20 duration-1000 delay-500">
          <div className="bg-slate-900/40 backdrop-blur-2xl p-6 rounded-[10px] border border-white/5 shadow-2xl flex items-center gap-6 group hover:translate-y-[-8px] transition-all duration-500">
            <div className="h-16 w-16 bg-blue-600 rounded-[10px] flex items-center justify-center shadow-lg shadow-blue-600/20 text-white">
              <Box size={32} strokeWidth={1.5} />
            </div>
            <div className="space-y-1">
              <h4 className="text-sm font-black uppercase tracking-wider">
                Fast Track
              </h4>
              <p className="text-[10px] text-slate-400 font-bold max-w-[120px] leading-tight">
                Priority rail handling for local Tanzanian routes.
              </p>
            </div>
            <ChevronRight
              size={18}
              className="text-slate-600 group-hover:text-blue-400 transition-colors"
            />
          </div>
        </div>

        {/* Bottom Right: Transit Widget */}
        <div className="absolute bottom-16 right-12 hidden xl:flex animate-in fade-in slide-in-from-right-20 duration-1000 delay-700">
          <div className="bg-slate-900/60 backdrop-blur-2xl p-8 rounded-[10px] border border-white/10 shadow-2xl min-w-[340px] transition-all duration-700 hover:border-blue-500/20">
            <div className="flex justify-between items-center mb-6">
              <span className="text-[9px] font-black uppercase tracking-[0.2em] text-slate-400">
                Transit Terminal
              </span>
              <div className="px-2 py-1 bg-emerald-500/10 rounded text-emerald-400 text-[8px] font-black uppercase tracking-widest">
                Active Sync
              </div>
            </div>
            <div
              key={currentPairIdx}
              className="flex items-center justify-between gap-6 animate-in slide-in-from-right-4 duration-500"
            >
              <div className="flex flex-col">
                <span className="text-2xl font-black text-white">
                  {transitPairs[currentPairIdx]?.from}
                </span>
                <span className="text-[9px] font-bold text-slate-500">
                  {transitPairs[currentPairIdx]?.fromName}
                </span>
              </div>
              <div className="flex-1 relative h-6 flex items-center justify-center">
                <div className="absolute top-1/2 left-0 right-0 h-[2px] bg-white/5 rounded-[10px]" />
                <div className="absolute top-1/2 left-0 w-2/3 h-[2px] bg-blue-500 rounded-[10px]" />
                <div className="h-8 w-8 bg-slate-800 rounded-[10px] flex items-center justify-center shadow-lg border border-white/5 relative z-10 -mt-1">
                  <TrainFront size={14} className="text-blue-400" />
                </div>
              </div>
              <div className="flex flex-col items-end">
                <span className="text-2xl font-black text-white">
                  {transitPairs[currentPairIdx]?.to}
                </span>
                <span className="text-[9px] font-bold text-slate-500 text-right">
                  {transitPairs[currentPairIdx]?.toName}
                </span>
              </div>
            </div>
            <div className="mt-6 pt-4 border-t border-white/5 grid grid-cols-2 gap-4">
              <div className="flex flex-col">
                <span className="text-[8px] font-bold text-slate-600 uppercase">
                  Rail ID
                </span>
                <span className="text-xs font-black text-blue-200">
                  {transitPairs[currentPairIdx]?.id}
                </span>
              </div>
              <div className="flex flex-col items-end">
                <span className="text-[8px] font-bold text-slate-600 uppercase">
                  ETA
                </span>
                <span className="text-xs font-black text-white">45 MIN</span>
              </div>
            </div>
          </div>
        </div>
      </main>

      {/* Dynamic Footer */}
      <footer className="relative z-50 p-5 md:p-10 flex flex-col sm:flex-row justify-between items-center gap-4 md:gap-6 bg-gradient-to-t from-slate-950 to-transparent px-5 md:px-12 xl:px-24">
        <div className="flex flex-col sm:flex-row items-center gap-3 sm:gap-10">
          <span
            className="text-[10px] font-black text-slate-500 uppercase tracking-widest"
            suppressHydrationWarning
          >
            © 2026 Mizigo
          </span>
          <div className="flex gap-6 sm:gap-8">
            <Link
              href="/terms"
              className="text-[10px] font-black text-slate-600 hover:text-blue-400 transition-colors uppercase tracking-widest"
              suppressHydrationWarning
            >
              Terms
            </Link>
            <Link
              href="/privacy"
              className="text-[10px] font-black text-slate-600 hover:text-blue-400 transition-colors uppercase tracking-widest"
              suppressHydrationWarning
            >
              Privacy
            </Link>
          </div>
        </div>

        <div className="flex items-center gap-3 md:gap-4 text-slate-500">
          <Activity
            size={14}
            className="text-blue-500 shrink-0 md:w-4 md:h-4"
          />
          <span className="text-[9px] font-black uppercase tracking-[0.2em] text-center">
            National Rail Network
          </span>
        </div>
      </footer>
    </div>
  );
}
