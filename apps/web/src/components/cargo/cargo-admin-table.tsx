'use client'

import { useState, useCallback } from 'react'
import { useRouter } from 'next/navigation'
import { 
    CheckCircle2, XCircle, Eye, Loader2, TruckIcon,
    Compass, MapPin, ArrowUpRight, Package, SlidersHorizontal, Calendar,
    Search, ChevronLeft, ChevronRight, Filter, Info
} from 'lucide-react'
import { cn } from '@/lib/utils'
import { ViewToggle, ViewType } from '@/components/ui/view-toggle'
import { CreateCargoModal } from './create-cargo-modal'
import { Tooltip, TooltipContent, TooltipProvider, TooltipTrigger } from '@repo/ui/tooltip'

// ── Status config ──────────────────────────────────────────────────────────────

const STATUS_META: Record<string, { label: string; dot: string; className: string }> = {
    PENDING:         { label: 'Pending',          dot: 'bg-amber-400',   className: 'bg-amber-50 text-amber-700 border-amber-200/60' },
    APPROVED:        { label: 'Approved',          dot: 'bg-blue-500',    className: 'bg-blue-50 text-blue-700 border-blue-200/60' },
    PAYMENT_PENDING: { label: 'Awaiting Payment',  dot: 'bg-violet-500',  className: 'bg-violet-50 text-violet-700 border-violet-200/60' },
    PAID:            { label: 'Paid',              dot: 'bg-emerald-500', className: 'bg-emerald-50 text-emerald-700 border-emerald-200/60' },
    IN_TRANSIT:      { label: 'In Transit',        dot: 'bg-blue-600',    className: 'bg-blue-50 text-blue-800 border-blue-200/60' },
    DELAYED:         { label: 'Delayed',           dot: 'bg-rose-500',    className: 'bg-rose-50 text-rose-700 border-rose-200/60' },
    COMPLETED:       { label: 'Completed',         dot: 'bg-slate-400',   className: 'bg-slate-50 text-slate-600 border-slate-200/60' },
    REJECTED:        { label: 'Rejected',          dot: 'bg-rose-500',    className: 'bg-rose-50 text-rose-700 border-rose-200/60' },
}

function StatusBadge({ status }: { status: string }) {
    const meta = STATUS_META[status] ?? { label: status, dot: 'bg-slate-400', className: 'bg-slate-50 text-slate-600 border-slate-200' }
    return (
        <span className={cn('inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg text-[11px] font-bold border tracking-wide', meta.className)}>
            <span className={cn('w-1.5 h-1.5 rounded-full shrink-0', meta.dot)} />
            {meta.label}
        </span>
    )
}

// ── Types ──────────────────────────────────────────────────────────────────────

export interface CargoItem {
    id: string
    fromAddress: string
    toAddress: string
    serviceType: string
    cargoType: string
    cargoSize: string
    status: string
    wagonType?: string | null
    amount?: number | null
    receiverName: string
    receiverPhone?: string
    peopleNeeded?: number
    createdAt: string
    user?: { name: string; email: string; phone?: string | null } | null
    payment?: { status: string; transactionReference?: string | null } | null
}

// ── Approve Modal ──────────────────────────────────────────────────────────────

