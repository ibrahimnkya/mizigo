import { cn } from "@/lib/utils";

interface PageHeaderProps {
  title: string;
  description?: string;
  children?: React.ReactNode;
  className?: string;
}

export function PageHeader({ title, description, children, className }: PageHeaderProps) {
  return (
    <div
      className={cn(
        "flex flex-col sm:flex-row sm:items-start sm:justify-between gap-3 pb-5 mb-6 border-b border-slate-200",
        className,
      )}
    >
      <div className="flex flex-col gap-0.5 min-w-0">
        <h1 className="text-[20px] font-semibold text-slate-800 leading-tight tracking-tight">
          {title}
        </h1>
        {description && (
          <p className="text-[13px] text-slate-500 leading-normal max-w-[540px]">
            {description}
          </p>
        )}
      </div>
      {children && (
        <div className="flex flex-wrap items-center gap-2 shrink-0">
          {children}
        </div>
      )}
    </div>
  );
}
