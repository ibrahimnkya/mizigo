import { cn } from "@/lib/utils";

type StatusType =
  | "PENDING"
  | "IN_TRANSIT"
  | "AT_STATION"
  | "DELIVERED"
  | "CANCELLED"
  | "APPROVED"
  | "REJECTED"
  | "ACTIVE"
  | "INACTIVE"
  | "SUCCESS"
  | "FAILED";

interface StatusBadgeProps {
  status: StatusType | string;
  className?: string;
}

const statusConfig: Record<string, { label: string; className: string }> = {
  PENDING: {
    label: "Pending",
    className: "bg-amber-100 text-amber-700 border-amber-200",
  },
  IN_TRANSIT: {
    label: "In Transit",
    className: "bg-blue-100 text-blue-700 border-blue-200",
  },
  AT_STATION: {
    label: "At Station",
    className: "bg-indigo-100 text-indigo-700 border-indigo-200",
  },
  DELIVERED: {
    label: "Delivered",
    className: "bg-emerald-100 text-emerald-700 border-emerald-200",
  },
  CANCELLED: {
    label: "Cancelled",
    className: "bg-rose-100 text-rose-700 border-rose-200",
  },
  APPROVED: {
    label: "Approved",
    className: "bg-emerald-100 text-emerald-700 border-emerald-200",
  },
  REJECTED: {
    label: "Rejected",
    className: "bg-rose-100 text-rose-700 border-rose-200",
  },
  ACTIVE: {
    label: "Active",
    className: "bg-emerald-100 text-emerald-700 border-emerald-200",
  },
  INACTIVE: {
    label: "Inactive",
    className: "bg-slate-100 text-slate-700 border-slate-200",
  },
  SUCCESS: {
    label: "Success",
    className: "bg-emerald-100 text-emerald-700 border-emerald-200",
  },
  FAILED: {
    label: "Failed",
    className: "bg-rose-100 text-rose-700 border-rose-200",
  },
};

export function StatusBadge({ status, className }: StatusBadgeProps) {
  const config = statusConfig[status.toUpperCase()] || {
    label: status,
    className: "bg-slate-100 text-slate-700 border-slate-200",
  };

  const isPositiveConfig = [
    "ACTIVE",
    "SUCCESS",
    "DELIVERED",
    "APPROVED",
  ].includes(status.toUpperCase());
  const isNeutralConfig = ["PENDING", "IN_TRANSIT", "AT_STATION"].includes(
    status.toUpperCase(),
  );
  const dotColor = isPositiveConfig
    ? "bg-emerald-500 animate-pulse"
    : isNeutralConfig
      ? "bg-amber-500 animate-pulse"
      : "bg-rose-500";

  return (
    <div
      className={cn(
        "inline-flex items-center gap-2 px-3 py-1.5 rounded-[10px] border text-[10px] font-black uppercase tracking-widest shadow-sm",
        config.className,
        className,
      )}
    >
      <div className={cn("w-1.5 h-1.5 rounded-full shrink-0", dotColor)} />
      {config.label}
    </div>
  );
}