function ApproveModal({ cargo, onClose, onSuccess }: { cargo: CargoItem; onClose: () => void; onSuccess: () => void }) {
    const [amount, setAmount] = useState(cargo.amount?.toString() ?? '')
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState('')

    const handleApprove = async () => {
        if (!amount || isNaN(Number(amount)) || Number(amount) <= 0) {
            setError('Please enter a valid amount.')
            return
        }
        setLoading(true)
        setError('')
        try {
            const res = await fetch(`/api/cargo/${cargo.id}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ status: 'APPROVED', amount: Number(amount) }),
            })
            const data = await res.json()
            if (!res.ok) throw new Error(data.error ?? 'Failed to approve')
            onSuccess(); onClose()
        } catch (e: any) {
            setError(e.message)
        } finally {
            setLoading(false)
        }
    }

    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
            <div className="absolute inset-0 bg-slate-900/50 backdrop-blur-[2px]" onClick={onClose} />
            <div className="relative z-10 bg-white rounded-2xl shadow-[0_24px_64px_rgba(0,0,0,0.14)] w-full max-w-md overflow-hidden">
                {/* Header strip */}
                <div className="h-1 bg-gradient-to-r from-emerald-400 to-emerald-500" />
                <div className="px-6 pt-5 pb-4 border-b border-slate-50">
                    <div className="flex items-center gap-3">
                        <div className="w-9 h-9 bg-emerald-50 rounded-xl flex items-center justify-center shrink-0">
                            <CheckCircle2 size={17} className="text-emerald-600" />
                        </div>
                        <div>
                            <h2 className="text-[15px] font-extrabold text-slate-900 tracking-tight">Approve Request</h2>
                            <p className="text-[12px] text-slate-400 font-mono mt-0.5">#{cargo.id.slice(-8).toUpperCase()}</p>
                        </div>
                    </div>
                </div>

                <div className="px-6 py-5 space-y-4">
                    {/* Route summary */}
                    <div className="bg-slate-50 rounded-xl p-4">
                        <div className="flex flex-col gap-2">
                            <div className="flex items-center gap-2.5 text-[13px] font-semibold text-slate-700">
                                <div className="w-2 h-2 rounded-full bg-indigo-500 shrink-0" />
                                {cargo.fromAddress}
                            </div>
                            <div className="ml-[3px] h-4 border-l-2 border-dashed border-slate-200" />
                            <div className="flex items-center gap-2.5 text-[13px] font-medium text-slate-500">
                                <div className="w-2 h-2 rounded-full bg-slate-300 shrink-0" />
                                {cargo.toAddress}
                            </div>
                        </div>
                        <div className="mt-3 pt-3 border-t border-slate-100 flex gap-4 text-[11px]">
                            <span className="text-slate-400 uppercase tracking-wider font-bold">Service</span>
                            <span className="font-bold text-slate-700">{cargo.serviceType}</span>
                        </div>
                    </div>

                    <div>
                        <label className="block text-[11px] font-extrabold text-slate-500 uppercase tracking-wider mb-2">
                            Payment Amount (TZS) *
                        </label>
                        <div className="relative">
                            <span className="absolute left-3.5 top-1/2 -translate-y-1/2 text-[12px] font-extrabold text-slate-400">TZS</span>
                            <input
                                type="number"
                                value={amount}
                                onChange={(e) => setAmount(e.target.value)}
                                placeholder="0"
                                className="w-full pl-14 pr-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-slate-900 font-bold text-sm focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:bg-white transition-colors"
                            />
                        </div>
                    </div>

                    {error && <p className="text-[12px] text-rose-600 bg-rose-50 px-3 py-2 rounded-lg font-semibold">{error}</p>}
                </div>

                <div className="px-6 pb-6 flex gap-2.5">
                    <button onClick={onClose} className="flex-1 py-2.5 border border-slate-200 rounded-xl text-[13px] font-bold text-slate-500 hover:bg-slate-50 transition-colors">
                        Cancel
                    </button>
                    <button
                        onClick={handleApprove}
                        disabled={loading}
                        className="flex-1 py-2.5 bg-emerald-600 hover:bg-emerald-700 disabled:opacity-60 text-white rounded-xl text-[13px] font-extrabold transition-colors flex items-center justify-center gap-2 shadow-lg shadow-emerald-200"
                    >
                        {loading ? <Loader2 size={14} className="animate-spin" /> : <CheckCircle2 size={14} />}
                        Approve & Set Amount
                    </button>
                </div>
            </div>
        </div>
    )
}

// ── Reject Modal ───────────────────────────────────────────────────────────────

function RejectModal({ cargo, onClose, onSuccess }: { cargo: CargoItem; onClose: () => void; onSuccess: () => void }) {
    const [reason, setReason] = useState('')
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState('')

    const handleReject = async () => {
        if (!reason.trim()) { setError('Please provide a rejection reason.'); return }
        setLoading(true); setError('')
        try {
            const res = await fetch(`/api/cargo/${cargo.id}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ status: 'REJECTED', reason }),
            })
            const data = await res.json()
            if (!res.ok) throw new Error(data.error ?? 'Failed to reject')
            onSuccess(); onClose()
        } catch (e: any) {
            setError(e.message)
        } finally {
            setLoading(false)
        }
    }

    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
            <div className="absolute inset-0 bg-slate-900/50 backdrop-blur-[2px]" onClick={onClose} />
            <div className="relative z-10 bg-white rounded-2xl shadow-[0_24px_64px_rgba(0,0,0,0.14)] w-full max-w-md overflow-hidden">
                <div className="h-1 bg-gradient-to-r from-rose-400 to-rose-500" />
                <div className="px-6 pt-5 pb-4 border-b border-slate-50">
                    <div className="flex items-center gap-3">
                        <div className="w-9 h-9 bg-rose-50 rounded-xl flex items-center justify-center shrink-0">
                            <XCircle size={17} className="text-rose-600" />
                        </div>
                        <div>
                            <h2 className="text-[15px] font-extrabold text-slate-900 tracking-tight">Reject Request</h2>
                            <p className="text-[12px] text-slate-400 font-mono mt-0.5">#{cargo.id.slice(-8).toUpperCase()}</p>
                        </div>
                    </div>
                </div>

                <div className="px-6 py-5 space-y-3">
                    <label className="block text-[11px] font-extrabold text-slate-500 uppercase tracking-wider">
                        Reason for rejection *
                    </label>
                    <textarea
                        value={reason}
                        onChange={(e) => setReason(e.target.value)}
                        rows={4}
                        placeholder="Provide a clear reason for the customer..."
                        className="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-slate-900 text-[13px] focus:outline-none focus:ring-2 focus:ring-rose-400 focus:bg-white resize-none transition-colors"
                    />
                    {error && <p className="text-[12px] text-rose-600 bg-rose-50 px-3 py-2 rounded-lg font-semibold">{error}</p>}
                </div>

                <div className="px-6 pb-6 flex gap-2.5">
                    <button onClick={onClose} className="flex-1 py-2.5 border border-slate-200 rounded-xl text-[13px] font-bold text-slate-500 hover:bg-slate-50 transition-colors">
                        Cancel
                    </button>
                    <button
                        onClick={handleReject}
                        disabled={loading}
                        className="flex-1 py-2.5 bg-rose-600 hover:bg-rose-700 disabled:opacity-60 text-white rounded-xl text-[13px] font-extrabold transition-colors flex items-center justify-center gap-2"
                    >
                        {loading ? <Loader2 size={14} className="animate-spin" /> : <XCircle size={14} />}
                        Reject Request
                    </button>
                </div>
            </div>
        </div>
    )
}

