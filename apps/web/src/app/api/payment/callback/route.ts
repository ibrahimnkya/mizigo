 import { NextResponse } from 'next/server'
 import { prisma } from '@repo/database'
 import { revalidatePath } from 'next/cache'

/**
 * POST /api/payment/callback
 *
 * Called by MySafari/AzamPay gateway after payment completes (success or failure).
 * Matches the payload format from the AzamPay callback specification.
 */

interface AzamPayCallbackPayload {
    user: any
    amount: string
    msisdn: string
    message: string
    transid: string
    clientId: any
    operator: string
    password: any
    reference: string
    utilityref: string       // This is the cargoId we set as payment_reference
    mnoreference: string
    submerchantAcc: any
    externalreference: string
    transactionstatus: string
}

export async function POST(req: Request) {
    const startTime = Date.now()

    let body: AzamPayCallbackPayload
    try {
        body = await req.json()
    } catch {
        return NextResponse.json({ error: 'Invalid JSON body' }, { status: 400 })
    }

    console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━')
    console.log('🔔 AZAMPAY CALLBACK RECEIVED')
    console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━')
    console.log('📦 Payload:', JSON.stringify(body, null, 2))

    const {
        utilityref: cargoId,  // the cargoId we sent as payment_reference
        transactionstatus,
        transid,
        amount,
        operator,
        msisdn,
    } = body

    if (!cargoId) {
        console.error('❌ Missing utilityref (cargoId)')
        return NextResponse.json({ error: 'Missing utilityref' }, { status: 400 })
    }

    // Find the payment for this cargo
    const payment = await prisma.payment.findFirst({
        where: { cargoId: cargoId.trim() },
        include: {
            cargo: {
                select: { userId: true, id: true, status: true },
            },
        },
    })

    if (!payment) {
        console.error(`❌ No payment found for cargoId: ${cargoId}`)
        return NextResponse.json({ error: 'Payment not found' }, { status: 404 })
    }

    console.log(`📋 Payment found: ${payment.id} | Cargo: ${payment.cargoId}`)
    console.log(`   Status: ${transactionstatus}`)

    const isSuccess = transactionstatus?.toLowerCase() === 'success'

    if (isSuccess) {
        console.log('🔄 Processing SUCCESS...')

        await prisma.$transaction([
            // Update payment → SUCCESS
            prisma.payment.update({
                where: { id: payment.id },
                data: {
                    status: 'SUCCESS',
                    transactionReference: transid,
                    paymentMethod: operator ?? payment.paymentMethod,
                    paidAt: new Date(),
                },
            }),
            // Transition cargo → PAID
            prisma.cargoRequest.update({
                where: { id: cargoId.trim() },
                data: { status: 'PAID' },
            }),
        ])

        // Send in-app notification
        if (payment.cargo?.userId) {
            try {
                await (prisma as any).notification.create({
                    data: {
                        userId: payment.cargo.userId,
                        title: 'Payment Confirmed ✅',
                        message: `TZS ${parseFloat(amount ?? '0').toLocaleString()} received via ${operator ?? 'mobile money'}. Ref: ${transid}`,
                        type: 'SUCCESS',
                    },
                })
            } catch (notifErr) {
                console.warn('Could not create notification:', notifErr)
            }
        }

        console.log(`✅ Cargo ${cargoId} → PAID | Payment ${payment.id} → SUCCESS`)
        console.log(`   Processing time: ${Date.now() - startTime}ms`)

        return NextResponse.json({ id: payment.id, status: 'SUCCESS' })
    } else {
        // Payment failed
        console.log('❌ Processing FAILURE...')

        await prisma.payment.update({
            where: { id: payment.id },
            data: {
                status: 'FAILED',
                transactionReference: transid ?? null,
            },
        })

        // Notify user of failure
        if (payment.cargo?.userId) {
            try {
                await (prisma as any).notification.create({
                    data: {
                        userId: payment.cargo.userId,
                        title: 'Payment Failed ❌',
                        message: `Your payment via ${operator ?? 'mobile money'} could not be processed. Please try again.`,
                        type: 'ERROR',
                    },
                })
            } catch (notifErr) {
                console.warn('Could not create notification:', notifErr)
            }
        }

        console.log(`❌ Payment ${payment.id} → FAILED`)
        console.log(`   Processing time: ${Date.now() - startTime}ms`)

        revalidatePath('/dashboard')
        revalidatePath('/cargo')
        revalidatePath(`/cargo/${cargoId}`)

        return NextResponse.json({ id: payment.id, status: 'FAILED' })
    }
}
