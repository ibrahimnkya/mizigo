"use client";

import { useState, useEffect, useRef } from "react";
import { useRouter } from "next/navigation";
import Image from "next/image";
import Link from "next/link";
import {
  Search,
  ChevronRight,
  Loader2,
  ArrowRight,
  Activity,
  TrainFront,
  Package,
  ShieldCheck,
  Zap,
} from "lucide-react";

export default function LandingPage() {
  const [trackingNumber, setTrackingNumber] = useState("");
  const [loading, setLoading] = useState(false);
  const [recentTracking, setRecentTracking] = useState<string[]>([]);
  const inputRef = useRef<HTMLInputElement>(null);
  const router = useRouter();

  const [transitPairs] = useState([
    { from: "DAR", to: "MOR", fromName: "DAR ES SALAAM", toName: "MOROGORO", id: "TR-4402" },
    { from: "MOR", to: "DAR", fromName: "MOROGORO", toName: "DAR ES SALAAM", id: "TR-4403" },
    { from: "DAR", to: "DOM", fromName: "DAR ES SALAAM", toName: "DODOMA", id: "TR-8812" },
    { from: "DOM", to: "DAR", fromName: "DODOMA", toName: "DAR ES SALAAM", id: "TR-8813" },
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
      } catch {}
    }
  }, []);

  const handleTrack = async (e?: React.FormEvent) => {
    e?.preventDefault();
    const cleanId = trackingNumber.trim();
    if (!cleanId) return;
    setLoading(true);
    const mzgId = cleanId.toUpperCase();
    const updated = [mzgId, ...recentTracking.filter((id) => id !== mzgId)].slice(0, 3);
    localStorage.setItem("mzg_recent_tracking", JSON.stringify(updated));
    setRecentTracking(updated);
    router.push(`/track/${mzgId}`);
  };

  const handlePaste = (e: React.ClipboardEvent) => {
    const pasted = e.clipboardData.getData("text");
    if (pasted) setTrackingNumber(pasted.trim().toUpperCase());
  };

  return (
    <div className="min-h-screen w-full relative bg-slate-950 text-white font-sans overflow-x-hidden">
      {/* Background */}
      <div className="absolute inset-0 z-0">
        <Image
          src="/side.png"
          alt="Mizigo Hero"
          fill
          className="object-cover opacity-60 brightness-75 contrast-110"
          priority
        />
        <div className="absolute inset-0 bg-gradient-to-b from-slate-950/50 via-slate-950/20 to-slate-950" />
        <div className="absolute inset-0 bg-gradient-to-r from-slate-950/60 via-transparent to-slate-950/60" />
      </div>

      {/* Navbar */}
      <nav className="relative z-50 flex justify-between items-center px-5 sm:px-8 md:px-12 xl:px-24 py-5 md:py-7 max-w-[1920px] mx-auto w-full">
        <div className="flex items-center gap-2.5 cursor-pointer" onClick={() => router.push("/")}>
          <Image
            src="/mono.png"
            alt="Icon"
            width={34}
            height={34}
            className="rounded-[10px] shadow-2xl shadow-blue-500/20 md:w-10 md:h-10"
          />
          <Image
            src="/word.png"
            alt="Mizigo"
            width={80}
            height={22}
            className="mb-0.5 md:w-[100px]"
          />
        </div>

        <button
          onClick={() => router.push("/login")}
          className="h-9 md:h-11 px-4 md:px-7 bg-white/5 backdrop-blur-md text-white rounded-[10px] text-[9px] md:text-[10px] font-black border border-white/10 hover:bg-blue-600 hover:border-blue-500 transition-all flex items-center gap-2 uppercase tracking-widest"
        >
          <span className="hidden sm:inline">Portal</span>
          <span className="sm:hidden">Login</span>
          <ArrowRight size={11} className="text-blue-400" />
        </button>
      </nav>

      {/* Hero */}
      <main className="relative z-10 w-full max-w-[1920px] mx-auto px-5 sm:px-8 md:px-12 xl:px-24 flex flex-col items-center pt-6 sm:pt-10 md:pt-4 pb-32 md:pb-20 xl:pb-0 xl:min-h-[calc(100vh-200px)] xl:justify-center">

        {/* Headline */}
        <div className="text-center w-full max-w-5xl space-y-5 md:space-y-7 mb-8 md:mb-14 animate-in fade-in zoom-in-95 duration-1000">
          <div className="inline-flex items-center gap-2 px-3 py-1.5 bg-blue-500/10 border border-blue-500/20 rounded-[8px] backdrop-blur-sm">
            <Activity size={11} className="text-blue-400 animate-pulse" />
            <span className="text-[9px] font-black uppercase tracking-[0.2em] text-blue-200">
              National Rail Logistics
            </span>
          </div>

          {/* Hero text - stacked on mobile, side-by-side on sm+ */}
          <h1 className="font-black tracking-tighter leading-none text-white">
            {/* Mobile: stacked */}
            <div className="flex flex-col items-center gap-1 sm:hidden">
              <span className="text-[52px] leading-none">Moving</span>
              <span className="text-[52px] leading-none text-blue-500 drop-shadow-[0_0_24px_rgba(59,130,246,0.5)] flex items-center justify-center min-h-[1.1em]">
                {displayedText || " "}
                <span className="inline-block w-[2px] h-[0.8em] bg-blue-500 animate-[pulse_1s_ease-in-out_infinite] ml-1 rounded-full align-middle" />
              </span>
              <span className="text-[52px] leading-none">Everywhere.</span>
            </div>

            {/* sm+: side-by-side "Moving [word]" then "Everywhere." */}
            <div className="hidden sm:flex flex-col items-center">
              <div className="flex items-baseline justify-center gap-3 md:gap-5 text-6xl md:text-8xl xl:text-[130px]">
                <span>Moving</span>
                <span className="text-blue-500 drop-shadow-[0_0_30px_rgba(59,130,246,0.5)] flex items-baseline min-w-[2ch]">
                  {displayedText || " "}
                  <span className="inline-block w-[2px] md:w-[3px] h-[0.8em] bg-blue-500 animate-[pulse_1s_ease-in-out_infinite] ml-1 md:ml-1.5 rounded-full" />
                </span>
              </div>
              <span className="text-6xl md:text-8xl xl:text-[130px] mt-1 md:mt-2">Everywhere.</span>
            </div>
          </h1>

          <p className="text-slate-300 font-medium text-sm md:text-base max-w-xs sm:max-w-md md:max-w-xl mx-auto leading-relaxed drop-shadow-xl px-2">
            Fast shipment tracking for Tanzanian regions. Real-time updates for local parcel rail.
          </p>
        </div>

        {/* Search */}
        <div className="w-full max-w-2xl xl:max-w-3xl relative animate-in fade-in slide-in-from-bottom-10 duration-1000 delay-300">
          <form
            onSubmit={handleTrack}
            className="bg-slate-900/70 backdrop-blur-3xl p-2 md:p-3 rounded-[14px] border border-white/10 shadow-[0_40px_100px_-20px_rgba(0,0,0,0.6)] hover:border-blue-500/40 transition-all duration-500 group"
          >
            <div className="flex flex-col sm:flex-row items-stretch gap-2">
              <div className="flex-1 relative">
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-blue-400 group-hover:scale-110 transition-transform w-4 h-4 md:w-5 md:h-5" />
                <input
                  ref={inputRef}
                  type="text"
                  placeholder="enter Parcel number"
                  value={trackingNumber}
                  onChange={(e) => setTrackingNumber(e.target.value.toUpperCase())}
                  onPaste={handlePaste}
                  className="w-full h-12 md:h-14 pl-10 md:pl-12 pr-4 bg-transparent border-none focus:ring-0 outline-none text-sm md:text-base font-black text-white placeholder:text-slate-600 font-mono tracking-widest uppercase"
                />
              </div>
              <button
                disabled={loading || !trackingNumber.trim()}
                className="h-12 md:h-14 px-6 md:px-10 bg-blue-600 text-white rounded-[10px] text-[10px] md:text-xs font-black uppercase tracking-[0.2em] shadow-2xl shadow-blue-600/30 hover:bg-blue-500 hover:scale-[1.02] active:scale-95 transition-all flex items-center justify-center gap-3 disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {loading ? <Loader2 className="animate-spin w-4 h-4" /> : "Trace Parcel"}
                <ChevronRight size={15} strokeWidth={3} />
              </button>
            </div>
          </form>

          {/* Recent tracking */}
          {recentTracking.length > 0 && (
            <div className="mt-4 flex flex-wrap items-center gap-2 justify-center">
              <span className="text-[9px] font-black text-slate-600 uppercase tracking-widest">Recent:</span>
              {recentTracking.map((id) => (
                <button
                  key={id}
                  onClick={() => { setTrackingNumber(id); router.push(`/track/${id}`); }}
                  className="px-3 py-1 bg-white/5 border border-white/10 rounded-[8px] text-[10px] font-black text-slate-400 hover:text-blue-400 hover:border-blue-500/30 transition-all font-mono tracking-widest uppercase"
                >
                  {id}
                </button>
              ))}
            </div>
          )}

          {/* Stats */}
          <div className="mt-6 flex items-center justify-center gap-6 md:gap-10">
            <div className="text-center">
              <p className="text-[8px] font-black text-slate-500 uppercase tracking-widest mb-0.5">Active Routes</p>
              <p className="text-lg md:text-2xl font-black text-white">06</p>
            </div>
            <div className="h-8 w-px bg-white/10" />
            <div className="text-center">
              <p className="text-[8px] font-black text-slate-500 uppercase tracking-widest mb-0.5">Node Latency</p>
              <p className="text-lg md:text-2xl font-black text-blue-400">2.4ms</p>
            </div>
            <div className="h-8 w-px bg-white/10" />
            <div className="text-center">
              <p className="text-[8px] font-black text-slate-500 uppercase tracking-widest mb-0.5">Uptime</p>
              <p className="text-lg md:text-2xl font-black text-emerald-400">99.9%</p>
            </div>
          </div>
        </div>

        {/* Feature chips — mobile only, below search */}
        <div className="mt-8 flex flex-wrap justify-center gap-3 xl:hidden animate-in fade-in duration-1000 delay-500">
          {[
            { icon: Zap, label: "Real-time tracking" },
            { icon: ShieldCheck, label: "Secure delivery" },
            { icon: Package, label: "Rail freight" },
          ].map(({ icon: Icon, label }) => (
            <div
              key={label}
              className="flex items-center gap-2 px-4 py-2.5 bg-slate-900/60 backdrop-blur-2xl border border-white/10 rounded-[10px] shadow-lg"
            >
              <Icon size={13} className="text-blue-400 shrink-0" />
              <span className="text-[10px] font-black text-slate-300 uppercase tracking-wider">{label}</span>
            </div>
          ))}
        </div>

        {/* Mobile transit widget */}
        <div className="mt-8 w-full max-w-2xl xl:hidden animate-in fade-in slide-in-from-bottom-6 duration-1000 delay-700">
          <div className="bg-slate-900/60 backdrop-blur-2xl p-5 rounded-[14px] border border-white/10 shadow-2xl">
            <div className="flex justify-between items-center mb-4">
              <span className="text-[9px] font-black uppercase tracking-[0.2em] text-slate-400">Transit Terminal</span>
              <div className="px-2 py-1 bg-emerald-500/10 rounded-[6px] text-emerald-400 text-[8px] font-black uppercase tracking-widest flex items-center gap-1.5">
                <span className="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-ping" />
                Active
              </div>
            </div>
            <div key={currentPairIdx} className="flex items-center justify-between gap-3 animate-in slide-in-from-right-4 duration-500">
              <div>
                <p className="text-xl font-black text-white">{transitPairs[currentPairIdx]?.from}</p>
                <p className="text-[9px] font-bold text-slate-500">{transitPairs[currentPairIdx]?.fromName}</p>
              </div>
              <div className="flex-1 relative h-6 flex items-center justify-center">
                <div className="absolute inset-x-0 top-1/2 h-[2px] bg-white/5 rounded-full" />
                <div className="absolute left-0 top-1/2 w-2/3 h-[2px] bg-blue-500 rounded-full" />
                <div className="h-7 w-7 bg-slate-800 rounded-[8px] flex items-center justify-center border border-white/5 relative z-10">
                  <TrainFront size={13} className="text-blue-400" />
                </div>
              </div>
              <div className="text-right">
                <p className="text-xl font-black text-white">{transitPairs[currentPairIdx]?.to}</p>
                <p className="text-[9px] font-bold text-slate-500">{transitPairs[currentPairIdx]?.toName}</p>
              </div>
            </div>
            <div className="mt-4 pt-3 border-t border-white/5 grid grid-cols-2 gap-3">
              <div>
                <p className="text-[8px] font-bold text-slate-600 uppercase">Rail ID</p>
                <p className="text-xs font-black text-blue-300">{transitPairs[currentPairIdx]?.id}</p>
              </div>
              <div className="text-right">
                <p className="text-[8px] font-bold text-slate-600 uppercase">ETA</p>
                <p className="text-xs font-black text-white">45 MIN</p>
              </div>
            </div>
          </div>
        </div>

        {/* Desktop floating widgets */}
        <div className="absolute bottom-12 left-10 hidden xl:flex animate-in fade-in slide-in-from-left-20 duration-1000 delay-500">
          <div className="bg-slate-900/50 backdrop-blur-2xl p-6 rounded-[14px] border border-white/8 shadow-2xl flex items-center gap-5 group hover:-translate-y-2 transition-all duration-500">
            <div className="h-14 w-14 bg-blue-600 rounded-[12px] flex items-center justify-center text-white shadow-lg shadow-blue-600/20 shrink-0">
              <Package size={28} strokeWidth={1.5} />
            </div>
            <div className="space-y-1">
              <p className="text-sm font-black uppercase tracking-wider">Fast Track</p>
              <p className="text-[10px] text-slate-400 font-bold max-w-[130px] leading-tight">Priority rail for Tanzanian routes.</p>
            </div>
            <ChevronRight size={16} className="text-slate-600 group-hover:text-blue-400 transition-colors" />
          </div>
        </div>

        <div className="absolute bottom-12 right-10 hidden xl:flex animate-in fade-in slide-in-from-right-20 duration-1000 delay-700">
          <div className="bg-slate-900/60 backdrop-blur-2xl p-7 rounded-[14px] border border-white/10 shadow-2xl min-w-[320px] hover:border-blue-500/20 transition-all duration-500">
            <div className="flex justify-between items-center mb-5">
              <span className="text-[9px] font-black uppercase tracking-[0.2em] text-slate-400">Transit Terminal</span>
              <div className="px-2 py-1 bg-emerald-500/10 rounded-[6px] text-emerald-400 text-[8px] font-black uppercase tracking-widest flex items-center gap-1.5">
                <span className="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-ping" />
                Active
              </div>
            </div>
            <div key={currentPairIdx} className="flex items-center justify-between gap-5 animate-in slide-in-from-right-4 duration-500">
              <div>
                <p className="text-2xl font-black text-white">{transitPairs[currentPairIdx]?.from}</p>
                <p className="text-[9px] font-bold text-slate-500">{transitPairs[currentPairIdx]?.fromName}</p>
              </div>
              <div className="flex-1 relative h-6 flex items-center justify-center">
                <div className="absolute inset-x-0 top-1/2 h-[2px] bg-white/5 rounded-full" />
                <div className="absolute left-0 top-1/2 w-2/3 h-[2px] bg-blue-500 rounded-full" />
                <div className="h-8 w-8 bg-slate-800 rounded-[8px] flex items-center justify-center border border-white/5 relative z-10">
                  <TrainFront size={14} className="text-blue-400" />
                </div>
              </div>
              <div className="text-right">
                <p className="text-2xl font-black text-white">{transitPairs[currentPairIdx]?.to}</p>
                <p className="text-[9px] font-bold text-slate-500">{transitPairs[currentPairIdx]?.toName}</p>
              </div>
            </div>
            <div className="mt-5 pt-4 border-t border-white/5 grid grid-cols-2 gap-4">
              <div>
                <p className="text-[8px] font-bold text-slate-600 uppercase">Rail ID</p>
                <p className="text-xs font-black text-blue-200">{transitPairs[currentPairIdx]?.id}</p>
              </div>
              <div className="text-right">
                <p className="text-[8px] font-bold text-slate-600 uppercase">ETA</p>
                <p className="text-xs font-black text-white">45 MIN</p>
              </div>
            </div>
          </div>
        </div>
      </main>

      {/* Footer */}
      <footer className="relative z-50 px-5 sm:px-8 md:px-12 xl:px-24 py-6 md:py-8 flex flex-col sm:flex-row justify-between items-center gap-4 bg-gradient-to-t from-slate-950 to-transparent border-t border-white/5 max-w-[1920px] mx-auto w-full">
        <div className="flex flex-col sm:flex-row items-center gap-3 sm:gap-8">
          <span className="text-[9px] font-black text-slate-500 uppercase tracking-widest" suppressHydrationWarning>
            © 2026 Mizigo
          </span>
          <div className="flex gap-5 sm:gap-7">
            <Link href="/terms" className="text-[9px] font-black text-slate-600 hover:text-blue-400 transition-colors uppercase tracking-widest">
              Terms
            </Link>
            <Link href="/privacy" className="text-[9px] font-black text-slate-600 hover:text-blue-400 transition-colors uppercase tracking-widest">
              Privacy
            </Link>
            <Link href="/login" className="text-[9px] font-black text-slate-600 hover:text-blue-400 transition-colors uppercase tracking-widest">
              Portal
            </Link>
          </div>
        </div>
        <div className="flex items-center gap-2.5 text-slate-500">
          <Activity size={13} className="text-blue-500 shrink-0" />
          <span className="text-[9px] font-black uppercase tracking-[0.2em]">National Rail Network</span>
        </div>
      </footer>
    </div>
  );
}
