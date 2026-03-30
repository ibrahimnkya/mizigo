/**
 * MizigoPDFReceipt – server-side React-PDF template.
 * Used by /api/cargo/[id]/receipt/pdf to generate a downloadable PDF.
 *
 * @react-pdf/renderer runs in a Node.js context; do NOT import browser APIs.
 */
import {
    Document,
    Page,
    Text,
    View,
    StyleSheet,
    Font,
} from '@react-pdf/renderer'

// ── Styles ────────────────────────────────────────────────────────────────────

const INDIGO = '#4F46E5'
const VIOLET = '#7C3AED'
const SLATE_900 = '#0F172A'
const SLATE_700 = '#334155'
const SLATE_500 = '#64748B'
const SLATE_200 = '#E2E8F0'
const EMERALD = '#059669'
const WHITE = '#FFFFFF'

const s = StyleSheet.create({
    page: {
        backgroundColor: '#F8FAFC',
        padding: 0,
        fontFamily: 'Helvetica',
        fontSize: 10,
        color: SLATE_900,
    },

    // ── Header band ──────────────────────────────────────────────────────────
    header: {
        backgroundColor: INDIGO,
        padding: '36 40 28',
    },
    headerLogo: {
        fontSize: 22,
        fontFamily: 'Helvetica-Bold',
        color: WHITE,
        letterSpacing: 0.5,
    },
    headerSub: {
        fontSize: 10,
        color: 'rgba(255,255,255,0.7)',
        marginTop: 2,
        letterSpacing: 0.8,
        textTransform: 'uppercase',
    },
    headerAmount: {
        fontSize: 34,
        fontFamily: 'Helvetica-Bold',
        color: WHITE,
        marginTop: 18,
    },
    headerCurrency: {
        fontSize: 14,
        color: 'rgba(255,255,255,0.8)',
    },
    headerConfirmed: {
        fontSize: 11,
        color: 'rgba(255,255,255,0.7)',
        marginTop: 4,
    },

    // ── Body ─────────────────────────────────────────────────────────────────
    body: {
        padding: '28 40 0',
        flex: 1,
    },

    // ── Section ──────────────────────────────────────────────────────────────
    section: {
        backgroundColor: WHITE,
        borderRadius: 10,
        padding: '14 18',
        marginBottom: 14,
        border: `1 solid ${SLATE_200}`,
    },
    sectionTitle: {
        fontSize: 8,
        fontFamily: 'Helvetica-Bold',
        color: SLATE_500,
        textTransform: 'uppercase',
        letterSpacing: 1,
        marginBottom: 10,
        borderBottom: `1 solid ${SLATE_200}`,
        paddingBottom: 6,
    },

    // ── Row ──────────────────────────────────────────────────────────────────
    row: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'flex-start',
        paddingVertical: 5,
        borderBottom: `1 solid #F1F5F9`,
    },
    rowLast: {
        borderBottom: 0,
    },
    rowLabel: {
        fontSize: 9,
        color: SLATE_500,
        flex: 1,
    },
    rowValue: {
        fontSize: 9,
        fontFamily: 'Helvetica-Bold',
        color: SLATE_700,
        flex: 2,
        textAlign: 'right',
    },

    // ── Status pill ──────────────────────────────────────────────────────────
    statusPill: {
        backgroundColor: '#D1FAE5',
        borderRadius: 20,
        alignSelf: 'flex-start',
        paddingHorizontal: 10,
        paddingVertical: 4,
        marginBottom: 14,
        flexDirection: 'row',
        alignItems: 'center',
        gap: 4,
    },
    statusDot: {
        width: 6,
        height: 6,
        borderRadius: 3,
        backgroundColor: EMERALD,
        marginRight: 5,
    },
    statusText: {
        fontSize: 9,
        fontFamily: 'Helvetica-Bold',
        color: EMERALD,
        textTransform: 'uppercase',
        letterSpacing: 0.8,
    },

    // ── Footer ───────────────────────────────────────────────────────────────
    footer: {
        padding: '20 40 32',
        alignItems: 'center',
    },
    footerLine: {
        width: '100%',
        borderTop: `1 solid ${SLATE_200}`,
        marginBottom: 14,
    },
    footerText: {
        fontSize: 8,
        color: SLATE_500,
        textAlign: 'center',
        lineHeight: 1.6,
    },
    footerBrand: {
        fontSize: 8,
        fontFamily: 'Helvetica-Bold',
        color: INDIGO,
    },

    // ── Two-col grid ─────────────────────────────────────────────────────────
    grid: {
        flexDirection: 'row',
        gap: 14,
    },
    gridHalf: {
        flex: 1,
    },
})

// ── Helpers ───────────────────────────────────────────────────────────────────

function fmt(date?: string | Date | null) {
    if (!date) return '—'
    return new Date(date).toLocaleString('en-TZ', {
        dateStyle: 'long',
        timeStyle: 'short',
    })
}

function money(amount?: number | null) {
    if (amount == null) return '—'
    return `TZS ${amount.toLocaleString()}`
}

// ── Types ─────────────────────────────────────────────────────────────────────

