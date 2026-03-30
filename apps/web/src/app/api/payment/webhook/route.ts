import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'

/**
 * POST /api/payment/webhook — Payment provider callback
 * Called by M-Pesa, Tigo, Airtel, or Stripe webhook after payment confirmation.
 */
export async function POST(request: Request) {
    try {
        const body = await request.json()
        const { transactionReference, status, cargoId, paymentId } = body

        if (!transactionReference || !status || !cargoId) {
            return NextResponse.json(
                { error: 'transactionReference, status, and cargoId are required' },
                { status: 400 }
            )
        }

        const isSuccess = ['SUCCESS', 'COMPLETED', 'PAID'].includes(status.toUpperCase())

        // Update payment record
        let payment = await prisma.payment.findFirst({
            where: paymentId ? { id: paymentId } : { cargoId },
        })

        if (!payment) {
            return NextResponse.json({ error: 'Payment not found' }, { status: 404 })
        }

        payment = await prisma.payment.update({
            where: { id: payment.id },
            data: {
                transactionReference,
                status: isSuccess ? 'SUCCESS' : 'FAILED',
                paidAt: isSuccess ? new Date() : null,
            },
        })

        if (isSuccess) {
            // Transition cargo to PAID
            const cargo = await prisma.cargoRequest.update({
                where: { id: cargoId },
                data: { status: 'PAID' },
                select: { userId: true, id: true },
            })

            // Notify user
            if (cargo.userId) {
                await (prisma as any).notification.create({
                    data: {
                        userId: cargo.userId,
                        title: 'Payment Confirmed ✅',
                        message: `TZS ${payment.amount.toLocaleString()} received via ${payment.paymentMethod ?? 'mobile payment'}. Ref: ${transactionReference}`,
                        type: 'SUCCESS',
                    }
                })
            }
        }

        return NextResponse.json({ received: true, status: payment.status })
    } catch (error) {
        console.error('Error processing payment webhook:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
