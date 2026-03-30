import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

export async function POST(request: Request) {
    try {
        const session = await auth()
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const body = await request.json()

        // Basic pricing calculation: 2000 TSH per kg (example)
        const baseRate = 2000;
        const weight = parseFloat(body.weight) || 1; // Use parseFloat for weight
        const calculatedAmount = Math.ceil(weight * baseRate);

        // Create the cargo request
        const userId = body.userId || session.user.id;

        const cargoRequest = await prisma.cargoRequest.create({
            data: {
                user: userId ? { connect: { id: userId } } : undefined,
                fromAddress: body.fromAddress,
                toAddress: body.toAddress,
                receiverName: body.receiverName,
                receiverPhone: body.receiverPhone,
                receiverPays: body.receiverPays ?? false,
                weight: weight,
                length: parseFloat(body.length) || null,
                width: parseFloat(body.width) || null,
                height: parseFloat(body.height) || null,
                cargoType: body.cargoType || "Standard",
                cargoSize: body.cargoSize || "Medium",
                urgency: body.urgency || "Normal",
                isFragile: body.isFragile ?? false,
                condition: body.condition || "New",
                specialInstructions: body.specialInstructions,
                serviceType: body.serviceType || "Standard",
                pickupType: body.pickupType ?? 'SGR_STATION',
                status: 'PENDING',
                amount: calculatedAmount,
            },
        })

        // Create the payment record
        await prisma.payment.create({
            data: {
                cargoId: cargoRequest.id,
                userId: userId,
                amount: calculatedAmount,
                status: 'PENDING',
                paymentMethod: body.paymentMethod || 'CASH',
                paidAt: null,
            }
        })

        return NextResponse.json(cargoRequest, { status: 201 })
    } catch (error) {
        console.error('Error in /api/cargo/receive:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
