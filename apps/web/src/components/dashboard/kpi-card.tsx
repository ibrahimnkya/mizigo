"use client";

import { useState, useEffect } from "react";
import { cn } from "@/lib/utils";
import * as Icons from "lucide-react";

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

interface KpiCardProps {
  label: string;
  value: number;
  iconName: string;
  accent: string;
  trend?: { value: string; up: boolean };
  seed: number;
}

export function KpiCard({
  label,
  value,
  iconName,
  accent,
  trend,
  seed,
}: KpiCardProps) {
  const counted = useCountUp(value, 1000);
  
  // Resolve Lucide Icon dynamically
  const Icon = (Icons as any)[iconName] || Icons.HelpCircle;

  return (
    <div className="group bg-white rounded-2xl border border-slate-100 p-5 flex flex-col justify-between hover:shadow-xl hover:border-slate-200 hover:-translate-y-0.5 transition-all duration-300 h-full relative overflow-hidden">
      {/* Top Row */}
      <div className="flex items-start justify-between">
        <div 
          className="w-9 h-9 rounded-xl flex items-center justify-center transition-all duration-300 group-hover:scale-110 shadow-sm"
          style={{ backgroundColor: `${accent}15`, color: accent }}
        >
          <Icon size={16} strokeWidth={2.5} />
        </div>
        {trend && (
          <span className={cn(
            "text-[9px] font-bold uppercase tracking-[0.18em] px-2.5 py-1.5 rounded-md border",
            trend.up 
              ? "bg-emerald-50 text-emerald-600 border-emerald-100" 
              : "bg-rose-50 text-rose-600 border-rose-100"
          )}>
            {trend.value}
          </span>
        )}
      </div>

      {/* Main Content */}
      <div className="mt-4 flex-1 flex flex-col justify-between">
        <div>
          {/* Primary value */}
          <p 
            className="text-[26px] font-black tracking-tight leading-none tabular-nums"
            style={{ color: accent }}
          >
            {counted.toLocaleString()}
          </p>
          
          {/* Title / Label */}
          <h3 className="text-[13px] font-black text-slate-800 tracking-tight mt-3">
            {label}
          </h3>
          <p className="text-[10px] font-bold text-slate-400 mt-1 leading-normal uppercase tracking-wider">
            Operational Metric
          </p>
        </div>

        {/* Sparkline */}
        <div className="mt-4 space-y-3">
          <div className="opacity-40 group-hover:opacity-100 transition-opacity duration-300">
            <Sparkline color={accent} seed={seed} />
          </div>
        </div>
      </div>

      {/* Bottom accent glow */}
      <div 
        className="absolute bottom-0 left-0 right-0 h-[3px] opacity-0 group-hover:opacity-100 transition-opacity duration-300" 
        style={{ backgroundColor: accent }}
      />
    </div>
  );
}
