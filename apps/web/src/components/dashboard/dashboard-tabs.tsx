"use client";

import React from "react";
import { useRouter, useSearchParams } from "next/navigation";

export function DashboardTabs({
  tabs,
  tabParamName,
  activeTab,
}: {
  tabs: string[];
  tabParamName?: string;
  activeTab?: string;
}) {
  const router = useRouter();
  const searchParams = useSearchParams();

  const handleTabClick = (tab: string) => {
    if (!tabParamName) return;
    const params = new URLSearchParams(searchParams.toString());
    params.set(tabParamName, tab.toLowerCase());
    router.push(`?${params.toString()}`, { scroll: false });
  };

  const currentTab =
    activeTab ||
    (tabParamName ? searchParams.get(tabParamName) : null) ||
    tabs[0];

  return (
    <div className="flex gap-1 p-1 bg-slate-50 rounded-[12px] border border-slate-100 w-full mb-4">
      {tabs.map((t) => (
        <button
          key={t}
          onClick={() => handleTabClick(t)}
          className={`flex-1 py-2 text-[12px] font-bold rounded-[10px] uppercase tracking-widest transition-all ${
            t.toLowerCase() === currentTab?.toLowerCase()
              ? "bg-white text-blue-600 shadow-[0_2px_8px_rgba(37,99,235,0.08)] border border-slate-200"
              : "text-slate-400 hover:text-slate-600 hover:bg-slate-100/50"
          }`}
        >
          {t}
        </button>
      ))}
    </div>
  );
}
