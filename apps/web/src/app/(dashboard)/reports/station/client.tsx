"use client";

import {
  Document,
  Page,
  Text,
  View,
  StyleSheet,
  PDFDownloadLink,
  Font,
} from "@react-pdf/renderer";
import {
  Download,
  FileText,
  ArrowLeft,
  BarChart3,
  PieChart,
  Activity,
  Globe,
  TrendingUp,
  Package,
  TrainFront,
  CheckCircle2,
  Warehouse,
  Search,
  Calendar as CalendarIcon,
} from "lucide-react";
import Link from "next/link";
import { cn } from "@/lib/utils";
import { useState, useEffect } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import { Calendar } from "@/components/ui/calendar";
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
import { format, subDays } from "date-fns";
import { DateRange } from "react-day-picker";
import {
  BarChart,
  Bar,
  Cell,
  ResponsiveContainer,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip as ChartTooltip,
  PieChart as RechartsPieChart,
  Pie,
} from "recharts";

// PDF Styles
const styles = StyleSheet.create({
  page: { padding: 50, fontFamily: "Helvetica", backgroundColor: "#ffffff" },
  header: {
    flexDirection: "row",
    justifyContent: "space-between",
    borderBottomWidth: 2,
    borderBottomColor: "#f1f5f9",
    paddingBottom: 25,
    marginBottom: 40,
  },
  title: {
    fontSize: 28,
    fontWeight: 700,
    color: "#0f172a",
    letterSpacing: -0.5,
  },
  subtitle: { fontSize: 11, color: "#64748b", marginTop: 6, fontWeight: 500 },
  brand: { fontSize: 18, fontWeight: 700, color: "#2563eb" },
  sectionTitle: {
    fontSize: 16,
    fontWeight: 700,
    color: "#1e293b",
    marginBottom: 18,
    marginTop: 30,
    textTransform: "uppercase",
    letterSpacing: 1,
  },
  cardGrid: {
    flexDirection: "row",
    flexWrap: "wrap",
    gap: 20,
    marginBottom: 30,
  },
  card: {
    width: "47%",
    padding: 20,
    backgroundColor: "#f8fafc",
    borderRadius: 12,
    border: "1px solid #e2e8f0",
  },
  cardTitle: {
    fontSize: 10,
    color: "#64748b",
    textTransform: "uppercase",
    fontWeight: 700,
    letterSpacing: 0.5,
  },
  cardValue: { fontSize: 24, fontWeight: 700, color: "#0f172a", marginTop: 10 },
  footer: {
    position: "absolute",
    bottom: 40,
    left: 50,
    right: 50,
    fontSize: 10,
    color: "#94a3b8",
    textAlign: "center",
    borderTopWidth: 1,
    borderTopColor: "#f1f5f9",
    paddingTop: 15,
  },
});

// The PDF Document Component
const StationReportPDF = ({ station, metrics, generatedAt }: any) => (
  <Document>
    <Page size="A4" style={styles.page}>
      <View style={styles.header}>
        <View>
          <Text style={styles.title}>Station Activity Report</Text>
          <Text style={styles.subtitle}>
            {station.name} • Operations Summary •{" "}
            {new Date(generatedAt).toLocaleDateString()}
          </Text>
        </View>
        <View>
          <Text style={styles.brand}>MIZIGO</Text>
        </View>
      </View>

      <View>
        <Text style={styles.sectionTitle}>Operational Flow Summary</Text>
        <View style={styles.cardGrid}>
          <View style={styles.card}>
            <Text style={styles.cardTitle}>Intake (Received)</Text>
            <Text style={styles.cardValue}>{metrics.received}</Text>
          </View>
          <View style={styles.card}>
            <Text style={styles.cardTitle}>Delivered</Text>
            <Text style={styles.cardValue}>{metrics.delivered}</Text>
          </View>
          <View style={styles.card}>
            <Text style={styles.cardTitle}>In Transit (Rail)</Text>
            <Text style={styles.cardValue}>{metrics.sent}</Text>
          </View>
          <View style={styles.card}>
            <Text style={styles.cardTitle}>At Warehouse</Text>
            <Text style={styles.cardValue}>{metrics.atWarehouse}</Text>
          </View>
        </View>
      </View>

      <Text style={styles.footer} fixed>
        CONFIDENTIAL: This document is for internal use within{" "}
        {station.organization?.name || "Mizigo"} only.
      </Text>
    </Page>
  </Document>
);

