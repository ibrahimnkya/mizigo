"use client";

import { Search, ArrowRight } from "lucide-react";
import { useState } from "react";
import { useRouter } from "next/navigation";

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
        ["CLERK", "STATION_MASTER", "TRAIN_GUARD", "AGENT"].includes(role)
          ? `/operator/operations?tab=track&q=${trackingNumber}`
          : `/parcel/track?q=${trackingNumber}`;
      router.push(target);
    }
  };

  const quickActions = [
    { title: "Parcels", desc: "Every parcel across your network", image: "/brand/staff_parcel.png", href: "/parcel" },
    { title: "Reports", desc: "Today's performance at a glance", image: "/brand/staff_reports.png", href: "/reports" },
    { title: "Finance", desc: "Revenue and settlements", image: "/brand/3d_send.png", href: "/admin/finance" },
    { title: "Track parcel", desc: "Find any parcel in seconds", image: "/brand/3d_track.png", href: "/parcel" },
  ];

  const hour = new Date().getHours();
  const greeting = hour < 12 ? "Good morning" : hour < 17 ? "Good afternoon" : "Good evening";

  return (
    <div className="space-y-8 pb-4">
      {/* Hero — same maroon bridge card as the mobile app */}
      <section className="bridge-card p-7 md:p-10">
        <div className="max-w-2xl space-y-6 pb-10">
          <div className="space-y-2">
            <span className="accent-pill">
              <span className="h-1.5 w-1.5 rounded-full bg-white animate-pulse" />
              Live tracking
            </span>
            <h1 className="text-[28px] md:text-[34px] font-semibold tracking-tight leading-tight">
              {greeting}
              {userName ? `, ${userName.split(" ")[0]}` : ""}
            </h1>
            <p className="text-white/70 text-[15px]">Track any parcel by its tracking number.</p>
          </div>

          <form onSubmit={handleTrack} className="relative">
            <Search size={18} className="absolute left-5 top-1/2 -translate-y-1/2 text-white/50 pointer-events-none" />
            <input
              value={trackingNumber}
              onChange={(e) => setTrackingNumber(e.target.value)}
              placeholder="e.g. MZG-AAA001"
              className="h-14 w-full rounded-full bg-white/10 border border-white/20 pl-12 pr-36 text-[15px] font-medium text-white placeholder:text-white/40 outline-none backdrop-blur-md transition focus:border-orange-500 focus:ring-4 focus:ring-orange-500/20 uppercase tracking-wide"
            />
            <button
              type="submit"
              className="absolute right-1.5 top-1.5 bottom-1.5 px-6 rounded-full bg-orange-500 hover:bg-orange-600 text-white text-sm font-semibold flex items-center gap-2 transition active:scale-95"
            >
              Track
              <ArrowRight size={16} strokeWidth={2.5} />
            </button>
          </form>
        </div>
      </section>

      {/* Quick actions — illustrated tiles like the app's action grid */}
      <div>
        <div className="flex items-end justify-between mb-4">
          <h2 className="text-[19px] font-semibold text-[#1C1C1E]">Quick actions</h2>
        </div>
        <section className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {quickActions.map((action) => (
            <button
              key={action.title}
              onClick={() => router.push(action.href)}
              className="group relative flex items-center gap-4 p-5 bg-white border border-[#E2E2E2] rounded-[24px] text-left transition hover:-translate-y-0.5 hover:shadow-premium active:scale-[0.98]"
            >
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src={action.image} alt="" className="h-14 w-14 object-contain shrink-0 transition-transform group-hover:scale-110" />
              <div className="min-w-0 flex-1">
                <h3 className="text-[15px] font-semibold text-[#1C1C1E]">{action.title}</h3>
                <p className="text-[13px] text-slate-500 mt-0.5 leading-snug">{action.desc}</p>
              </div>
              <span className="h-9 w-9 rounded-full bg-slate-100 flex items-center justify-center text-slate-500 shrink-0 transition group-hover:bg-orange-500 group-hover:text-white">
                <ArrowRight size={16} />
              </span>
            </button>
          ))}
        </section>
      </div>
    </div>
  );
}
