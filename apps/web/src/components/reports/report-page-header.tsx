"use client";

import {
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
  FileSpreadsheet,
  FileText,
  ChevronDown,
  ArrowLeft,
  type LucideIcon,
} from "lucide-react";
import { useState, useEffect, useRef, Suspense } from "react";
import { createPortal } from "react-dom";
import { useRouter, useSearchParams } from "next/navigation";
import { cn } from "@/lib/utils";
import { PDFDownloadLink } from "@react-pdf/renderer";
import { ReportPDF } from "./report-pdf";
import { Calendar } from "@/components/ui/calendar";
import { format, subDays, startOfMonth } from "date-fns";
import { DateRange } from "react-day-picker";
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
import { downloadExcel, type ExportColumn } from "@/lib/export";

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
  Globe: FileBarChart2,
};

interface ReportPageHeaderProps {
  title: string;
  subtitle: string;
  icon?: any;
  iconName?: string;
  onSearch?: (query: string) => void;
  pdfData?: any[];
  pdfColumns?: { header: string; key: string; width?: number }[];
  hideBackArrow?: boolean;
  action?: React.ReactNode;
  tabs?: string[];
  activeTab?: string;
  tabParamName?: string;
  exportData?: any[];
  exportColumns?: { header: string; key: string; width?: number }[];
  dateRange?: string;
  /** Show the date-range picker (writes ?from&to to the URL). Off by default. */
  showDateRange?: boolean;
  /** Extra content shown inside the maroon header, below the title (e.g. filters). */
  heroContent?: React.ReactNode;
}

