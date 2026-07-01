"use client";

import {
  ArrowLeft,
  Calendar as CalendarIcon,
  Download,
  Search,
  X,
  FileBarChart2,
  TrendingUp,
  Timer,
  Package,
  Package2,
  MapPin,
  Users,
  Building2,
  Inbox,
  LogOut,
  TrainFront,
  CheckCircle2,
  XCircle,
  AlertTriangle,
  ShieldCheck,
  FileBox,
  CreditCard,
  type LucideIcon,
} from "lucide-react";
import { useState, useEffect, Suspense } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import { cn } from "@/lib/utils";
import { PDFDownloadLink } from "@react-pdf/renderer";
import { ReportPDF } from "./report-pdf";
import { Calendar } from "@/components/ui/calendar";
import { format, subDays, startOfMonth } from "date-fns";
import { DateRange } from "react-day-picker";
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover";

const ICON_MAP: Record<string, LucideIcon> = {
  FileBarChart2,
  TrendingUp,
  Timer,
  Package,
  Package2,
  MapPin,
  Users,
  Building2,
  Inbox,
  LogOut,
  TrainFront,
  Truck: TrainFront,
  CheckCircle2,
  XCircle,
  AlertTriangle,
  ShieldCheck,
  FileBox,
  CreditCard,
};

