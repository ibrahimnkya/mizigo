import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

/**
 * GET /api/cargo/[id]/status
 * Lightweight polling endpoint for mobile app to check cargo status.
 */
export async function GET(
    request: Request,
    { params }: { params: Promise<{ id: string }> }
) {
    try {
        const session = await auth()
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const { id } = await params

        const cargo = await prisma.cargoRequest.findUnique({
            where: { id },
            select: {
                id: true,
                status: true,
                rejectionReason: true,
                reason: true,
                amount: true,
                updatedAt: true,
                payment: {
                    select: {
                        id: true,
                        status: true,
                        amount: true,
                        paymentMethod: true,
                        paidAt: true,
                    }
                }
            },
        })

        if (!cargo) {
            return NextResponse.json({ error: 'Cargo request not found' }, { status: 404 })
        }

        return NextResponse.json({
            id: cargo.id,
            status: cargo.status,
            rejectionReason: cargo.rejectionReason ?? cargo.reason,
            amount: cargo.amount,
            updatedAt: cargo.updatedAt,
            payment: cargo.payment,
            // UI hint for mobile
            uiState: getUiState(cargo.status as string),
        })
    } catch (error) {
        console.error('Error fetching cargo status:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}

function getUiState(status: string) {
    const map: Record<string, { message: string; action: string | null }> = {
        PENDING: { message: 'Waiting for admin approval...', action: null },
        APPROVED: { message: 'Approved! Preparing payment...', action: 'WAIT' },
        PAYMENT_PENDING: { message: 'Payment required to proceed.', action: 'PAY' },
        PAID: { message: 'Payment confirmed! Your cargo is being arranged.', action: 'VIEW_RECEIPT' },
        COMPLETED: { message: 'Delivered! Your cargo has been completed.', action: 'REVIEW' },
        REJECTED: { message: 'Your request was rejected.', action: 'VIEW_REASON' },
    }
    return map[status] ?? { message: 'Unknown status', action: null }
}