// ── Action Button ──────────────────────────────────────────────────────────────

function ActionBtn({ onClick, title, icon, className }: { onClick: () => void; title: string; icon: React.ReactNode; className: string }) {
    return (
        <TooltipProvider>
            <Tooltip>
                <TooltipTrigger asChild>
                    <button onClick={onClick} className={cn('w-8 h-8 rounded-xl flex items-center justify-center transition-all bg-white border border-slate-100 shadow-sm hover:shadow-md', className)}>
                        {icon}
                    </button>
                </TooltipTrigger>
                <TooltipContent side="top">
                    <p className="text-[10px] font-black uppercase tracking-widest">{title}</p>
                </TooltipContent>
            </Tooltip>
        </TooltipProvider>
    )
}

// ── Main Component ─────────────────────────────────────────────────────────────

export function CargoAdminTable({ initialItems }: { initialItems: CargoItem[] }) {
    const router = useRouter()
    const [view, setView] = useState<ViewType>('list')
    const [approveTarget, setApproveTarget] = useState<CargoItem | null>(null)
    const [rejectTarget, setRejectTarget] = useState<CargoItem | null>(null)
    const [searchQuery, setSearchQuery] = useState('')
    
    // Pagination (Simple client-side for now, can be extended to server-side)
    const [currentPage, setCurrentPage] = useState(1)
    const itemsPerPage = 8

    // Filtering logic
    const params = typeof window !== 'undefined' ? new URLSearchParams(window.location.search) : new URLSearchParams()
    const statusFilter = params.get('status')
    const startDate = params.get('startDate')
    const endDate = params.get('endDate')

    const filteredItems = initialItems.filter(item => {
        const matchesSearch = 
            item.id.toLowerCase().includes(searchQuery.toLowerCase()) ||
            item.user?.name?.toLowerCase().includes(searchQuery.toLowerCase()) ||
            item.fromAddress.toLowerCase().includes(searchQuery.toLowerCase()) ||
            item.toAddress.toLowerCase().includes(searchQuery.toLowerCase())
        
        const matchesStatus = !statusFilter || item.status === statusFilter
        
        let matchesDate = true
        if (startDate || endDate) {
            const itemDate = new Date(item.createdAt).getTime()
            if (startDate && itemDate < new Date(startDate).getTime()) matchesDate = false
            if (endDate && itemDate > new Date(endDate).getTime() + 86400000) matchesDate = false
        }

        return matchesSearch && matchesStatus && matchesDate
    })

    const totalPages = Math.ceil(filteredItems.length / itemsPerPage)
    const paginatedItems = filteredItems.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage)

    const refresh = useCallback(() => router.refresh(), [router])

    const updateFilter = (key: string, value: string | null) => {
        const url = new URL(window.location.href)
        if (value) url.searchParams.set(key, value)
        else url.searchParams.delete(key)
        router.push(url.toString())
        setCurrentPage(1)
    }

    return (
        <div className="bg-white rounded-[2.5rem] border border-slate-100 shadow-[0_20px_50px_rgba(0,0,0,0.03)] overflow-hidden">

            {/* Premium Header */}
            <div className="px-8 py-6 border-b border-slate-50">
                <div className="flex flex-col md:flex-row md:items-center justify-between gap-6">
                    <div className="space-y-1">
                        <div className="flex items-center gap-3">
                            <div className="w-10 h-10 bg-blue-600 rounded-2xl flex items-center justify-center shadow-lg shadow-blue-200">
                                <TruckIcon size={18} className="text-white" strokeWidth={2.5} />
                            </div>
                            <h2 className="text-[20px] font-black text-slate-900 tracking-tight">Cargo Operations</h2>
                        </div>
                        <p className="text-[12px] text-slate-400 font-bold ml-[52px]">
                            Managing <span className="text-blue-600">{filteredItems.length}</span> total requests
                        </p>
                    </div>

                    <div className="flex flex-wrap items-center gap-3">
                        <div className="relative group/search">
                            <Search size={14} className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within/search:text-blue-600 group-focus-within/search:scale-110 transition-all" />
                            <input 
                                type="text"
                                placeholder="Search by ID, customer, route..."
                                value={searchQuery}
                                onChange={(e) => { setSearchQuery(e.target.value); setCurrentPage(1); }}
                                className="pl-11 pr-6 py-3 bg-slate-50/80 border border-slate-100 rounded-2xl text-[12px] font-bold text-slate-700 w-full md:w-[280px] focus:outline-none focus:ring-4 focus:ring-blue-50 focus:bg-white focus:border-blue-200 transition-all placeholder:text-slate-400"
                            />
                        </div>
                        
                        <div className="flex items-center bg-slate-50/80 border border-slate-100 rounded-2xl p-1 shrink-0">
                            <select 
                                value={statusFilter || ''}
                                onChange={(e) => updateFilter('status', e.target.value || null)}
                                className="bg-transparent border-none text-[11px] font-black uppercase tracking-widest text-slate-500 px-3 outline-none cursor-pointer hover:text-slate-900 transition-colors"
                            >
                                <option value="">All Statuses</option>
                                {Object.entries(STATUS_META).map(([status, meta]) => (
                                    <option key={status} value={status}>{meta.label}</option>
                                ))}
                            </select>
                        </div>

                        <div className="flex items-center gap-2 bg-slate-50/80 border border-slate-100 rounded-2xl px-3 py-2.5">
                            <Calendar size={13} className="text-slate-400" />
                            <input 
                                type="date" 
                                value={startDate || ''}
                                className="bg-transparent border-none text-[11px] font-black text-slate-600 focus:outline-none uppercase w-[100px]"
                                onChange={(e) => updateFilter('startDate', e.target.value || null)}
                            />
                            <span className="text-slate-200">—</span>
                            <input 
                                type="date" 
                                value={endDate || ''}
                                className="bg-transparent border-none text-[11px] font-black text-slate-600 focus:outline-none uppercase w-[100px]"
                                onChange={(e) => updateFilter('endDate', e.target.value || null)}
                            />
                        </div>

                        <div className="h-8 w-px bg-slate-100 mx-2" />
                        <ViewToggle view={view} onChange={setView} />
                        <CreateCargoModal />
                    </div>
                </div>
            </div>

            {/* Empty state */}
            {filteredItems.length === 0 ? (
                <div className="flex flex-col items-center justify-center py-32 text-slate-300 gap-4">
                    <div className="w-16 h-16 bg-slate-50 rounded-[2rem] flex items-center justify-center">
                        <Package size={28} className="text-slate-300" strokeWidth={1.5} />
                    </div>
                    <div className="text-center">
                        <p className="text-[15px] font-black text-slate-900 tracking-tight">No cargo requests found</p>
                        <p className="text-[12px] text-slate-400 font-bold mt-1 max-w-[240px]">We couldn't find any results matching your current filters.</p>
                    </div>
                    <button 
                        onClick={() => {
                            setSearchQuery('');
                            router.push(window.location.pathname);
                        }}
                        className="mt-2 text-[11px] font-black text-blue-600 uppercase tracking-widest hover:text-blue-700 transition-colors underline underline-offset-4"
                    >
                        Clear all filters
                    </button>
                </div>
            ) : view === 'list' ? (
                <div className="overflow-x-auto">
                    <table className="w-full text-[13px]">
                        <thead>
                            <tr>
                                {['ID', 'Customer details', 'Shipment Route', 'Cargo specs', 'Wagon', 'Settlement', 'Status', ''].map((h, i) => (
                                    <th
                                        key={h + i}
                                        className={cn(
                                            'px-8 py-5 text-[10px] font-black text-slate-400 uppercase tracking-[0.2em] bg-slate-50/30 border-b border-slate-50',
                                            i === 6 ? 'text-right' : 'text-left'
                                        )}
                                    >
                                        {h}
                                    </th>
                                ))}
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-slate-50">
                            {paginatedItems.map((item) => {
                                const canApprove = item.status === 'PENDING'
                                const canReject = ['PENDING', 'APPROVED', 'PAYMENT_PENDING'].includes(item.status)

                                return (
                                    <tr key={item.id} className="group hover:bg-slate-50/40 transition-all duration-200">

                                        {/* ID */}
                                        <td className="px-8 py-6 whitespace-nowrap">
                                            <span className="font-mono text-[10px] font-black text-slate-400 bg-slate-50 border border-slate-100 px-2 py-1 rounded-lg">
                                                #{item.id.slice(-8).toUpperCase()}
                                            </span>
                                        </td>

                                        {/* Customer */}
                                        <td className="px-8 py-6">
                                            {item.user ? (
                                                <div className="flex items-center gap-3">
                                                    <div className="w-10 h-10 bg-blue-50 rounded-2xl flex items-center justify-center text-[13px] font-black text-blue-600 border border-blue-100 shadow-sm">
                                                        {item.user.name.charAt(0).toUpperCase()}
                                                    </div>
                                                    <div>
                                                        <p className="font-black text-slate-900 text-[14px] leading-tight">{item.user.name}</p>
                                                        <p className="text-[11px] text-slate-400 font-bold mt-1 uppercase tracking-tight">{item.user.phone ?? item.user.email}</p>
                                                    </div>
                                                </div>
                                            ) : (
                                                <div className="flex items-center gap-2 text-slate-300 italic">
                                                    <Info size={12} />
                                                    <span className="text-[11px] font-bold">Unassigned</span>
                                                </div>
                                            )}
                                        </td>

                                        {/* Route */}
                                        <td className="px-8 py-6 max-w-[240px]">
                                            <div className="flex flex-col gap-1.5 relative pl-4">
                                                <div className="absolute left-0.5 top-1 bottom-1 w-[1.5px] bg-slate-100 rounded-full" />
                                                <div className="flex items-center gap-2 text-[12px] font-bold text-slate-700">
                                                    <span className="w-1.5 h-1.5 rounded-full bg-blue-500 shrink-0 shadow-[0_0_8px_rgba(59,130,246,0.3)]" />
                                                    <span className="truncate">{item.fromAddress}</span>
                                                </div>
                                                <div className="flex items-center gap-2 text-[12px] font-bold text-slate-400">
                                                    <span className="w-1.5 h-1.5 rounded-full bg-slate-300 shrink-0" />
                                                    <span className="truncate">{item.toAddress}</span>
                                                </div>
                                            </div>
                                        </td>

                                        {/* Service */}
                                        <td className="px-8 py-6">
                                            <div>
                                                <p className="text-[11px] font-black text-slate-900 uppercase tracking-widest leading-none mb-1.5">{item.serviceType}</p>
                                                <div className="flex items-center gap-2">
                                                    <span className="text-[10px] font-black text-white bg-slate-900 px-1.5 py-0.5 rounded uppercase tracking-tighter">{item.cargoType}</span>
                                                    <span className="text-[10px] font-black text-slate-400 uppercase">{item.cargoSize}</span>
                                                </div>
                                            </div>
                                        </td>

                                        {/* Wagon */}
                                        <td className="px-8 py-6">
                                            {item.wagonType ? (
                                                <span className="text-[10px] font-black text-slate-600 bg-white border border-slate-100 px-2.5 py-1.5 rounded-xl uppercase tracking-widest shadow-sm">
                                                    {item.wagonType}
                                                </span>
                                            ) : <span className="text-[10px] font-black text-slate-200 uppercase tracking-widest">Optional</span>}
                                        </td>

                                        {/* Amount */}
                                        <td className="px-8 py-6 whitespace-nowrap">
                                            {item.amount != null ? (
                                                <div>
                                                    <p className="text-[14px] font-black text-slate-900 tabular-nums leading-none">
                                                        TZS {Number(item.amount).toLocaleString()}
                                                    </p>
                                                    <p className="text-[9px] font-black text-emerald-600 uppercase tracking-[0.1em] mt-1.5 ml-0.5">Verified</p>
                                                </div>
                                            ) : (
                                                <div className="flex items-center gap-2 text-amber-500 bg-amber-50 border border-amber-100 px-2 py-1.5 rounded-xl w-fit">
                                                    <Info size={10} strokeWidth={3} />
                                                    <span className="text-[10px] font-black uppercase tracking-widest">Pending</span>
                                                </div>
                                            )}
                                        </td>

                                        {/* Status */}
                                        <td className="px-8 py-6">
                                            <div className="flex justify-end">
                                                <StatusBadge status={item.status} />
                                            </div>
                                        </td>

                                        {/* Actions */}
                                        <td className="px-8 py-6">
                                            <div className="flex items-center justify-end gap-2 shrink-0">
                                                <ActionBtn
                                                    onClick={() => router.push(`/cargo/${item.id}`)}
                                                    title="Inspect Details"
                                                    icon={<Eye size={14} strokeWidth={2.5} />}
                                                    className="text-slate-400 hover:text-blue-600"
                                                />
                                                {canApprove && (
                                                    <ActionBtn
                                                        onClick={() => setApproveTarget(item)}
                                                        title="Approve Cargo"
                                                        icon={<CheckCircle2 size={14} strokeWidth={2.5} />}
                                                        className="text-slate-400 hover:text-blue-600"
                                                    />
                                                )}
                                                {canReject && (
                                                    <ActionBtn
                                                        onClick={() => setRejectTarget(item)}
                                                        title="Reject Cargo"
                                                        icon={<XCircle size={14} strokeWidth={2.5} />}
                                                        className="text-slate-400 hover:text-rose-600"
                                                    />
                                                )}
                                            </div>
                                        </td>
                                    </tr>
                                )
                            })}
                        </tbody>
                    </table>
                </div>
            ) : (
                // ── Grid View ──────────────────────────────────────────────────
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 p-8">
                    {paginatedItems.map((item) => (
                        <div
                            key={item.id}
                            onClick={() => router.push(`/cargo/${item.id}`)}
                            className="group relative bg-white rounded-[2rem] border border-slate-100 p-6 shadow-[0_4px_12px_rgba(0,0,0,0.02)] hover:shadow-[0_20px_50px_rgba(0,0,0,0.08)] hover:-translate-y-1 cursor-pointer transition-all duration-300 flex flex-col gap-5 overflow-hidden"
                        >
                            {/* Accent highlight */}
                            <div className="absolute top-0 left-0 right-0 h-1 bg-gradient-to-r from-blue-400/20 via-blue-600 to-blue-400/20 opacity-0 group-hover:opacity-100 transition-opacity" />

                            {/* Top row */}
                            <div className="flex items-start justify-between">
                                <span className="font-mono text-[10px] font-black text-slate-400 bg-slate-50 border border-slate-100 px-2 py-1 rounded-lg">
                                    #{item.id.slice(-8).toUpperCase()}
                                </span>
                                <StatusBadge status={item.status} />
                            </div>

                            {/* Route */}
                            <div className="flex flex-col gap-2 relative pl-4 mt-2">
                                <div className="absolute left-0.5 top-1 bottom-1 w-[2px] bg-slate-100 rounded-full" />
                                <div>
                                    <p className="text-[9px] font-black uppercase tracking-[0.2em] text-slate-400 mb-1">Pickup</p>
                                    <p className="text-[13px] font-black text-slate-900 leading-tight truncate">{item.fromAddress}</p>
                                </div>
                                <div>
                                    <p className="text-[9px] font-black uppercase tracking-[0.2em] text-slate-400 mb-1 mt-2">Delivery Target</p>
                                    <p className="text-[13px] font-black text-slate-900 leading-tight truncate">{item.toAddress}</p>
                                </div>
                            </div>

                            {/* Service Details */}
                            <div className="flex items-center gap-2 p-3 bg-slate-50 rounded-2xl border border-slate-100">
                                <Package size={14} className="text-slate-400" />
                                <div className="flex flex-wrap gap-1.5">
                                    <span className="text-[10px] font-black text-slate-900 uppercase tracking-tighter">{item.cargoType}</span>
                                    <span className="text-[10px] font-black text-slate-400 uppercase tracking-tighter">·</span>
                                    <span className="text-[10px] font-black text-slate-400 uppercase tracking-tighter">{item.cargoSize}</span>
                                </div>
                            </div>

                            {/* Footer */}
                            <div className="pt-5 mt-auto border-t border-slate-50 flex items-center justify-between">
                                <div>
                                    <p className="text-[9px] font-black text-slate-400 uppercase tracking-[0.2em] mb-1">Settlement</p>
                                    <p className="text-[14px] font-black text-slate-900 tabular-nums">
                                        {item.amount != null ? `TZS ${Number(item.amount).toLocaleString()}` : <span className="text-amber-500 font-black italic text-[11px] uppercase">Quoting...</span>}
                                    </p>
                                </div>
                                <div className="w-10 h-10 rounded-full border border-slate-100 flex items-center justify-center group-hover:bg-blue-600 group-hover:border-blue-600 transition-all">
                                    <ArrowUpRight size={16} className="text-slate-300 group-hover:text-white group-hover:scale-110 transition-all" />
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
            )}

            {/* Pagination Sidebar */}
            {totalPages > 1 && (
                <div className="px-8 py-5 bg-slate-50/50 border-t border-slate-50 flex items-center justify-between">
                    <p className="text-[11px] font-black text-slate-400 uppercase tracking-widest">
                        Page <span className="text-slate-900">{currentPage}</span> of <span className="text-slate-900">{totalPages}</span>
                    </p>
                    <div className="flex items-center gap-1.5">
                        <button
                            disabled={currentPage === 1}
                            onClick={() => setCurrentPage(p => p - 1)}
                            className="w-10 h-10 rounded-2xl border border-slate-200 bg-white flex items-center justify-center disabled:opacity-30 disabled:cursor-not-allowed hover:bg-slate-50 transition-all shadow-sm"
                        >
                            <ChevronLeft size={16} strokeWidth={3} className="text-slate-600" />
                        </button>
                        {[...Array(totalPages)].map((_, i) => (
                            <button
                                key={i}
                                onClick={() => setCurrentPage(i + 1)}
                                className={cn(
                                    "w-10 h-10 rounded-2xl text-[12px] font-black transition-all",
                                    currentPage === i + 1 
                                        ? "bg-blue-600 text-white shadow-lg shadow-blue-200 scale-110" 
                                        : "bg-white border border-slate-200 text-slate-400 hover:bg-slate-50"
                                )}
                            >
                                {i + 1}
                            </button>
                        )).slice(Math.max(0, currentPage - 2), Math.min(totalPages, currentPage + 1))}
                        <button
                            disabled={currentPage === totalPages}
                            onClick={() => setCurrentPage(p => p + 1)}
                            className="w-10 h-10 rounded-2xl border border-slate-200 bg-white flex items-center justify-center disabled:opacity-30 disabled:cursor-not-allowed hover:bg-slate-50 transition-all shadow-sm"
                        >
                            <ChevronRight size={16} strokeWidth={3} className="text-slate-600" />
                        </button>
                    </div>
                </div>
            )}

            {/* Modals */}
            {approveTarget && (
                <ApproveModal cargo={approveTarget} onClose={() => setApproveTarget(null)} onSuccess={refresh} />
            )}
            {rejectTarget && (
                <RejectModal cargo={rejectTarget} onClose={() => setRejectTarget(null)} onSuccess={refresh} />
            )}
        </div>
    )
}