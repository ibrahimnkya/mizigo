"use client";

import { useTheme } from "next-themes";
import { Toaster as Sonner } from "sonner";

type ToasterProps = React.ComponentProps<typeof Sonner>;

const Toaster = ({ ...props }: ToasterProps) => {
  const { theme = "system" } = useTheme();

  return (
    <Sonner
      theme={theme as ToasterProps["theme"]}
      className="toaster group"
      toastOptions={{
        classNames: {
          toast:
            "group toast group-[.toaster]:bg-slate-950 group-[.toaster]:text-slate-100 group-[.toaster]:border-slate-800/80 group-[.toaster]:shadow-[0_16px_64px_-8px_rgba(0,0,0,0.3)] group-[.toaster]:rounded-[10px] font-sans text-xs font-bold p-4 border backdrop-blur-md transition-all",
          description: "group-[.toast]:text-slate-400 text-[11px]",
          success:
            "group-[.toast]:border-emerald-500/30 group-[.toast]:bg-slate-950 group-[.toast]:text-emerald-400",
          error:
            "group-[.toast]:border-rose-500/30 group-[.toast]:bg-slate-950 group-[.toast]:text-rose-400",
          actionButton:
            "group-[.toast]:bg-primary group-[.toast]:text-primary-foreground",
          cancelButton:
            "group-[.toast]:bg-muted group-[.toast]:text-muted-foreground",
        },
      }}
      {...props}
    />
  );
};

export { Toaster };
