"use client";

import { useState, useEffect } from "react";
import { cn } from "@/lib/utils";
import * as Icons from "lucide-react";

function useCountUp(target: number, duration = 1000): number {
  const [value, setValue] = useState(0);
  useEffect(() => {
    if (!target) { setValue(0); return; }
    const steps = 36;
    const increment = target / steps;
    let current = 0;
    const timer = setInterval(() => {
      current += increment;
      if (current >= target) { setValue(target); clearInterval(timer); }
      else setValue(Math.floor(current));
    }, duration / steps);
    return () => clearInterval(timer);
  }, [target, duration]);
  return value;
}

interface KpiCardProps {
  label: string;
  value: number;
  iconName: string;
  accent: string;
  trend?: { value: string; up: boolean };
  seed: number;
}

export function KpiCard({ label, value, iconName, accent, trend, seed }: KpiCardProps) {
  const counted = useCountUp(value, 1000);
  const Icon = (Icons as any)[iconName] || Icons.HelpCircle;

  return (
    <div className="bg-white border border-[#E2E2E2] rounded-[20px] p-5 flex flex-col gap-4">
      <div className="flex items-start justify-between">
        <div
          className="h-8 w-8 rounded-xl flex items-center justify-center shrink-0"
          style={{ backgroundColor: `${accent}15`, color: accent }}
        >
          <Icon size={15} strokeWidth={2} />
        </div>
        {trend && (
          <span className={cn(
            "inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border leading-none",
            trend.up
              ? "bg-green-50 text-green-700 border-green-100"
              : "bg-red-50 text-red-700 border-red-100",
          )}>
            {trend.value}
          </span>
        )}
      </div>

      <div>
        <p className="text-[26px] font-semibold tabular-nums leading-none" style={{ color: accent }}>
          {counted.toLocaleString()}
        </p>
        <p className="text-[13px] font-medium text-slate-700 mt-1.5 leading-tight">{label}</p>
        <p className="text-[11px] text-slate-400 mt-0.5">Operational metric</p>
      </div>
    </div>
  );
}
