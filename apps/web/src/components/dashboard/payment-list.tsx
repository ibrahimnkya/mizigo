import { cn } from "@repo/ui/utils";
import { CreditCard, Package, ArrowRight, TrendingUp, Search, Calendar, Download } from "lucide-react";

import { prisma } from "@repo/database";
import { auth } from "@/auth";

async function getPayments(status?: string | string[]) {
    const session = await auth();
    if (!session?.user) return [];

    const role = session.user.role;
    const isSuperAdmin = role === 'SUPER_ADMIN';
    const isOperator  = role === 'OPERATOR';
    const userId = session.user.id;

    let where: any = {};

    // Status filter — supports single value or array
    if (status) {
        where.status = Array.isArray(status) ? { in: status } : status;
    }

    // RBAC scoping
    if (isSuperAdmin || isOperator) {
        // Full visibility — no extra filter
    } else {
        // Agents / regular users only see their own payments
        where.userId = userId;
    }

    try {
        const payments = await prisma.payment.findMany({
            where,
            include: { cargo: true },
            orderBy: { createdAt: 'desc' }
        });
        return payments;
    } catch (error) {
        console.error('Error fetching payments:', error);
        return [];
    }
}

const STATUS_META: Record<string, { dot: string; className: string; label: string }> = {
    SUCCESS:   { dot: "bg-emerald-500", className: "bg-emerald-50 text-emerald-700 border-emerald-200/60",   label: "Success" },
    PAID:      { dot: "bg-emerald-500", className: "bg-emerald-50 text-emerald-700 border-emerald-200/60",   label: "Paid" },
    PENDING:   { dot: "bg-amber-400",   className: "bg-amber-50 text-amber-700 border-amber-200/60",         label: "Pending" },
    FAILED:    { dot: "bg-rose-500",    className: "bg-rose-50 text-rose-700 border-rose-200/60",            label: "Failed" },
    REFUNDED:  { dot: "bg-slate-400",   className: "bg-slate-50 text-slate-600 border-slate-200/60",         label: "Refunded" },
    SIMULATED: { dot: "bg-violet-400",  className: "bg-violet-50 text-violet-700 border-violet-200/60",      label: "Simulated" },
}

function StatusBadge({ status }: { status: string }) {
    const meta = STATUS_META[status] ?? { dot: "bg-slate-400", className: "bg-slate-50 text-slate-500 border-slate-200", label: status }
    return (
        <span className={cn("inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-[11px] font-black border uppercase tracking-widest", meta.className)}>
            <span className={cn("w-1.5 h-1.5 rounded-full shrink-0", meta.dot)} />
            {meta.label}
        </span>
    )
}

