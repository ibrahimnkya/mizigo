"use client";

import * as React from "react";
import { ChevronDown, Check, LucideIcon } from "lucide-react";
import { cn } from "@/lib/utils";

interface EntityOption {
  id: string;
  name: string;
  description?: string;
  icon?: LucideIcon;
}

interface EntitySelectProps {
  label: string;
  options: EntityOption[];
  value?: string;
  onChange?: (value: string) => void;
  placeholder?: string;
  icon?: LucideIcon;
  loading?: boolean;
  error?: string | null;
  name?: string;
}

export function EntitySelect({
  label,
  options,
  value: externalValue,
  onChange: externalOnChange,
  placeholder = "Select option...",
  icon: Icon,
  loading = false,
  error = null,
  name,
}: EntitySelectProps) {
  const [internalValue, setInternalValue] = React.useState("");
  const isControlled =
    externalValue !== undefined && externalOnChange !== undefined;
  const activeValue = isControlled ? externalValue : internalValue;

  const [isOpen, setIsOpen] = React.useState(false);
  const containerRef = React.useRef<HTMLDivElement>(null);

  const selectedOption = options.find((opt) => opt.id === activeValue);

  React.useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (
        containerRef.current &&
        !containerRef.current.contains(event.target as Node)
      ) {
        setIsOpen(false);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  return (
    <div className="relative space-y-2" ref={containerRef}>
      {name && <input type="hidden" name={name} value={activeValue} />}
      <label className="text-[10px] font-black text-slate-400 uppercase tracking-[0.25em] mb-3 block ml-1">
        {label}
      </label>

      <button
        type="button"
        onClick={() => !loading && setIsOpen(!isOpen)}
        className={cn(
          "w-full h-14 bg-slate-50 border border-slate-100 rounded-[10px] px-5 flex items-center justify-between transition-all group",
          isOpen
            ? "ring-4 ring-blue-500/10 border-blue-500/30 bg-white shadow-lg"
            : "hover:bg-white hover:border-slate-200",
          loading && "opacity-50 cursor-not-allowed",
          error && "border-rose-200 bg-rose-50/30",
        )}
      >
        <div className="flex items-center gap-3">
          {Icon && (
            <div
              className={cn(
                "w-8 h-8 rounded-[10px] flex items-center justify-center transition-all",
                isOpen
                  ? "bg-blue-600 text-white"
                  : "bg-white text-slate-400 group-hover:text-slate-900 border border-slate-100",
              )}
            >
              <Icon size={16} strokeWidth={2.5} />
            </div>
          )}
          <span
            className={cn(
              "text-[14px] font-bold tracking-tight",
              selectedOption ? "text-slate-900" : "text-slate-400",
            )}
          >
            {selectedOption ? selectedOption.name : placeholder}
          </span>
        </div>
        <ChevronDown
          size={16}
          strokeWidth={3}
          className={cn(
            "text-slate-300 transition-transform duration-300",
            isOpen && "rotate-180 text-blue-600",
          )}
        />
      </button>

      {/* Dropdown Panel */}
      {isOpen && (
        <div className="absolute z-[100] w-full mt-2 bg-white border border-slate-100 rounded-[10px] shadow-[0_20px_50px_-20px_rgba(0,0,0,0.15)] overflow-hidden animate-in fade-in zoom-in-95 duration-200 origin-top">
          <div className="max-h-[280px] overflow-y-auto p-1.5 custom-scrollbar">
            {options.length === 0 ? (
              <div className="py-8 px-4 text-center">
                <p className="text-[11px] font-black text-slate-300 uppercase tracking-widest">
                  No options identified
                </p>
              </div>
            ) : (
              options.map((option) => (
                <button
                  key={option.id}
                  type="button"
                  onClick={() => {
                    if (isControlled && externalOnChange) {
                      externalOnChange(option.id);
                    } else {
                      setInternalValue(option.id);
                    }
                    setIsOpen(false);
                  }}
                  className={cn(
                    "w-full flex items-center justify-between p-3 rounded-[10px] transition-all group/opt text-left mb-0.5 last:mb-0",
                    activeValue === option.id
                      ? "bg-blue-50 text-blue-700"
                      : "hover:bg-slate-50 text-slate-600 hover:text-slate-900",
                  )}
                >
                  <div className="flex items-center gap-3">
                    <div
                      className={cn(
                        "w-8 h-8 rounded-[10px] flex items-center justify-center transition-all",
                        activeValue === option.id
                          ? "bg-blue-600 text-white"
                          : "bg-slate-100 text-slate-400 group-hover/opt:bg-white group-hover/opt:text-slate-900",
                      )}
                    >
                      {option.icon ? (
                        <option.icon size={14} />
                      ) : (
                        <div className="w-1.5 h-1.5 rounded-full bg-current" />
                      )}
                    </div>
                    <div className="flex flex-col">
                      <span className="text-[13px] font-black uppercase tracking-tight leading-none mb-1">
                        {option.name}
                      </span>
                      {option.description && (
                        <span className="text-[10px] font-bold text-slate-400 group-hover/opt:text-slate-500">
                          {option.description}
                        </span>
                      )}
                    </div>
                  </div>
                  {activeValue === option.id && (
                    <Check
                      size={14}
                      strokeWidth={4}
                      className="text-blue-600"
                    />
                  )}
                </button>
              ))
            )}
          </div>
        </div>
      )}

      {error && (
        <p className="text-[11px] font-bold text-rose-500 ml-1">{error}</p>
      )}

      <style jsx global>{`
        .custom-scrollbar::-webkit-scrollbar {
          width: 4px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
          background: transparent;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
          background: #f1f5f9;
          border-radius: 20px;
        }
      `}</style>
    </div>
  );
}
