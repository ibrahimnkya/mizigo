'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import {
    Package, Compass, CalendarDays, User,
    CreditCard, CheckCircle2, XCircle, Clock,
    Loader2, ArrowLeft, Receipt, TruckIcon, Info,
    Zap,
} from 'lucide-react'
import { cn } from '@/lib/utils'
import { PaymentGatewayService, PaymentChannel } from '@/services/paymentGatewayService'

// ── Status config ──────────────────────────────────────────────────────────────

const STATUS_META: Record<string, { label: string; color: string; bg: string; border: string; dot: string }> = {
    PENDING:         { label: 'Pending Review',    color: 'text-amber-700',  bg: 'bg-amber-50',   border: 'border-amber-200/60', dot: 'bg-amber-400' },
    APPROVED:        { label: 'Approved',           color: 'text-blue-700',   bg: 'bg-blue-50',    border: 'border-blue-200/60',  dot: 'bg-blue-500' },
    PAYMENT_PENDING: { label: 'Awaiting Payment',   color: 'text-violet-700', bg: 'bg-violet-50',  border: 'border-violet-200/60',dot: 'bg-violet-500' },
    PAID:            { label: 'Paid',               color: 'text-emerald-700',bg: 'bg-emerald-50', border: 'border-emerald-200/60',dot: 'bg-emerald-500' },
    COMPLETED:       { label: 'Completed',          color: 'text-slate-600',  bg: 'bg-slate-50',   border: 'border-slate-200/60', dot: 'bg-slate-400' },
    REJECTED:        { label: 'Rejected',           color: 'text-rose-700',   bg: 'bg-rose-50',    border: 'border-rose-200/60',  dot: 'bg-rose-500' },
}

const STATUS_ICONS: Record<string, React.ElementType> = {
    PENDING: Clock, APPROVED: CheckCircle2, PAYMENT_PENDING: CreditCard,
    PAID: CheckCircle2, COMPLETED: TruckIcon, REJECTED: XCircle,
}

// ── Types ──────────────────────────────────────────────────────────────────────

interface Payment {
    id: string; status: string; amount: number;
    paymentMethod?: string | null; transactionReference?: string | null;
    paidAt?: string | null; createdAt: string
}

interface CargoDetail {
    id: string; fromAddress: string; toAddress: string; serviceType: string;
    cargoType: string; cargoSize: string; peopleNeeded: number;
    weight: number; length?: number | null; width?: number | null; height?: number | null;
    urgency: string; isFragile: boolean; specialInstructions?: string | null;
    receiverName: string; receiverPhone?: string | null; receiverPays: boolean;
    pickupType: string; status: string; rejectionReason?: string | null;
    amount?: number | null; createdAt: string; updatedAt: string;
    user?: { name: string; email: string; phone?: string | null } | null;
    approvedBy?: { name: string; email: string } | null;
    payment?: Payment | null;
}

interface CargoDetailPanelProps {
    cargo: CargoDetail;
    defaultTab: string;
    userRole?: string;
}

// ── Sub-components ─────────────────────────────────────────────────────────────

function Field({ label, value }: { label: string; value?: string | number | null }) {
    return (
        <div className="flex flex-col gap-1">
            <span className="text-[10px] font-extrabold uppercase tracking-[0.12em] text-slate-400">{label}</span>
            <span className="text-[13px] font-semibold text-slate-800 leading-snug">
                {value ?? <span className="text-slate-300 font-normal italic">Not provided</span>}
            </span>
        </div>
    )
}

function Section({ title, icon: Icon, children }: { title: string; icon: React.ElementType; children: React.ReactNode }) {
    return (
        <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_4px_rgba(0,0,0,0.04)] overflow-hidden">
            <div className="flex items-center gap-2 px-5 py-3.5 border-b border-slate-50 bg-slate-50/50">
                <Icon size={12} className="text-slate-400" strokeWidth={2.5} />
                <span className="text-[10.5px] font-extrabold uppercase tracking-[0.1em] text-slate-500">{title}</span>
            </div>
            <div className="px-5 py-4">{children}</div>
        </div>
    )
}

