"use client";

import { useState, useCallback, useMemo } from "react";
import { useRouter } from "next/navigation";
import { useSession } from "next-auth/react";
import {
  CheckCircle2,
  XCircle,
  Eye,
  Loader2,
  ArrowUpRight,
  Package,
  Info,
  Filter,
  Building2,
  Layers,
  Zap,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { DataTable } from "@/components/shared/data-table";

// ── Status config ──────────────────────────────────────────────────────────────

const STATUS_META: Record<
  string,
  { label: string; dot: string; className: string }
> = {
  PENDING: {
    label: "Pending",
    dot: "bg-amber-400",
    className: "bg-amber-50 text-amber-700 border-amber-200/60",
  },
  RECEIVED: {
    label: "Received",
    dot: "bg-blue-500",
    className: "bg-blue-50 text-blue-700 border-blue-200/60",
  },
  APPROVED: {
    label: "Approved",
    dot: "bg-sky-500",
    className: "bg-sky-50 text-sky-700 border-sky-200/60",
  },
  PAYMENT_PENDING: {
    label: "Awaiting Payment",
    dot: "bg-violet-500",
    className: "bg-violet-50 text-violet-700 border-violet-200/60",
  },
  PAID: {
    label: "Paid",
    dot: "bg-emerald-500",
    className: "bg-emerald-50 text-emerald-700 border-emerald-200/60",
  },
  DISPATCHED: {
    label: "Dispatched",
    dot: "bg-indigo-500",
    className: "bg-indigo-50 text-indigo-700 border-indigo-200/60",
  },
  OFFLOADED: {
    label: "Offloaded",
    dot: "bg-amber-600",
    className: "bg-amber-50 text-amber-800 border-amber-200/60",
  },
  IN_TRANSIT: {
    label: "In Transit",
    dot: "bg-blue-600",
    className: "bg-blue-50 text-blue-800 border-blue-200/60",
  },
  AT_STATION: {
    label: "At Station",
    dot: "bg-teal-500",
    className: "bg-teal-50 text-teal-700 border-teal-200/60",
  },
  DELAYED: {
    label: "Delayed",
    dot: "bg-rose-500",
    className: "bg-rose-50 text-rose-700 border-rose-200/60",
  },
  DELIVERED: {
    label: "Delivered",
    dot: "bg-emerald-400",
    className: "bg-emerald-50 text-emerald-700 border-emerald-200/60",
  },
  REJECTED: {
    label: "Rejected",
    dot: "bg-rose-500",
    className: "bg-rose-50 text-rose-700 border-rose-200/60",
  },
  CANCELED: {
    label: "Cancelled",
    dot: "bg-slate-300",
    className: "bg-slate-50 text-slate-500 border-slate-200/60",
  },
  LOST: {
    label: "Lost",
    dot: "bg-slate-900",
    className: "bg-slate-900 text-white border-slate-700",
  },
};

function StatusBadge({ status }: { status: string }) {
  const meta = STATUS_META[status] ?? {
    label: status,
    dot: "bg-slate-400",
    className: "bg-slate-50 text-slate-600 border-slate-200",
  };
  return (
    <span
      className={cn(
        "inline-flex items-center gap-1.5 px-2.5 py-1 rounded-[10px] text-[10px] font-black border tracking-widest uppercase",
        meta.className,
      )}
    >
      <span className={cn("w-1.5 h-1.5 rounded-full shrink-0", meta.dot)} />
      {meta.label}
    </span>
  );
}

// ── Types ──────────────────────────────────────────────────────────────────────

export interface ParcelItem {
  id: string;
  fromAddress: string;
  toAddress: string;
  serviceType: string;
  parcelType: string;
  parcelSize: string;
  condition?: string | null;
  urgency?: string | null;
  status: string;
  wagonType?: string | null;
  amount?: number | null;
  receiverName: string;
  receiverPhone?: string;
  peopleNeeded?: number;
  createdAt: string;
  user?: { name: string; email: string; phone?: string | null } | null;
  payment?: { status: string; transactionReference?: string | null } | null;
  organization?: { id: string; name: string } | null;
  origin?: { id: string; name: string } | null;
  destination?: { id: string; name: string } | null;
}

// ── Modals ─────────────────────────────────────────────────────────────────────

function ApproveModal({
  parcel,
  onClose,
  onSuccess,
}: {
  parcel: ParcelItem;
  onClose: () => void;
  onSuccess: () => void;
}) {
  const [amount, setAmount] = useState(parcel.amount?.toString() ?? "");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const handleApprove = async () => {
    if (!amount || isNaN(Number(amount)) || Number(amount) <= 0) {
      setError("Please enter a valid amount.");
      return;
    }
    setLoading(true);
    setError("");
    try {
      const res = await fetch(`/api/parcel/${parcel.id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ status: "APPROVED", amount: Number(amount) }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error ?? "Failed to approve");
      onSuccess();
      onClose();
    } catch (e: any) {
      setError(e.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <div
        className="absolute inset-0 bg-slate-900/50 backdrop-blur-[2px]"
        onClick={onClose}
      />
      <div className="relative z-10 bg-white rounded-[12px] shadow-[0_24px_64px_rgba(0,0,0,0.14)] w-full max-w-md overflow-hidden">
        <div className="h-1 bg-gradient-to-r from-emerald-400 to-emerald-500" />
        <div className="px-6 pt-5 pb-4 border-b border-slate-50 flex items-center gap-3">
          <div className="w-9 h-9 bg-emerald-50 rounded-[10px] flex items-center justify-center shrink-0">
            <CheckCircle2 size={17} className="text-emerald-600" />
          </div>
          <div>
            <h2 className="text-[15px] font-extrabold text-slate-900 tracking-tight">
              Approve Request
            </h2>
            <p className="text-[12px] text-slate-400 font-mono mt-0.5">
              #{parcel.id.slice(-8).toUpperCase()}
            </p>
          </div>
        </div>
        <div className="px-6 py-5 space-y-4">
          <div className="bg-slate-50 rounded-[10px] p-4 flex flex-col gap-2">
            <div className="flex items-center gap-2.5 text-[13px] font-semibold text-slate-700">
              <div className="w-2 h-2 rounded-full bg-indigo-500 shrink-0" />
              {parcel.fromAddress}
            </div>
            <div className="ml-[3px] h-4 border-l-2 border-dashed border-slate-200" />
            <div className="flex items-center gap-2.5 text-[13px] font-medium text-slate-500">
              <div className="w-2 h-2 rounded-full bg-slate-300 shrink-0" />
              {parcel.toAddress}
            </div>
          </div>
          <div>
            <label className="block text-[11px] font-extrabold text-slate-500 uppercase tracking-wider mb-2">
              Payment Amount (TZS) *
            </label>
            <div className="relative">
              <span className="absolute left-3.5 top-1/2 -translate-y-1/2 text-[12px] font-extrabold text-slate-400">
                TZS
              </span>
              <input
                type="number"
                value={amount}
                onChange={(e) => setAmount(e.target.value)}
                className="w-full pl-14 pr-4 py-3 bg-slate-50 border border-slate-200 rounded-[10px] text-slate-900 font-bold text-sm focus:outline-none focus:ring-2 focus:ring-indigo-400 transition-colors"
              />
            </div>
          </div>
          {error && (
            <p className="text-[12px] text-rose-600 bg-rose-50 px-3 py-2 rounded-[10px] font-semibold">
              {error}
            </p>
          )}
        </div>
        <div className="px-6 pb-6 flex gap-2.5">
          <button
            onClick={onClose}
            className="flex-1 py-2.5 border border-slate-200 rounded-[10px] text-[13px] font-bold text-slate-500 hover:bg-slate-50 transition-colors"
          >
            Cancel
          </button>
          <button
            onClick={handleApprove}
            disabled={loading}
            className="flex-1 py-2.5 bg-emerald-600 hover:bg-emerald-700 disabled:opacity-60 text-white rounded-[10px] text-[13px] font-extrabold transition-colors flex items-center justify-center gap-2"
          >
            {loading ? (
              <Loader2 size={14} className="animate-spin" />
            ) : (
              <CheckCircle2 size={14} />
            )}{" "}
            Approve
          </button>
        </div>
      </div>
    </div>
  );
}

function RejectModal({
  parcel,
  onClose,
  onSuccess,
}: {
  parcel: ParcelItem;
  onClose: () => void;
  onSuccess: () => void;
}) {
  const [reason, setReason] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const handleReject = async () => {
    if (!reason.trim()) {
      setError("Please provide a rejection reason.");
      return;
    }
    setLoading(true);
    setError("");
    try {
      const res = await fetch(`/api/parcel/${parcel.id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ status: "REJECTED", reason }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error ?? "Failed to reject");
      onSuccess();
      onClose();
    } catch (e: any) {
      setError(e.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <div
        className="absolute inset-0 bg-slate-900/50 backdrop-blur-[2px]"
        onClick={onClose}
      />
      <div className="relative z-10 bg-white rounded-[12px] shadow-[0_24px_64px_rgba(0,0,0,0.14)] w-full max-w-md overflow-hidden">
        <div className="h-1 bg-gradient-to-r from-rose-400 to-rose-500" />
        <div className="px-6 pt-5 pb-4 border-b border-slate-50 flex items-center gap-3">
          <div className="w-9 h-9 bg-rose-50 rounded-[10px] flex items-center justify-center shrink-0">
            <XCircle size={17} className="text-rose-600" />
          </div>
          <div>
            <h2 className="text-[15px] font-extrabold text-slate-900 tracking-tight">
              Reject Request
            </h2>
            <p className="text-[12px] text-slate-400 font-mono mt-0.5">
              #{parcel.id.slice(-8).toUpperCase()}
            </p>
          </div>
        </div>
        <div className="px-6 py-5 space-y-3">
          <textarea
            value={reason}
            onChange={(e) => setReason(e.target.value)}
            rows={4}
            placeholder="Provide a clear reason for the customer..."
            className="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-[10px] text-slate-900 text-[13px] focus:outline-none focus:ring-2 focus:ring-rose-400 resize-none transition-colors"
          />
          {error && (
            <p className="text-[12px] text-rose-600 bg-rose-50 px-3 py-2 rounded-[10px] font-semibold">
              {error}
            </p>
          )}
        </div>
        <div className="px-6 pb-6 flex gap-2.5">
          <button
            onClick={onClose}
            className="flex-1 py-2.5 border border-slate-200 rounded-[10px] text-[13px] font-bold text-slate-500 hover:bg-slate-50 transition-colors"
          >
            Cancel
          </button>
          <button
            onClick={handleReject}
            disabled={loading}
            className="flex-1 py-2.5 bg-rose-600 hover:bg-rose-700 disabled:opacity-60 text-white rounded-[10px] text-[13px] font-extrabold transition-colors flex items-center justify-center gap-2"
          >
            {loading ? (
              <Loader2 size={14} className="animate-spin" />
            ) : (
              <XCircle size={14} />
            )}{" "}
            Reject
          </button>
        </div>
      </div>
    </div>
  );
}

// ── Filter Bar ─────────────────────────────────────────────────────────────────

function FilterSelect({
  icon: Icon,
  label,
  value,
  onChange,
  options,
}: {
  icon: React.ElementType;
  label: string;
  value: string;
  onChange: (v: string) => void;
  options: { label: string; value: string }[];
}) {
  return (
    <div className="relative flex items-center h-9 bg-slate-50 border border-slate-200 rounded-[10px] min-w-[180px]">
      <Icon size={12} className="absolute left-3 text-slate-400 pointer-events-none" />
      <select
        value={value}
        onChange={(e) => onChange(e.target.value)}
        className="w-full h-full pl-8 pr-8 bg-transparent border-none text-[12px] font-bold text-slate-600 outline-none cursor-pointer appearance-none"
      >
        <option value="" className="text-slate-900 bg-white font-normal normal-case tracking-normal">
          {label}
        </option>
        {options.map((o) => (
          <option
            key={o.value}
            value={o.value}
            className="text-slate-900 bg-white font-normal normal-case tracking-normal"
          >
            {o.label}
          </option>
        ))}
      </select>
      <div className="absolute right-3 pointer-events-none text-slate-400">
        <svg
          width="8"
          height="8"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          strokeWidth="3"
          strokeLinecap="round"
          strokeLinejoin="round"
        >
          <polyline points="6 9 12 15 18 9" />
        </svg>
      </div>
    </div>
  );
}

// ── Main Component ─────────────────────────────────────────────────────────────

export function ParcelAdminTable({
  initialItems,
}: {
  initialItems: ParcelItem[];
}) {
  const router = useRouter();
  const { data: session } = useSession();
  const isSuperAdmin = (session?.user as any)?.role === "SUPER_ADMIN";

  const [approveTarget, setApproveTarget] = useState<ParcelItem | null>(null);
  const [rejectTarget, setRejectTarget] = useState<ParcelItem | null>(null);
  const refresh = useCallback(() => router.refresh(), [router]);

  // ── Filters ────────────────────────────────────────────────────────────────
  const [filterCompany, setFilterCompany] = useState("");
  const [filterService, setFilterService] = useState("");
  const [filterParcelType, setFilterParcelType] = useState("");
  const [filterOrigin, setFilterOrigin] = useState("");
  const [filterDestination, setFilterDestination] = useState("");

  // Derive unique values for filter options from data
  const companyOptions = useMemo(() => {
    const names = [
      ...new Set(
        initialItems.map((i) => (i as any).organization?.name || i.user?.name).filter(Boolean) as string[],
      ),
    ];
    return names.map((n) => ({ label: n, value: n }));
  }, [initialItems]);

  const serviceOptions = useMemo(() => {
    const types = [
      ...new Set(initialItems.map((i) => i.serviceType).filter(Boolean)),
    ];
    return types.map((t) => ({ label: t, value: t }));
  }, [initialItems]);

  const parcelTypeOptions = useMemo(() => {
    const types = [
      ...new Set(initialItems.map((i) => i.parcelType).filter(Boolean)),
    ];
    return types.map((t) => ({ label: t, value: t }));
  }, [initialItems]);

  const originOptions = useMemo(() => {
    const origins = [
      ...new Set(initialItems.map((i) => i.fromAddress).filter(Boolean)),
    ];
    return origins.map((o) => ({ label: o, value: o }));
  }, [initialItems]);

  const destinationOptions = useMemo(() => {
    const destinations = [
      ...new Set(initialItems.map((i) => i.toAddress).filter(Boolean)),
    ];
    return destinations.map((d) => ({ label: d, value: d }));
  }, [initialItems]);

  const activeFilterCount = [
    filterCompany,
    filterService,
    filterParcelType,
    filterOrigin,
    filterDestination,
  ].filter(Boolean).length;

  const filteredItems = useMemo(() => {
    return initialItems.filter((item) => {
      if (filterCompany && (item as any).organization?.name !== filterCompany && item.user?.name !== filterCompany) return false;
      if (filterService && item.serviceType !== filterService) return false;
      if (filterParcelType && item.parcelType !== filterParcelType)
        return false;
      if (filterOrigin && item.fromAddress !== filterOrigin) return false;
      if (filterDestination && item.toAddress !== filterDestination) return false;
      return true;
    });
  }, [
    initialItems,
    filterCompany,
    filterService,
    filterParcelType,
    filterOrigin,
    filterDestination,
  ]);

  const clearFilters = () => {
    setFilterCompany("");
    setFilterService("");
    setFilterParcelType("");
    setFilterOrigin("");
    setFilterDestination("");
  };

  // ── Columns ────────────────────────────────────────────────────────────────

  const columns = [
    {
      header: "Tracking ID",
      accessor: (item: ParcelItem) => (
        <div className="flex items-center gap-3">
          <div className="h-10 w-10 rounded-[10px] bg-slate-900 text-white flex items-center justify-center shrink-0">
            <Package className="h-4 w-4" />
          </div>
          <div className="flex flex-col">
            <span className="font-black text-slate-900 text-[13px] tracking-tight font-mono">
              #{item.id.slice(-8).toUpperCase()}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">
              {new Date(item.createdAt).toLocaleDateString("en-GB", {
                day: "2-digit",
                month: "short",
                year: "numeric",
              })}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Company / Sender",
      accessor: (item: ParcelItem) => {
        const orgName = (item as any).organization?.name || null;
        const senderName = item.user?.name || "Customer";
        return (
          <div className="flex items-center gap-2.5">
            <div className="w-8 h-8 rounded-[8px] bg-blue-50 border border-blue-100 flex items-center justify-center text-[12px] font-black text-blue-600 shrink-0">
              {(orgName || senderName).charAt(0).toUpperCase()}
            </div>
            <div className="flex flex-col">
              <span className="font-black text-slate-900 text-[13px] tracking-tight">
                {orgName || senderName}
              </span>
              <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">
                {orgName ? "Organization" : (item.user?.phone ?? item.user?.email ?? "Walk-in")}
              </span>
            </div>
          </div>
        );
      },
    },
    {
      header: "Route",
      accessor: (item: ParcelItem) => {
        const originName = (item as any).origin?.name || item.fromAddress;
        const destName = (item as any).destination?.name || item.toAddress;
        return (
          <div className="flex flex-col gap-1.5 relative pl-4">
            <div className="absolute left-0.5 top-1 bottom-1 w-[1.5px] bg-slate-100 rounded-full" />
            <div className="flex items-center gap-2 text-[12px] font-bold text-slate-700">
              <span className="w-1.5 h-1.5 rounded-full bg-blue-500 shrink-0" />
              <span className="truncate max-w-[140px]">{originName}</span>
            </div>
            <div className="flex items-center gap-2 text-[12px] font-bold text-slate-400">
              <span className="w-1.5 h-1.5 rounded-full bg-slate-300 shrink-0" />
              <span className="truncate max-w-[140px]">{destName}</span>
            </div>
          </div>
        );
      },
    },
    {
      header: "Receiver",
      accessor: (item: ParcelItem) => (
        <div className="flex flex-col">
          <span className="font-black text-slate-900 text-[13px] tracking-tight">
            {item.receiverName}
          </span>
          {item.receiverPhone && (
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">
              {item.receiverPhone}
            </span>
          )}
        </div>
      ),
    },
    {
      header: "Service / Type",
      accessor: (item: ParcelItem) => (
        <div className="flex flex-col gap-1">
          <span className="text-[11px] font-black text-slate-900 uppercase tracking-widest leading-none">
            {item.serviceType}
          </span>
          <div className="flex items-center gap-1.5">
            <span className="text-[9px] font-black text-white bg-slate-900 px-1.5 py-0.5 rounded-[6px] uppercase">
              {item.parcelType}
            </span>
            <span className="text-[9px] font-black text-slate-400 uppercase">
              {item.parcelSize}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Settlement",
      accessor: (item: ParcelItem) =>
        item.amount != null ? (
          <div className="flex flex-col gap-0.5">
            <span className="text-[14px] font-black tracking-tighter tabular-nums text-slate-900">
              {new Intl.NumberFormat("en-TZ", {
                style: "currency",
                currency: "TZS",
                maximumSignificantDigits: 4,
              }).format(item.amount)}
            </span>
            <span className="text-[9px] font-black text-emerald-500 uppercase tracking-widest">
              Verified
            </span>
          </div>
        ) : (
          <div className="inline-flex items-center gap-1.5 px-2 py-1 rounded-[8px] bg-amber-50 border border-amber-100 text-[10px] font-black uppercase tracking-widest text-amber-600">
            <Info size={9} strokeWidth={3} /> Pending
          </div>
        ),
    },
    {
      header: "Status",
      accessor: (item: ParcelItem) => <StatusBadge status={item.status} />,
    },
    {
      header: "Actions",
      align: "right" as const,
      accessor: (item: ParcelItem) => {
        const canApprove = item.status === "PENDING";
        const canReject = ["PENDING", "APPROVED", "PAYMENT_PENDING"].includes(
          item.status,
        );
        return (
          <div className="flex items-center justify-end gap-2 pr-2">
            <button
              onClick={() => router.push(`/parcel/${item.id}`)}
              className="h-9 px-4 bg-slate-900 hover:bg-blue-600 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm flex items-center gap-2"
            >
              View <ArrowUpRight size={12} strokeWidth={3} />
            </button>
            {canApprove && (
              <button
                onClick={() => setApproveTarget(item)}
                className="h-9 px-3 bg-emerald-50 hover:bg-emerald-600 text-emerald-700 hover:text-white border border-emerald-200 rounded-[10px] text-[10px] font-black transition-all active:scale-95"
              >
                <CheckCircle2 size={13} />
              </button>
            )}
            {canReject && (
              <button
                onClick={() => setRejectTarget(item)}
                className="h-9 px-3 bg-rose-50 hover:bg-rose-600 text-rose-600 hover:text-white border border-rose-200 rounded-[10px] text-[10px] font-black transition-all active:scale-95"
              >
                <XCircle size={13} />
              </button>
            )}
          </div>
        );
      },
    },
  ];

  return (
    <div>
      {/* Filter Bar */}
      <div className="px-6 py-3 border-b border-slate-100 bg-white flex items-center gap-3 flex-wrap">
        <div className="flex items-center gap-2 text-[10px] font-black text-slate-400 uppercase tracking-widest shrink-0">
          <Filter size={11} />
          Filters
        </div>
        <div className="h-5 w-px bg-slate-100" />
        {isSuperAdmin && (
          <FilterSelect
            icon={Building2}
            label="All Companies"
            value={filterCompany}
            onChange={setFilterCompany}
            options={companyOptions}
          />
        )}
        <FilterSelect
          icon={Zap}
          label="All Services"
          value={filterService}
          onChange={setFilterService}
          options={serviceOptions}
        />
        <FilterSelect
          icon={Layers}
          label="All Types"
          value={filterParcelType}
          onChange={setFilterParcelType}
          options={parcelTypeOptions}
        />
        <FilterSelect
          icon={Package}
          label="All Origins"
          value={filterOrigin}
          onChange={setFilterOrigin}
          options={originOptions}
        />
        <FilterSelect
          icon={Package}
          label="All Destinations"
          value={filterDestination}
          onChange={setFilterDestination}
          options={destinationOptions}
        />

        {activeFilterCount > 0 && (
          <>
            <div className="h-5 w-px bg-slate-100" />
            <button
              onClick={clearFilters}
              className="h-9 px-3 text-[10px] font-black uppercase tracking-widest text-rose-500 hover:bg-rose-50 rounded-[10px] transition-all border border-rose-100 flex items-center gap-1.5"
            >
              <XCircle size={11} /> Clear ({activeFilterCount})
            </button>
          </>
        )}

        <div className="ml-auto text-[10px] font-black text-slate-400 uppercase tracking-widest">
          <span className="text-slate-900">{filteredItems.length}</span> of{" "}
          {initialItems.length} parcels
        </div>
      </div>

      {/* Table */}
      <DataTable
        data={filteredItems}
        columns={columns as any}
        hideActions={true}
        hideInternalSearch={true}
        emptyMessage="No parcels match the selected filters."
      />

      {approveTarget && (
        <ApproveModal
          parcel={approveTarget}
          onClose={() => setApproveTarget(null)}
          onSuccess={refresh}
        />
      )}
      {rejectTarget && (
        <RejectModal
          parcel={rejectTarget}
          onClose={() => setRejectTarget(null)}
          onSuccess={refresh}
        />
      )}
    </div>
  );
}
