"use client";

import { Eye, MoreVertical, ShieldAlert } from "lucide-react";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
  DropdownMenuSeparator,
} from "@repo/ui/dropdown-menu";

interface PricingActionMenuProps {
  rule: any;
  onView: (rule: any) => void;
}

export function PricingActionMenu({ rule, onView }: PricingActionMenuProps) {
  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <button
          onClick={(e) => e.stopPropagation()}
          className="h-9 w-9 flex items-center justify-center hover:bg-slate-900 hover:text-white rounded-[10px] transition-all border border-slate-100 bg-white shadow-sm active:scale-95 group/btn"
        >
          <MoreVertical className="h-4 w-4 text-slate-400 group-hover/btn:text-white transition-colors" />
        </button>
      </DropdownMenuTrigger>
      <DropdownMenuContent
        align="end"
        className="w-56 p-2 bg-white border border-slate-100 rounded-[10px] shadow-2xl animate-in zoom-in-95 duration-200"
      >
        <div className="px-3 py-2">
          <p className="text-[10px] font-black text-slate-400 uppercase tracking-widest leading-none mb-1">
            Options
          </p>
          <p className="text-[12px] font-bold text-slate-900 truncate">
            {rule.name}
          </p>
        </div>
        <DropdownMenuSeparator className="bg-slate-50 mx-[-8px] my-2" />

        <DropdownMenuItem
          onClick={() => onView(rule)}
          className="flex items-center gap-3 px-3 py-2.5 rounded-[10px] text-[12px] font-bold text-slate-600 hover:bg-slate-50 hover:text-slate-900 focus:bg-slate-50 focus:text-slate-900 transition-colors cursor-pointer outline-none"
        >
          <Eye size={14} strokeWidth={2.5} />
          View Details
        </DropdownMenuItem>

        <DropdownMenuSeparator className="bg-slate-50 mx-[-8px] my-2" />

        <DropdownMenuItem className="flex items-center gap-3 px-3 py-2.5 rounded-[10px] text-[10px] font-black text-slate-400 uppercase tracking-widest hover:bg-slate-50 transition-colors cursor-default outline-none">
          <ShieldAlert size={12} strokeWidth={3} />
          Audit Logs
        </DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  );
}