export interface ReceiptData {
    receiptId: string
    cargoId: string
    cargoRef: string
    status: string
    route: { from: string; to: string; pickupType: string }
    serviceType: string
    helpersCount: number
    receiverName: string
    receiverPhone?: string | null
    payment: {
        paymentId: string
        amount: number
        currency: string
        method?: string | null
        transactionReference?: string | null
        paidAt?: string | Date | null
        status: string
    }
    sender: { name?: string | null; email?: string | null }
    issuedAt: string
}

// ── PDF Document ──────────────────────────────────────────────────────────────

export function MizigoPDFReceipt({ data }: { data: ReceiptData }) {
    const { route, payment, sender, receiverName, receiverPhone } = data

    return createReceiptPDF(data)
}

/**
 * Factory function that returns the react-pdf Document element directly.
 * Use this with renderToStream/renderToFile to avoid component wrapper type issues.
 */
export function createReceiptPDF(data: ReceiptData) {
    const { route, payment, sender, receiverName, receiverPhone } = data

    return (
        <Document
            title={`Mizigo Receipt – ${data.receiptId}`}
            author="Mizigo Logistics"
            subject="Cargo Payment Receipt"
            keywords="receipt, cargo, mizigo, logistics"
        >
            <Page size="A4" style={s.page}>
                {/* ── Header ── */}
                <View style={s.header}>
                    <Text style={s.headerLogo}>Mizigo Logistics</Text>
                    <Text style={s.headerSub}>Official Payment Receipt</Text>
                    <Text style={s.headerAmount}>
                        <Text style={s.headerCurrency}>{payment.currency} </Text>
                        {payment.amount.toLocaleString()}
                    </Text>
                    <Text style={s.headerConfirmed}>Payment Confirmed ✓</Text>
                </View>

                {/* ── Body ── */}
                <View style={s.body}>
                    {/* Status pill */}
                    <View style={s.statusPill}>
                        <View style={s.statusDot} />
                        <Text style={s.statusText}>{data.status}</Text>
                    </View>

                    {/* Payment details */}
                    <View style={s.section}>
                        <Text style={s.sectionTitle}>Payment Details</Text>
                        {[
                            ['Receipt No.', data.receiptId],
                            ['Transaction Ref.', payment.transactionReference ?? '—'],
                            ['Payment Method', payment.method?.toUpperCase() ?? '—'],
                            ['Amount', money(payment.amount)],
                            ['Paid At', fmt(payment.paidAt)],
                            ['Issued At', fmt(data.issuedAt)],
                        ].map(([label, value], i, arr) => (
                            <View key={label} style={[s.row, i === arr.length - 1 ? s.rowLast : {}]}>
                                <Text style={s.rowLabel}>{label}</Text>
                                <Text style={s.rowValue}>{value}</Text>
                            </View>
                        ))}
                    </View>

                    {/* Route */}
                    <View style={s.section}>
                        <Text style={s.sectionTitle}>Cargo & Route</Text>
                        {[
                            ['Cargo Ref.', `#${data.cargoRef}`],
                            ['From', route.from],
                            ['To', route.to],
                            ['Service', data.serviceType],
                            ['Pickup Type', route.pickupType],
                            ['Helpers', String(data.helpersCount)],
                        ].map(([label, value], i, arr) => (
                            <View key={label} style={[s.row, i === arr.length - 1 ? s.rowLast : {}]}>
                                <Text style={s.rowLabel}>{label}</Text>
                                <Text style={s.rowValue}>{value}</Text>
                            </View>
                        ))}
                    </View>

                    {/* Parties  */}
                    <View style={s.grid}>
                        <View style={[s.section, s.gridHalf]}>
                            <Text style={s.sectionTitle}>Sender</Text>
                            <View style={[s.row, s.rowLast]}>
                                <Text style={s.rowLabel}>Name</Text>
                                <Text style={s.rowValue}>{sender.name ?? '—'}</Text>
                            </View>
                            <View style={[s.row, s.rowLast]}>
                                <Text style={s.rowLabel}>Email</Text>
                                <Text style={s.rowValue}>{sender.email ?? '—'}</Text>
                            </View>
                        </View>
                        <View style={[s.section, s.gridHalf]}>
                            <Text style={s.sectionTitle}>Receiver</Text>
                            <View style={[s.row, s.rowLast]}>
                                <Text style={s.rowLabel}>Name</Text>
                                <Text style={s.rowValue}>{receiverName}</Text>
                            </View>
                            <View style={[s.row, s.rowLast]}>
                                <Text style={s.rowLabel}>Phone</Text>
                                <Text style={s.rowValue}>{receiverPhone ?? '—'}</Text>
                            </View>
                        </View>
                    </View>
                </View>

                {/* ── Footer ── */}
                <View style={s.footer}>
                    <View style={s.footerLine} />
                    <Text style={s.footerText}>
                        This is an official digital receipt issued by{' '}
                        <Text style={s.footerBrand}>Mizigo Logistics</Text>.{'\n'}
                        For support, contact support@mizigo.co.tz {' | '} +255 700 000 000
                    </Text>
                </View>
            </Page>
        </Document>
    )
}

