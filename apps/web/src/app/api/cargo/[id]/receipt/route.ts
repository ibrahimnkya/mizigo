import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

/**
 * GET /api/cargo/[id]/receipt
 * Returns a full receipt object for a paid cargo request.
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
            include: {
                user: {
                    select: {
                        name: true,
                        email: true,
                    },
                },
                payment: true,
            },
        }) as any

        if (!cargo) {
            return NextResponse.json({ error: 'Cargo request not found' }, { status: 404 })
        }

        if (!['PAID', 'COMPLETED'].includes(cargo.status as string)) {
            return NextResponse.json(
                { error: 'Receipt is only available for paid or completed cargo.' },
                { status: 400 }
            )
        }

        if (!cargo.payment) {
            return NextResponse.json({ error: 'No payment record found.' }, { status: 404 })
        }

        const receipt = {
            receiptId: `RCP-${cargo.payment.id.slice(-8).toUpperCase()}`,
            cargoId: cargo.id,
            cargoRef: cargo.id.slice(-6).toUpperCase(),
            status: cargo.status,
            route: {
                from: cargo.fromAddress,
                to: cargo.toAddress,
                pickupType: cargo.pickupType,
            },
            serviceType: cargo.serviceType,
            helpersCount: cargo.peopleNeeded,
            receiverName: cargo.receiverName,
            receiverPhone: cargo.receiverPhone,
            receiverPays: cargo.receiverPays,
            additionalServices: cargo.additionalServices,
            payment: {
                paymentId: cargo.payment.id,
                amount: cargo.payment.amount,
                currency: 'TZS',
                method: cargo.payment.paymentMethod,
                transactionReference: cargo.payment.transactionReference,
                paidAt: cargo.payment.paidAt,
                status: cargo.payment.status,
            },
            sender: {
                name: cargo.user?.name,
                email: cargo.user?.email,
            },
            issuedAt: new Date().toISOString(),
        }

        return NextResponse.json(receipt)
    } catch (error) {
        console.error('Error generating receipt:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
