"use client";

import {
  PackagePlus,
  Package,
  TrainFront,
  ShieldCheck,
  Search,
  ArrowRight,
  Navigation,
  Activity,
  FileText,
  Zap,
  CheckCircle2,
} from "lucide-react";
import { useState } from "react";
import { useRouter } from "next/navigation";
import { cn } from "@/lib/utils";

interface UnifiedDashboardContentProps {
  role: string;
  userName: string;
}

export function UnifiedDashboardContent({
  role,
  userName,
}: UnifiedDashboardContentProps) {
  const router = useRouter();
  const [trackingNumber, setTrackingNumber] = useState("");

  const handleTrack = (e?: React.FormEvent) => {
    e?.preventDefault();
    if (trackingNumber.trim()) {
      const target =
        role === "OPERATOR"
          ? `/operator/operations?tab=track&q=${trackingNumber}`
          : `/parcel/track?q=${trackingNumber}`;
      router.push(target);
    }
  };

  const quickActions = [
    {
      title: "Parcel Management",
      desc: "Unified view of all logistics",
      icon: Package,
      color: "bg-blue-600",
      textColor: "text-blue-700",
      href: "/parcel",
    },
    {
      title: "Logistics Reports",
      desc: "View today's performance",
      icon: FileText,
      color: "bg-emerald-600",
      textColor: "text-emerald-700",
      href: "/reports",
    },
    {
      title: "Financials",
      desc: "Revenue and settlements",
      icon: Activity,
      color: "bg-indigo-600",
      textColor: "text-indigo-700",
      href: "/admin/finance",
    },
    {
      title: "Track Parcel",
      desc: "Global real-time locator",
      icon: Search,
      color: "bg-amber-600",
      textColor: "text-amber-700",
      href: "/parcel",
    },
  ];

  return (
    <div className="space-y-12 pb-4">
      {/* 1. HERO TRACKING SECTION - PURSUIT MODE */}
      <section className="relative overflow-hidden bg-slate-900 rounded-[10px] p-8 md:p-12 shadow-2xl shadow-blue-900/10 border border-white/5">
        <div className="absolute top-[-50px] right-[-50px] p-12 opacity-5 pointer-events-none text-white">
          <Navigation size={300} strokeWidth={1} />
        </div>

        <div className="relative z-10 max-w-2xl space-y-8">
          <div className="space-y-2">
            <div className="inline-flex items-center gap-2 px-3 py-1 bg-blue-500/10 border border-blue-500/20 rounded-full">
              <div className="w-1.5 h-1.5 rounded-full bg-blue-400 animate-pulse" />
              <span className="text-[10px] font-black uppercase tracking-widest text-blue-300">
                Operational Pursuit Mode Active
              </span>
            </div>
            <h1 className="text-3xl font-black text-white tracking-tight leading-none">
              Pursuit Mode: Global Parcel Tracking
            </h1>
            <p className="text-slate-400 text-sm font-bold opacity-80">
              Intercept any shipment node within the active network protocol.
            </p>
          </div>

          <form onSubmit={handleTrack} className="relative group">
            <input
              value={trackingNumber}
              onChange={(e) => setTrackingNumber(e.target.value)}
              placeholder="Enter Terminal Tracking ID..."
              className="h-16 w-full bg-white/5 border-2 border-white/10 rounded-[10px] px-6 pr-40 text-lg font-black text-white placeholder:text-slate-600 focus:ring-4 focus:ring-blue-500/20 focus:border-blue-500/50 transition-all outline-none uppercase tracking-widest"
            />
            <button
              type="submit"
              className="absolute right-2 top-2 bottom-2 px-8 bg-blue-600 hover:bg-blue-500 text-white rounded-[10px] flex items-center gap-3 text-[11px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-xl shadow-blue-600/20"
            >
              Intercept
              <Search size={16} strokeWidth={3} />
            </button>
          </form>
        </div>
      </section>

      {/* 2. OPERATIONAL QUICK ACTION GRID */}
      <div>
        <p className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-slate-400 mb-6">
          Execution Suite
        </p>
        <section className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">
          {quickActions.map((action, idx) => (
            <button
              key={idx}
              onClick={() => router.push(action.href)}
              className="group relative flex flex-col items-start p-6 bg-white border border-slate-100 rounded-[10px] text-left transition-all hover:bg-slate-50 hover:shadow-2xl hover:shadow-slate-200/50 active:scale-95 overflow-hidden"
            >
              <div
                className={cn(
                  "inline-flex h-12 w-12 items-center justify-center rounded-[10px] mb-4 shadow-xl transition-transform group-hover:scale-110 duration-300 text-white",
                  action.color,
                )}
              >
                <action.icon size={20} strokeWidth={2.5} />
              </div>

              <h3 className="text-sm font-black text-slate-900 tracking-tight group-hover:text-blue-600 transition-colors uppercase">
                {action.title}
              </h3>
              <p className="text-slate-400 font-bold text-[10px] mt-1 uppercase leading-tight tracking-wider">
                {action.desc}
              </p>

              <div className="mt-6 flex items-center gap-2 text-[9px] font-black uppercase tracking-widest text-slate-300 group-hover:text-blue-500 transition-colors">
                Launch Node
                <ArrowRight size={12} strokeWidth={3} />
              </div>

              <div
                className={cn(
                  "absolute bottom-[-10%] right-[-5%] opacity-[0.03] group-hover:opacity-[0.08] transition-opacity duration-700 pointer-events-none",
                  action.textColor,
                )}
              >
                <action.icon size={100} strokeWidth={1} />
              </div>
            </button>
          ))}
        </section>
      </div>
    </div>
  );
}
