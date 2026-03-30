import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

/**
 * GET /api/payment/status/[paymentId]
 * Mobile app polls this after initiating a payment to check whether the
 * user has confirmed the STK push.
 *
 * Returns: { id, status, amount, provider, transactionReference, cargoId, cargoStatus }
 */
export async function GET(
    _req: Request,
    { params }: { params: Promise<{ paymentId: string }> }
) {
    try {
        const session = await auth()
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const { paymentId } = await params

        const payment = await prisma.payment.findUnique({
            where: { id: paymentId },
            include: {
                cargo: {
                    select: { id: true, status: true, userId: true },
                },
            },
        })

        if (!payment) {
            return NextResponse.json({ error: 'Payment not found' }, { status: 404 })
        }

        // Ownership check — only the paying user may poll
        if (payment.userId !== session.user.id) {
            return NextResponse.json({ error: 'Forbidden' }, { status: 403 })
        }

        return NextResponse.json({
            id: payment.id,
            status: payment.status,             // PENDING | SUCCESS | FAILED
            amount: payment.amount,
            provider: payment.paymentMethod,
            transactionReference: payment.transactionReference,
            paidAt: payment.paidAt,
            cargoId: payment.cargoId,
            cargoStatus: payment.cargo?.status, // So the app knows when to show receipt
        })
    } catch (error) {
        console.error('[API] Payment status error:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