export async function PaymentList({ status }: { status?: string | string[] }) {
    let payments: any[] = []
    try {
        payments = await getPayments(status)
    } catch (e) {
        console.error("Failed to fetch payments", e)
    }

    return (
        <div className="flex flex-col gap-8 p-6 md:p-10 bg-white max-w-[1440px] mx-auto min-h-[85vh] shadow-[0_0_80px_-20px_rgba(0,0,0,0.08)] rounded-[2.5rem] my-8 border border-slate-100/50 relative overflow-hidden">
            {/* Background Decoration */}
            <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-emerald-50/20 rounded-full blur-3xl -mr-64 -mt-64 pointer-events-none" />
            <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-slate-50/30 rounded-full blur-3xl -ml-48 -mb-48 pointer-events-none" />
            
            {/* Header Section */}
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-6 pb-6 border-b border-slate-100 relative z-10">
                <div>
                    <h1 className="text-2xl font-black text-slate-900 tracking-tight flex items-center gap-3">
                        <CreditCard className="w-6 h-6 text-emerald-600" strokeWidth={3} />
                        Financial Ledger
                        <span className="px-3 py-1 bg-emerald-50 text-emerald-600 text-[12px] font-bold rounded-full border border-emerald-100 uppercase tracking-widest">
                            {payments.length} Transactions
                        </span>
                    </h1>
                    <p className="text-slate-500 font-medium text-[14px] mt-1">Real-time monitoring of all cargo-related financial activities</p>
                </div>
                
                <div className="flex items-center gap-3">
                    <span className="inline-flex items-center gap-2 text-[11px] font-black uppercase tracking-[0.2em] text-emerald-600 bg-emerald-50 px-4 py-2 rounded-2xl border border-emerald-100">
                        <span className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse" />
                        Live Feed
                    </span>
                    <button className="flex items-center gap-2.5 px-6 h-12 bg-slate-900 text-white rounded-2xl hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 active:scale-95 text-[12px] font-black uppercase tracking-widest border-none">
                        <Download size={16} strokeWidth={2.5} />
                        Export Data
                    </button>
                </div>
            </div>

            {/* Toolbar Section */}
            <div className="flex flex-col gap-4 bg-slate-50/50 p-5 rounded-[2rem] border border-slate-100 shadow-sm relative z-10">
                <div className="flex flex-wrap items-center gap-4">
                    <div className="relative group min-w-[320px] flex-1">
                        <Search size={18} className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-blue-600 transition-colors" />
                        <input 
                            type="text"
                            placeholder="Search by reference, cargo ID, or method..."
                            className="w-full pl-12 pr-4 py-3 bg-white border border-slate-200 rounded-2xl focus:outline-none focus:ring-4 focus:ring-blue-500/10 focus:border-blue-500/50 transition-all text-slate-700 font-bold text-[14px] shadow-sm placeholder:text-slate-300"
                        />
                    </div>

                    <div className="flex items-center gap-3 bg-white px-4 py-2 rounded-2xl border border-slate-200 shadow-sm">
                        <Calendar size={14} className="text-slate-400" />
                        <span className="text-[12px] font-black text-slate-700 uppercase tracking-tight">Filtering by: Last 30 Days</span>
                    </div>
                </div>
            </div>

            {/* Table Area */}
            <div className="relative z-10 overflow-hidden bg-white rounded-[2rem] border border-slate-100 shadow-2xl shadow-slate-100/50 flex-1">
                <div className="overflow-x-auto">
                    <table className="w-full text-left border-collapse">
                        <thead>
                            <tr className="bg-slate-50/50 border-b border-slate-100">
                                <th className="py-5 px-6 text-[11px] font-black text-slate-400 uppercase tracking-[0.2em] w-[220px]">Reference</th>
                                <th className="py-5 px-6 text-[11px] font-black text-slate-400 uppercase tracking-[0.2em]">Asset Details</th>
                                <th className="py-5 px-6 text-[11px] font-black text-slate-400 uppercase tracking-[0.2em]">Volume (TZS)</th>
                                <th className="py-5 px-6 text-[11px] font-black text-slate-400 uppercase tracking-[0.2em]">Method</th>
                                <th className="py-5 px-6 text-[11px] font-black text-slate-400 uppercase tracking-[0.2em]">Network Status</th>
                                <th className="py-5 px-6 text-[11px] font-black text-slate-400 uppercase tracking-[0.2em] text-right">Synchronization</th>
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-slate-50">
                            {payments.length === 0 ? (
                                <tr>
                                    <td colSpan={6} className="py-32 text-center">
                                        <div className="flex flex-col items-center gap-6">
                                            <div className="w-20 h-20 bg-slate-50 rounded-3xl flex items-center justify-center border border-slate-100 shadow-sm">
                                                <CreditCard size={32} strokeWidth={1.5} className="text-slate-300" />
                                            </div>
                                            <div className="space-y-1">
                                                <p className="text-xl font-black text-slate-900">Void Transaction History</p>
                                                <p className="text-[14px] text-slate-400 font-bold">Awaiting initial financial handshake from the network.</p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            ) : (
                                payments.map((payment: any) => (
                                    <tr key={payment.id} className="group hover:bg-blue-50/30 transition-all duration-300">
                                        {/* Reference */}
                                        <td className="py-5 px-6 whitespace-nowrap">
                                            <div className="flex items-center gap-3">
                                                <div className="w-1.5 h-1.5 rounded-full bg-blue-400 opacity-0 group-hover:opacity-100 transition-opacity" />
                                                <span className="font-mono text-[11px] font-black text-slate-600 bg-slate-50 px-3 py-1.5 rounded-xl border border-slate-100">
                                                    {payment.transactionReference || `#${payment.id.slice(0, 8).toUpperCase()}`}
                                                </span>
                                            </div>
                                        </td>

                                        {/* Cargo Details */}
                                        <td className="py-5 px-6">
                                            <div className="flex flex-col gap-1">
                                                <div className="flex items-center gap-2 text-[14px] font-bold text-slate-900 group-hover:text-blue-600 transition-colors">
                                                    <Package size={14} className="text-slate-300 shrink-0" />
                                                    {payment.cargo?.cargoType || "Logistics Asset"}
                                                </div>
                                                {payment.cargo?.fromAddress && (
                                                    <div className="flex items-center gap-2 text-[11px] text-slate-400 font-black uppercase tracking-widest pl-5">
                                                        <span>{payment.cargo.fromAddress.split(',')[0]}</span>
                                                        <ArrowRight size={10} className="text-slate-200" strokeWidth={3} />
                                                        <span>{payment.cargo.toAddress.split(',')[0]}</span>
                                                    </div>
                                                )}
                                            </div>
                                        </td>

                                        {/* Amount */}
                                        <td className="py-5 px-6 whitespace-nowrap">
                                            <span className="text-[15px] font-black text-slate-900 tabular-nums">
                                                {payment.amount.toLocaleString()}
                                            </span>
                                        </td>

                                        {/* Method */}
                                        <td className="py-5 px-6 whitespace-nowrap">
                                            {payment.paymentMethod ? (
                                                <span className="text-[11px] font-black text-slate-500 bg-slate-50 px-3 py-1.5 rounded-xl border border-slate-100 uppercase tracking-widest">
                                                    {payment.paymentMethod}
                                                </span>
                                            ) : (
                                                <span className="text-slate-200 text-[11px] font-black">—</span>
                                            )}
                                        </td>

                                        {/* Status */}
                                        <td className="py-5 px-6 whitespace-nowrap">
                                            <StatusBadge status={payment.status} />
                                        </td>

                                        {/* Date */}
                                        <td className="py-5 px-6 text-right whitespace-nowrap">
                                            <div className="flex flex-col items-end gap-1">
                                                <span className="text-[14px] font-black text-slate-900 tabular-nums">
                                                    {new Date(payment.createdAt).toLocaleDateString("en-GB", { day: "2-digit", month: "short", year: "numeric" })}
                                                </span>
                                                <span className="text-[11px] text-slate-400 font-black uppercase tracking-widest tabular-nums">
                                                    {new Date(payment.createdAt).toLocaleTimeString("en-GB", { hour: "2-digit", minute: "2-digit" })}
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                ))
                            )}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    )
}
