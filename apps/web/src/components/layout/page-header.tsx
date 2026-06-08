import { cn } from "@/lib/utils";

interface PageHeaderProps {
  title: string;
  description?: string;
  children?: React.ReactNode;
  className?: string;
}

export function PageHeader({
  title,
  description,
  children,
  className,
}: PageHeaderProps) {
  return (
    <div
      className={cn(
        "flex flex-col gap-4 md:flex-row md:items-center md:justify-between mb-8",
        className,
      )}
    >
      <div className="flex flex-col gap-1 text-left">
        <h1 className="text-2xl font-black tracking-tighter text-slate-900 sm:text-4xl md:text-5xl">
          {title}
        </h1>
        {description && (
          <p className="text-sm md:text-base lg:text-lg text-slate-500 font-medium max-w-[600px] leading-relaxed">
            {description}
          </p>
        )}
      </div>
      {children && (
        <div className="flex flex-wrap items-center gap-2 md:gap-3 w-full md:w-auto">
          {children}
        </div>
      )}
    </div>
  );
}