// ── Details Tab ────────────────────────────────────────────────────────────────

function DetailsTab({ cargo, onActionSuccess, userRole }: { cargo: CargoDetail; onActionSuccess: () => void; userRole?: string }) {
    const DEFAULT = { label: cargo.status, color: 'text-slate-600', bg: 'bg-slate-50', border: 'border-slate-200', dot: 'bg-slate-400' }
    const meta = STATUS_META[cargo.status] ?? DEFAULT
    const Icon = STATUS_ICONS[cargo.status] ?? Info

    return (
        <div className="flex flex-col gap-4">

            {/* Status banner */}
            <div className={cn('flex items-center gap-3.5 px-5 py-4 rounded-2xl border', meta.bg, meta.border)}>
                <div className={cn('w-8 h-8 rounded-xl flex items-center justify-center shrink-0', meta.bg, 'border', meta.border)}>
                    <Icon size={15} className={meta.color} strokeWidth={2.5} />
                </div>
                <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2">
                        <span className={cn('w-1.5 h-1.5 rounded-full shrink-0', meta.dot)} />
                        <p className={cn('text-[13px] font-extrabold', meta.color)}>{meta.label}</p>
                    </div>
                    {cargo.rejectionReason && (
                        <p className="text-[12px] text-rose-500 font-medium mt-0.5 ml-3.5">"{cargo.rejectionReason}"</p>
                    )}
                </div>
                {cargo.amount != null && (
                    <div className="text-right shrink-0">
                        <p className="text-[9px] font-extrabold uppercase tracking-widest text-slate-400 mb-0.5">Amount</p>
                        <p className={cn('text-[17px] font-extrabold tabular-nums', meta.color)}>
                            TZS {cargo.amount.toLocaleString()}
                        </p>
                    </div>
                )}
            </div>

            {/* Route */}
            <Section title="Route" icon={Compass}>
                {/* Visual route */}
                <div className="flex flex-col gap-2 mb-4 pl-2 relative">
                    <div className="absolute left-[5px] top-2 bottom-2 w-[1.5px] bg-slate-100 rounded-full" />
                    <div className="flex items-start gap-3">
                        <div className="w-2.5 h-2.5 rounded-full bg-indigo-500 border-2 border-white ring-1 ring-indigo-200 shrink-0 mt-0.5" />
                        <div>
                            <p className="text-[9px] font-extrabold uppercase tracking-widest text-slate-400">Origin</p>
                            <p className="text-[13px] font-bold text-slate-800 mt-0.5">{cargo.fromAddress}</p>
                        </div>
                    </div>
                    <div className="flex items-start gap-3">
                        <div className="w-2.5 h-2.5 rounded-full bg-slate-300 border-2 border-white ring-1 ring-slate-100 shrink-0 mt-0.5" />
                        <div>
                            <p className="text-[9px] font-extrabold uppercase tracking-widest text-slate-400">Destination</p>
                            <p className="text-[13px] font-bold text-slate-800 mt-0.5">{cargo.toAddress}</p>
                        </div>
                    </div>
                </div>
                <div className="grid grid-cols-2 gap-4 pt-4 border-t border-slate-50">
                    <Field label="Pickup Type" value={cargo.pickupType} />
                    <Field label="Service" value={cargo.serviceType} />
                </div>
            </Section>

            {/* Cargo details */}
            <Section title="Cargo Details" icon={Package}>
                <div className="grid grid-cols-2 gap-4">
                    <Field label="Type" value={cargo.cargoType} />
                    <Field label="Size" value={cargo.cargoSize} />
                    <Field label="Weight" value={`${cargo.weight} kg`} />
                    <Field label="Urgency" value={cargo.urgency} />
                    <Field label="Dimensions (L×W×H)" value={cargo.length ? `${cargo.length}×${cargo.width}×${cargo.height} cm` : '—'} />
                    <Field label="Fragile" value={cargo.isFragile ? 'Yes' : 'No'} />
                    <Field label="People Needed" value={cargo.peopleNeeded} />
                    <Field label="Receiver Pays" value={cargo.receiverPays ? 'Yes' : 'No'} />
                </div>
                {cargo.specialInstructions && (
                    <div className="mt-4 pt-4 border-t border-slate-50">
                        <p className="text-[10px] font-extrabold uppercase tracking-[0.12em] text-slate-400 mb-1">Special Instructions</p>
                        <p className="text-[12px] text-slate-600 italic">"{cargo.specialInstructions}"</p>
                    </div>
                )}
            </Section>

            {/* Payment (For Agents when status is PAYMENT_PENDING) */}
            {cargo.status === 'PAYMENT_PENDING' && userRole === 'AGENT' && (
                <CargoPaymentSection cargo={cargo} onPaymentInitiated={onActionSuccess} />
            )}

            {/* Receiver */}
            <Section title="Receiver" icon={User}>
                <div className="grid grid-cols-2 gap-4">
                    <Field label="Name" value={cargo.receiverName} />
                    <Field label="Phone" value={cargo.receiverPhone} />
                </div>
            </Section>

            {/* Customer */}
            {cargo.user && (
                <Section title="Customer" icon={User}>
                    <div className="grid grid-cols-2 gap-4">
                        <Field label="Name" value={cargo.user.name} />
                        <Field label="Email" value={cargo.user.email} />
                        <Field label="Phone" value={cargo.user.phone} />
                        {cargo.approvedBy && <Field label="Approved By" value={cargo.approvedBy.name} />}
                    </div>
                </Section>
            )}

            {/* Admin actions */}
            {(cargo.status === 'PENDING' || cargo.status === 'PAID') && userRole !== 'AGENT' && (
                <ActionPanel cargo={cargo} onSuccess={onActionSuccess} />
            )}
        </div>
    )
}

