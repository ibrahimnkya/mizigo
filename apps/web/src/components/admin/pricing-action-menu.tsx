"use client";

import { useState } from "react";
import {
  MoreVertical,
  Edit2,
  Trash2,
  ShieldAlert,
  Loader2,
} from "lucide-react";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
  DropdownMenuSeparator,
} from "@repo/ui/dropdown-menu";
import { useDeletePricingRule } from "@/modules/pricing/use-pricing";
import { cn } from "@/lib/utils";

interface PricingActionMenuProps {
  rule: any;
  onEdit: (rule: any) => void;
}

export function PricingActionMenu({ rule, onEdit }: PricingActionMenuProps) {
  const deleteMutation = useDeletePricingRule();
  const [isDeleting, setIsDeleting] = useState(false);

  const handleDelete = async () => {
    if (!confirm(`Are you sure you want to delete "${rule.name}"?`)) return;

    setIsDeleting(true);
    try {
      await deleteMutation.mutateAsync(rule.id);
    } catch (err) {
      console.error("Failed to delete rule", err);
      alert("Failed to delete rule.");
    } finally {
      setIsDeleting(false);
    }
  };

  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <button className="h-9 w-9 flex items-center justify-center hover:bg-slate-900 hover:text-white rounded-[10px] transition-all border border-slate-100 bg-white shadow-sm active:scale-95 group/btn">
          {isDeleting ? (
            <Loader2 className="h-4 w-4 animate-spin text-blue-600" />
          ) : (
            <MoreVertical className="h-4 w-4 text-slate-400 group-hover/btn:text-white transition-colors" />
          )}
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
          onClick={() => onEdit(rule)}
          className="flex items-center gap-3 px-3 py-2.5 rounded-[10px] text-[12px] font-bold text-slate-600 hover:bg-blue-50 hover:text-blue-600 focus:bg-blue-50 focus:text-blue-600 transition-colors cursor-pointer outline-none"
        >
          <Edit2 size={14} strokeWidth={2.5} />
          Edit Rule
        </DropdownMenuItem>

        <DropdownMenuItem
          onClick={handleDelete}
          className="flex items-center gap-3 px-3 py-2.5 rounded-[10px] text-[12px] font-bold text-rose-600 hover:bg-rose-50 focus:bg-rose-50 transition-colors cursor-pointer outline-none"
        >
          <Trash2 size={14} strokeWidth={2.5} />
          Delete Rule
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
