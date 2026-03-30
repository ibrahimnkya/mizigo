import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'
import { revalidatePath } from 'next/cache'

/**
 * POST /api/payment/simulate
 * Simulates a successful payment for a cargo request.
 * Used for demo and testing purposes to bypass real mobile money prompts.
 */
export async function POST(request: Request) {
    try {
        const session = await auth()
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const { cargoId } = await request.json()
        if (!cargoId) {
            return NextResponse.json({ error: 'Cargo ID is required' }, { status: 400 })
        }

        // 1. Find the payment associated with this cargo
        const payment = await prisma.payment.findUnique({
            where: { cargoId },
            include: { cargo: true }
        })

        if (!payment) {
            return NextResponse.json({ error: 'Payment record not found' }, { status: 404 })
        }

        // 2. Perform transaction to update both Payment and CargoRequest
        await prisma.$transaction([
            prisma.payment.update({
                where: { id: payment.id },
                data: {
                    status: 'PAID',
                    paidAt: new Date(),
                    transactionReference: `SIM-${Math.random().toString(36).substring(2, 11).toUpperCase()}`,
                    paymentMethod: 'SIMULATED',
                }
            }),
            prisma.cargoRequest.update({
                where: { id: cargoId },
                data: {
                    status: 'PAID'
                }
            })
        ])

        // 3. Create a notification for the success
        if (payment.userId) {
            await (prisma as any).notification.create({
                data: {
                    userId: payment.userId,
                    title: 'Payment Confirmed',
                    message: `Payment for cargo #${cargoId.slice(-6).toUpperCase()} has been confirmed. Processing your request.`,
                    type: 'SUCCESS'
                }
            })
        }

        // 4. Revalidate cache
        revalidatePath('/dashboard')
        revalidatePath('/cargo')
        revalidatePath(`/cargo/${cargoId}`)

        return NextResponse.json({
            message: 'Payment simulated successfully',
            status: 'PAID'
        })
    } catch (error) {
        console.error('[PaymentSimulate] Error:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