// ── Receipt Tab ────────────────────────────────────────────────────────────────

function ReceiptTab({ cargo }: { cargo: CargoDetail }) {
    const pay = cargo.payment
    const [downloading, setDownloading] = useState(false)

    const handleDownloadPDF = async () => {
        setDownloading(true)
        try {
            const res = await fetch(`/api/cargo/${cargo.id}/receipt/pdf`)
            if (!res.ok) throw new Error('PDF generation failed')
            const blob = await res.blob()
            const url = URL.createObjectURL(blob)
            const a = document.createElement('a')
            a.href = url
            a.download = `mizigo-receipt-${cargo.id.slice(-6).toUpperCase()}.pdf`
            document.body.appendChild(a)
            a.click()
            a.remove()
            URL.revokeObjectURL(url)
        } catch (e) {
            console.error('PDF download failed:', e)
        } finally {
            setDownloading(false)
        }
    }

    if (!pay || pay.status !== 'SUCCESS') {
        return (
            <div className="flex flex-col items-center justify-center py-24 text-slate-300 gap-3">
                <Receipt size={36} strokeWidth={1.5} />
                <p className="text-sm font-semibold text-slate-400">No receipt available yet</p>
                <p className="text-[12px] text-slate-300">Receipt will appear once payment is confirmed</p>
            </div>
        )
    }

    const paidAt = pay.paidAt
        ? new Date(pay.paidAt).toLocaleString('en-TZ', { dateStyle: 'long', timeStyle: 'short' })
        : '—'

    const rows = [
        { label: 'Receipt No.', value: `RCP-${pay.id.slice(-8).toUpperCase()}` },
        { label: 'Transaction Ref.', value: pay.transactionReference ?? '—' },
        { label: 'Payment Method', value: pay.paymentMethod?.toUpperCase() ?? '—' },
        { label: 'Paid At', value: paidAt },
        { label: 'Cargo ID', value: `#${cargo.id.slice(-8).toUpperCase()}` },
        { label: 'Route', value: `${cargo.fromAddress} → ${cargo.toAddress}` },
        { label: 'Customer', value: cargo.user?.name ?? '—' },
    ]

    return (
        <div className="flex justify-center py-2">
            <div className="w-full max-w-md">
                {/* Receipt card */}
                <div className="bg-white border border-slate-200 rounded-2xl shadow-[0_4px_24px_rgba(0,0,0,0.08)] overflow-hidden">

                    {/* Header */}
                    <div className="bg-slate-900 px-6 py-7 text-white">
                        <div className="flex items-start justify-between">
                            <div>
                                <p className="text-[9px] font-extrabold uppercase tracking-[0.2em] text-slate-500">Official Receipt</p>
                                <p className="text-[18px] font-extrabold tracking-tight mt-1">Mizigo Logistics</p>
                            </div>
                            <div className="w-8 h-8 bg-emerald-500 rounded-xl flex items-center justify-center">
                                <CheckCircle2 size={16} className="text-white" />
                            </div>
                        </div>
                        <div className="mt-5">
                            <p className="text-[10px] text-slate-500 font-extrabold uppercase tracking-widest mb-1">Amount Paid</p>
                            <p className="text-[28px] font-extrabold tracking-tight tabular-nums">
                                TZS {pay.amount.toLocaleString()}
                            </p>
                        </div>
                        <div className="mt-3 inline-flex items-center gap-1.5 bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 px-3 py-1 rounded-full">
                            <span className="w-1.5 h-1.5 rounded-full bg-emerald-400" />
                            <span className="text-[11px] font-extrabold uppercase tracking-wider">Payment Confirmed</span>
                        </div>
                    </div>

                    {/* Rows */}
                    <div className="px-6 divide-y divide-slate-50">
                        {rows.map(({ label, value }) => (
                            <div key={label} className="flex justify-between items-center py-3">
                                <span className="text-[11px] text-slate-400 font-semibold">{label}</span>
                                <span className="text-[12px] text-slate-800 font-bold text-right max-w-[200px] truncate">{value}</span>
                            </div>
                        ))}
                    </div>

                    {/* Footer */}
                    <div className="px-6 py-4 bg-slate-50 border-t border-slate-100 text-center">
                        <p className="text-[11px] text-slate-400 font-medium">Thank you for using Mizigo Logistics</p>
                    </div>
                </div>

                {/* Actions */}
                <div className="flex justify-center gap-6 mt-4">
                    <button
                        onClick={() => window.print()}
                        className="flex items-center gap-1.5 text-[12px] text-slate-400 hover:text-slate-700 font-semibold transition-colors"
                    >
                        <Receipt size={13} /> Print
                    </button>
                    <button
                        onClick={handleDownloadPDF}
                        disabled={downloading}
                        className="flex items-center gap-1.5 text-[12px] text-indigo-500 hover:text-indigo-700 font-semibold transition-colors disabled:opacity-50"
                    >
                        {downloading ? <Loader2 size={13} className="animate-spin" /> : <Receipt size={13} />}
                        {downloading ? 'Generating…' : 'Download PDF'}
                    </button>
                </div>
            </div>
        </div>
    )
}