interface ReportPageHeaderProps {
  title: string;
  subtitle: string;
  icon?: any;
  iconName?: string;
  onSearch?: (query: string) => void;
  pdfData?: any[];
  pdfColumns?: { header: string; key: string }[];
  hideBackArrow?: boolean;
  action?: React.ReactNode;
  tabs?: string[];
  activeTab?: string;
  tabParamName?: string;
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

function ReportPageHeaderInner({
  title,
  subtitle,
  icon,
  iconName,
  onSearch,
  pdfData,
  pdfColumns,
  hideBackArrow,
  action,
  tabs,
  activeTab,
  tabParamName,
}: ReportPageHeaderProps) {
  const Icon: LucideIcon =
    (iconName
      ? ICON_MAP[iconName]
      : typeof icon === "string"
        ? ICON_MAP[icon]
        : icon) ?? FileBarChart2;
  const router = useRouter();
  const searchParams = useSearchParams();
  const [query, setQuery] = useState("");
  const [isSearchOpen, setIsSearchOpen] = useState(false);
  const [isClient, setIsClient] = useState(false);
  const [dateRange, setDateRange] = useState<DateRange | undefined>();
  const [open, setOpen] = useState(false);

  useEffect(() => {
    setIsClient(true);
    setDateRange({ from: subDays(new Date(), 30), to: new Date() });
  }, []);

  const handleSearchSubmit = (val: string) => {
    setQuery(val);
    onSearch?.(val);
  };

  if (!isClient) {
    return (
      <div className="h-[92px] bg-[#0f172a] rounded-[12px] animate-pulse mb-8" />
    );
  }

  return (
    <>
      <div className="relative flex flex-col bg-[#0f172a] rounded-[12px] shadow-2xl flex-shrink-0 overflow-hidden mb-8">
        {/* Ambient glows */}
        <div className="absolute inset-0 opacity-10 pointer-events-none">
          <div className="absolute -right-20 -top-20 w-80 h-80 bg-blue-500 rounded-full blur-[100px]" />
          <div className="absolute -left-20 -bottom-20 w-60 h-60 bg-blue-500 rounded-full blur-[80px]" />
        </div>

        <div className="relative z-10 flex flex-col md:flex-row md:items-center gap-4 px-6 py-5 w-full">
          {/* Title */}
          <div className="relative z-10 flex items-center gap-3.5 flex-shrink-0 w-full md:w-auto md:mr-auto">
            <div className="w-10 h-10 rounded-[12px] bg-blue-600/20 border border-blue-500/20 flex items-center justify-center flex-shrink-0 backdrop-blur-md">
              <Icon size={18} className="text-blue-400" />
            </div>
            <div className="text-left">
              <p className="text-[12px] font-black uppercase tracking-[0.35em] text-white leading-none">
                {title}
              </p>
              <p className="text-[10px] text-blue-400/60 font-bold mt-1.5 uppercase tracking-widest">
                {subtitle}
              </p>
            </div>
          </div>

          {/* Controls Group */}
          <div className="relative z-10 flex flex-wrap items-center gap-3 w-full md:w-auto justify-start md:justify-end">
            {/* ── Compact Date Picker ── */}
            <div className="relative z-10">
              <Popover open={open} onOpenChange={setOpen}>
                <PopoverTrigger asChild>
                  <button className="flex items-center gap-2.5 h-10 bg-white/5 border border-white/10 rounded-[10px] px-3 hover:bg-white/10 transition-all active:scale-95 group">
                    <CalendarIcon
                      size={13}
                      className="text-blue-400 flex-shrink-0"
                    />
                    <span className="text-[11px] font-bold text-white tabular-nums tracking-tight leading-none">
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
                  align="end"
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
                      onClick={() => setOpen(false)}
                      className="h-7 px-4 bg-slate-900 text-white rounded-[8px] text-[9px] font-black uppercase tracking-widest hover:bg-blue-600 transition-all active:scale-95"
                    >
                      Apply
                    </button>
                  </div>
                </PopoverContent>
              </Popover>
            </div>

            <div className="hidden md:block relative z-10 h-8 w-px bg-white/10 mx-1 flex-shrink-0" />

            {/* Search */}
            <button
              onClick={() => setIsSearchOpen(true)}
              className="relative z-10 w-10 h-10 rounded-[10px] bg-white/5 border border-white/10 flex items-center justify-center text-white hover:bg-white/10 transition-all active:scale-95 flex-shrink-0 group"
            >
              <Search
                size={18}
                className="group-hover:text-blue-400 transition-colors"
              />
            </button>

            {/* Action/Export */}
            {action ? (
              action
            ) : pdfData && pdfColumns ? (
              <PDFDownloadLink
                document={
                  <ReportPDF
                    title={title}
                    subtitle={subtitle}
                    data={pdfData}
                    columns={pdfColumns}
                  />
                }
                fileName={`${title.toLowerCase().replace(/\s+/g, "-")}-report.pdf`}
              >
                {({ loading }) => (
                  <button
                    disabled={loading}
                    className="relative z-10 bg-blue-600 hover:bg-blue-500 text-white h-10 px-6 rounded-[10px] font-black text-[11px] uppercase tracking-widest shadow-xl shadow-blue-600/20 transition-all active:scale-95 flex items-center gap-2 flex-shrink-0 disabled:opacity-50"
                  >
                    {loading ? (
                      <div className="w-3.5 h-3.5 rounded-full border-2 border-white/20 border-t-white animate-spin" />
                    ) : (
                      <Download size={14} strokeWidth={2.5} />
                    )}
                    {loading ? "Preparing…" : "Export PDF"}
                  </button>
                )}
              </PDFDownloadLink>
            ) : null}
          </div>
        </div>

        {tabs && tabs.length > 0 && (
          <div className="relative z-10 w-full flex items-center gap-2 bg-slate-900/60 border-t border-white/5 px-6 py-3 overflow-x-auto scrollbar-none whitespace-nowrap">
            {tabs.map((t) => {
              const currentTab =
                activeTab ||
                (tabParamName ? searchParams.get(tabParamName) : null) ||
                tabs[0];
              const isActive = t.toLowerCase() === currentTab?.toLowerCase();
              return (
                <button
                  key={t}
                  onClick={() => {
                    if (!tabParamName) return;
                    const params = new URLSearchParams(searchParams.toString());
                    params.set(tabParamName, t.toLowerCase());
                    router.push(`?${params.toString()}`, { scroll: false });
                  }}
                  className={cn(
                    "flex-1 px-4 py-2 text-[11px] font-bold rounded-[8px] uppercase tracking-widest transition-all whitespace-nowrap shrink-0",
                    isActive
                      ? "bg-blue-600 text-white shadow-lg shadow-blue-600/20"
                      : "text-slate-400 hover:text-white hover:bg-white/5",
                  )}
                >
                  {t}
                </button>
              );
            })}
          </div>
        )}
      </div>

      {/* Search Modal */}
      {isSearchOpen && (
        <div className="fixed inset-0 z-[200] flex items-start justify-center pt-[15vh] px-4">
          <div
            className="absolute inset-0 backdrop-blur-md bg-slate-950/40 animate-in fade-in duration-300"
            onClick={() => setIsSearchOpen(false)}
          />
          <div className="relative w-full max-w-2xl bg-white rounded-[16px] shadow-2xl shadow-black/20 overflow-hidden animate-in zoom-in-95 slide-in-from-top-4 duration-300">
            <div className="p-2 border-b border-slate-100 flex items-center gap-3">
              <div className="w-10 h-10 rounded-full flex items-center justify-center text-slate-400">
                <Search size={20} />
              </div>
              <input
                autoFocus
                type="text"
                value={query}
                onChange={(e) => handleSearchSubmit(e.target.value)}
                placeholder="Search..."
                className="flex-1 bg-transparent border-none outline-none text-[15px] font-bold text-slate-900 placeholder:text-slate-300 py-4"
              />
              <button
                onClick={() => setIsSearchOpen(false)}
                className="w-10 h-10 rounded-[10px] hover:bg-slate-50 flex items-center justify-center text-slate-400 transition-colors"
              >
                <X size={18} />
              </button>
            </div>
            <div className="p-4 bg-slate-50">
              <div className="flex items-center justify-between">
                <p className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                  Search {title}
                </p>
                <span className="px-1.5 py-0.5 rounded bg-slate-200 text-[9px] font-bold text-slate-500">
                  ESC to close
                </span>
              </div>
            </div>
          </div>
        </div>
      )}
    </>
  );
}

export function ReportPageHeader(props: ReportPageHeaderProps) {
  return (
    <Suspense
      fallback={
        <div className="h-[92px] bg-[#0f172a] rounded-[12px] animate-pulse mb-8" />
      }
    >
      <ReportPageHeaderInner {...props} />
    </Suspense>
  );
}
