"use client";

import { useEffect, useState } from "react";
import { Check, ChevronDown } from "lucide-react";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuTrigger,
} from "@repo/ui/dropdown-menu";
import { cn } from "@/lib/utils";

/** Same three themes as the mobile app. */
export const THEMES = [
  { key: "trc", title: "TRC Default", subtitle: "TRC-branded theme", swatch: ["#5C0B19", "#F78A1F"] },
  { key: "midnight", title: "Mid-Night", subtitle: "Dark, for low light", swatch: ["#161616", "#F78A1F"] },
  { key: "daylight", title: "Daylight", subtitle: "Bright, for daytime", swatch: ["#F3F3F3", "#5C0B19"] },
] as const;
export type ThemeKey = (typeof THEMES)[number]["key"];

function readTheme(): ThemeKey {
  if (typeof document === "undefined") return "daylight";
  const t = document.documentElement.dataset.theme;
  return (THEMES.some((x) => x.key === t) ? t : "daylight") as ThemeKey;
}

function Swatch({ colors, size = 20 }: { colors: readonly string[]; size?: number }) {
  return (
    <span
      className="relative inline-flex shrink-0 overflow-hidden rounded-full ring-1 ring-black/10"
      style={{ width: size, height: size, background: colors[0] }}
    >
      <span className="absolute bottom-0 right-0 h-1/2 w-1/2 rounded-tl-full" style={{ background: colors[1] }} />
    </span>
  );
}

/** Marks <body> as portal so popovers/menus rendered outside the layout are themed too. */
export function PortalScope() {
  useEffect(() => {
    document.body.classList.add("portal");
    return () => document.body.classList.remove("portal");
  }, []);
  return null;
}

export function ThemeSwitcher() {
  const [theme, setTheme] = useState<ThemeKey>("daylight");
  useEffect(() => setTheme(readTheme()), []);

  const choose = (key: ThemeKey) => {
    document.documentElement.dataset.theme = key;
    try {
      localStorage.setItem("mzg-theme", key);
    } catch {}
    setTheme(key);
  };

  const current = THEMES.find((t) => t.key === theme)!;

  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <button
          aria-label={`Theme: ${current.title}`}
          className="group flex h-10 items-center gap-2 rounded-full border border-[#E2E2E2] bg-white pl-2 pr-3 text-[13px] font-medium text-slate-600 outline-none transition hover:border-orange-300 hover:bg-slate-50 focus-visible:ring-4 focus-visible:ring-orange-500/20 data-[state=open]:border-orange-500 data-[state=open]:ring-4 data-[state=open]:ring-orange-500/15"
        >
          <Swatch colors={current.swatch} />
          <span className="hidden xl:inline">{current.title}</span>
          <ChevronDown size={14} className="text-slate-400 transition-transform group-data-[state=open]:rotate-180" />
        </button>
      </DropdownMenuTrigger>
      <DropdownMenuContent
        align="end"
        sideOffset={8}
        className="z-50 w-64 rounded-2xl border border-[#E2E2E2] bg-white p-1.5 shadow-premium"
      >
        <DropdownMenuLabel className="px-3 py-2 text-[12px] font-medium uppercase tracking-[0.08em] text-slate-400">
          Theme
        </DropdownMenuLabel>
        {THEMES.map((t) => (
          <DropdownMenuItem
            key={t.key}
            onClick={() => choose(t.key)}
            aria-checked={theme === t.key}
            role="menuitemradio"
            className={cn(
              "mb-1 flex cursor-pointer items-center gap-3 rounded-xl border px-3 py-2.5 outline-none transition last:mb-0",
              "focus:bg-slate-50 focus:text-inherit data-[highlighted]:bg-slate-50",
              theme === t.key ? "border-orange-500 bg-orange-50" : "border-transparent",
            )}
          >
            <Swatch colors={t.swatch} size={30} />
            <span className="min-w-0 flex-1">
              <span className="block text-[14px] font-semibold text-[#1C1C1E]">{t.title}</span>
              <span className="block text-[12px] text-slate-500">{t.subtitle}</span>
            </span>
            <span
              className={cn(
                "flex h-5 w-5 shrink-0 items-center justify-center rounded-full border-2 transition",
                theme === t.key ? "border-orange-500 bg-orange-500 text-white" : "border-slate-300",
              )}
            >
              {theme === t.key && <Check size={12} strokeWidth={3} />}
            </span>
          </DropdownMenuItem>
        ))}
      </DropdownMenuContent>
    </DropdownMenu>
  );
}