// ── Action Panel ───────────────────────────────────────────────────────────────

function ActionPanel({ cargo, onSuccess }: { cargo: CargoDetail; onSuccess: () => void }) {
    const [amount, setAmount] = useState(cargo.amount?.toString() ?? '')
    const [reason, setReason] = useState('')
    const [loading, setLoading] = useState<'approve' | 'reject' | 'complete' | null>(null)
    const [error, setError] = useState('')

    const call = async (body: object, action: 'approve' | 'reject' | 'complete') => {
        setLoading(action); setError('')
        try {
            const res = await fetch(`/api/cargo/${cargo.id}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(body),
            })
            const data = await res.json()
            if (!res.ok) throw new Error(data.error ?? 'Request failed')
            onSuccess()
        } catch (e: any) {
            setError(e.message)
        } finally {
            setLoading(null)
        }
    }

    return (
        <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_4px_rgba(0,0,0,0.04)] overflow-hidden">
            <div className="flex items-center gap-2 px-5 py-3.5 border-b border-slate-50 bg-slate-50/50">
                <CheckCircle2 size={12} className="text-slate-400" strokeWidth={2.5} />
                <span className="text-[10.5px] font-extrabold uppercase tracking-[0.1em] text-slate-500">Admin Actions</span>
            </div>
            <div className="px-5 py-4">
                {error && (
                    <div className="mb-4 px-3 py-2 bg-rose-50 rounded-lg text-rose-600 text-[12px] font-semibold border border-rose-100">
                        {error}
                    </div>
                )}

                {cargo.status === 'PENDING' && (
                    <div className="flex flex-col gap-4">
                        <div>
                            <label className="block text-[10px] font-extrabold text-slate-400 uppercase tracking-wider mb-1.5">
                                Payment Amount (TZS)
                            </label>
                            <div className="relative">
                                <span className="absolute left-3.5 top-1/2 -translate-y-1/2 text-[11px] font-extrabold text-slate-400">TZS</span>
                                <input
                                    type="number"
                                    value={amount}
                                    onChange={(e) => setAmount(e.target.value)}
                                    placeholder="0"
                                    className="w-full pl-14 pr-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-[13px] font-bold text-slate-900 focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:bg-white transition-colors"
                                />
                            </div>
                        </div>
                        <div>
                            <label className="block text-[10px] font-extrabold text-slate-400 uppercase tracking-wider mb-1.5">
                                Rejection Reason (if rejecting)
                            </label>
                            <textarea
                                value={reason}
                                onChange={(e) => setReason(e.target.value)}
                                rows={2}
                                placeholder="Optional — required if rejecting"
                                className="w-full px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-[13px] text-slate-900 focus:outline-none focus:ring-2 focus:ring-rose-400 focus:bg-white resize-none transition-colors"
                            />
                        </div>
                        <div className="grid grid-cols-2 gap-2.5">
                            <button
                                disabled={!!loading}
                                onClick={() => call({ status: 'APPROVED', amount: Number(amount) }, 'approve')}
                                className="py-2.5 bg-emerald-600 hover:bg-emerald-700 disabled:opacity-60 text-white rounded-xl text-[12px] font-extrabold flex items-center justify-center gap-1.5 transition-colors shadow-md shadow-emerald-100"
                            >
                                {loading === 'approve' ? <Loader2 size={13} className="animate-spin" /> : <CheckCircle2 size={13} />}
                                Approve
                            </button>
                            <button
                                disabled={!!loading}
                                onClick={() => {
                                    if (!reason.trim()) { setError('Rejection reason required'); return }
                                    call({ status: 'REJECTED', reason }, 'reject')
                                }}
                                className="py-2.5 bg-rose-600 hover:bg-rose-700 disabled:opacity-60 text-white rounded-xl text-[12px] font-extrabold flex items-center justify-center gap-1.5 transition-colors"
                            >
                                {loading === 'reject' ? <Loader2 size={13} className="animate-spin" /> : <XCircle size={13} />}
                                Reject
                            </button>
                        </div>
                    </div>
                )}

                {cargo.status === 'PAID' && (
                    <button
                        disabled={!!loading}
                        onClick={() => call({ status: 'COMPLETED' }, 'complete')}
                        className="w-full py-3 bg-indigo-600 hover:bg-indigo-700 disabled:opacity-60 text-white rounded-xl text-[13px] font-extrabold flex items-center justify-center gap-2 transition-colors shadow-md shadow-indigo-100"
                    >
                        {loading === 'complete' ? <Loader2 size={14} className="animate-spin" /> : <TruckIcon size={14} />}
                        Mark as Delivered
                    </button>
                )}
            </div>
        </div>
    )
}

// ── Cargo Payment Section (For Agents) ──────────────────────────────────────────

function CargoPaymentSection({ cargo, onPaymentInitiated }: { cargo: CargoDetail; onPaymentInitiated: () => void }) {
    const [provider, setProvider] = useState('')
    const [phone, setPhone] = useState(cargo.user?.phone ?? '')
    const [loading, setLoading] = useState<string | null>(null)
    const [error, setError] = useState('')
    const [success, setSuccess] = useState('')
    const [channels, setChannels] = useState<PaymentChannel[]>([])

    useEffect(() => {
        const loadChannels = async () => {
            const data = await PaymentGatewayService.getChannels()
            setChannels(data)
        }
        loadChannels()
    }, [])

    const handlePay = async () => {
        if (!provider) { setError('Please select a payment provider'); return }
        if (!phone) { setError('Phone number is required'); return }

        setLoading('pay'); setError(''); setSuccess('')
        try {
            const res = await fetch('/api/payment/initiate', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ cargoId: cargo.id, provider, phone }),
            })
            const data = await res.json()
            if (!res.ok) throw new Error(data.error ?? 'Payment initiation failed')

            setSuccess(data.message)
            setTimeout(() => onPaymentInitiated(), 3000)
        } catch (e: any) {
            setError(e.message)
        } finally {
            setLoading(null)
        }
    }

    const handleSimulate = async () => {
        setLoading('simulate'); setError(''); setSuccess('')
        try {
            const res = await fetch('/api/payment/simulate', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ cargoId: cargo.id }),
            })
            const data = await res.json()
            if (!res.ok) throw new Error(data.error ?? 'Simulation failed')

            setSuccess(data.message)
            setTimeout(() => onPaymentInitiated(), 2000)
        } catch (e: any) {
            setError(e.message)
        } finally {
            setLoading(null)
        }
    }

    return (
        <div className="bg-white rounded-2xl border border-indigo-100 shadow-[0_4px_12px_rgba(79,70,229,0.08)] overflow-hidden">
            <div className="flex items-center gap-2 px-5 py-3.5 border-b border-indigo-50 bg-indigo-50/30">
                <CreditCard size={14} className="text-indigo-500" strokeWidth={2.5} />
                <span className="text-[11px] font-extrabold uppercase tracking-[0.1em] text-indigo-600">Complete Payment</span>
            </div>
            <div className="px-5 py-5 flex flex-col gap-5">
                {error && (
                    <div className="px-3 py-2 bg-rose-50 rounded-lg text-rose-600 text-[11px] font-semibold border border-rose-100 flex items-center gap-2">
                        <XCircle size={12} /> {error}
                    </div>
                )}
                {success && (
                    <div className="px-3 py-2 bg-emerald-50 rounded-lg text-emerald-600 text-[11px] font-semibold border border-emerald-100 flex items-center gap-2">
                        <CheckCircle2 size={12} /> {success}
                    </div>
                )}

                {channels.length > 0 && (
                    <div>
                        <p className="text-[10px] font-extrabold text-slate-400 uppercase tracking-wider mb-2.5">Select Provider</p>
                        <div className="grid grid-cols-2 gap-2">
                            {channels.map((ch) => (
                                <button
                                    key={ch.id}
                                    onClick={() => { setProvider(ch.uts_name); setError('') }}
                                    className={cn(
                                        "flex items-center gap-2.5 px-3 py-2.5 rounded-xl border text-[12px] font-bold transition-all",
                                        provider === ch.uts_name
                                            ? "bg-indigo-600 border-indigo-600 text-white shadow-md shadow-indigo-100"
                                            : "bg-white border-slate-100 text-slate-600 hover:border-slate-300"
                                    )}
                                >
                                    <div className="w-5 h-5 rounded-full bg-slate-100 overflow-hidden shrink-0 border border-slate-200">
                                        <img src={ch.logoUrl} alt={ch.mobile_channel} className="w-full h-full object-cover" />
                                    </div>
                                    {ch.mobile_channel === 'YAS' ? 'Mixx by Yas' : ch.mobile_channel}
                                </button>
                            ))}
                        </div>
                    </div>
                )}

                <div>
                    <label className="block text-[10px] font-extrabold text-slate-400 uppercase tracking-wider mb-2">
                        Payment Phone Number
                    </label>
                    <input
                        type="tel"
                        value={phone}
                        onChange={(e) => setPhone(e.target.value)}
                        placeholder="07XXXXXXXX"
                        className="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-[14px] font-bold text-slate-900 focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:bg-white transition-colors"
                    />
                    <p className="text-[10px] text-slate-400 mt-2 flex items-center gap-1">
                        <Info size={10} /> Enter number to receive M-Pesa/Airtel Money prompt
                    </p>
                </div>

                <div className="flex flex-col gap-2">
                    <button
                        disabled={!!loading || !!success}
                        onClick={handlePay}
                        className="w-full py-3.5 bg-indigo-600 hover:bg-indigo-700 disabled:opacity-60 text-white rounded-xl text-[14px] font-extrabold flex items-center justify-center gap-2 transition-all shadow-lg shadow-indigo-100 active:scale-[0.98]"
                    >
                        {loading === 'pay' ? <Loader2 size={16} className="animate-spin" /> : <CreditCard size={16} />}
                        {loading === 'pay' ? 'Initiating...' : `Pay TZS ${cargo.amount?.toLocaleString()}`}
                    </button>

                    <button
                        disabled={!!loading || !!success}
                        onClick={handleSimulate}
                        className="w-full py-2.5 bg-slate-100 hover:bg-slate-200 disabled:opacity-60 text-slate-600 rounded-lg text-[12px] font-bold flex items-center justify-center gap-2 transition-colors border border-slate-200"
                    >
                        {loading === 'simulate' ? <Loader2 size={14} className="animate-spin" /> : <Zap size={14} className="text-amber-500" />}
                        Simulate Success (Demo)
                    </button>
                </div>
            </div>
        </div>
    )
}

// ── Main ───────────────────────────────────────────────────────────────────────

export function CargoDetailPanel({ cargo, defaultTab, userRole }: CargoDetailPanelProps) {
    const router = useRouter()
    const [tab, setTab] = useState<'details' | 'receipt'>(defaultTab === 'receipt' ? 'receipt' : 'details')
    const hasPaid = ['PAID', 'COMPLETED'].includes(cargo.status)

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-2xl mx-auto px-5 py-8 flex flex-col gap-5">

                {/* Top nav */}
                <div className="flex items-center justify-between">
                    <button
                        onClick={() => router.back()}
                        className="flex items-center gap-1.5 text-[12px] font-bold text-slate-400 hover:text-slate-700 transition-colors"
                    >
                        <ArrowLeft size={14} />
                        Back
                    </button>

                    {/* Tabs */}
                    <div className="flex items-center bg-white border border-slate-100 rounded-xl p-1 shadow-[0_1px_3px_rgba(0,0,0,0.04)] gap-1">
                        {(['details', 'receipt'] as const).map((t) => (
                            <button
                                key={t}
                                onClick={() => setTab(t)}
                                disabled={t === 'receipt' && !hasPaid}
                                className={cn(
                                    'px-4 py-2 rounded-lg text-[11px] font-extrabold uppercase tracking-wider transition-all',
                                    tab === t
                                        ? 'bg-indigo-600 text-white shadow-md shadow-indigo-200'
                                        : 'text-slate-400 hover:text-slate-600 disabled:opacity-30 disabled:cursor-not-allowed'
                                )}
                            >
                                {t === 'details' ? 'Details' : 'Receipt'}
                            </button>
                        ))}
                    </div>
                </div>

                {/* Title */}
                <div>
                    <div className="flex items-center gap-2 mb-1">
                        <span className="font-mono text-[11px] font-bold text-slate-400 bg-slate-100 px-2 py-0.5 rounded-md">
                            #{cargo.id.slice(-8).toUpperCase()}
                        </span>
                    </div>
                    <h1 className="text-[20px] font-extrabold text-slate-900 tracking-tight">Cargo Request</h1>
                    <p className="text-[12px] text-slate-400 font-medium mt-0.5">
                        Created {new Date(cargo.createdAt).toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' })}
                    </p>
                </div>

                {/* Content */}
                {tab === 'details'
                    ? <DetailsTab cargo={cargo} onActionSuccess={() => router.refresh()} userRole={userRole} />
                    : <ReceiptTab cargo={cargo} />
                }
            </div>
        </div>
    )
}