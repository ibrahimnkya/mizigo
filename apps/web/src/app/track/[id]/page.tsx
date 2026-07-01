"use client";

import { useQuery } from "@tanstack/react-query";
import { useParams, useRouter } from "next/navigation";
import Image from "next/image";
import api from "@/lib/api/client";
import {
  Package,
  MapPin,
  Search,
  Loader2,
  CheckCircle2,
  Clock,
  Home,
  AlertCircle,
  Copy,
  Printer,
  ShieldCheck,
  Phone,
  Activity,
  TrainFront,
  Tag,
  Info,
} from "lucide-react";
import { format } from "date-fns";
import { cn } from "@/lib/utils";
import { toast } from "sonner";
import { useState } from "react";

export default function PublicTrackingPage() {
  const { id } = useParams();
  const router = useRouter();
  const [altSearch, setAltSearch] = useState("");

  const { data: trackingData, isLoading, error } = useQuery({
    queryKey: ["public-tracking", id],
    queryFn: async () => {
      const { data } = await api.get(`/parcel/track/${id}`);
      return data.data;
    },
    enabled: !!id,
    retry: 1,
  });

  const copyLink = () => {
    navigator.clipboard.writeText(window.location.href);
    toast.success("Tracking link copied");
  };

  const handleAltSearch = (e: React.FormEvent) => {
    e.preventDefault();
    if (altSearch.trim()) router.push(`/track/${altSearch.trim().toUpperCase()}`);
  };

  const getStatusDetails = (status: string) => {
    switch (status) {
      case "PENDING":
        return { icon: Clock, color: "text-amber-400", bg: "bg-amber-400/10", border: "border-amber-400/20", label: "Processing" };
      case "RECEIVED":
        return { icon: Package, color: "text-blue-400", bg: "bg-blue-400/10", border: "border-blue-400/20", label: "Received" };
      case "IN_TRANSIT":
        return { icon: TrainFront, color: "text-indigo-400", bg: "bg-indigo-400/10", border: "border-indigo-400/20", label: "In Transit" };
      case "AT_STATION":
        return { icon: MapPin, color: "text-emerald-400", bg: "bg-emerald-400/10", border: "border-emerald-400/20", label: "Ready for Pickup" };
      case "COMPLETED":
        return { icon: CheckCircle2, color: "text-teal-400", bg: "bg-teal-400/10", border: "border-teal-400/20", label: "Delivered" };
      case "CANCELLED":
        return { icon: AlertCircle, color: "text-rose-400", bg: "bg-rose-400/10", border: "border-rose-400/20", label: "Cancelled" };
      default:
        return { icon: Package, color: "text-slate-400", bg: "bg-slate-400/10", border: "border-slate-400/20", label: status };
    }
  };

  /* ─── Loading ─── */
  if (isLoading) {
    return (
      <div className="min-h-screen w-full bg-slate-950 text-white font-sans flex flex-col items-center justify-center p-6 relative">
        <div className="absolute inset-0 z-0">
          <Image src="/side.png" alt="Mizigo" fill className="object-cover opacity-50 brightness-75" priority />
          <div className="absolute inset-0 bg-gradient-to-b from-slate-950/40 to-slate-950" />
        </div>
        <div className="relative z-10 flex flex-col items-center gap-8 text-center">
          <div className="relative w-20 h-20 bg-slate-900/70 backdrop-blur-3xl border border-white/10 rounded-[14px] flex items-center justify-center shadow-2xl shadow-blue-500/20">
            <div className="absolute inset-0 bg-blue-500/10 animate-pulse rounded-[14px]" />
            <Activity className="text-blue-400 w-9 h-9 animate-bounce" />
          </div>
          <div className="space-y-3">
            <h2 className="text-2xl font-black tracking-tight text-white uppercase">
              Finding <span className="text-blue-500">Parcel</span>
            </h2>
            <div className="inline-flex items-center gap-3 px-4 py-2 bg-white/5 border border-white/10 rounded-[10px]">
              <Loader2 className="w-3 h-3 animate-spin text-blue-400" />
              <p className="text-slate-400 font-mono text-[10px] uppercase tracking-[0.3em] font-black">{id}</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  /* ─── Not Found ─── */
  if (error || !trackingData) {
    return (
      <div className="min-h-screen w-full bg-slate-950 text-white font-sans flex flex-col relative">
        <div className="absolute inset-0 z-0">
          <Image src="/side.png" alt="Mizigo" fill className="object-cover opacity-50 brightness-75" priority />
          <div className="absolute inset-0 bg-gradient-to-b from-slate-950/40 to-slate-950" />
        </div>

        <nav className="relative z-50 flex justify-between items-center px-5 sm:px-8 md:px-12 py-5 md:py-7 max-w-[1400px] mx-auto w-full">
          <div className="flex items-center gap-2.5 cursor-pointer" onClick={() => router.push("/")}>
            <Image src="/mono.png" alt="Icon" width={34} height={34} className="rounded-[10px] shadow-xl shadow-blue-500/20" />
            <Image src="/word.png" alt="Mizigo" width={80} height={22} className="opacity-90 mt-0.5" />
          </div>
          <button
            onClick={() => router.push("/")}
            className="h-10 px-5 bg-blue-600/10 backdrop-blur-md text-white rounded-[10px] text-[9px] sm:text-[10px] font-black border border-blue-500/20 hover:bg-blue-600 hover:border-blue-500 transition-all flex items-center gap-2 uppercase tracking-widest"
          >
            <Search size={12} className="text-blue-400" />
            <span className="hidden sm:inline">Track Another</span>
            <span className="sm:hidden">Search</span>
          </button>
        </nav>

        <main className="flex-1 relative z-10 flex items-center justify-center p-5">
          <div className="w-full max-w-lg bg-slate-900/70 backdrop-blur-3xl border border-white/10 rounded-[16px] p-8 sm:p-12 shadow-2xl text-center animate-in fade-in slide-in-from-bottom-10 duration-800">
            <div className="w-16 h-16 bg-rose-500/10 text-rose-500 rounded-[12px] flex items-center justify-center mx-auto mb-8 border border-rose-500/20">
              <Search size={28} strokeWidth={2} />
            </div>
            <h1 className="text-3xl sm:text-4xl font-black tracking-tighter mb-3 text-white uppercase">
              Parcel <span className="text-rose-500">Not Found</span>
            </h1>
            <p className="text-[11px] font-black uppercase tracking-[0.15em] text-slate-400 leading-relaxed mb-10 opacity-70">
              Could not resolve{" "}
              <span className="text-rose-400 font-mono">{id}</span>.{" "}
              Verify the shipment code or search by phone number.
            </p>
            <form onSubmit={handleAltSearch} className="relative">
              <input
                type="text"
                placeholder="Enter phone number or parcel ID…"
                value={altSearch}
                onChange={(e) => setAltSearch(e.target.value)}
                className="w-full h-14 bg-white/5 border border-white/10 rounded-[12px] px-5 pr-28 text-sm font-bold text-white focus:border-rose-500/50 focus:bg-white/8 outline-none transition-all placeholder:text-slate-600 tracking-wide uppercase"
              />
              <button className="absolute right-2 top-2 h-10 px-5 bg-white/10 hover:bg-rose-600 rounded-[10px] text-[10px] font-black uppercase tracking-wider text-white transition-all">
                Search
              </button>
            </form>
          </div>
        </main>
      </div>
    );
  }

  const { parcel, statusTimeline, isPrivacyMasked } = trackingData;
  const activeStatus = getStatusDetails(parcel.status);

  return (
    <div className="min-h-screen w-full bg-slate-950 text-white font-sans overflow-x-hidden pb-16 sm:pb-20">
      {/* Background — only top portion */}
      <div className="absolute inset-x-0 top-0 h-[500px] z-0 pointer-events-none">
        <Image src="/side.png" alt="Mizigo" fill className="object-cover opacity-50 brightness-75" priority />
        <div className="absolute inset-0 bg-gradient-to-b from-slate-950/30 via-slate-950/60 to-slate-950" />
      </div>

      {/* Sticky Navbar */}
      <nav className="sticky top-0 z-50 h-16 sm:h-20 px-4 sm:px-8 md:px-12 flex items-center justify-between border-b border-white/5 bg-slate-950/85 backdrop-blur-2xl">
        <div className="flex items-center gap-4 sm:gap-6 min-w-0">
          <div className="flex items-center gap-2.5 cursor-pointer shrink-0" onClick={() => router.push("/")}>
            <Image src="/mono.png" alt="Icon" width={32} height={32} className="rounded-[8px] shadow-xl shadow-blue-500/20 sm:w-9 sm:h-9" />
            <Image src="/word.png" alt="Mizigo" width={72} height={20} className="opacity-90 hidden sm:block" />
          </div>
          <div className="h-8 w-px bg-white/10 hidden sm:block" />
          <div className="hidden sm:flex flex-col min-w-0">
            <span className="text-[9px] font-black text-slate-500 uppercase tracking-[0.2em]">Parcel Status</span>
            <span className="text-sm font-mono font-black text-blue-400 tracking-widest truncate">{parcel.trackingNumber}</span>
          </div>
          {/* Mobile tracking number */}
          <span className="sm:hidden text-xs font-mono font-black text-blue-400 tracking-wider truncate">{parcel.trackingNumber}</span>
        </div>

        <div className="flex items-center gap-2 sm:gap-3">
          <button
            onClick={() => router.push("/")}
            className="h-9 sm:h-11 px-3 sm:px-5 bg-blue-600/10 hover:bg-blue-600 rounded-[10px] border border-blue-500/20 text-[9px] sm:text-[10px] font-black uppercase tracking-widest text-white transition-all flex items-center gap-2"
          >
            <Search size={13} className="text-blue-400" />
            <span className="hidden sm:inline">Track Another</span>
          </button>
          <button
            onClick={copyLink}
            className="hidden sm:flex items-center gap-2 h-11 px-5 bg-white/5 hover:bg-white/10 rounded-[10px] border border-white/10 text-[10px] font-black uppercase tracking-widest text-slate-300 transition-all"
          >
            <Copy size={14} /> Copy
          </button>
          <button
            onClick={copyLink}
            className="sm:hidden h-9 w-9 bg-white/5 hover:bg-white/10 rounded-[10px] border border-white/10 flex items-center justify-center text-slate-300"
          >
            <Copy size={14} />
          </button>
          <button className="h-9 w-9 sm:h-11 sm:w-11 bg-white/5 hover:bg-white/10 rounded-[10px] border border-white/10 flex items-center justify-center text-slate-300 transition-all">
            <Printer size={16} />
          </button>
        </div>
      </nav>

      <main className="max-w-[1400px] mx-auto px-4 sm:px-8 md:px-12 py-8 sm:py-12 relative z-10 space-y-6 sm:space-y-10">

        {/* Privacy banner */}
        {isPrivacyMasked && (
          <div className="bg-blue-500/10 border border-blue-500/20 p-4 sm:p-6 rounded-[12px] backdrop-blur-3xl flex items-center gap-4 animate-in slide-in-from-top-4 duration-500">
            <div className="h-10 w-10 bg-blue-500/20 rounded-[10px] flex items-center justify-center text-blue-400 shrink-0">
              <ShieldCheck size={20} />
            </div>
            <p className="text-[10px] font-black uppercase tracking-[0.1em] text-blue-200/70 leading-relaxed">
              <span className="text-blue-500 font-black mr-2 px-2 py-0.5 bg-blue-500/20 rounded">PRIVACY PROTECTED</span>
              Some details are hidden. Use the full Parcel ID to see more.
            </p>
          </div>
        )}

        {/* Hero grid */}
        <div className="grid grid-cols-1 xl:grid-cols-3 gap-6 sm:gap-8">
          {/* Main status card */}
          <div className="xl:col-span-2 bg-slate-900/60 backdrop-blur-3xl border border-white/10 rounded-[16px] p-7 sm:p-10 md:p-12 shadow-2xl relative overflow-hidden group">
            <div className="absolute right-0 top-0 h-full w-1/2 bg-gradient-to-l from-blue-500/5 to-transparent pointer-events-none group-hover:from-blue-500/8 transition-colors duration-700" />
            <div className="relative z-10 flex flex-col sm:flex-row gap-8 sm:gap-10 justify-between items-start sm:items-center">
              <div className="space-y-6 flex-1 min-w-0">
                {/* Status badge */}
                <div className={cn("inline-flex items-center gap-2.5 px-3.5 py-2 rounded-[10px] border-2", activeStatus.bg, activeStatus.border)}>
                  <Activity size={13} className={cn("animate-pulse", activeStatus.color)} />
                  <span className={cn("text-[11px] font-black uppercase tracking-[0.2em]", activeStatus.color)}>
                    {activeStatus.label}
                  </span>
                </div>

                {/* Destination */}
                <div>
                  <div className="flex items-center gap-3 mb-3">
                    <div className="h-7 w-7 bg-blue-600/20 rounded-[8px] flex items-center justify-center shrink-0">
                      <MapPin size={14} className="text-blue-400" />
                    </div>
                    <span className="text-[10px] font-black text-slate-500 uppercase tracking-widest">Destination</span>
                  </div>
                  <h1 className="text-4xl sm:text-5xl md:text-6xl xl:text-7xl font-black tracking-tighter text-white uppercase leading-[0.85] mb-3 truncate">
                    {parcel.route.destinationStation.split(",")[0]}
                  </h1>
                  <p className="text-slate-400 font-bold text-sm tracking-wide uppercase opacity-70">
                    From{" "}
                    <span className="text-blue-400">{parcel.route.receivingStation.split(",")[0]}</span>
                  </p>
                </div>

                {/* Meta info */}
                <div className="flex flex-wrap gap-6 sm:gap-10 pt-5 border-t border-white/5">
                  <div>
                    <p className="text-[10px] font-black text-slate-600 uppercase tracking-widest mb-1">Last Update</p>
                    <p className="text-sm font-mono font-black text-slate-300">
                      {format(new Date(parcel.updatedAt), "MMM dd, HH:mm")}
                    </p>
                  </div>
                  <div>
                    <p className="text-[10px] font-black text-slate-600 uppercase tracking-widest mb-1">Reference</p>
                    <p className="text-sm font-mono font-black text-blue-400/80 tracking-widest uppercase truncate max-w-[180px]">
                      {parcel.trackingNumber}
                    </p>
                  </div>
                </div>
              </div>

              {/* Status icon — hidden on small, visible on sm+ */}
              <div className="hidden sm:flex flex-col items-center shrink-0">
                <div className={cn(
                  "h-36 w-36 md:h-44 md:w-44 rounded-[14px] flex items-center justify-center border-2 border-dashed shadow-2xl rotate-3 group-hover:rotate-6 transition-transform duration-700",
                  activeStatus.bg, activeStatus.border,
                )}>
                  <activeStatus.icon size={64} className={cn(activeStatus.color, "drop-shadow-[0_0_24px_currentColor]")} strokeWidth={1.5} />
                </div>
              </div>
            </div>
          </div>

          {/* Specs card */}
          <div className="bg-slate-900/60 backdrop-blur-3xl border border-white/10 rounded-[16px] p-7 sm:p-10 flex flex-col justify-between shadow-2xl relative overflow-hidden group">
            <div className="absolute inset-0 bg-gradient-to-br from-white/3 to-transparent pointer-events-none" />
            <h3 className="text-[11px] font-black text-slate-500 uppercase tracking-[0.25em] mb-7 flex items-center gap-3">
              <span className="h-3.5 w-3.5 bg-blue-600 rounded-full animate-pulse" />
              Parcel Details
            </h3>
            <div className="space-y-6 flex-1">
              {[
                { icon: Package, label: "Package Size", value: parcel.packageSize?.replace("_", " ") || "N/A" },
                { icon: Tag, label: "Category", value: parcel.parcelType?.replace("_", " ") || "N/A" },
                { icon: Activity, label: "Priority", value: parcel.urgency, accent: true },
              ].map(({ icon: Icon, label, value, accent }) => (
                <div key={label} className="flex items-center gap-5 group/item">
                  <div className="h-12 w-12 bg-white/5 rounded-[10px] flex items-center justify-center text-slate-400 shrink-0 border border-white/10 group-hover/item:border-blue-500/40 group-hover/item:text-blue-400 transition-all">
                    <Icon size={22} strokeWidth={1.5} />
                  </div>
                  <div className="min-w-0">
                    <p className="text-[10px] font-black text-slate-600 uppercase tracking-widest mb-0.5">{label}</p>
                    <p className={cn("text-base font-black tracking-tight uppercase truncate", accent ? "text-blue-400" : "text-slate-200")}>
                      {value}
                    </p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Timeline */}
        <div className="bg-slate-900/60 backdrop-blur-3xl border border-white/10 rounded-[16px] p-7 sm:p-10 md:p-12 shadow-2xl">
          <h3 className="text-[11px] font-black text-slate-500 uppercase tracking-[0.25em] mb-8 flex items-center gap-3">
            <span className="h-3.5 w-3.5 bg-blue-600 rounded-full animate-pulse" />
            Shipment Timeline
          </h3>

          {/* Horizontal timeline (md+) */}
          <div className="hidden md:block overflow-x-auto no-scrollbar">
            <div className="min-w-[700px] relative py-8">
              <div className="absolute top-[56px] left-12 right-12 h-[2px] bg-white/5" />
              {(() => {
                const reachedCount = statusTimeline.filter((s: any) => s.reached).length;
                const pct = reachedCount > 1 ? ((reachedCount - 1) / (statusTimeline.length - 1)) * 100 : 0;
                return (
                  <div
                    className="absolute top-[56px] left-12 h-[2px] bg-blue-600 shadow-[0_0_16px_rgba(59,130,246,0.7)] transition-all duration-1000"
                    style={{ width: `calc(${pct}% - 24px)` }}
                  />
                );
              })()}
              <div className="relative flex justify-between">
                {statusTimeline.map((step: any, i: number) => {
                  const sd = getStatusDetails(step.status);
                  const isCurrent = step.status === parcel.status;
                  const isDone = step.reached && !isCurrent;
                  return (
                    <div key={i} className="flex flex-col items-center w-28 gap-5 relative z-10">
                      <div className={cn(
                        "h-14 w-14 rounded-[10px] flex items-center justify-center border-2 transition-all duration-700 bg-slate-900 shadow-xl",
                        isCurrent ? "border-blue-500 text-blue-400 scale-125 shadow-[0_0_24px_rgba(59,130,246,0.4)]"
                          : isDone ? "border-slate-700 text-slate-400"
                          : "border-white/5 text-slate-800 opacity-40",
                      )}>
                        <sd.icon size={26} strokeWidth={isCurrent ? 2.5 : 1.5} />
                      </div>
                      <div className="text-center space-y-1">
                        <span className={cn("text-[10px] font-black uppercase tracking-widest block",
                          isCurrent ? "text-blue-400" : isDone ? "text-slate-400" : "text-slate-700",
                        )}>{sd.label}</span>
                        {isCurrent && (
                          <span className="text-[8px] font-black text-blue-500/50 uppercase tracking-[0.2em] animate-pulse">Live</span>
                        )}
                      </div>
                    </div>
                  );
                })}
              </div>
            </div>
          </div>

          {/* Vertical timeline (mobile < md) */}
          <div className="md:hidden space-y-0">
            {statusTimeline.map((step: any, i: number) => {
              const sd = getStatusDetails(step.status);
              const isCurrent = step.status === parcel.status;
              const isDone = step.reached && !isCurrent;
              const isLast = i === statusTimeline.length - 1;
              return (
                <div key={i} className="flex gap-4 relative">
                  {/* Line + node column */}
                  <div className="flex flex-col items-center shrink-0">
                    <div className={cn(
                      "h-11 w-11 rounded-[10px] flex items-center justify-center border-2 shrink-0 transition-all duration-500",
                      isCurrent ? "border-blue-500 text-blue-400 shadow-[0_0_16px_rgba(59,130,246,0.4)] bg-blue-500/10 scale-105"
                        : isDone ? "border-slate-700 text-slate-400 bg-slate-900"
                        : "border-white/5 text-slate-700 bg-slate-900 opacity-40",
                    )}>
                      <sd.icon size={20} strokeWidth={isCurrent ? 2.5 : 1.5} />
                    </div>
                    {!isLast && (
                      <div className={cn("w-[2px] flex-1 my-2 rounded-full min-h-[28px]",
                        isDone || isCurrent ? "bg-blue-600/40" : "bg-white/5",
                      )} />
                    )}
                  </div>
                  {/* Content */}
                  <div className={cn("pb-6 pt-2 min-w-0", isLast && "pb-0")}>
                    <p className={cn("text-[11px] font-black uppercase tracking-widest",
                      isCurrent ? "text-blue-400" : isDone ? "text-slate-300" : "text-slate-600",
                    )}>
                      {sd.label}
                    </p>
                    {isCurrent && (
                      <span className="inline-flex items-center gap-1.5 mt-1">
                        <span className="w-1.5 h-1.5 rounded-full bg-blue-500 animate-ping" />
                        <span className="text-[8px] font-black text-blue-500/70 uppercase tracking-[0.2em]">Live Tracking</span>
                      </span>
                    )}
                    {step.timestamp && (
                      <p className="text-[10px] font-bold text-slate-600 mt-0.5">
                        {format(new Date(step.timestamp), "MMM dd · HH:mm")}
                      </p>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        </div>

        {/* Bottom details grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6 sm:gap-8">
          {/* Delivery info */}
          <div className="bg-slate-900/60 backdrop-blur-3xl border border-white/10 rounded-[16px] p-7 sm:p-10 space-y-7 shadow-2xl">
            <h3 className="text-[11px] font-black text-slate-500 uppercase tracking-[0.3em] flex items-center gap-3">
              <Info size={15} className="text-blue-500" /> Delivery Info
            </h3>
            <div className="space-y-3">
              {[
                { label: "Service Type", value: "SGR Rail Freight" },
                { label: "Condition", value: parcel.condition },
                { label: "Payment", value: parcel.paymentStatus, accent: true },
              ].map(({ label, value, accent }) => (
                <div key={label} className="flex justify-between items-center p-4 bg-white/4 rounded-[10px] border border-white/5 hover:border-white/10 transition-colors group">
                  <span className="text-[10px] font-black text-slate-600 uppercase tracking-widest group-hover:text-slate-400 transition-colors">{label}</span>
                  <span className={cn("text-xs font-black uppercase", accent ? "text-amber-400" : "text-white")}>{value}</span>
                </div>
              ))}
            </div>
          </div>

          {/* Security token */}
          <div className="bg-gradient-to-br from-slate-800 to-slate-950 border border-white/10 shadow-2xl rounded-[16px] p-7 sm:p-10 relative overflow-hidden flex flex-col justify-center gap-6 group">
            <div className="absolute -right-8 -bottom-8 opacity-5 group-hover:opacity-8 transition-opacity duration-700">
              <ShieldCheck size={200} />
            </div>
            <div className="relative z-10 space-y-5">
              <div className="h-12 w-12 bg-blue-600/20 text-blue-500 rounded-[10px] flex items-center justify-center border border-blue-500/30">
                <ShieldCheck size={24} />
              </div>
              <h3 className="text-2xl font-black tracking-tighter text-white uppercase">
                Security <span className="text-blue-500">Token</span>
              </h3>
              <p className="text-[11px] font-black text-slate-400 uppercase tracking-[0.15em] leading-relaxed max-w-sm opacity-80">
                Present the 6-digit code sent to the registered phone to collect your parcel.
              </p>
              <div className="inline-flex items-center gap-3 px-5 py-3 bg-black/50 rounded-[10px] border border-white/10 backdrop-blur-md">
                <Phone size={15} className="text-blue-400" />
                <span className="font-mono text-lg font-black text-white tracking-[0.3em] uppercase">
                  ***{parcel.receiver?.phone?.slice(-4)}
                </span>
              </div>
            </div>
          </div>
        </div>
      </main>

      <footer className="max-w-[1400px] mx-auto px-4 sm:px-8 md:px-12 py-8 flex flex-col sm:flex-row justify-between items-center gap-5 border-t border-white/5 mt-10 opacity-40">
        <span className="text-[9px] font-black text-slate-600 uppercase tracking-widest">© 2026 MIZIGO CORE</span>
        <div className="flex items-center gap-2.5">
          <Activity size={13} className="text-blue-600" />
          <span className="text-[9px] font-black uppercase tracking-[0.25em] text-slate-600">National Logistics Network</span>
        </div>
      </footer>
    </div>
  );
}
