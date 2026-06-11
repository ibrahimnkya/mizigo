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

// --- Animated counter hook ---
function useCountUp(target: number, duration = 1200): number {
  const [value, setValue] = useState(0);
  useEffect(() => {
    if (!target) return;
    const steps = 40;
    const increment = target / steps;
    let current = 0;
    const timer = setInterval(() => {
      current += increment;
      if (current >= target) {
        setValue(target);
        clearInterval(timer);
      } else {
        setValue(Math.floor(current));
      }
    }, duration / steps);
    return () => clearInterval(timer);
  }, [target, duration]);
  return value;
}

// --- Sparkline SVG ---
function Sparkline({ color = "#10b981", seed = 0 }: { color?: string; seed?: number }) {
  const basePoints = [30, 55, 40, 70, 52, 80, 65, 90, 72, 95];
  const points = basePoints.map((p, i) => {
    const shift = Math.sin(seed + i) * 8;
    return Math.max(10, Math.min(100, p + shift));
  });
  const h = 48, w = 120;
  const max = Math.max(...points), min = Math.min(...points);
  const coords: [number, number][] = points.map((p, i) => [
    (i / (points.length - 1)) * w,
    h - ((p - min) / (max - min)) * (h - 4) - 2,
  ]);
  const path = coords.map(([x, y], i) => `${i === 0 ? "M" : "L"}${x.toFixed(1)},${y.toFixed(1)}`).join(" ");
  const fill = path + ` L${w},${h} L0,${h} Z`;
  const gradId = `spark-${color.replace("#", "")}-${seed}`;

  return (
    <svg viewBox={`0 0 ${w} ${h}`} className="w-full h-12" preserveAspectRatio="none">
      <defs>
        <linearGradient id={gradId} x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stopColor={color} stopOpacity="0.2" />
          <stop offset="100%" stopColor={color} stopOpacity="0" />
        </linearGradient>
      </defs>
      <path d={fill} fill={`url(#${gradId})`} />
      <path d={path} fill="none" stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" />
    </svg>
  );
}

// --- Helper to parse numeric value ---
const parseNumeric = (val: string | number): number | null => {
  if (typeof val === "number") return val;
  const cleaned = val.replace(/,/g, "").trim();
  const parsed = Number(cleaned);
  return isNaN(parsed) ? null : parsed;
};

// --- Helper to map iconColor / text class to Hex ---
const getSparkColor = (colorClass: string) => {
  if (colorClass.includes("blue")) return "#3b82f6";
  if (colorClass.includes("emerald")) return "#10b981";
  if (colorClass.includes("indigo")) return "#6366f1";
  if (colorClass.includes("amber")) return "#f59e0b";
  if (colorClass.includes("orange")) return "#f97316";
  if (colorClass.includes("violet")) return "#8b5cf6";
  if (colorClass.includes("cyan")) return "#06b6d4";
  if (colorClass.includes("rose")) return "#f43f5e";
  return "#94a3b8"; // default slate
};

// --- Custom ReportCard Component ---
function ReportCard({ report, seed, delay = 0 }: { report: ReportCardData; seed: number; delay?: number }) {
  const Icon = ICON_MAP[report.iconName] || FileBarChart2;
  const primaryStat = report.snapshot[0];
  const primaryValue = primaryStat ? primaryStat.value : "";
  const numeric = parseNumeric(primaryValue);
  const counted = useCountUp(numeric ?? 0, 1000);
  const isNumeric = numeric !== null;

  const sparkColor = getSparkColor(report.iconColor);
  const secondaryStats = report.snapshot.slice(1);

  return (
    <div
      className={cn(
        "group bg-white rounded-2xl border border-slate-100 p-5 flex flex-col justify-between hover:shadow-lg hover:border-slate-200 hover:-translate-y-0.5 transition-all duration-300 cursor-pointer h-full relative"
      )}
      style={{ animationDelay: `${delay}ms` }}
    >
      {/* Top Row */}
      <div className="flex items-start justify-between">
        <div className={cn("w-9 h-9 rounded-xl flex items-center justify-center transition-all duration-300 group-hover:scale-110", report.iconBg, report.iconColor)}>
          <Icon size={16} strokeWidth={2.5} />
        </div>
        <span className={cn("text-[9px] font-bold uppercase tracking-[0.18em] px-2.5 py-1.5 rounded-md border", report.tagBg, report.tagColor)}>
          {report.tag}
        </span>
      </div>

      {/* Main Content */}
      <div className="mt-4 flex-1 flex flex-col justify-between">
        <div>
          {/* Primary value */}
          <p className={cn("text-3xl font-black tracking-tight leading-none tabular-nums", report.iconColor)}>
            {isNumeric ? counted.toLocaleString() : primaryValue}
          </p>
          
          {/* Title & Description */}
          <h3 className="text-[14px] font-black text-slate-800 tracking-tight mt-2.5 group-hover:text-blue-600 transition-colors">
            {report.title}
          </h3>
          <p className="text-[11px] font-medium text-slate-400 mt-1 leading-normal line-clamp-2">
            {report.description}
          </p>
        </div>

        {/* Sparkline & Snapshot */}
        <div className="mt-4 space-y-3">
          {/* Sparkline */}
          <div className="opacity-50 group-hover:opacity-100 transition-opacity duration-300">
            <Sparkline color={sparkColor} seed={seed} />
          </div>

          {/* Secondary stats */}
          {secondaryStats.length > 0 && (
            <div className="grid grid-cols-2 gap-2 pt-2.5 border-t border-slate-50">
              {secondaryStats.map((stat) => (
                <div key={stat.label} className="flex flex-col">
                  <span className="text-[8px] font-bold text-slate-400 uppercase tracking-widest">{stat.label}</span>
                  <span className="text-[11px] font-black text-slate-700 mt-0.5">{stat.value}</span>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>

      {/* Footer */}
      <div className="mt-4 pt-3 border-t border-slate-50 flex items-center justify-between">
        <div className={cn("flex items-center gap-1.5 text-[9.5px] font-black uppercase tracking-widest transition-all group-hover:gap-2", report.ctaColor)}>
          View Report <ArrowUpRight size={11} strokeWidth={3} />
        </div>
        <div className="w-5 h-5 rounded-full bg-slate-50 flex items-center justify-center group-hover:bg-slate-100 transition-colors">
          <div className={cn("w-1.5 h-1.5 rounded-full opacity-20 group-hover:opacity-100 transition-all", report.accentBar)} />
        </div>
      </div>
    </div>
  );
}

const PRESETS = [
  {
    label: "7 Days",
    getValue: () => ({ from: subDays(new Date(), 7), to: new Date() }),
  },
  {
    label: "30 Days",
    getValue: () => ({ from: subDays(new Date(), 30), to: new Date() }),
  },
  {
    label: "This Month",
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
              {filtered.map((report, i) => (
                <Link
                  key={report.title}
                  href={report.href}
                  className="group animate-in fade-in zoom-in-95 duration-500"
                >
                  <ReportCard report={report} seed={i} delay={i * 60} />
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
