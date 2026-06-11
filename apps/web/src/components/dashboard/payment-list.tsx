"use client";

import { cn } from "@/lib/utils";
import {
  CreditCard,
  TrendingUp,
  Zap,
  Activity,
  Database,
  Info,
  Wallet,
  CheckCircle2,
  FileText,
  ArrowUpRight,
  Coins,
} from "lucide-react";
import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { DataTable } from "@/components/shared/data-table";
import { format } from "date-fns";
import { useState, useEffect } from "react";
import { useStations } from "@/modules/stations/use-stations";

// --- Animated counter hook ---
function useCountUp(target: number, duration = 1200): number {
  const [value, setValue] = useState(0);
  useEffect(() => {
    if (!target) {
      setValue(0);
      return;
    }
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

// --- Helper to map text class to Hex ---
const getSparkColor = (colorClass: string) => {
  if (colorClass.includes("blue")) return "#3b82f6";
  if (colorClass.includes("emerald")) return "#10b981";
  if (colorClass.includes("indigo")) return "#6366f1";
  if (colorClass.includes("amber")) return "#f59e0b";
  if (colorClass.includes("orange")) return "#f97316";
  if (colorClass.includes("violet")) return "#8b5cf6";
  if (colorClass.includes("cyan")) return "#06b6d4";
  if (colorClass.includes("rose")) return "#f43f5e";
  return "#94a3b8";
};

// --- Custom PaymentStatCard Component ---
interface PaymentStatCardProps {
  label: string;
  value: number;
  isCurrency?: boolean;
  isPercent?: boolean;
  icon: React.ElementType;
  iconBg: string;
  iconColor: string;
  tag: string;
  tagBg: string;
  tagColor: string;
  accentBar: string;
  description: string;
  seed: number;
}

function PaymentStatCard({
  label,
  value,
  isCurrency = false,
  isPercent = false,
  icon: Icon,
  iconBg,
  iconColor,
  tag,
  tagBg,
  tagColor,
  accentBar,
  description,
  seed,
}: PaymentStatCardProps) {
  const counted = useCountUp(value, 1000);
  const sparkColor = getSparkColor(iconColor);

  const displayValue = isCurrency
    ? `TSh ${counted.toLocaleString()}`
    : isPercent
      ? `${counted}%`
      : counted.toLocaleString();

  return (
    <div className="group bg-white rounded-2xl border border-slate-100 p-5 flex flex-col justify-between hover:shadow-xl hover:border-slate-200 hover:-translate-y-0.5 transition-all duration-300 h-full relative overflow-hidden">
      {/* Top Row */}
      <div className="flex items-start justify-between">
        <div className={cn("w-9 h-9 rounded-xl flex items-center justify-center transition-all duration-300 group-hover:scale-110 shadow-sm", iconBg, iconColor)}>
          <Icon size={16} strokeWidth={2.5} />
        </div>
        <span className={cn("text-[9px] font-bold uppercase tracking-[0.18em] px-2.5 py-1.5 rounded-md border", tagBg, tagColor)}>
          {tag}
        </span>
      </div>

      {/* Main Content */}
      <div className="mt-4 flex-1 flex flex-col justify-between">
        <div>
          {/* Primary value */}
          <p className={cn("text-[24px] font-black tracking-tight leading-none tabular-nums", iconColor)}>
            {displayValue}
          </p>
          
          {/* Title & Description */}
          <h3 className="text-[13px] font-black text-slate-800 tracking-tight mt-3">
            {label}
          </h3>
          <p className="text-[10px] font-bold text-slate-400 mt-1 leading-normal line-clamp-2">
            {description}
          </p>
        </div>

        {/* Sparkline */}
        <div className="mt-4 space-y-3">
          <div className="opacity-40 group-hover:opacity-100 transition-opacity duration-300">
            <Sparkline color={sparkColor} seed={seed} />
          </div>
        </div>
      </div>

      {/* Bottom accent glow */}
      <div className={cn("absolute bottom-0 left-0 right-0 h-[3px] opacity-0 group-hover:opacity-100 transition-opacity duration-300", accentBar)} />
    </div>
  );
}

export function PaymentList({
  status,
  tab = "overview",
}: {
  status?: string | string[];
  tab?: string;
}) {
  const [selectedStationId, setSelectedStationId] = useState<string>("");
  const { data: stations } = useStations();
  const stationList = Array.isArray(stations) ? stations : [];

  const { data: payments, isLoading } = useQuery({
    queryKey: ["payments", status, selectedStationId],
    queryFn: async () => {
      const params = new URLSearchParams();
      if (status) {
        if (Array.isArray(status)) {
          status.forEach((s) => params.append("status", s));
        } else {
          params.append("status", status);
        }
      }
      if (selectedStationId) {
        params.append("stationId", selectedStationId);
      }
      const { data } = await api.get(`/payments?${params.toString()}`);
      return data.data || [];
    },
  });

  const rawPayments = Array.isArray(payments) ? payments : [];

  const totalPaid = rawPayments.filter((p: any) => p.status === "SUCCESS");
  const totalPending = rawPayments.filter((p: any) => p.status === "PENDING");

  const totalPaidAmount = totalPaid.reduce(
    (acc: number, p: any) => acc + p.amount,
    0,
  );
  const totalPendingAmount = totalPending.reduce(
    (acc: number, p: any) => acc + p.amount,
    0,
  );

  const successRate = rawPayments.length
    ? ((totalPaid.length / rawPayments.length) * 100).toFixed(1) + "%"
    : "0%";

  const formatAmount = (amt: number) => {
    if (amt >= 1000000) return `TSh ${(amt / 1000000).toFixed(1)}M`;
    if (amt >= 1000) return `TSh ${(amt / 1000).toFixed(1)}K`;
    return `TSh ${amt.toLocaleString()}`;
  };

  const columns = [
    {
      header: "Transaction",
      accessor: (pay: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-10 w-10 rounded-[10px] flex items-center justify-center shadow-lg",
              pay.status === "SUCCESS"
                ? "bg-slate-900"
                : "bg-slate-200 grayscale",
            )}
          >
            <FileText className="h-5 w-5 text-white" />
          </div>
          <div className="flex flex-col">
            <span className="font-black text-slate-900 text-[14px] uppercase">
              #
              {pay.parcel?.id?.slice(-8).toUpperCase() ||
                pay.transactionReference?.slice(-8).toUpperCase() ||
                "---"}
            </span>
            <span className="text-[10px] text-slate-400 uppercase mt-1">
              Reference
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Reference ID",
      accessor: (pay: any) => (
        <span className="text-[12px] font-bold text-blue-600">
          {pay.transactionReference?.slice(0, 10) || "PENDING"}
        </span>
      ),
    },
    {
      header: "Origin Station",
      accessor: (pay: any) => (
        <span className="text-[12px] font-bold text-slate-600">
          {pay.parcel?.origin?.name || "---"}
        </span>
      ),
    },
    {
      header: "Status",
      accessor: (pay: any) => {
        const isSuccess = pay.status === "SUCCESS" || pay.status === "PAID";
        return (
          <div
            className={cn(
              "inline-flex items-center gap-2 px-3 py-1.5 rounded-full border",
              isSuccess
                ? "bg-emerald-50 border-emerald-100 text-emerald-600"
                : "bg-amber-50 border-amber-100 text-amber-600",
            )}
          >
            <Zap
              className={cn(
                "w-3 h-3",
                isSuccess ? "fill-emerald-600" : "fill-amber-500",
              )}
            />
            <span className="text-[10px] font-bold uppercase">
              {isSuccess ? "Paid" : "Pending"}
            </span>
          </div>
        );
      },
    },
    {
      header: "Amount",
      accessor: (pay: any) => (
        <div className="flex items-center gap-1 text-slate-900">
          <Wallet className="w-4 h-4 text-slate-400" />
          <span className="text-[14px] font-black">
            TSh {pay.amount.toLocaleString()}
          </span>
        </div>
      ),
    },
    {
      header: "Date",
      accessor: (pay: any) => (
        <div className="flex flex-col text-right pr-4">
          <span className="text-[12px] font-bold text-slate-900">
            {format(new Date(pay.createdAt || Date.now()), "HH:mm")}
          </span>
          <span className="text-[10px] text-slate-400 uppercase">
            {format(new Date(pay.createdAt || Date.now()), "MMM dd, yyyy")}
          </span>
        </div>
      ),
    },
  ];

  return (
    <div className="h-full flex flex-col gap-4 overflow-hidden animate-in fade-in duration-700">
      {/* Filter Bar */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 bg-white border border-slate-100 rounded-[12px] px-6 py-4 shadow-sm flex-shrink-0">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-[10px] bg-blue-50 flex items-center justify-center text-blue-600">
            <Database size={18} strokeWidth={2.5} />
          </div>
          <div>
            <span className="text-[9px] font-black uppercase tracking-widest text-slate-400">Filter Location</span>
            <h4 className="text-[14px] font-black text-slate-900 leading-none mt-1">Origin Station</h4>
          </div>
        </div>
        
        <div className="w-full sm:w-72">
          <select
            value={selectedStationId}
            onChange={(e) => setSelectedStationId(e.target.value)}
            className="w-full h-11 px-4 bg-slate-50 border border-slate-200/60 rounded-[10px] text-xs font-bold text-slate-700 outline-none focus:border-blue-500 hover:bg-slate-100/50 transition-all cursor-pointer shadow-sm"
          >
            <option value="">All Stations</option>
            {stationList.map((st: any) => (
              <option key={st.id} value={st.id}>
                {st.name} ({st.code})
              </option>
            ))}
          </select>
        </div>
      </div>

      {/* Stats Overview Tab */}
      {tab.toLowerCase() === "overview" && (
        <div className="flex-1 flex flex-col gap-4 overflow-hidden min-h-0">
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 flex-shrink-0">
            <PaymentStatCard
              label="Total Paid"
              value={totalPaidAmount}
              isCurrency={true}
              icon={Coins}
              iconBg="bg-emerald-50"
              iconColor="text-emerald-600"
              tag="SUCCESS"
              tagBg="bg-emerald-50/50 border-emerald-100"
              tagColor="text-emerald-700"
              accentBar="bg-emerald-500"
              description="Successfully processed payments"
              seed={1}
            />
            <PaymentStatCard
              label="Pending Payments"
              value={totalPendingAmount}
              isCurrency={true}
              icon={CreditCard}
              iconBg="bg-blue-50"
              iconColor="text-blue-600"
              tag="PENDING"
              tagBg="bg-blue-50/50 border-blue-100"
              tagColor="text-blue-700"
              accentBar="bg-blue-500"
              description="Awaiting gateway confirmation"
              seed={2}
            />
            <PaymentStatCard
              label="Success Rate"
              value={rawPayments.length ? Math.round((totalPaid.length / rawPayments.length) * 100) : 0}
              isPercent={true}
              icon={TrendingUp}
              iconBg="bg-indigo-50"
              iconColor="text-indigo-600"
              tag="CONVERSION"
              tagBg="bg-indigo-50/50 border-indigo-100"
              tagColor="text-indigo-700"
              accentBar="bg-indigo-500"
              description="Ratio of successful transactions"
              seed={3}
            />
            <PaymentStatCard
              label="Total Transactions"
              value={rawPayments.length}
              icon={Activity}
              iconBg="bg-violet-50"
              iconColor="text-violet-600"
              tag="VOLUME"
              tagBg="bg-violet-50/50 border-violet-100"
              tagColor="text-violet-700"
              accentBar="bg-violet-500"
              description="All payment records in database"
              seed={4}
            />
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-3 gap-4 flex-1 min-h-0">
            {/* How It Works Section */}
            <div className="lg:col-span-1 bg-slate-900 rounded-[10px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between h-full min-h-0">
              <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-blue-500/10 rounded-full blur-[100px]" />

              <div className="relative z-10">
                <div className="h-12 w-12 rounded-[10px] bg-white/10 flex items-center justify-center mb-8 border border-white/10 backdrop-blur-md shadow-2xl shadow-blue-500/10">
                  <Wallet className="h-6 w-6 text-blue-400" strokeWidth={2.5} />
                </div>
                <h3 className="text-[20px] font-black tracking-tight leading-none mb-3">
                  Payment Flow
                </h3>
                <p className="text-slate-400 text-[12px] font-bold leading-relaxed opacity-80 mb-6">
                  Payments are processed through integrated gateways in
                  real-time. Successful transactions automatically update parcel
                  statuses.
                </p>
              </div>

              <div className="relative z-10 space-y-3">
                <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                  <div className="flex flex-col">
                    <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                      Total Verified
                    </span>
                    <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                      Paid Volume
                    </span>
                  </div>
                  <span className="text-[14px] font-black text-emerald-400 tabular-nums">
                    {formatAmount(totalPaidAmount)}
                  </span>
                </div>
                <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                  <div className="flex flex-col">
                    <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                      Pending
                    </span>
                    <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                      Awaiting
                    </span>
                  </div>
                  <span className="text-[14px] font-black text-amber-400 tabular-nums">
                    {formatAmount(totalPendingAmount)}
                  </span>
                </div>
              </div>
            </div>

            {/* Placeholder for Graphs or other analytical tools */}
            <div className="lg:col-span-2 bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 flex flex-col items-center justify-center text-center h-full min-h-0">
              <div className="w-16 h-16 rounded-full bg-blue-50 flex items-center justify-center mb-4">
                <TrendingUp className="w-8 h-8 text-blue-500" />
              </div>
              <h4 className="text-[16px] font-black text-slate-900 mb-2">
                Revenue Activity Graph
              </h4>
              <p className="text-[13px] text-slate-400 max-w-md">
                Detailed graphical analysis of payment inflows, transaction
                volumes, and revenue trends will be populated here as
                transactions occur.
              </p>
            </div>
          </div>
        </div>
      )}

      {/* Table Tab */}
      {tab.toLowerCase() === "all" && (
        <div className="flex-1 min-h-0 bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden p-1">
          <DataTable
            title="Payments"
            data={rawPayments}
            columns={columns}
            isLoading={isLoading}
            hideInternalSearch={true}
          />
        </div>
      )}
    </div>
  );
}
