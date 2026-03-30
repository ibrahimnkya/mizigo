"use client"

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

    const currentTab = activeTab || (tabParamName ? searchParams.get(tabParamName) : null) || tabs[0];

    return (
        <div className="flex gap-0.5 p-0.5 bg-slate-50 rounded-[8px] border border-slate-100">
            {tabs.map((t) => (
                <button
                    key={t}
                    onClick={() => handleTabClick(t)}
                    className={`px-3 py-1 text-[11px] font-bold rounded-[6px] transition-all ${t.toLowerCase() === currentTab?.toLowerCase()
                            ? "bg-white text-indigo-600 shadow-[0_2px_4px_rgba(37,99,235,0.06)] border border-slate-100"
                            : "text-slate-400 hover:text-slate-600"
                        }`}
                >
                    {t}
                </button>
            ))}
        </div>
    );
}