// --- Custom Operational Flow Chart Component ---
function OperationalFlowChart({ metrics }: { metrics: any }) {
  const data = [
    { name: "Intake (Received)", value: metrics.received, fill: "url(#blueGrad)" },
    { name: "At Warehouse", value: metrics.atWarehouse, fill: "url(#amberGrad)" },
    { name: "In Transit (Rail)", value: metrics.sent, fill: "url(#indigoGrad)" },
    { name: "Delivered", value: metrics.delivered, fill: "url(#emeraldGrad)" },
  ];

  return (
    <div className="h-[280px] w-full mt-4">
      <ResponsiveContainer width="100%" height="100%">
        <BarChart data={data} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
          <defs>
            <linearGradient id="blueGrad" x1="0" y1="0" x2="0" y2="1">
              <stop offset="0%" stopColor="#3b82f6" stopOpacity={0.9} />
              <stop offset="100%" stopColor="#3b82f6" stopOpacity={0.3} />
            </linearGradient>
            <linearGradient id="amberGrad" x1="0" y1="0" x2="0" y2="1">
              <stop offset="0%" stopColor="#f59e0b" stopOpacity={0.9} />
              <stop offset="100%" stopColor="#f59e0b" stopOpacity={0.3} />
            </linearGradient>
            <linearGradient id="indigoGrad" x1="0" y1="0" x2="0" y2="1">
              <stop offset="0%" stopColor="#6366f1" stopOpacity={0.9} />
              <stop offset="100%" stopColor="#6366f1" stopOpacity={0.3} />
            </linearGradient>
            <linearGradient id="emeraldGrad" x1="0" y1="0" x2="0" y2="1">
              <stop offset="0%" stopColor="#10b981" stopOpacity={0.9} />
              <stop offset="100%" stopColor="#10b981" stopOpacity={0.3} />
            </linearGradient>
          </defs>
          <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#f1f5f9" />
          <XAxis 
            dataKey="name" 
            stroke="#94a3b8" 
            fontSize={11} 
            tickLine={false} 
            axisLine={false} 
            dy={10} 
            fontFamily="inherit"
            fontWeight="bold"
          />
          <YAxis 
            stroke="#94a3b8" 
            fontSize={11} 
            tickLine={false} 
            axisLine={false} 
            allowDecimals={false}
            fontFamily="inherit"
            fontWeight="bold"
          />
          <ChartTooltip
            cursor={{ fill: "rgba(248, 250, 252, 0.6)", radius: 10 }}
            contentStyle={{
              backgroundColor: "#fff",
              border: "1px solid #e2e8f0",
              borderRadius: "12px",
              boxShadow: "0 10px 15px -3px rgb(0 0 0 / 0.05)",
              fontFamily: "inherit",
              fontWeight: "bold",
              fontSize: "12px",
            }}
          />
          <Bar dataKey="value" radius={[8, 8, 0, 0]} barSize={55}>
            {data.map((entry, index) => (
              <Cell key={`cell-${index}`} fill={entry.fill} />
            ))}
          </Bar>
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
}

export function StationReportClient({
  station,
  metrics,
  generatedAt,
}: any) {
  const [isClient, setIsClient] = useState(false);
  const router = useRouter();
  const searchParams = useSearchParams();
  const timeframe = searchParams.get("timeframe") || "weekly";

  const [dateRange, setDateRange] = useState<DateRange | undefined>(() => {
    const fromStr = searchParams.get("dateFrom");
    const toStr = searchParams.get("dateTo");
    return {
      from: fromStr ? new Date(fromStr) : subDays(new Date(), 30),
      to: toStr ? new Date(toStr) : new Date(),
    };
  });
  const [popoverOpen, setPopoverOpen] = useState(false);

  useEffect(() => {
    setIsClient(true);
  }, []);

  const updateTimeframe = (newTimeframe: string, range?: DateRange) => {
    const params = new URLSearchParams(searchParams.toString());
    params.set("timeframe", newTimeframe);
    if (newTimeframe === "custom" && range?.from && range?.to) {
      params.set("dateFrom", format(range.from, "yyyy-MM-dd"));
      params.set("dateTo", format(range.to, "yyyy-MM-dd"));
    } else {
      params.delete("dateFrom");
      params.delete("dateTo");
    }
    router.push(`?${params.toString()}`, { scroll: false });
  };

  return (
    <div className="flex flex-col gap-8 p-6 md:p-10 bg-white max-w-[1440px] mx-auto min-h-[85vh] shadow-[0_0_80px_-20px_rgba(0,0,0,0.08)] rounded-[20px] my-8 border border-slate-100/50 relative overflow-hidden">
      {/* Background Decoration */}
      <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-blue-50/20 rounded-full blur-3xl -mr-64 -mt-64 pointer-events-none" />
      <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-slate-50/30 rounded-full blur-3xl -ml-48 -mb-48 pointer-events-none" />

      {/* Header Section */}
      <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-6 pb-2 relative z-10 border-b border-slate-50 pb-6">
        <div>
          <Link
            href="/reports"
            className="inline-flex items-center text-[10px] font-black text-slate-400 hover:text-blue-600 mb-4 transition-all group uppercase tracking-[0.2em]"
          >
            <ArrowLeft
              className="w-3.5 h-3.5 mr-1.5 group-hover:-translate-x-0.5 transition-transform"
              strokeWidth={3}
            />
            Analytics Hub
          </Link>
          <div className="flex items-center gap-3.5 mb-2">
            <div className="w-10 h-10 rounded-xl bg-blue-600 flex items-center justify-center text-white shadow-lg shadow-blue-500/20">
              <Activity size={20} strokeWidth={2.5} />
            </div>
            <h1 className="text-[26px] font-black text-slate-900 tracking-tight leading-none">
              Station Performance
            </h1>
          </div>
          <p className="text-[13px] text-slate-500 font-bold tracking-tight">
            Activity and performance overview for <span className="text-blue-600 font-extrabold">{station.name}</span>
          </p>
        </div>

        <div className="flex flex-wrap items-center gap-4">
          {/* Timeframe Selector & Date Range Picker */}
          <div className="flex items-center gap-3 relative">
            <div className="flex items-center bg-slate-50 border border-slate-100 rounded-[10px] p-1.5 shadow-sm">
              {["daily", "weekly", "monthly", "custom"].map((tf) => (
                <button
                  key={tf}
                  onClick={() => {
                    if (tf === "custom") {
                      setPopoverOpen(true);
                    } else {
                      updateTimeframe(tf);
                    }
                  }}
                  className={cn(
                    "px-4 py-2 rounded-[8px] text-[10px] font-black uppercase tracking-widest transition-all",
                    timeframe === tf
                      ? "bg-white text-blue-600 shadow-sm border border-slate-200/50"
                      : "text-slate-400 hover:text-slate-600",
                  )}
                >
                  {tf}
                </button>
              ))}
            </div>

            {/* Custom Date Range Popover Trigger (only visible when custom timeframe is active) */}
            <Popover open={popoverOpen} onOpenChange={setPopoverOpen}>
              <PopoverTrigger asChild>
                <button className={cn(
                  "hidden",
                  timeframe === "custom" && "flex items-center gap-2 h-9 bg-white border border-slate-200 rounded-[10px] px-3 hover:bg-slate-50 transition-all active:scale-95 text-slate-700 shadow-sm"
                )}>
                  <CalendarIcon size={12} className="text-blue-500" />
                  <span className="text-[10px] font-black uppercase tracking-widest tabular-nums">
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
                className="p-0 w-auto border border-slate-100 shadow-2xl shadow-black/10 rounded-[16px] bg-white overflow-hidden z-[100]"
              >
                <div className="p-3">
                  <Calendar
                    mode="range"
                    selected={dateRange}
                    onSelect={setDateRange}
                    numberOfMonths={2}
                    className="p-0"
                  />
                </div>
                <div className="flex items-center justify-between px-4 py-3 border-t border-slate-50 bg-slate-50/40">
                  <span className="text-[9px] text-slate-400 font-bold uppercase tracking-widest">
                    {dateRange?.from && dateRange?.to
                      ? `${format(dateRange.from, "MMM d")} → ${format(dateRange.to, "MMM d, yyyy")}`
                      : "Select a range"}
                  </span>
                  <button
                    onClick={() => {
                      if (dateRange?.from && dateRange?.to) {
                        updateTimeframe("custom", dateRange);
                        setPopoverOpen(false);
                      }
                    }}
                    disabled={!dateRange?.from || !dateRange?.to}
                    className="h-8 px-4 bg-slate-900 text-white rounded-[8px] text-[9px] font-black uppercase tracking-widest hover:bg-blue-600 transition-all active:scale-95 disabled:opacity-50"
                  >
                    Apply Range
                  </button>
                </div>
              </PopoverContent>
            </Popover>
          </div>

          {isClient && (
            <PDFDownloadLink
              document={
                <StationReportPDF
                  station={station}
                  metrics={metrics}
                  generatedAt={generatedAt}
                />
              }
              fileName={`station-report-${station.name.toLowerCase().replace(/\s+/g, "-")}.pdf`}
            >
              {({ loading }) => (
                <button
                  disabled={loading}
                  className="h-10 px-6 rounded-[10px] bg-slate-900 hover:bg-black text-white font-black text-[10px] uppercase tracking-widest shadow-xl shadow-slate-200 transition-all active:scale-95 flex items-center gap-2 disabled:opacity-50"
                >
                  {loading ? (
                    <div className="w-4 h-4 rounded-full border-2 border-white/20 border-t-white animate-spin" />
                  ) : (
                    <Download className="w-4 h-4" strokeWidth={2.5} />
                  )}
                  {loading ? "Exporting..." : "Export Report"}
                </button>
              )}
            </PDFDownloadLink>
          )}
        </div>
      </div>

      {/* KPI Performance Matrix */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 relative z-10 flex-1">
        <div className="lg:col-span-2 space-y-8">
          {/* Core Operational Stats */}
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            {[
              {
                label: "Intake (Received)",
                value: metrics.received,
                icon: Package,
                color: "text-blue-600",
                bg: "bg-blue-50/50",
              },
              {
                label: "At Warehouse",
                value: metrics.atWarehouse,
                icon: Warehouse,
                color: "text-amber-600",
                bg: "bg-amber-50/50",
              },
              {
                label: "In Transit (Rail)",
                value: metrics.sent,
                icon: TrainFront,
                color: "text-indigo-600",
                bg: "bg-indigo-50/50",
              },
              {
                label: "Delivered",
                value: metrics.delivered,
                icon: CheckCircle2,
                color: "text-emerald-600",
                bg: "bg-emerald-50/50",
              },
            ].map((stat) => (
              <div
                key={stat.label}
                className="bg-white rounded-xl border border-slate-100 p-5 shadow-sm hover:shadow-md transition-all group"
              >
                <div
                  className={cn(
                    "w-10 h-10 rounded-xl flex items-center justify-center mb-3 group-hover:scale-110 transition-transform",
                    stat.bg,
                    stat.color,
                  )}
                >
                  <stat.icon size={18} strokeWidth={2.5} />
                </div>
                <div className="space-y-1">
                  <p className="text-[9px] font-black text-slate-400 uppercase tracking-widest">
                    {stat.label}
                  </p>
                  <p className="text-2xl font-black text-slate-900 tabular-nums leading-none tracking-tight">
                    {stat.value}
                  </p>
                </div>
              </div>
            ))}
          </div>

          {/* Operational Flow Pipeline */}
          <div className="bg-white rounded-2xl border border-slate-100 p-6 md:p-8 shadow-sm relative overflow-hidden group">
            <div className="flex items-center justify-between mb-6">
              <h2 className="text-[16px] font-black text-slate-900 flex items-center gap-2.5">
                <BarChart3 size={16} className="text-blue-600" />
                Operational Flow Pipeline
              </h2>
              <div className="flex items-center gap-2 px-3 py-1 rounded-lg bg-blue-50 text-blue-600 border border-blue-100/60 font-black text-[9px] uppercase tracking-widest">
                Active Flow
              </div>
            </div>
            
            {/* Operational Flow Chart Component */}
            <OperationalFlowChart metrics={metrics} />
          </div>
        </div>

        {/* Performance Sidebar */}
        <div className="space-y-8">
          <div className="bg-slate-900 rounded-2xl p-8 text-white relative overflow-hidden shadow-xl border border-slate-800">
            <Globe
              size={120}
              className="absolute -bottom-6 -right-6 text-white/5 rotate-12 pointer-events-none"
            />
            <div className="relative z-10">
              <span className="text-[9px] font-black text-blue-400 uppercase tracking-[0.2em] block mb-4">
                Station Details
              </span>
              <h3 className="text-xl font-black mb-6 leading-tight">
                Operating Status
              </h3>
              <div className="space-y-4">
                <div className="flex justify-between items-center text-[12px] font-black">
                  <span className="text-slate-400">Online Status</span>
                  <span className="text-emerald-400 uppercase tracking-widest flex items-center gap-1.5">
                    <span className="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-ping" />
                    Optimal
                  </span>
                </div>
                <div className="h-1.5 bg-white/10 rounded-full overflow-hidden">
                  <div className="h-full bg-blue-600 w-[95%] rounded-full" />
                </div>
                <p className="text-[11px] text-slate-400 leading-relaxed font-bold pt-2">
                  The station is running smoothly with no issues reported in the last 24 hours.
                </p>
              </div>
            </div>
          </div>

          <div className="bg-white rounded-2xl border border-slate-100 p-6 shadow-sm">
            <h3 className="text-[12px] font-black text-slate-900 uppercase tracking-[0.15em] mb-4 flex items-center gap-2">
              <PieChart size={14} className="text-blue-600" />
              Volume Breakdown
            </h3>
            
            {/* Real Data Donut Chart */}
            {(() => {
              const totalVolume = metrics.received + metrics.atWarehouse + metrics.sent + metrics.delivered;
              const intakePct = totalVolume > 0 ? Math.round((metrics.received / totalVolume) * 100) : 0;
              const warehousePct = totalVolume > 0 ? Math.round((metrics.atWarehouse / totalVolume) * 100) : 0;
              const transitPct = totalVolume > 0 ? Math.round((metrics.sent / totalVolume) * 100) : 0;
              const deliveredPct = totalVolume > 0 ? Math.round((metrics.delivered / totalVolume) * 100) : 0;

              const hasData = totalVolume > 0;
              const donutData = hasData 
                ? [
                    { name: "Intake", value: metrics.received, color: "#3b82f6" },
                    { name: "Warehouse", value: metrics.atWarehouse, color: "#f59e0b" },
                    { name: "Transit", value: metrics.sent, color: "#6366f1" },
                    { name: "Delivered", value: metrics.delivered, color: "#10b981" },
                  ].filter(item => item.value > 0)
                : [{ name: "No Activity", value: 1, color: "#e2e8f0" }];

              return (
                <div className="space-y-4">
                  <div className="h-[140px] w-full flex items-center justify-center relative">
                    <ResponsiveContainer width="100%" height="100%">
                      <RechartsPieChart>
                        <Pie
                          data={donutData}
                          cx="50%"
                          cy="50%"
                          innerRadius={42}
                          outerRadius={58}
                          paddingAngle={hasData ? 3 : 0}
                          dataKey="value"
                        >
                          {donutData.map((entry, index) => (
                            <Cell key={`cell-${index}`} fill={entry.color} />
                          ))}
                        </Pie>
                        <ChartTooltip
                          contentStyle={{
                            backgroundColor: "#fff",
                            border: "1px solid #e2e8f0",
                            borderRadius: "8px",
                            fontSize: "11px",
                            fontFamily: "inherit",
                            fontWeight: "bold",
                          }}
                        />
                      </RechartsPieChart>
                    </ResponsiveContainer>
                    {/* Center text showing total */}
                    <div className="absolute flex flex-col items-center justify-center">
                      <span className="text-[9px] font-black uppercase tracking-wider text-slate-400">Total</span>
                      <span className="text-base font-black text-slate-800 tabular-nums">{totalVolume}</span>
                    </div>
                  </div>

                  <div className="grid grid-cols-2 gap-2 mt-2">
                    {[
                      { label: "Intake", value: intakePct, color: "bg-blue-500" },
                      { label: "Warehouse", value: warehousePct, color: "bg-amber-500" },
                      { label: "Transit", value: transitPct, color: "bg-indigo-500" },
                      { label: "Delivered", value: deliveredPct, color: "bg-emerald-500" },
                    ].map((item) => (
                      <div key={item.label} className="flex items-center gap-2 bg-slate-50/50 border border-slate-100/50 p-2 rounded-xl">
                        <span className={cn("w-1.5 h-1.5 rounded-full flex-shrink-0", item.color)} />
                        <div className="flex flex-col">
                          <span className="text-[8px] font-bold text-slate-400 uppercase tracking-wider leading-none">{item.label}</span>
                          <span className="text-[11px] font-black text-slate-800 mt-1 tabular-nums">{item.value}%</span>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              );
            })()}
          </div>
        </div>
      </div>
    </div>
  );
}