const PRESETS = [
  { label: "7 days",    getValue: () => ({ from: subDays(new Date(), 7),  to: new Date() }) },
  { label: "30 days",   getValue: () => ({ from: subDays(new Date(), 30), to: new Date() }) },
  { label: "This month",getValue: () => ({ from: startOfMonth(new Date()), to: new Date() }) },
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
  exportData,
  exportColumns,
  dateRange: dateRangeProp,
  showDateRange = false,
  heroContent,
}: ReportPageHeaderProps) {
  const Icon: LucideIcon =
    (iconName ? ICON_MAP[iconName] : typeof icon === "string" ? ICON_MAP[icon] : icon) ?? FileBarChart2;

  const router = useRouter();
  const searchParams = useSearchParams();
  const [query, setQuery] = useState("");
  const [isSearchOpen, setIsSearchOpen] = useState(false);
  const [isClient, setIsClient] = useState(false);
  const [dateRange, setDateRange] = useState<DateRange | undefined>();
  const [open, setOpen] = useState(false);
  const [downloadOpen, setDownloadOpen] = useState(false);
  const [dropdownPos, setDropdownPos] = useState({ top: 0, right: 0 });
  const downloadBtnRef = useRef<HTMLButtonElement>(null);

  const handleDownloadToggle = () => {
    if (!downloadOpen && downloadBtnRef.current) {
      const rect = downloadBtnRef.current.getBoundingClientRect();
      setDropdownPos({ top: rect.bottom + 6, right: window.innerWidth - rect.right });
    }
    setDownloadOpen((v) => !v);
  };

  useEffect(() => {
    setIsClient(true);
    if (!showDateRange) return;
    const fromParam = searchParams.get("from");
    const toParam = searchParams.get("to");
    if (fromParam && toParam) {
      setDateRange({ from: new Date(fromParam), to: new Date(toParam) });
    } else {
      const defaultFrom = subDays(new Date(), 30);
      const defaultTo = new Date();
      setDateRange({ from: defaultFrom, to: defaultTo });
      const params = new URLSearchParams(searchParams.toString());
      params.set("from", defaultFrom.toISOString().split("T")[0]!);
      params.set("to", defaultTo.toISOString().split("T")[0]!);
      router.replace(`?${params.toString()}`, { scroll: false });
    }
  }, []);

  const handleDateChange = (range: DateRange | undefined) => {
    setDateRange(range);
    if (range?.from && range?.to) {
      const params = new URLSearchParams(searchParams.toString());
      params.set("from", range.from.toISOString().split("T")[0]!);
      params.set("to", range.to.toISOString().split("T")[0]!);
      router.replace(`?${params.toString()}`, { scroll: false });
    }
  };

  const handleSearchSubmit = (val: string) => {
    setQuery(val);
    onSearch?.(val);
  };

  if (!isClient) {
    return <div className="mb-5 h-14 animate-pulse rounded-2xl bg-slate-100" />;
  }

  const hasExport =
    ((exportData ?? pdfData) && (exportColumns ?? pdfColumns)) ||
    (pdfData && pdfColumns);

  const currentTab =
    activeTab ||
    (tabParamName ? searchParams.get(tabParamName) : null) ||
    tabs?.[0];

  return (
    <>
      {/* Header card */}
      <div className="mb-5">
        {/* Main row — maroon bridge card, like the app's screen headers */}
        <div className="page-hero bridge-card px-5 py-5 md:px-6 md:py-6">
        <div className="flex flex-col gap-4 md:flex-row md:items-center">
          {/* Left: back + identity */}
          <div className="flex items-center gap-3 flex-1 min-w-0">
            {!hideBackArrow && (
              <>
                <button
                  onClick={() => router.back()}
                  aria-label="Go back"
                  className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-white/10 text-white transition hover:bg-white/20"
                >
                  <ArrowLeft size={18} />
                </button>
              </>
            )}
            <div className="flex h-12 w-12 shrink-0 items-center justify-center rounded-2xl bg-white/15">
              <Icon size={22} className="text-orange-300" />
            </div>
            <div className="min-w-0">
              <h1 className="truncate text-[26px] font-semibold leading-tight text-white">{title}</h1>
              {subtitle && <p className="truncate text-[14px] text-white/70">{subtitle}</p>}
            </div>
          </div>

          {/* Right: controls */}
          <div className="flex flex-wrap items-center gap-2">
            {/* Date range picker */}
            {showDateRange && (
            <Popover open={open} onOpenChange={setOpen}>
              <PopoverTrigger asChild>
                <button className="flex h-10 items-center gap-2 rounded-full bg-white/10 px-4 text-[13px] font-medium text-white transition hover:bg-white/20">
                  <CalendarIcon size={14} className="shrink-0 text-white/70" />
                  <span className="tabular-nums">
                    {dateRange?.from ? format(dateRange.from, "MMM d") : "Start"}
                    {dateRange?.to ? ` - ${format(dateRange.to, "MMM d, yyyy")}` : ""}
                  </span>
                  <ChevronDown size={12} className="shrink-0 text-white/70" />
                </button>
              </PopoverTrigger>
              <PopoverContent
                align="end"
                sideOffset={6}
                className="p-0 w-auto border border-slate-200  rounded-xl bg-white overflow-hidden"
              >
                {/* Preset strip */}
                <div className="flex items-center gap-1.5 px-3 pt-2.5 pb-2 border-b border-slate-100">
                  <span className="text-[10px] font-semibold text-slate-400 mr-1">Quick select</span>
                  {PRESETS.map((p) => (
                    <button
                      key={p.label}
                      onClick={() => handleDateChange(p.getValue())}
                      className="px-2.5 py-1 rounded-xl text-[11px] font-medium border border-slate-200 text-slate-600 hover:bg-orange-50 hover:text-orange-600 hover:border-orange-200 transition-colors"
                    >
                      {p.label}
                    </button>
                  ))}
                </div>
                <div className="px-2 py-2">
                  <Calendar
                    mode="range"
                    defaultMonth={dateRange?.from}
                    selected={dateRange}
                    onSelect={handleDateChange}
                    numberOfMonths={2}
                    className="p-0"
                  />
                </div>
                <div className="flex items-center justify-between px-4 py-2.5 border-t border-slate-100 bg-slate-50/60">
                  <span className="text-[11px] text-slate-400">
                    {dateRange?.from && dateRange?.to
                      ? `${format(dateRange.from, "MMM d")} to ${format(dateRange.to, "MMM d, yyyy")}`
                      : "Select a range"}
                  </span>
                  <button
                    onClick={() => setOpen(false)}
                    className="h-8 rounded-full bg-orange-500 px-4 text-[12px] font-semibold text-white transition hover:bg-orange-600"
                  >
                    Apply
                  </button>
                </div>
              </PopoverContent>
            </Popover>
            )}

            {/* Search */}
            {onSearch && (
              <button
                onClick={() => setIsSearchOpen(true)}
                aria-label="Search"
                className="flex h-10 w-10 items-center justify-center rounded-full bg-white/10 text-white transition hover:bg-white/20"
              >
                <Search size={16} />
              </button>
            )}

            {/* Custom action or export */}
            {action ?? (hasExport ? (
              <div className="relative">
                <button
                  ref={downloadBtnRef}
                  onClick={handleDownloadToggle}
                  className="flex h-10 items-center gap-2 rounded-full bg-orange-500 px-4 text-[13px] font-semibold text-white transition hover:bg-orange-600"
                >
                  <Download size={13} strokeWidth={2} />
                  Download
                  <ChevronDown size={11} strokeWidth={2.5} className={cn("transition-transform duration-150", downloadOpen && "rotate-180")} />
                </button>

                {downloadOpen && createPortal(
                  <>
                    <div className="fixed inset-0 z-[980]" onClick={() => setDownloadOpen(false)} />
                    <div
                      className="fixed z-[990] w-48 bg-white rounded-[20px] border border-[#E2E2E2]  overflow-hidden"
                      style={{ top: dropdownPos.top, right: dropdownPos.right }}
                    >
                      <p className="px-3 pt-2.5 pb-1 text-[10px] font-semibold uppercase tracking-[0.06em] text-slate-400">
                        Export as
                      </p>
                      {(exportData ?? pdfData) && (exportColumns ?? pdfColumns) && (
                        <button
                          onClick={() => {
                            setDownloadOpen(false);
                            downloadExcel({
                              title,
                              subtitle,
                              dateRange: dateRangeProp ??
                                (dateRange?.from && dateRange?.to
                                  ? `${format(dateRange.from, "MMM d, yyyy")} - ${format(dateRange.to, "MMM d, yyyy")}`
                                  : undefined),
                              columns: (exportColumns ?? pdfColumns)!,
                              data: (exportData ?? pdfData)!,
                            });
                          }}
                          className="w-full flex items-center gap-2.5 px-3 py-2.5 text-left hover:bg-slate-50 transition-colors"
                        >
                          <FileSpreadsheet size={15} className="text-emerald-600 shrink-0" />
                          <div>
                            <span className="text-[13px] font-medium text-slate-800 block">Excel</span>
                            <span className="text-[10px] text-slate-400">.xlsx</span>
                          </div>
                        </button>
                      )}
                      {pdfData && pdfColumns && (
                        <PDFDownloadLink
                          document={<ReportPDF title={title} subtitle={subtitle} data={pdfData} columns={pdfColumns} />}
                          fileName={`${title.toLowerCase().replace(/\s+/g, "-")}-report.pdf`}
                          onClick={() => setDownloadOpen(false)}
                        >
                          {({ loading }) => (
                            <button
                              disabled={loading}
                              className="w-full flex items-center gap-2.5 px-3 py-2.5 text-left hover:bg-slate-50 transition-colors disabled:opacity-50"
                            >
                              {loading
                                ? <div className="w-4 h-4 rounded-full border-2 border-slate-200 border-t-slate-500 animate-spin shrink-0" />
                                : <FileText size={15} className="text-rose-500 shrink-0" />
                              }
                              <div>
                                <span className="text-[13px] font-medium text-slate-800 block">
                                  {loading ? "Preparing..." : "PDF"}
                                </span>
                                <span className="text-[10px] text-slate-400">.pdf</span>
                              </div>
                            </button>
                          )}
                        </PDFDownloadLink>
                      )}
                      <div className="h-1.5" />
                    </div>
                  </>,
                  document.body,
                )}
              </div>
            ) : null)}
          </div>
        </div>
        {heroContent && <div className="mt-5 border-t border-white/15 pt-5">{heroContent}</div>}
        </div>

        {/* Tabs (Atlassian border-bottom style) */}
        {tabs && tabs.length > 0 && (
          <div className="mt-4 flex w-fit max-w-full items-center gap-1 overflow-x-auto rounded-full border border-[#E2E2E2] bg-white p-1">
            {tabs.map((t) => {
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
                    "shrink-0 whitespace-nowrap rounded-full px-4 py-2 text-[13px] font-semibold transition",
                    isActive ? "bg-orange-500 text-white" : "text-slate-500 hover:bg-slate-50 hover:text-[#1C1C1E]",
                  )}
                >
                  {t}
                </button>
              );
            })}
          </div>
        )}
      </div>

      {/* Search modal */}
      {isSearchOpen && (
        <div className="fixed inset-0 z-[200] flex items-start justify-center pt-[15vh] px-4">
          <div
            className="absolute inset-0 bg-black/30"
            onClick={() => setIsSearchOpen(false)}
          />
          <div className="relative w-full max-w-2xl overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white shadow-premium">
            <div className="flex items-center gap-3 px-4 py-3 border-b border-slate-100">
              <Search size={16} className="text-slate-400 shrink-0" />
              <input
                autoFocus
                type="text"
                value={query}
                onChange={(e) => handleSearchSubmit(e.target.value)}
                placeholder={`Search ${title}...`}
                className="flex-1 bg-transparent border-none outline-none text-[14px] font-medium text-slate-900 placeholder:text-slate-400 py-1"
              />
              <button
                onClick={() => setIsSearchOpen(false)}
                className="h-7 w-7 rounded-xl hover:bg-slate-100 flex items-center justify-center text-slate-400 transition-colors"
              >
                <X size={14} />
              </button>
            </div>
            <div className="px-4 py-2.5 bg-slate-50 flex items-center justify-between border-b border-slate-100">
              <p className="text-[11px] font-medium text-slate-400">Type to search</p>
              <span className="px-1.5 py-0.5 rounded-lg bg-slate-200 text-[10px] font-medium text-slate-500">
                Esc to close
              </span>
            </div>
          </div>
        </div>
      )}
    </>
  );
}

export function ReportPageHeader(props: ReportPageHeaderProps) {
  return (
    <Suspense fallback={<div className="h-14 bg-slate-100 rounded-xl animate-pulse mb-5" />}>
      <ReportPageHeaderInner {...props} />
    </Suspense>
  );
}
