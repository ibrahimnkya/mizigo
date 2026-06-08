"use client";

import {
  Printer,
  RefreshCcw,
  Search,
  FileText,
  CheckCircle2,
  Settings,
  Zap,
  Package,
  History,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { useState } from "react";
import { format } from "date-fns";

export default function OperatorPrintsPage() {
  const [isPrinting, setIsPrinting] = useState(false);

  const pendingPrints = [
    {
      id: "1a2b3c",
      type: "WAYBILL",
      created: new Date(),
      parcelId: "MZ-123456",
      status: "READY",
    },
    {
      id: "4d5e6f",
      type: "PAYMENT_RECEIPT",
      created: new Date(),
      parcelId: "MZ-789012",
      status: "READY",
    },
    {
      id: "7g8h9i",
      type: "TAG_LABEL",
      created: new Date(),
      parcelId: "MZ-123456",
      status: "READY",
    },
  ];

  return (
    <div className="max-w-4xl mx-auto space-y-12 py-6 animate-in fade-in duration-500">
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-6">
        <div className="space-y-1">
          <h1 className="text-4xl font-black text-slate-900 tracking-tight">
            Printing Terminal
          </h1>
          <p className="text-slate-500 font-medium">
            Manage thermal labels and master waybills for current outbound flow.
          </p>
        </div>

        <div className="bg-white border border-slate-200 rounded-[10px] p-2 pr-6 shadow-xl shadow-slate-200/50 flex items-center gap-4">
          <div className="h-10 w-10 bg-emerald-600 rounded-[10px] flex items-center justify-center text-white shadow-lg">
            <Printer size={20} />
          </div>
          <div>
            <span className="text-[10px] font-black uppercase text-slate-400 tracking-widest block">
              Printer Status
            </span>
            <span className="text-sm font-black text-emerald-500 flex items-center gap-1.5">
              <div className="h-2 w-2 rounded-full bg-emerald-500 animate-pulse" />
              Online
            </span>
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        {[
          {
            label: "Pending Queue",
            value: "3 Jobs",
            icon: RefreshCcw,
            color: "text-blue-500",
            bg: "bg-blue-50",
          },
          {
            label: "Ink Level",
            value: "82%",
            icon: Zap,
            color: "text-amber-500",
            bg: "bg-amber-50",
          },
          {
            label: "Total Today",
            value: "142 Prints",
            icon: CheckCircle2,
            color: "text-emerald-500",
            bg: "bg-emerald-50",
          },
        ].map((stat, i) => (
          <div
            key={i}
            className="p-6 bg-white border border-slate-200 rounded-[10px] flex items-center gap-6 shadow-sm"
          >
            <div
              className={cn(
                "h-14 w-14 rounded-[10px] flex items-center justify-center",
                stat.bg,
              )}
            >
              <stat.icon size={28} className={stat.color} strokeWidth={2.5} />
            </div>
            <div className="flex flex-col">
              <span className="text-[11px] font-extrabold text-slate-400 uppercase tracking-widest">
                {stat.label}
              </span>
              <span className="text-2xl font-black text-slate-800 tabular-nums">
                {stat.value}
              </span>
            </div>
          </div>
        ))}
      </div>

      <div className="bg-white rounded-[10px] border border-slate-200 overflow-hidden shadow-sm">
        <div className="px-8 py-6 bg-slate-50/50 border-b border-slate-100 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <History size={18} className="text-slate-400" />
            <h3 className="text-sm font-black tracking-tight text-slate-800 uppercase tracking-widest text-xs opacity-50">
              Local Print Queue
            </h3>
          </div>
          <button className="text-[10px] font-extrabold text-blue-600 uppercase tracking-widest flex items-center gap-2 hover:underline">
            <RefreshCcw size={12} />
            Clear History
          </button>
        </div>

        <div className="divide-y divide-slate-100">
          {pendingPrints.map((print) => (
            <div
              key={print.id}
              className="p-8 flex items-center justify-between hover:bg-slate-50 transition-all group"
            >
              <div className="flex items-center gap-6">
                <div className="h-14 w-14 bg-white rounded-[10px] flex items-center justify-center text-slate-400 border border-slate-100 shadow-sm group-hover:border-blue-200 transition-all">
                  <FileText size={24} />
                </div>
                <div className="flex flex-col gap-1">
                  <span className="text-[10px] font-black text-blue-600 bg-blue-50 px-2 py-0.5 rounded uppercase tracking-widest self-start">
                    {print.type.replace("_", " ")}
                  </span>
                  <div className="flex items-center gap-3">
                    <h4 className="text-lg font-black text-slate-800 tracking-tight">
                      {print.parcelId}
                    </h4>
                    <span className="text-xs font-bold text-slate-400">
                      # {print.id}
                    </span>
                  </div>
                </div>
              </div>
              <div className="flex items-center gap-4">
                <div className="text-right flex flex-col mr-4">
                  <span className="text-[10px] font-extrabold text-slate-400 uppercase tracking-wider">
                    Created AT
                  </span>
                  <span className="text-xs font-bold text-slate-600">
                    {format(print.created, "HH:mm:ss")}
                  </span>
                </div>
                <button
                  onClick={() => {
                    setIsPrinting(true);
                    setTimeout(() => setIsPrinting(false), 2000);
                  }}
                  className="h-12 w-12 rounded-[10px] bg-slate-900 flex items-center justify-center text-white shadow-xl shadow-slate-900/10 hover:bg-slate-800 transition-all active:scale-95"
                >
                  {isPrinting ? (
                    <RefreshCcw size={20} className="animate-spin" />
                  ) : (
                    <Printer size={20} />
                  )}
                </button>
              </div>
            </div>
          ))}
        </div>
      </div>

      <div className="flex justify-center">
        <p className="text-[10px] font-black text-slate-300 uppercase tracking-[0.2em]">
          mzg-thermal-driver v1.4 · ready to scale
        </p>
      </div>
    </div>
  );
}
