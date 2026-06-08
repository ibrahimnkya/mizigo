"use client";

import * as React from "react";
import { ChevronLeft, ChevronRight } from "lucide-react";
import { DayPicker, DayButton, DayButtonProps } from "react-day-picker";

import { cn } from "@/lib/utils";
import { buttonVariants } from "@repo/ui/button";

export type CalendarProps = React.ComponentProps<typeof DayPicker>;

function Calendar({
  className,
  classNames,
  showOutsideDays = true,
  ...props
}: CalendarProps) {
  return (
    <DayPicker
      showOutsideDays={showOutsideDays}
      className={cn("p-4", className)}
      classNames={{
        months: "flex flex-col sm:flex-row space-y-4 sm:space-x-8 sm:space-y-0",
        month: "space-y-4",
        caption: "flex justify-center pt-1 relative items-center mb-4",
        caption_label:
          "text-[13px] font-black uppercase tracking-[0.2em] text-slate-900",
        nav: "space-x-1 flex items-center",
        nav_button: cn(
          buttonVariants({ variant: "outline" }),
          "h-7 w-7 bg-transparent p-0 opacity-40 hover:opacity-100 border-slate-100 rounded-[8px] hover:bg-slate-50 transition-all",
        ),
        nav_button_previous: "absolute left-1",
        nav_button_next: "absolute right-1",
        month_grid: "w-full border-collapse space-y-1",
        weekdays: "flex",
        weekday:
          "text-slate-300 rounded-md w-9 font-black text-[9px] uppercase tracking-widest text-center",
        week: "flex w-full mt-2",
        day: cn(
          buttonVariants({ variant: "ghost" }),
          "h-9 w-9 p-0 font-bold aria-selected:opacity-100 rounded-[10px] hover:bg-slate-900 hover:text-white transition-all flex flex-col items-center justify-center group",
        ),
        day_range_start: "day-range-start",
        day_range_end: "day-range-end",
        day_selected:
          "bg-slate-900 text-white hover:bg-slate-900 hover:text-white focus:bg-slate-900 focus:text-white shadow-lg shadow-slate-900/10",
        day_today: "bg-blue-50/50 text-blue-600 font-black",
        day_outside:
          "day-outside text-slate-200 opacity-30 aria-selected:bg-slate-50/50 aria-selected:text-slate-300 aria-selected:opacity-20",
        day_disabled: "text-slate-200 opacity-50",
        day_range_middle:
          "aria-selected:bg-slate-50 aria-selected:text-slate-900",
        day_hidden: "invisible",
        ...classNames,
      }}
      components={{
        Chevron: ({ orientation }) => {
          const Icon = orientation === "left" ? ChevronLeft : ChevronRight;
          return <Icon className="h-4 w-4" />;
        },
        DayButton: (props) => <CalendarDayButton {...props} />,
      }}
      {...props}
    />
  );
}
Calendar.displayName = "Calendar";

function CalendarDayButton({
  day,
  modifiers,
  className,
  children,
  ...props
}: DayButtonProps) {
  return (
    <DayButton
      day={day}
      modifiers={modifiers}
      className={cn(className)}
      {...props}
    >
      <span className="text-[13px] group-active:scale-90 transition-transform">
        {children}
      </span>
    </DayButton>
  );
}
CalendarDayButton.displayName = "CalendarDayButton";

export { Calendar, CalendarDayButton };
