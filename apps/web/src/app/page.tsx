"use client";

import { useEffect, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import Image from "next/image";
import Link from "next/link";
import { SiteFooter } from "@/components/layout/site-footer";
import { ArrowRight, BellRing, Clock, Loader2, MapPin, Search, ShieldCheck } from "lucide-react";

const STEPS = [
  {
    image: "/brand/staff_receive.png",
    title: "Drop it at a station",
    text: "Bring your parcel to any MiziGO counter. We weigh it, price it and give you a receipt with a tracking number.",
  },
  {
    image: "/brand/staff_parcel.png",
    title: "It travels by SGR",
    text: "Your parcel rides the Standard Gauge Railway. Every scan along the way updates its journey.",
  },
  {
    image: "/brand/staff_deliver.png",
    title: "Collect with your OTP",
    text: "The receiver gets an SMS with a one-time code and picks the parcel up at the destination station.",
  },
];

const FEATURES = [
  { icon: MapPin, title: "Live tracking", text: "See where your parcel is at any time, using just its tracking number." },
  { icon: BellRing, title: "SMS updates", text: "Sender and receiver get a message when the parcel moves and when it arrives." },
  { icon: ShieldCheck, title: "Secure pickup", text: "Parcels are only released with the receiver's one-time code." },
  { icon: Clock, title: "Fast by rail", text: "The SGR keeps parcels on schedule between major cities." },
];

export default function LandingPage() {
  const router = useRouter();
  const inputRef = useRef<HTMLInputElement>(null);
  const [trackingNumber, setTrackingNumber] = useState("");
  const [loading, setLoading] = useState(false);
  const [recent, setRecent] = useState<string[]>([]);

  useEffect(() => {
    try {
      const saved = localStorage.getItem("mzg_recent_tracking");
      if (saved) setRecent(JSON.parse(saved).slice(0, 3));
    } catch {}
  }, []);

  const track = (id: string) => {
    const clean = id.trim().toUpperCase();
    if (!clean) {
      inputRef.current?.focus();
      return;
    }
    setLoading(true);
    const updated = [clean, ...recent.filter((r) => r !== clean)].slice(0, 3);
    try {
      localStorage.setItem("mzg_recent_tracking", JSON.stringify(updated));
    } catch {}
    setRecent(updated);
    router.push(`/track/${encodeURIComponent(clean)}`);
  };

  return (
    <div className="min-h-screen w-full bg-[#F3F3F3] text-[#1C1C1E]">
      {/* ── Hero ── */}
      <div className="fixed inset-x-0 top-3 z-50 px-3 text-white sm:top-4 sm:px-5">
        <nav className="relative z-10 mx-auto flex w-full max-w-6xl items-center justify-between rounded-full border border-white/15 bg-[#5C0B19]/80 py-2.5 pl-4 pr-2.5 shadow-[0_16px_40px_-20px_rgba(0,0,0,0.6)] backdrop-blur-xl sm:pl-6">
          <Link href="/" aria-label="MiziGO home" className="flex items-center">
            <span className="flex items-center gap-2.5">
              <Image src="/brand/logo_icon.png" alt="" width={40} height={40} className="h-10 w-10" priority />
              <Image src="/brand/logo_text.png" alt="MiziGO" width={110} height={34} className="h-7 w-auto" priority />
            </span>
          </Link>
          <div className="flex items-center gap-2 sm:gap-6">
            <a href="#how" className="hidden text-[15px] text-white/75 transition hover:text-white sm:block">
              How it works
            </a>
            <a href="#why" className="hidden text-[15px] text-white/75 transition hover:text-white sm:block">
              Why MiziGO
            </a>
            <Link
              href="/login"
              className="rounded-full bg-white/10 px-5 py-2.5 text-[14px] font-semibold backdrop-blur-md transition hover:bg-white/20"
            >
              Staff sign in
            </Link>
          </div>
        </nav>
      </div>
      <header className="relative overflow-hidden bg-gradient-to-br from-[#5C0B19] to-[#4F0A0C] text-white">
        <div className="pointer-events-none absolute inset-x-0 bottom-0 h-[55%] bg-bridge bg-cover bg-bottom opacity-30" />
        <div className="pointer-events-none absolute inset-0 bg-gradient-to-b from-transparent to-[#4F0A0C]/60" />
        <div className="pointer-events-none absolute -right-32 -top-32 h-96 w-96 rounded-full bg-orange-500/20 blur-[120px]" />


        <div className="relative z-10 mx-auto w-full max-w-6xl px-5 pb-28 pt-32 sm:px-8 md:pt-36 lg:pb-36">
          <div className="max-w-2xl">
            <h1 className="text-[40px] font-semibold leading-[1.08] tracking-tight sm:text-[54px]">
              Send parcels across Tanzania, <span className="text-orange-400">on rails.</span>
            </h1>
            <p className="mt-4 max-w-xl text-[17px] leading-relaxed text-white/75">
              Drop off at a station, follow every step of the journey, and collect safely with a one-time code.
            </p>

            <form
              onSubmit={(e) => {
                e.preventDefault();
                track(trackingNumber);
              }}
              className="relative mt-8 max-w-xl"
            >
              <Search size={18} className="pointer-events-none absolute left-5 top-1/2 -translate-y-1/2 text-white/50" />
              <input
                ref={inputRef}
                value={trackingNumber}
                onChange={(e) => setTrackingNumber(e.target.value.toUpperCase())}
                placeholder="Enter your tracking number"
                aria-label="Tracking number"
                className="h-16 w-full rounded-full border border-white/20 bg-white/10 pl-12 pr-40 text-[16px] font-medium tracking-wide text-white outline-none backdrop-blur-md transition placeholder:text-white/45 focus:border-orange-400 focus:ring-4 focus:ring-orange-500/20"
              />
              <button
                type="submit"
                disabled={loading}
                className="absolute bottom-2 right-2 top-2 flex items-center gap-2 rounded-full bg-orange-500 px-7 text-[15px] font-semibold text-white transition hover:bg-orange-600 active:scale-95 disabled:opacity-70"
              >
                {loading ? <Loader2 size={18} className="animate-spin" /> : <>Track <ArrowRight size={18} /></>}
              </button>
            </form>

            {recent.length > 0 && (
              <div className="mt-4 flex flex-wrap items-center gap-2">
                <span className="text-[13px] text-white/55">Recent:</span>
                {recent.map((id) => (
                  <button
                    key={id}
                    onClick={() => track(id)}
                    className="rounded-full border border-white/15 bg-white/10 px-3 py-1 text-[13px] font-medium tracking-wide transition hover:bg-white/20"
                  >
                    {id}
                  </button>
                ))}
              </div>
            )}
          </div>

        </div>
      </header>

      <main className="relative z-10 mx-auto -mt-16 w-full max-w-6xl px-5 sm:px-8">
        {/* ── How it works ── */}
        <section id="how" className="scroll-mt-8 rounded-[28px] border border-[#E2E2E2] bg-white p-6 sm:p-10">
          <h2 className="text-[28px] font-semibold tracking-tight">How it works</h2>
          <p className="mt-1 text-[16px] text-slate-500">Three steps from your hands to theirs.</p>
          <div className="mt-8 grid gap-5 md:grid-cols-3">
            {STEPS.map((s, i) => (
              <div key={s.title} className="relative rounded-[24px] bg-[#F7F5F4] p-6">
                <span className="absolute right-5 top-5 flex h-8 w-8 items-center justify-center rounded-full bg-orange-500 text-[14px] font-semibold text-white">
                  {i + 1}
                </span>
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img src={s.image} alt="" className="h-20 w-20 object-contain" />
                <h3 className="mt-4 text-[18px] font-semibold">{s.title}</h3>
                <p className="mt-1.5 text-[15px] leading-relaxed text-slate-500">{s.text}</p>
              </div>
            ))}
          </div>
        </section>

        {/* ── Why MiziGO ── */}
        <section id="why" className="scroll-mt-8 py-14">
          <h2 className="text-[28px] font-semibold tracking-tight">Why MiziGO</h2>
          <p className="mt-1 text-[16px] text-slate-500">Built for the people sending, carrying and collecting.</p>
          <div className="mt-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            {FEATURES.map((f) => (
              <div key={f.title} className="rounded-[24px] border border-[#E2E2E2] bg-white p-6">
                <span className="flex h-12 w-12 items-center justify-center rounded-2xl bg-orange-50">
                  <f.icon size={22} className="text-orange-500" />
                </span>
                <h3 className="mt-4 text-[17px] font-semibold">{f.title}</h3>
                <p className="mt-1.5 text-[14px] leading-relaxed text-slate-500">{f.text}</p>
              </div>
            ))}
          </div>
        </section>

        {/* ── CTA ── */}
        <section className="mb-14 flex flex-col items-start justify-between gap-6 rounded-[28px] bg-gradient-to-br from-[#F78A1F] to-[#D9620B] p-8 text-white sm:flex-row sm:items-center sm:p-10">
          <div>
            <h2 className="text-[26px] font-semibold leading-tight">Already sent something?</h2>
            <p className="mt-1 text-[16px] text-white/85">Enter the tracking number from your receipt or SMS.</p>
          </div>
          <button
            onClick={() => {
              window.scrollTo({ top: 0, behavior: "smooth" });
              setTimeout(() => inputRef.current?.focus(), 400);
            }}
            className="flex shrink-0 items-center gap-2 rounded-full bg-white px-7 py-3.5 text-[15px] font-semibold text-[#5C0B19] transition hover:bg-orange-50 active:scale-95"
          >
            Track a parcel <ArrowRight size={18} />
          </button>
        </section>
      </main>

      {/* ── Footer ── */}
      <SiteFooter />
    </div>
  );
}
