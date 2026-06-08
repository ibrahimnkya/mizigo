"use client";

import { useQuery } from "@tanstack/react-query";
import { useParams, useRouter } from "next/navigation";
import Image from "next/image";
import api from "@/lib/api/client";
import {
  Package,
  MapPin,
  Search,
  ChevronLeft,
  Loader2,
  CheckCircle2,
  Clock,
  Truck,
  Home,
  AlertCircle,
  Copy,
  Printer,
  ChevronRight,
  ShieldCheck,
  Phone,
  MessageSquare,
  FileText,
  Activity,
  ArrowRight,
  TrainFront,
  Weight,
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

  const {
    data: trackingData,
    isLoading,
    error,
    refetch,
  } = useQuery({
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
    toast.success("Tracking link copied to clipboard");
  };

  const handleAltSearch = (e: React.FormEvent) => {
    e.preventDefault();
    if (altSearch.trim()) {
      router.push(`/track/${altSearch.trim().toUpperCase()}`);
    }
  };

  if (isLoading) {
    return (
      <div className="min-h-screen w-screen relative bg-slate-950 text-white selection:bg-blue-500/30 font-sans overflow-hidden flex flex-col items-center justify-center p-6">
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

        <div className="relative z-10 flex flex-col items-center gap-8">
          <div className="relative w-24 h-24 bg-slate-900/60 backdrop-blur-3xl border border-white/10 rounded-[10px] flex items-center justify-center shadow-2xl shadow-blue-500/20 overflow-hidden">
            <div className="absolute inset-0 bg-blue-500/10 animate-pulse" />
            <Activity className="text-blue-400 w-10 h-10 animate-bounce" />
          </div>
          <div className="text-center space-y-3">
            <h2 className="text-2xl md:text-3xl font-black tracking-tight text-white uppercase">
              Finding{" "}
              <span className="text-blue-500 drop-shadow-[0_0_20px_rgba(59,130,246,0.5)]">
                Parcel
              </span>
            </h2>
            <div className="inline-flex items-center gap-3 px-4 py-2 bg-white/5 border border-white/10 rounded-[10px] backdrop-blur-sm">
              <Loader2 className="w-3 h-3 animate-spin text-blue-400" />
              <p className="text-slate-400 font-mono text-[10px] uppercase tracking-[0.3em] font-black">
                {id}
              </p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  if (error || !trackingData) {
    return (
      <div className="min-h-screen w-screen relative bg-slate-950 text-white selection:bg-rose-500/30 font-sans overflow-hidden flex flex-col">
        <div className="absolute inset-0 z-0">
          <Image
            src="/side.png"
            alt="Mizigo Hero"
            fill
            className="object-cover opacity-70 brightness-90 contrast-125"
            priority
          />
          <div className="absolute inset-0 bg-gradient-to-b from-slate-950/30 via-transparent to-slate-950" />
        </div>

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
              height={24}
              className="opacity-90 mt-1 md:w-[110px]"
            />
          </div>

          <button
            onClick={() => router.push("/")}
            className="h-10 md:h-12 px-5 md:px-8 bg-blue-600/10 backdrop-blur-md text-white rounded-[10px] text-[9px] md:text-[10px] font-black border border-blue-500/20 hover:bg-blue-600 hover:border-blue-500 transition-all flex items-center gap-2 md:gap-3 uppercase tracking-widest shadow-xl group"
          >
            <Search
              size={12}
              className="text-blue-400 md:w-[14px] md:h-[14px] group-hover:text-white transition-colors"
            />
            Track Another
          </button>
        </nav>

        <main className="flex-1 relative z-10 flex items-center justify-center p-6">
          <div className="w-full max-w-xl bg-slate-900/60 backdrop-blur-3xl border border-white/10 rounded-[10px] p-10 md:p-14 shadow-[0_40px_100px_-20px_rgba(0,0,0,0.5)] text-center animate-in fade-in slide-in-from-bottom-12 duration-1000">
            <div className="w-20 h-20 bg-rose-500/10 text-rose-500 rounded-[10px] flex items-center justify-center mx-auto mb-10 border border-rose-500/20 shadow-[0_0_40px_rgba(244,63,94,0.2)]">
              <Search size={32} strokeWidth={2.5} />
            </div>
            <h1 className="text-4xl font-black tracking-tighter mb-4 text-white uppercase">
              Parcel <span className="text-rose-500">Not Found</span>
            </h1>
            <p className="text-[11px] font-black uppercase tracking-[0.2em] text-slate-400 leading-relaxed mb-12 max-w-md mx-auto opacity-70">
              System could not resolve{" "}
              <span className="text-rose-400 font-mono mx-1">{id}</span>. Verify
              the shipment code or search via destination number.
            </p>
            <form
              onSubmit={handleAltSearch}
              className="relative group mx-auto max-w-sm"
            >
              <input
                type="text"
                placeholder="ENTER PHONE NUMBER..."
                value={altSearch}
                onChange={(e) => setAltSearch(e.target.value)}
                className="w-full h-16 bg-white/5 border border-white/10 rounded-[10px] px-6 text-sm font-black text-white focus:border-rose-500/50 focus:bg-white/10 outline-none transition-all placeholder:text-slate-700 tracking-widest uppercase"
              />
              <button className="absolute right-2.5 top-2.5 h-11 px-6 bg-white/10 hover:bg-rose-600 rounded-[10px] flex items-center justify-center transition-all text-[10px] font-black uppercase tracking-widest text-white shadow-xl">
                Trace
              </button>
            </form>
          </div>
        </main>
      </div>
    );
  }

  const { parcel, statusTimeline, isPrivacyMasked } = trackingData;

  const getStatusDetails = (status: string) => {
    switch (status) {
      case "PENDING":
        return {
          icon: Clock,
          color: "text-amber-400",
          bg: "bg-amber-400/10",
          border: "border-amber-400/20",
          label: "Processing",
        };
      case "RECEIVED":
        return {
          icon: Package,
          color: "text-blue-400",
          bg: "bg-blue-400/10",
          border: "border-blue-400/20",
          label: "Received",
        };
      case "IN_TRANSIT":
        return {
          icon: TrainFront,
          color: "text-indigo-400",
          bg: "bg-indigo-400/10",
          border: "border-indigo-400/20",
          label: "In Transit",
        };
      case "AT_STATION":
        return {
          icon: MapPin,
          color: "text-emerald-400",
          bg: "bg-emerald-400/10",
          border: "border-emerald-400/20",
          label: "Ready for Pickup",
        };
      case "COMPLETED":
        return {
          icon: CheckCircle2,
          color: "text-teal-400",
          bg: "bg-teal-400/10",
          border: "border-teal-400/20",
          label: "Delivered",
        };
      case "CANCELLED":
        return {
          icon: AlertCircle,
          color: "text-rose-400",
          bg: "bg-rose-400/10",
          border: "border-rose-400/20",
          label: "Cancelled",
        };
      default:
        return {
          icon: Package,
          color: "text-slate-400",
          bg: "bg-slate-400/10",
          border: "border-slate-400/20",
          label: status,
        };
    }
  };

  const activeStatus = getStatusDetails(parcel.status);

  return (
    <div className="min-h-screen w-screen relative bg-slate-950 text-white selection:bg-blue-500/30 font-sans overflow-x-hidden pb-20">
      {/* Immersive Background Layer */}
      <div className="absolute inset-0 z-0 h-[600px]">
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
      <nav className="sticky top-0 z-50 h-24 px-5 md:px-12 xl:px-24 flex items-center justify-between border-b border-white/5 bg-slate-950/80 backdrop-blur-2xl">
        <div className="flex items-center gap-6">
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
              height={24}
              className="opacity-90 mt-1 md:w-[110px]"
            />
          </div>
          <div className="h-10 w-[1px] bg-white/10 hidden md:block" />
          <div className="hidden sm:flex flex-col">
            <span className="text-[10px] font-black text-slate-500 uppercase tracking-[0.2em]">
              Parcel Status
            </span>
            <span className="text-base font-mono font-black text-blue-400 tracking-widest">
              {parcel.trackingNumber}
            </span>
          </div>
        </div>
        <div className="flex items-center gap-4">
          <button
            onClick={() => router.push("/")}
            className="h-12 px-6 bg-blue-600/10 hover:bg-blue-600 rounded-[10px] border border-blue-500/20 text-[10px] font-black uppercase tracking-widest text-white transition-all shadow-xl flex items-center gap-3 group"
          >
            <Search
              size={16}
              className="text-blue-400 group-hover:text-white transition-colors"
            />
            Track Another
          </button>
          <button
            onClick={copyLink}
            className="hidden sm:flex items-center gap-3 h-12 px-6 bg-white/5 hover:bg-white/10 rounded-[10px] border border-white/10 text-[10px] font-black uppercase tracking-widest text-slate-300 transition-all shadow-xl"
          >
            <Copy size={16} /> Copy Reference
          </button>
          <button className="h-12 w-12 bg-white/5 hover:bg-white/10 rounded-[10px] border border-white/10 flex items-center justify-center text-slate-300 transition-all shadow-xl">
            <Printer size={20} />
          </button>
        </div>
      </nav>

      <main className="max-w-[1400px] mx-auto px-5 md:px-12 py-12 relative z-10 space-y-10">
        {isPrivacyMasked && (
          <div className="bg-blue-500/10 border border-blue-500/20 p-6 rounded-[10px] backdrop-blur-3xl flex items-center gap-6 animate-in slide-in-from-top-4 duration-500 shadow-2xl">
            <div className="h-12 w-12 bg-blue-500/20 rounded-[10px] flex items-center justify-center text-blue-400 shrink-0">
              <ShieldCheck size={24} />
            </div>
            <p className="text-[10px] font-black uppercase tracking-[0.1em] text-blue-200/70 leading-relaxed">
              <span className="text-blue-500 font-black mr-3 px-2 py-0.5 bg-blue-500/20 rounded">
                PRIVACY PROTECTED
              </span>
              Some details are hidden. Use the full Parcel ID to see more
              information.
            </p>
          </div>
        )}

        {/* Hero Tracking State */}
        <div className="grid grid-cols-1 xl:grid-cols-3 gap-10">
          <div className="xl:col-span-2 bg-slate-900/60 backdrop-blur-3xl border border-white/10 rounded-[10px] p-10 md:p-14 shadow-[0_40px_100px_-20px_rgba(0,0,0,0.5)] relative overflow-hidden group">
            <div className="absolute right-0 top-0 h-full w-1/2 bg-gradient-to-l from-blue-500/5 to-transparent pointer-events-none group-hover:from-blue-500/10 transition-colors duration-700" />
            <div className="relative z-10 flex flex-col md:flex-row gap-12 justify-between items-start md:items-center">
              <div className="space-y-8 flex-1">
                <div
                  className={cn(
                    "inline-flex items-center gap-3 px-4 py-2 rounded-[10px] border-2 backdrop-blur-md",
                    activeStatus.bg,
                    activeStatus.border,
                  )}
                >
                  <Activity
                    size={14}
                    className={cn("animate-pulse", activeStatus.color)}
                  />
                  <span
                    className={cn(
                      "text-[11px] font-black uppercase tracking-[0.2em]",
                      activeStatus.color,
                    )}
                  >
                    {activeStatus.label}
                  </span>
                </div>
                <div>
                  <div className="flex items-center gap-4 mb-4">
                    <div className="h-8 w-8 bg-blue-600/20 rounded-[8px] flex items-center justify-center">
                      <MapPin size={16} className="text-blue-400" />
                    </div>
                    <span className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
                      Destination
                    </span>
                  </div>
                  <h1 className="text-5xl md:text-7xl font-black tracking-tighter text-white uppercase leading-[0.8] mb-4">
                    {parcel.route.destinationStation.split(",")[0]}
                  </h1>
                  <p className="text-slate-400 font-bold text-sm tracking-wide uppercase opacity-70">
                    Shipping from{" "}
                    <span className="text-blue-400 drop-shadow-[0_0_10px_rgba(59,130,246,0.3)]">
                      {parcel.route.receivingStation.split(",")[0]}
                    </span>
                  </p>
                </div>

                <div className="flex flex-wrap gap-10 pt-6 border-t border-white/5">
                  <div>
                    <p className="text-[10px] font-black text-slate-600 uppercase tracking-widest mb-2">
                      Last Update
                    </p>
                    <p className="text-base font-mono font-black text-slate-300 tracking-tight">
                      {format(new Date(parcel.updatedAt), "MMM dd, HH:mm")}
                    </p>
                  </div>
                  <div>
                    <p className="text-[10px] font-black text-slate-600 uppercase tracking-widest mb-2">
                      Reference No
                    </p>
                    <p className="text-base font-mono font-black text-blue-400/70 tracking-widest uppercase">
                      {parcel.trackingNumber}
                    </p>
                  </div>
                </div>
              </div>

              <div className="hidden md:flex flex-col items-center gap-6">
                <div
                  className={cn(
                    "h-48 w-48 rounded-[10px] flex items-center justify-center border-2 border-dashed shadow-[0_0_60px_rgba(0,0,0,0.5)] rotate-3 group-hover:rotate-6 transition-transform duration-700",
                    activeStatus.bg,
                    activeStatus.border.replace(
                      "border-",
                      "border-opacity-30 border-",
                    ),
                  )}
                >
                  <activeStatus.icon
                    size={80}
                    className={cn(
                      activeStatus.color,
                      "drop-shadow-[0_0_30px_currentColor]",
                    )}
                    strokeWidth={1.5}
                  />
                </div>
              </div>
            </div>
          </div>

          {/* Shipment Specs Grid */}
          <div className="bg-slate-900/60 backdrop-blur-3xl border border-white/10 rounded-[10px] p-10 flex flex-col justify-between shadow-2xl relative overflow-hidden group">
            <div className="absolute inset-0 bg-gradient-to-br from-white/5 to-transparent pointer-events-none" />
            <h3 className="text-[11px] font-black text-slate-500 uppercase tracking-[0.25em] mb-10 flex items-center gap-3">
              <div className="h-4 w-4 bg-blue-600 rounded-full animate-pulse" />
              Parcel Details
            </h3>
            <div className="space-y-8 flex-1">
              <div className="flex items-center gap-6 group/item">
                <div className="h-14 w-14 bg-white/5 rounded-[10px] flex items-center justify-center text-slate-400 shrink-0 border border-white/10 group-hover/item:border-blue-500/50 group-hover/item:text-blue-400 transition-all">
                  <Package size={24} strokeWidth={1.5} />
                </div>
                <div>
                  <p className="text-[10px] font-black text-slate-600 uppercase tracking-widest mb-1">
                    Package Size
                  </p>
                  <p className="text-lg font-black text-slate-200 tracking-tight uppercase">
                    {parcel.packageSize.replace("_", " ")}
                  </p>
                </div>
              </div>
              <div className="flex items-center gap-6 group/item">
                <div className="h-14 w-14 bg-white/5 rounded-[10px] flex items-center justify-center text-slate-400 shrink-0 border border-white/10 group-hover/item:border-blue-500/50 group-hover/item:text-blue-400 transition-all">
                  <Tag size={24} strokeWidth={1.5} />
                </div>
                <div>
                  <p className="text-[10px] font-black text-slate-600 uppercase tracking-widest mb-1">
                    Category
                  </p>
                  <p className="text-lg font-black text-slate-200 tracking-tight uppercase">
                    {parcel.parcelType.replace("_", " ")}
                  </p>
                </div>
              </div>
              <div className="flex items-center gap-6 group/item">
                <div className="h-14 w-14 bg-white/5 rounded-[10px] flex items-center justify-center text-slate-400 shrink-0 border border-white/10 group-hover/item:border-blue-500/50 group-hover/item:text-blue-400 transition-all">
                  <Activity size={24} strokeWidth={1.5} />
                </div>
                <div>
                  <p className="text-[10px] font-black text-slate-600 uppercase tracking-widest mb-1">
                    Priority
                  </p>
                  <p className="text-lg font-black text-blue-400 tracking-tight uppercase">
                    {parcel.urgency}
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Network Timeline */}
        <div className="bg-slate-900/60 backdrop-blur-3xl border border-white/10 rounded-[10px] p-10 md:p-16 overflow-x-auto no-scrollbar shadow-[0_40px_100px_-20px_rgba(0,0,0,0.5)]">
          <div className="min-w-[1000px] relative py-10">
            {/* Line Background */}
            <div className="absolute top-[72px] left-16 right-16 h-[2px] bg-white/5" />

            {/* Progress Line */}
            {(() => {
              const reachedCount = statusTimeline.filter(
                (s: any) => s.reached,
              ).length;
              const progressPercentage =
                reachedCount > 1
                  ? ((reachedCount - 1) / (statusTimeline.length - 1)) * 100
                  : 0;
              return (
                <div
                  className="absolute top-[72px] left-16 h-[2px] bg-blue-600 shadow-[0_0_20px_rgba(59,130,246,0.8)] transition-all duration-1000 ease-in-out"
                  style={{ width: `calc(${progressPercentage}% - 32px)` }}
                />
              );
            })()}

            {/* Nodes */}
            <div className="relative flex justify-between">
              {statusTimeline.map((step: any, i: number) => {
                const stepDetails = getStatusDetails(step.status);
                const isCurrent = step.status === parcel.status;
                const isCompleted = step.reached && !isCurrent;

                return (
                  <div
                    key={i}
                    className="flex flex-col items-center w-32 gap-6 relative z-10"
                  >
                    <div
                      className={cn(
                        "h-16 w-16 rounded-[10px] flex items-center justify-center border-2 transition-all duration-700 bg-slate-900 shadow-2xl",
                        isCurrent
                          ? "border-blue-500 text-blue-400 scale-125 shadow-[0_0_30px_rgba(59,130,246,0.4)]"
                          : isCompleted
                            ? "border-slate-700 text-slate-400"
                            : "border-white/5 text-slate-800 opacity-40",
                      )}
                    >
                      <stepDetails.icon
                        size={28}
                        strokeWidth={isCurrent ? 2.5 : 1.5}
                      />
                    </div>
                    <div className="text-center space-y-1">
                      <span
                        className={cn(
                          "text-[10px] font-black uppercase tracking-widest block",
                          isCurrent
                            ? "text-blue-400"
                            : isCompleted
                              ? "text-slate-400"
                              : "text-slate-700",
                        )}
                      >
                        {stepDetails.label}
                      </span>
                      {isCurrent && (
                        <span className="text-[8px] font-black text-blue-500/50 uppercase tracking-[0.2em] animate-pulse">
                          Live Tracking
                        </span>
                      )}
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        </div>

        {/* Delivery Details Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-10">
          <div className="bg-slate-900/60 backdrop-blur-3xl border border-white/10 rounded-[10px] p-10 space-y-10 shadow-2xl">
            <h3 className="text-[11px] font-black text-slate-500 uppercase tracking-[0.3em] flex items-center gap-3">
              <Info size={16} className="text-blue-500" /> Delivery Information
            </h3>
            <div className="space-y-4">
              <div className="flex justify-between items-center p-5 bg-white/5 rounded-[10px] border border-white/5 hover:border-white/10 transition-colors group">
                <span className="text-[11px] font-black text-slate-600 uppercase tracking-widest group-hover:text-slate-400 transition-colors">
                  Service Type
                </span>
                <span className="text-xs font-black text-white uppercase">
                  SGR Rail Freight
                </span>
              </div>
              <div className="flex justify-between items-center p-5 bg-white/5 rounded-[10px] border border-white/5 hover:border-white/10 transition-colors group">
                <span className="text-[11px] font-black text-slate-600 uppercase tracking-widest group-hover:text-slate-400 transition-colors">
                  Condition
                </span>
                <span className="text-xs font-black text-white uppercase">
                  {parcel.condition}
                </span>
              </div>
              <div className="flex justify-between items-center p-5 bg-white/5 rounded-[10px] border border-white/5 hover:border-white/10 transition-colors group">
                <span className="text-[11px] font-black text-slate-600 uppercase tracking-widest group-hover:text-slate-400 transition-colors">
                  Payment
                </span>
                <span className="text-xs font-black text-amber-400 uppercase tracking-widest drop-shadow-[0_0_10px_rgba(251,191,36,0.3)]">
                  {parcel.paymentStatus}
                </span>
              </div>
            </div>
          </div>

          <div className="bg-gradient-to-br from-slate-800 to-slate-950 border border-white/10 shadow-[0_40px_100px_-20px_rgba(0,0,0,0.6)] rounded-[10px] p-10 relative overflow-hidden flex flex-col justify-center gap-8 group">
            <div className="absolute -right-10 -bottom-10 opacity-5 group-hover:opacity-10 group-hover:scale-110 transition-all duration-1000">
              <ShieldCheck size={280} />
            </div>
            <div className="relative z-10 space-y-6">
              <div className="h-14 w-14 bg-blue-600/20 text-blue-500 rounded-[10px] flex items-center justify-center border border-blue-500/30 shadow-[0_0_30px_rgba(59,130,246,0.2)]">
                <ShieldCheck size={28} />
              </div>
              <h3 className="text-3xl font-black tracking-tighter text-white uppercase">
                Security <span className="text-blue-500">Token</span>
              </h3>
              <p className="text-[11px] font-black text-slate-400 uppercase tracking-[0.15em] leading-relaxed max-w-sm opacity-80">
                Present the 6-digit code sent to the registered phone number to
                collect your parcel.
              </p>
              <div className="inline-flex items-center gap-4 px-6 py-3 bg-black/50 rounded-[10px] border border-white/10 mt-2 backdrop-blur-md">
                <Phone size={16} className="text-blue-400" />
                <span className="font-mono text-xl font-black text-white tracking-[0.3em] uppercase">
                  ***{parcel.receiver.phone?.slice(-4)}
                </span>
              </div>
            </div>
          </div>
        </div>
      </main>

      {/* Footer */}
      <footer className="max-w-[1400px] mx-auto px-5 md:px-12 py-10 flex flex-col sm:flex-row justify-between items-center gap-8 border-t border-white/5 mt-20 opacity-50">
        <div className="flex items-center gap-8">
          <span className="text-[10px] font-black text-slate-600 uppercase tracking-widest">
            © 2026 MIZIGO CORE
          </span>
          <div className="flex gap-6">
            <a
              href="#"
              className="text-[9px] font-black text-slate-700 hover:text-blue-400 transition-colors uppercase tracking-[0.2em]"
            >
              Compliance
            </a>
            <a
              href="#"
              className="text-[9px] font-black text-slate-700 hover:text-blue-400 transition-colors uppercase tracking-[0.2em]"
            >
              Security
            </a>
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
