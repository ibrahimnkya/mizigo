"use client";

import { useState, useCallback, useMemo } from "react";
import { useRouter } from "next/navigation";
import { useSession } from "next-auth/react";
import {
  CheckCircle2,
  XCircle,
  Loader2,
  ArrowUpRight,
  Package,
  Filter,
  Building2,
  Layers,
  Zap,
  Search,
  MapPin,
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
    className: "bg-slate-50 text-slate-500 border-slate-200",
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
        "inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-[12px] font-semibold border whitespace-nowrap",
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
  trackingNumber?: string;
  weight?: number | null;
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
        className="absolute inset-0 bg-slate-900/50 -[2px]"
        onClick={onClose}
      />
      <div className="relative z-10 bg-white rounded-xl shadow-[0_24px_64px_rgba(0,0,0,0.14)] w-full max-w-md overflow-hidden">
        <div className="h-1 bg-gradient-to-r from-emerald-400 to-emerald-500" />
        <div className="px-6 pt-5 pb-4 border-b border-slate-50 flex items-center gap-3">
          <div className="w-9 h-9 bg-emerald-50 rounded-xl flex items-center justify-center shrink-0">
            <CheckCircle2 size={17} className="text-emerald-600" />
          </div>
          <div>
            <h2 className="text-[15px] font-semibold text-slate-900 tracking-tight">
              Approve Request
            </h2>
            <p className="text-[12px] text-slate-400 font-mono mt-0.5">
              #{parcel.id.slice(-8).toUpperCase()}
            </p>
          </div>
        </div>
        <div className="px-6 py-5 space-y-4">
          <div className="bg-slate-50 rounded-xl p-4 flex flex-col gap-2">
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
            <label className="block text-[11px] font-semibold text-slate-500 uppercase tracking-wider mb-2">
              Payment Amount (TZS) *
            </label>
            <div className="relative">
              <span className="absolute left-3.5 top-1/2 -translate-y-1/2 text-[12px] font-semibold text-slate-400">
                TZS
              </span>
              <input
                type="number"
                value={amount}
                onChange={(e) => setAmount(e.target.value)}
                className="w-full pl-14 pr-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-slate-900 font-bold text-sm focus:outline-none focus:ring-2 focus:ring-indigo-400 transition-colors"
              />
            </div>
          </div>
          {error && (
            <p className="text-[12px] text-rose-600 bg-rose-50 px-3 py-2 rounded-xl font-semibold">
              {error}
            </p>
          )}
        </div>
        <div className="px-6 pb-6 flex gap-2.5">
          <button
            onClick={onClose}
            className="flex-1 py-2.5 border border-slate-200 rounded-xl text-[13px] font-bold text-slate-500 hover:bg-slate-50 transition-colors"
          >
            Cancel
          </button>
          <button
            onClick={handleApprove}
            disabled={loading}
            className="flex-1 py-2.5 bg-emerald-600 hover:bg-emerald-700 disabled:opacity-60 text-white rounded-xl text-[13px] font-semibold transition-colors flex items-center justify-center gap-2"
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
        className="absolute inset-0 bg-slate-900/50 -[2px]"
        onClick={onClose}
      />
      <div className="relative z-10 bg-white rounded-xl shadow-[0_24px_64px_rgba(0,0,0,0.14)] w-full max-w-md overflow-hidden">
        <div className="h-1 bg-gradient-to-r from-rose-400 to-rose-500" />
        <div className="px-6 pt-5 pb-4 border-b border-slate-50 flex items-center gap-3">
          <div className="w-9 h-9 bg-rose-50 rounded-xl flex items-center justify-center shrink-0">
            <XCircle size={17} className="text-rose-600" />
          </div>
          <div>
            <h2 className="text-[15px] font-semibold text-slate-900 tracking-tight">
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
            className="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-slate-900 text-[13px] focus:outline-none focus:ring-2 focus:ring-rose-400 resize-none transition-colors"
          />
          {error && (
            <p className="text-[12px] text-rose-600 bg-rose-50 px-3 py-2 rounded-xl font-semibold">
              {error}
            </p>
          )}
        </div>
        <div className="px-6 pb-6 flex gap-2.5">
          <button
            onClick={onClose}
            className="flex-1 py-2.5 border border-slate-200 rounded-xl text-[13px] font-bold text-slate-500 hover:bg-slate-50 transition-colors"
          >
            Cancel
          </button>
          <button
            onClick={handleReject}
            disabled={loading}
            className="flex-1 py-2.5 bg-rose-600 hover:bg-rose-700 disabled:opacity-60 text-white rounded-xl text-[13px] font-semibold transition-colors flex items-center justify-center gap-2"
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
    <div className="relative flex items-center h-10 bg-white border border-[#E2E2E2] rounded-full min-w-[160px] focus-within:border-orange-500">
      <Icon size={14} className="absolute left-3.5 text-slate-400 pointer-events-none" />
      <select
        value={value}
        onChange={(e) => onChange(e.target.value)}
        className="w-full h-full pl-9 pr-8 bg-transparent border-none text-[13px] font-medium text-slate-600 outline-none cursor-pointer appearance-none"
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
  const [filterPriority, setFilterPriority] = useState("");
  const [filterParcelType, setFilterParcelType] = useState("");
  const [filterOrigin, setFilterOrigin] = useState("");
  const [filterDestination, setFilterDestination] = useState("");
  const [query, setQuery] = useState("");

  // Derive unique values for filter options from data
  const companyOptions = useMemo(() => {
    const names = [
      ...new Set(
        initialItems.map((i) => (i as any).organization?.name || i.user?.name).filter(Boolean) as string[],
      ),
    ];
    return names.map((n) => ({ label: n, value: n }));
  }, [initialItems]);

  // Delivery priority options (urgency field, e.g. Standard, Express, Economy)
  const priorityOptions = useMemo(() => {
    const priorities = [
      ...new Set(initialItems.map((i) => i.urgency).filter(Boolean)),
    ];
    return priorities.map((p) => ({ label: p as string, value: p as string }));
  }, [initialItems]);

  const parcelTypeOptions = useMemo(() => {
    const types = [
      ...new Set(initialItems.map((i) => i.parcelType).filter(Boolean)),
    ];
    return types.map((t) => ({ label: t, value: t }));
  }, [initialItems]);

  // Use station name as label but station ID as value for accurate filtering
  const originOptions = useMemo(() => {
    const map = new Map<string, string>();
    initialItems.forEach((i) => {
      if (i.fromAddress) map.set(i.fromAddress, (i as any).origin?.name || i.fromAddress);
    });
    return Array.from(map.entries()).map(([value, label]) => ({ label, value }));
  }, [initialItems]);

  const destinationOptions = useMemo(() => {
    const map = new Map<string, string>();
    initialItems.forEach((i) => {
      if (i.toAddress) map.set(i.toAddress, (i as any).destination?.name || i.toAddress);
    });
    return Array.from(map.entries()).map(([value, label]) => ({ label, value }));
  }, [initialItems]);

  const activeFilterCount = [
    query,
    filterCompany,
    filterPriority,
    filterParcelType,
    filterOrigin,
    filterDestination,
  ].filter(Boolean).length;

  const filteredItems = useMemo(() => {
    const q = query.trim().toLowerCase();
    return initialItems.filter((item) => {
      if (
        q &&
        ![item.trackingNumber, item.receiverName, item.receiverPhone, item.origin?.name, item.destination?.name]
          .some((v) => v?.toLowerCase().includes(q))
      )
        return false;
      if (filterCompany && (item as any).organization?.name !== filterCompany && item.user?.name !== filterCompany) return false;
      if (filterPriority && item.urgency !== filterPriority) return false;
      if (filterParcelType && item.parcelType !== filterParcelType) return false;
      if (filterOrigin && item.fromAddress !== filterOrigin) return false;
      if (filterDestination && item.toAddress !== filterDestination) return false;
      return true;
    });
  }, [
    initialItems,
    query,
    filterCompany,
    filterPriority,
    filterParcelType,
    filterOrigin,
    filterDestination,
  ]);

  const clearFilters = () => {
    setQuery("");
    setFilterCompany("");
    setFilterPriority("");
    setFilterParcelType("");
    setFilterOrigin("");
    setFilterDestination("");
  };

  // ── Columns ────────────────────────────────────────────────────────────────

  const tsh = (n: number) => `TSh ${Math.round(n).toLocaleString("en-US")}`;
  const when = (iso: string) => {
    const d = new Date(iso);
    return `${d.toLocaleDateString("en-GB", { day: "numeric", month: "short", year: "numeric" })} · ${d.toLocaleTimeString("en-GB", { hour: "2-digit", minute: "2-digit" })}`;
  };

  const columns = [
    {
      header: "Parcel",
      accessor: (item: ParcelItem) => (
        <div className="flex items-center gap-3">
          <div className="h-11 w-11 rounded-2xl bg-orange-50 flex items-center justify-center shrink-0">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src="/brand/staff_parcel.png" alt="" className="h-8 w-8 object-contain" />
          </div>
          <div className="flex flex-col min-w-0">
            <span className="font-semibold text-[#1C1C1E] text-[14px] tracking-wide">
              {item.trackingNumber || `#${item.id.slice(-8).toUpperCase()}`}
            </span>
            <span className="text-[12px] text-slate-400">{when(item.createdAt)}</span>
          </div>
        </div>
      ),
    },
    {
      header: "Route",
      accessor: (item: ParcelItem) => {
        const originName = item.origin?.name || item.fromAddress;
        const destName = item.destination?.name || item.toAddress;
        return (
          <div className="flex items-center gap-2 text-[13px] font-medium text-slate-700">
            <span className="truncate max-w-[130px]">{originName}</span>
            <ArrowUpRight size={14} className="rotate-45 text-orange-500 shrink-0" />
            <span className="truncate max-w-[130px]">{destName}</span>
          </div>
        );
      },
    },
    ...(isSuperAdmin
      ? [
          {
            header: "Company",
            accessor: (item: ParcelItem) => (
              <span className="text-[13px] font-medium text-slate-700">
                {item.organization?.name || item.user?.name || "—"}
              </span>
            ),
          },
        ]
      : []),
    {
      header: "Receiver",
      accessor: (item: ParcelItem) => (
        <div className="flex flex-col">
          <span className="font-medium text-[#1C1C1E] text-[13px]">{item.receiverName || "—"}</span>
          {item.receiverPhone && <span className="text-[12px] text-slate-400">{item.receiverPhone}</span>}
        </div>
      ),
    },
    {
      header: "Parcel details",
      accessor: (item: ParcelItem) => (
        <div className="flex flex-wrap items-center gap-1.5">
          {item.urgency === "Express" && (
            <span className="text-[11px] font-semibold px-2 py-0.5 rounded-full bg-orange-500 text-white">Express</span>
          )}
          {item.parcelType && (
            <span className="text-[11px] font-medium px-2 py-0.5 rounded-full bg-slate-100 text-slate-600">{item.parcelType}</span>
          )}
          {item.weight ? <span className="text-[12px] text-slate-400">{item.weight} kg</span> : null}
        </div>
      ),
    },
    {
      header: "Amount",
      align: "right" as const,
      accessor: (item: ParcelItem) =>
        item.amount != null ? (
          <span className="text-[14px] font-semibold tabular-nums text-[#1C1C1E]">{tsh(item.amount)}</span>
        ) : (
          <span className="text-[12px] text-slate-400">Not priced</span>
        ),
    },
    {
      header: "Status",
      accessor: (item: ParcelItem) => <StatusBadge status={item.status} />,
    },
    {
      header: "",
      align: "right" as const,
      accessor: (item: ParcelItem) => {
        const canApprove = item.status === "PENDING";
        const canReject = ["PENDING", "APPROVED", "PAYMENT_PENDING"].includes(item.status);
        return (
          <div className="flex items-center justify-end gap-2">
            {canApprove && (
              <button
                onClick={() => setApproveTarget(item)}
                title="Approve"
                className="h-9 w-9 flex items-center justify-center rounded-full bg-emerald-50 text-emerald-600 hover:bg-emerald-600 hover:text-white transition"
              >
                <CheckCircle2 size={16} />
              </button>
            )}
            {canReject && (
              <button
                onClick={() => setRejectTarget(item)}
                title="Reject"
                className="h-9 w-9 flex items-center justify-center rounded-full bg-rose-50 text-rose-600 hover:bg-rose-600 hover:text-white transition"
              >
                <XCircle size={16} />
              </button>
            )}
            <button
              onClick={() => router.push(`/parcel/${item.id}`)}
              className="h-9 px-4 rounded-full bg-[#5C0B19] hover:bg-[#4F0A0C] text-white text-[13px] font-semibold flex items-center gap-1.5 transition active:scale-95"
            >
              View <ArrowUpRight size={14} />
            </button>
          </div>
        );
      },
    },
  ];

  return (
    <div>
      {/* Filter Bar */}
      <div className="px-5 py-4 border-b border-slate-100 bg-white flex items-center gap-2.5 flex-wrap">
        <div className="relative flex-1 min-w-[220px]">
          <Search size={15} className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 pointer-events-none" />
          <input
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Search tracking number, receiver, phone or station"
            className="h-10 w-full rounded-full border border-[#E2E2E2] bg-white pl-10 pr-4 text-[13px] text-slate-700 outline-none transition placeholder:text-slate-400 focus:border-orange-500 focus:ring-4 focus:ring-orange-500/10"
          />
        </div>
        {isSuperAdmin && (
          <FilterSelect
            icon={Building2}
            label="All companies"
            value={filterCompany}
            onChange={setFilterCompany}
            options={companyOptions}
          />
        )}
        <FilterSelect
          icon={Zap}
          label="All priorities"
          value={filterPriority}
          onChange={setFilterPriority}
          options={priorityOptions}
        />
        <FilterSelect
          icon={Layers}
          label="All types"
          value={filterParcelType}
          onChange={setFilterParcelType}
          options={parcelTypeOptions}
        />
        <FilterSelect
          icon={MapPin}
          label="All origins"
          value={filterOrigin}
          onChange={setFilterOrigin}
          options={originOptions}
        />
        <FilterSelect
          icon={MapPin}
          label="All destinations"
          value={filterDestination}
          onChange={setFilterDestination}
          options={destinationOptions}
        />

        {activeFilterCount > 0 && (
          <>
            <button
              onClick={clearFilters}
              className="h-10 px-4 text-[13px] font-semibold text-orange-600 bg-orange-50 hover:bg-orange-100 rounded-full transition flex items-center gap-1.5"
            >
              <XCircle size={14} /> Clear ({activeFilterCount})
            </button>
          </>
        )}

        <div className="ml-auto text-[13px] text-slate-500">
          <span className="font-semibold text-[#1C1C1E]">{filteredItems.length}</span> of {initialItems.length} parcels
        </div>
      </div>

      {/* Table */}
      <DataTable
        data={filteredItems}
        columns={columns as any}
        hideActions={true}
        hideInternalSearch={true}
        emptyMessage={initialItems.length === 0 ? "No parcels here yet." : "No parcels match your search or filters."}
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
