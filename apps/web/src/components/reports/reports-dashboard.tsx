"use client";

import Link from "next/link";
import { useState, useEffect } from "react";
import {
  TrendingUp,
  Package2,
  Timer,
  ArrowUpRight,
  MapPin,
  Users,
  Building2,
  FileBarChart2,
  Search,
  X,
  Calendar as CalendarIcon,
  Activity,
  Shield,
  Database,
  ArrowRight,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { Calendar } from "@/components/ui/calendar";
import { format, subDays, startOfMonth } from "date-fns";
import { DateRange } from "react-day-picker";
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover";

const ICON_MAP: Record<string, any> = {
  MapPin: MapPin,
  Users: Users,
  Package2: Package2,
  TrendingUp: TrendingUp,
  Building2: Building2,
  Timer: Timer,
};

interface ReportStat {
  label: string;
  value: string;
}

interface ReportCardData {
  title: string;
  description: string;
  href: string;
  iconName: string;
  tag: string;
  gradient: string;
  iconBg: string;
  iconColor: string;
  tagBg: string;
  tagColor: string;
  accentBar: string;
  descColor: string;
  ctaColor: string;
  borderColor: string;
  snapColor: string;
  snapMuted: string;
  snapBorder: string;
  snapshot: ReportStat[];
  titleColor: string;
}

const PRESETS = [
  {
    label: "7D",
    getValue: () => ({ from: subDays(new Date(), 7), to: new Date() }),
  },
  {
    label: "30D",
    getValue: () => ({ from: subDays(new Date(), 30), to: new Date() }),
  },
  {
    label: "MTD",
    getValue: () => ({ from: startOfMonth(new Date()), to: new Date() }),
  },
];

export function ReportsDashboard({
  initialData,
}: {
  initialData: ReportCardData[];
}) {
  const [query, setQuery] = useState("");
  const [dateRange, setDateRange] = useState<DateRange | undefined>();
  const [isCalendarOpen, setIsCalendarOpen] = useState(false);
  const [isClient, setIsClient] = useState(false);

  useEffect(() => {
    setIsClient(true);
    setDateRange({ from: subDays(new Date(), 30), to: new Date() });
  }, []);

  const filtered = initialData.filter(
    (r) =>
      r.title.toLowerCase().includes(query.toLowerCase()) ||
      r.tag.toLowerCase().includes(query.toLowerCase()) ||
      r.description.toLowerCase().includes(query.toLowerCase()),
  );

  if (!isClient) return null;

  return (
    <div className="h-screen bg-[#f8f9fb] flex flex-col overflow-hidden">
      <div className="max-w-[1520px] w-full mx-auto px-6 lg:px-10 pt-2 pb-3 flex flex-col gap-4 h-full overflow-hidden">
        {/* Top Bar - Restored Premium Dark Bluish Background */}
        <div className="relative flex items-center gap-4 bg-[#0f172a] rounded-[12px] px-6 py-5 shadow-2xl flex-shrink-0 overflow-hidden">
          {/* Background Pattern */}
          <div className="absolute inset-0 opacity-10 pointer-events-none">
            <div className="absolute -right-20 -top-20 w-80 h-80 bg-blue-500 rounded-full blur-[100px]" />
            <div className="absolute -left-20 -bottom-20 w-60 h-60 bg-indigo-500 rounded-full blur-[80px]" />
            <div className="absolute top-0 left-0 w-full h-full bg-[radial-gradient(circle_at_2px_2px,rgba(255,255,255,0.05)_1px,transparent_0)] bg-[length:24px_24px]" />
          </div>

          {/* Brand/Title */}
          <div className="relative z-10 flex items-center gap-3.5 flex-shrink-0">
            <div className="w-10 h-10 rounded-[12px] bg-blue-600/20 border border-blue-500/20 flex items-center justify-center flex-shrink-0 backdrop-blur-md">
              <FileBarChart2 size={18} className="text-blue-400" />
            </div>
            <div>
              <p className="text-[12px] font-black uppercase tracking-[0.35em] text-white leading-none">
                Reports Suite
              </p>
              <p className="text-[9px] text-blue-400/60 font-bold mt-1.5 uppercase tracking-[0.15em]">
                Your Go-To Place For All Data & Analytics
              </p>
            </div>
          </div>

          <div className="relative z-10 h-8 w-px bg-white/10 mx-3 flex-shrink-0" />

          {/* Standardized Date Picker - Reused from ReportPageHeader */}
          <div className="relative z-10">
            <Popover open={isCalendarOpen} onOpenChange={setIsCalendarOpen}>
              <PopoverTrigger asChild>
                <button className="flex items-center gap-2.5 h-10 bg-white/5 border border-white/10 rounded-[10px] px-4 hover:bg-white/10 transition-all active:scale-95 group">
                  <CalendarIcon
                    size={13}
                    className="text-blue-400 flex-shrink-0"
                  />
                  <span className="text-[11px] font-bold text-white tabular-nums tracking-tight leading-none whitespace-nowrap">
                    {dateRange?.from
                      ? format(dateRange.from, "MMM d")
                      : "Start"}
                    {dateRange?.to
                      ? ` – ${format(dateRange.to, "MMM d, yyyy")}`
                      : ""}
                  </span>
                </button>
              </PopoverTrigger>

              <PopoverContent
                align="start"
                sideOffset={10}
                className="p-0 w-auto border border-slate-100 shadow-2xl shadow-black/10 rounded-[16px] bg-white overflow-hidden"
              >
                {/* Preset strip */}
                <div className="flex items-center gap-1.5 px-3 pt-3 pb-2 border-b border-slate-50">
                  <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest mr-1">
                    Quick
                  </span>
                  {PRESETS.map((p) => (
                    <button
                      key={p.label}
                      onClick={() => setDateRange(p.getValue())}
                      className="px-2.5 py-1 rounded-full text-[9px] font-black uppercase tracking-widest border border-slate-200 text-slate-500 hover:bg-slate-900 hover:text-white hover:border-slate-900 transition-all"
                    >
                      {p.label}
                    </button>
                  ))}
                </div>

                {/* Calendar */}
                <div className="px-2 py-2">
                  <Calendar
                    mode="range"
                    defaultMonth={dateRange?.from}
                    selected={dateRange}
                    onSelect={setDateRange}
                    numberOfMonths={2}
                    className="p-0"
                  />
                </div>

                {/* Footer */}
                <div className="flex items-center justify-between px-4 py-2.5 border-t border-slate-50 bg-slate-50/40">
                  <span className="text-[9px] text-slate-300 font-bold uppercase tracking-widest">
                    {dateRange?.from && dateRange?.to
                      ? `${format(dateRange.from, "MMM d")} → ${format(dateRange.to, "MMM d, yyyy")}`
                      : "Select a range"}
                  </span>
                  <button
                    onClick={() => setIsCalendarOpen(false)}
                    className="h-7 px-4 bg-slate-900 text-white rounded-[8px] text-[9px] font-black uppercase tracking-widest hover:bg-blue-600 transition-all active:scale-95"
                  >
                    Apply
                  </button>
                </div>
              </PopoverContent>
            </Popover>
          </div>

          <div className="relative z-10 h-8 w-px bg-white/10 mx-3 flex-shrink-0" />

          {/* Search */}
          <div className="relative z-10 flex-1 min-w-0 group">
            <Search
              size={14}
              className="absolute left-4 top-1/2 -translate-y-1/2 text-white/30 group-focus-within:text-blue-400 transition-colors"
            />
            <input
              type="text"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              placeholder="Search reports..."
              className="w-full bg-white/5 border border-white/10 rounded-[10px] pl-11 pr-8 py-3 text-[13px] font-medium text-white placeholder:text-white/20 focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500/30 transition-all backdrop-blur-sm"
            />
            {query && (
              <button
                onClick={() => setQuery("")}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-white/30 hover:text-white transition-colors"
              >
                <X size={14} />
              </button>
            )}
          </div>
        </div>

        {/* Search Results Summary (Visible when searching) */}
        {query && (
          <div className="flex items-center justify-between px-2 flex-shrink-0 animate-in fade-in slide-in-from-top-2 duration-300">
            <div className="flex items-center gap-2">
              <Database size={12} className="text-slate-400" />
              <p className="text-[11px] font-black text-slate-500 uppercase tracking-widest">
                Search Results:{" "}
                <span className="text-blue-600 ml-1">
                  {filtered.length} matches found
                </span>
              </p>
            </div>
            <button
              onClick={() => setQuery("")}
              className="text-[10px] font-black text-blue-600 uppercase tracking-widest hover:underline flex items-center gap-1"
            >
              Clear Search <X size={10} />
            </button>
          </div>
        )}

        {/* Reports Grid - Reduced Height and Scrollable */}
        <div className="flex-1 overflow-y-auto pr-1 -mr-1 custom-scrollbar">
          {filtered.length > 0 ? (
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3 pb-6">
              {filtered.map((report) => (
                <Link
                  key={report.title}
                  href={report.href}
                  className="group animate-in fade-in zoom-in-95 duration-500"
                >
                  <div
                    className={`relative bg-white rounded-[12px] border ${report.borderColor} px-6 py-6 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 overflow-hidden flex flex-col`}
                  >
                    {(() => {
                      const Icon = ICON_MAP[report.iconName] || FileBarChart2;
                      return (
                        <>
                          {/* Large background watermark icon - Faded Look */}
                          <Icon
                            size={140}
                            className="absolute -bottom-8 -right-8 text-slate-50 opacity-40 pointer-events-none group-hover:scale-110 group-hover:text-slate-100 transition-all duration-500"
                            strokeWidth={0.5}
                          />

                          {/* Top accent line - Faded/Elegant */}
                          <div
                            className={`absolute top-0 left-0 w-full h-[3px] ${report.accentBar} opacity-10 group-hover:opacity-40 transition-opacity`}
                          />

                          {/* Header row: icon + tag */}
                          <div className="flex items-center justify-between relative z-10">
                            <div
                              className={`w-10 h-10 rounded-[10px] flex items-center justify-center ${report.iconBg} ${report.iconColor} flex-shrink-0 transition-all duration-300 group-hover:scale-110 group-hover:shadow-lg group-hover:shadow-current/5`}
                            >
                              <Icon size={18} strokeWidth={2.5} />
                            </div>
                            <span
                              className={`text-[10px] font-black uppercase tracking-[0.2em] px-3 py-1.5 rounded-[8px] ${report.tagBg} ${report.tagColor} border border-current/10 shadow-sm`}
                            >
                              {report.tag}
                            </span>
                          </div>
                        </>
                      );
                    })()}

                    {/* Title + description */}
                    <div className="mt-6 relative z-10">
                      <h3
                        className={`text-[18px] font-black ${report.titleColor} mb-1 tracking-tight group-hover:text-blue-600 transition-colors`}
                      >
                        {report.title}
                      </h3>
                      <p
                        className={`text-[12px] font-medium leading-relaxed ${report.descColor} line-clamp-2`}
                      >
                        {report.description}
                      </p>
                    </div>

                    {/* Snapshot metrics - Muted Design */}
                    <div
                      className={`grid grid-cols-3 gap-2 mt-6 pt-6 border-t ${report.snapBorder} relative z-10`}
                    >
                      {report.snapshot.map((snap) => (
                        <div key={snap.label} className="flex flex-col gap-0.5">
                          <p
                            className={`text-[9px] font-black uppercase tracking-wider leading-none ${report.snapMuted}`}
                          >
                            {snap.label}
                          </p>
                          <p
                            className={`text-[14px] font-black leading-none ${report.snapColor}`}
                          >
                            {snap.value}
                          </p>
                        </div>
                      ))}
                    </div>

                    {/* CTA - Professional Look */}
                    <div
                      className={`flex items-center justify-between pt-6 mt-4 border-t ${report.snapBorder} relative z-10`}
                    >
                      <div
                        className={`flex items-center gap-1.5 text-[11px] font-black uppercase tracking-widest ${report.ctaColor} transition-all group-hover:gap-2.5`}
                      >
                        View Report <ArrowUpRight size={12} strokeWidth={3} />
                      </div>
                      <div
                        className={`w-6 h-6 rounded-full bg-slate-50 flex items-center justify-center group-hover:${report.iconBg} transition-colors`}
                      >
                        <div
                          className={`w-1.5 h-1.5 rounded-full ${report.accentBar} opacity-20 group-hover:opacity-100 group-hover:animate-pulse transition-all`}
                        />
                      </div>
                    </div>
                  </div>
                </Link>
              ))}
            </div>
          ) : (
            /* Premium Empty State / No Results Found */
            <div className="flex flex-col items-center justify-center w-full min-h-[400px] py-20 text-center animate-in fade-in zoom-in-95 duration-700">
              <div className="relative mb-8">
                <div className="absolute inset-0 bg-blue-500/5 blur-[50px] animate-pulse rounded-full" />
                <div className="w-24 h-24 rounded-[24px] bg-white border border-slate-100 flex items-center justify-center shadow-2xl relative z-10 group">
                  <div className="absolute inset-0 bg-slate-50 rounded-[24px] scale-90 group-hover:scale-100 transition-transform" />
                  <Search
                    size={40}
                    className="text-slate-200 relative z-10 group-hover:text-blue-500 transition-colors duration-500"
                    strokeWidth={1}
                  />
                  <div className="absolute -top-1 -right-1 w-4 h-4 bg-rose-500 rounded-full border-4 border-white animate-bounce" />
                </div>
                <div className="absolute -bottom-4 left-1/2 -translate-x-1/2 w-32 h-1 bg-slate-100 rounded-full overflow-hidden">
                  <div className="w-full h-full bg-blue-500/20 animate-[scanning_2s_ease-in-out_infinite]" />
                </div>
              </div>

              <div className="space-y-3 max-w-[400px]">
                <h3 className="text-[24px] font-black text-slate-900 tracking-tight uppercase leading-none">
                  No Results
                </h3>
                <p className="text-[14px] text-slate-400 font-medium leading-relaxed">
                  No reports matched your search for{" "}
                  <span className="text-slate-900 font-bold">"{query}"</span>.
                  Please try a different term.
                </p>
              </div>

              <div className="mt-10 grid grid-cols-2 gap-4 w-full max-w-[440px]">
                <div className="p-4 bg-white border border-slate-100 rounded-[12px] text-left">
                  <Shield size={16} className="text-blue-500 mb-2" />
                  <p className="text-[10px] font-black text-slate-900 uppercase tracking-widest">
                    Check Spelling
                  </p>
                  <p className="text-[10px] text-slate-400 font-bold mt-1 uppercase tracking-tighter">
                    Ensure report names are correct
                  </p>
                </div>
                <div className="p-4 bg-white border border-slate-100 rounded-[12px] text-left">
                  <Activity size={16} className="text-emerald-500 mb-2" />
                  <p className="text-[10px] font-black text-slate-900 uppercase tracking-widest">
                    Broaden Search
                  </p>
                  <p className="text-[10px] text-slate-400 font-bold mt-1 uppercase tracking-tighter">
                    Try simpler keywords
                  </p>
                </div>
              </div>

              <button
                onClick={() => setQuery("")}
                className="mt-10 h-12 px-8 bg-slate-900 text-white rounded-[12px] font-black text-[12px] uppercase tracking-widest shadow-xl shadow-slate-900/20 hover:bg-blue-600 transition-all active:scale-95 flex items-center gap-2"
              >
                <X size={16} strokeWidth={3} /> Reset Search
              </button>
            </div>
          )}
        </div>
      </div>

      {/* Custom Animations & Styles */}
      <style jsx global>{`
        @keyframes scanning {
          0% {
            transform: translateX(-100%);
          }
          50% {
            transform: translateX(100%);
          }
          100% {
            transform: translateX(-100%);
          }
        }
        .custom-scrollbar::-webkit-scrollbar {
          width: 4px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
          background: transparent;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
          background: #e2e8f0;
          border-radius: 10px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover {
          background: #cbd5e1;
        }
      `}</style>
    </div>
  );
}
