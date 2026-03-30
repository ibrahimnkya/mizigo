"use client";

import { LayoutGrid, List } from "lucide-react";
import { cn } from "@/lib/utils";

export type ViewType = "list" | "grid";

interface ViewToggleProps {
    view: ViewType;
    onChange: (view: ViewType) => void;
    className?: string;
}

export function ViewToggle({ view, onChange, className }: ViewToggleProps) {
    return (
        <div
            className={cn(
                "flex items-center p-1 bg-slate-100/50 rounded-lg border border-slate-200/50 backdrop-blur-sm",
                className
            )}
        >
            <button
                onClick={() => onChange("list")}
                className={cn(
                    "flex items-center justify-center w-8 h-8 rounded-md transition-all duration-200",
                    view === "list"
                        ? "bg-white text-blue-600 shadow-sm ring-1 ring-slate-200"
                        : "text-slate-500 hover:text-slate-900 hover:bg-white/50"
                )}
                title="List View"
            >
                <List size={18} strokeWidth={2.5} />
            </button>
            <button
                onClick={() => onChange("grid")}
                className={cn(
                    "flex items-center justify-center w-8 h-8 rounded-md transition-all duration-200",
                    view === "grid"
                        ? "bg-white text-blue-600 shadow-sm ring-1 ring-slate-200"
                        : "text-slate-500 hover:text-slate-900 hover:bg-white/50"
                )}
                title="Grid View"
            >
                <LayoutGrid size={18} strokeWidth={2.5} />
            </button>
        </div>
    );
}
