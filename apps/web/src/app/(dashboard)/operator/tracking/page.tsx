"use client";

import { useState, Suspense } from "react";
import {
  Search,
  Package,
  MapPin,
  Clock,
  CheckCircle2,
  Truck,
  SearchX,
  Loader2,
  ArrowRight,
  ShieldCheck,
  Building,
} from "lucide-react";
import { cn } from "@/lib/utils";
import api from "@/lib/api/client";
import { StatusBadge } from "@/components/shared/status-badge";
import { format } from "date-fns";

import { useSearchParams } from "next/navigation";
import { useEffect } from "react";

function TrackingPageInner() {
  const searchParams = useSearchParams();
  const initialQuery = searchParams.get("q") || "";
  const [query, setQuery] = useState(initialQuery);
  const [isSearching, setIsSearching] = useState(false);
  const [result, setResult] = useState<any>(null);
  const [error, setError] = useState(false);

  useEffect(() => {
    if (initialQuery) {
      performSearch(initialQuery);
    }
  }, [initialQuery]);

  const performSearch = async (trackingId: string) => {
    setIsSearching(true);
    setError(false);
    setResult(null);

    try {
      const { data } = await api.get(`/parcel/${trackingId}`);
      setResult(data.data);
    } catch (err) {
      setError(true);
    } finally {
      setIsSearching(false);
    }
  };

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault();
    if (!query) return;
    performSearch(query);
  };

  const timeline = result
    ? [
        {
          status: "CREATED",
          label: "Parcel Registered",
          time: result.createdAt,
          icon: Package,
          color: "bg-blue-500",
        },
        {
          status: "APPROVED",
          label: "Admin Approval",
          time: result.updatedAt,
          icon: ShieldCheck,
          color: "bg-emerald-500",
          isDone: ["APPROVED", "IN_TRANSIT", "DELIVERED"].includes(
            result.status,
          ),
        },
        {
          status: "IN_TRANSIT",
          label: "Dispatched from Station",
          time: result.updatedAt,
          icon: Truck,
          color: "bg-blue-600",
          isDone: ["IN_TRANSIT", "DELIVERED"].includes(result.status),
        },
        {
          status: "DELIVERED",
          label: "Handover Completed",
          time: result.updatedAt,
          icon: CheckCircle2,
          color: "bg-emerald-600",
          isDone: result.status === "DELIVERED",
        },
      ]
    : [];

  return (
    <div className="max-w-5xl mx-auto space-y-12 py-6 animate-in fade-in duration-500">
      {/* Search Header */}
      <div className="flex flex-col items-center text-center space-y-4">
        <div className="h-16 w-16 bg-blue-600 rounded-[10px] flex items-center justify-center text-white shadow-2xl shadow-blue-500/20 mb-2">
          <Search size={32} strokeWidth={3} />
        </div>
        <h1 className="text-4xl font-black text-slate-900 tracking-tight">
          Logistics Intelligence
        </h1>
        <p className="text-slate-500 font-medium max-w-md">
          Search any Tracking ID or Manifest number to retrieve real-time
          telemetry.
        </p>

        <form onSubmit={handleSearch} className="w-full max-w-xl relative mt-8">
          <input
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            className="w-full h-16 pl-8 pr-32 bg-white border border-slate-200 rounded-[10px] shadow-2xl shadow-slate-200/50 text-lg font-bold placeholder:text-slate-300 focus:outline-none focus:ring-4 focus:ring-blue-500/10 focus:border-blue-500 transition-all"
            placeholder="enter Parcel number"
          />
          <button
            disabled={isSearching}
            className="absolute right-2 top-2 bottom-2 px-8 bg-slate-900 text-white rounded-[10px] text-sm font-black shadow-lg hover:bg-slate-800 transition-all active:scale-95 flex items-center gap-2"
          >
            {isSearching ? (
              <Loader2 className="animate-spin h-4 w-4" />
            ) : (
              "Track"
            )}
          </button>
        </form>
      </div>

      {/* Results Rendering */}
      {result ? (
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 animate-in slide-in-from-bottom-8 duration-500">
          {/* Left: Summary Card */}
          <div className="lg:col-span-2 space-y-8">
            <div className="bg-white rounded-[10px] border border-slate-200 p-10 shadow-sm relative overflow-hidden">
              <div className="absolute top-0 right-0 p-10 opacity-5">
                <Package size={160} />
              </div>

              <div className="relative z-10 space-y-8">
                <div className="flex items-center justify-between">
                  <div className="flex flex-col">
                    <span className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em] mb-1">
                      Telemetry ID
                    </span>
                    <span className="text-2xl font-black text-blue-600 font-mono tracking-tighter">
                      #{result.id.slice(-12).toUpperCase()}
                    </span>
                  </div>
                  <StatusBadge status={result.status} className="h-8 px-4" />
                </div>

                <div className="grid grid-cols-2 gap-12 border-t border-slate-50 pt-8">
                  <div className="space-y-1">
                    <span className="text-[10px] font-extrabold text-slate-400 uppercase tracking-widest">
                      Origin Terminal
                    </span>
                    <div className="flex items-center gap-2">
                      <MapPin size={16} className="text-blue-500" />
                      <span className="text-base font-bold text-slate-800">
                        {result.fromAddress}
                      </span>
                    </div>
                  </div>
                  <div className="space-y-1">
                    <span className="text-[10px] font-extrabold text-slate-400 uppercase tracking-widest">
                      Target Terminal
                    </span>
                    <div className="flex items-center gap-2">
                      <MapPin size={16} className="text-emerald-500" />
                      <span className="text-base font-bold text-slate-800">
                        {result.toAddress}
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            {/* Package Details */}
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
              {[
                { label: "Weight", value: `${result.weight}kg`, icon: Clock },
                { label: "Service", value: result.serviceType, icon: Building },
                { label: "Urgency", value: result.urgency, icon: Truck },
                {
                  label: "Paid",
                  value: result.isPaid ? "Yes" : "No",
                  icon: ShieldCheck,
                },
              ].map((d, i) => (
                <div
                  key={i}
                  className="p-4 bg-white border border-slate-200 rounded-[10px] flex flex-col gap-1"
                >
                  <span className="text-[9px] font-extrabold text-slate-400 uppercase tracking-wider">
                    {d.label}
                  </span>
                  <span className="text-sm font-black text-slate-800">
                    {d.value}
                  </span>
                </div>
              ))}
            </div>
          </div>

          {/* Right: Timeline */}
          <div className="bg-slate-900 rounded-[10px] p-10 text-white shadow-2xl relative overflow-hidden min-h-[500px]">
            <div className="absolute top-[-100px] right-[-100px] w-64 h-64 bg-blue-500/10 rounded-full blur-[80px]" />

            <div className="relative z-10 space-y-10">
              <h4 className="text-xl font-black tracking-tight border-b border-white/10 pb-6">
                Lifecycle Events
              </h4>

              <div className="space-y-10 relative">
                <div className="absolute left-[13px] top-2 bottom-2 w-0.5 bg-white/10 rounded-full" />

                {timeline.map((event, i) => (
                  <div
                    key={i}
                    className={cn(
                      "flex gap-6 relative transition-opacity duration-500",
                      !event.isDone && i !== 0 ? "opacity-30" : "opacity-100",
                    )}
                  >
                    <div
                      className={cn(
                        "h-7 w-7 rounded-full flex items-center justify-center shrink-0 z-10 border-4 border-slate-900",
                        event.isDone || i === 0 ? event.color : "bg-slate-800",
                      )}
                    >
                      <event.icon
                        size={11}
                        className="text-white"
                        strokeWidth={3}
                      />
                    </div>
                    <div className="flex flex-col">
                      <span className="text-sm font-bold text-white">
                        {event.label}
                      </span>
                      <span className="text-[10px] font-bold text-slate-500 mt-0.5 uppercase tracking-wider">
                        {event.isDone || i === 0
                          ? format(new Date(event.time), "MMM dd, HH:mm")
                          : "In Progress"}
                      </span>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      ) : error ? (
        <div className="py-20 text-center animate-in fade-in duration-300">
          <div className="h-20 w-20 bg-rose-50 rounded-full flex items-center justify-center mx-auto mb-6">
            <SearchX size={32} className="text-rose-500" />
          </div>
          <h3 className="text-xl font-bold text-slate-900">
            Telemetry Out of Range
          </h3>
          <p className="text-slate-400 font-medium max-w-xs mx-auto mt-2">
            The Tracking ID provided was not found in our global operational
            node database.
          </p>
        </div>
      ) : (
        <div className="py-32 text-center opacity-20 hidden md:block">
          <Package size={200} className="mx-auto text-slate-400" />
        </div>
      )}
    </div>
  );
}

export default function TrackingPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">
          Loading page...
        </div>
      }
    >
      <TrackingPageInner />
    </Suspense>
  );
}
