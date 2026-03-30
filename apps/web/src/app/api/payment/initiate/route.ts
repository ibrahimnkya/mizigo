import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'
import { PaymentGatewayService, CHANNEL_DISPLAY_MAP } from '@/services/paymentGatewayService'

/**
 * POST /api/payment/initiate
 *
 * Body: { cargoId, provider, phone }
 *   provider — the channel's `uts_name` (e.g. "airtel", "tigopesa", "halopesa", "azampesa")
 *   phone    — subscriber MSISDN (e.g. "0754123456")
 */
export async function POST(request: Request) {
    try {
        const session = await auth()
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const body = await request.json()
        const { cargoId, provider, phone } = body

        if (!cargoId || !provider || !phone) {
            return NextResponse.json(
                { error: 'cargoId, provider, and phone are required' },
                { status: 400 }
            )
        }

        console.log(`🚀 Initiating payment for cargo ${cargoId}`)
        console.log(`   Provider: ${provider} | Phone: ${phone}`)

        // 1. Verify cargo is in PAYMENT_PENDING state
        const cargo = await prisma.cargoRequest.findUnique({
            where: { id: cargoId },
            include: { payment: true },
        })

        if (!cargo) {
            return NextResponse.json({ error: 'Cargo request not found' }, { status: 404 })
        }

        if (cargo.status !== 'PAYMENT_PENDING') {
            return NextResponse.json(
                { error: `Cargo is not awaiting payment. Current status: ${cargo.status}` },
                { status: 400 }
            )
        }

        // 2. Find or create a PENDING payment record
        let payment = cargo.payment
        if (payment) {
            payment = await prisma.payment.update({
                where: { id: payment.id },
                data: {
                    paymentMethod: provider,
                    status: 'PENDING',
                },
            })
        } else {
            payment = await prisma.payment.create({
                data: {
                    cargoId,
                    userId: session.user.id as string,
                    amount: cargo.amount ?? 0,
                    paymentMethod: provider,
                    status: 'PENDING',
                },
            })
        }

        console.log(`✅ Payment record ready: ${payment.id}`)

        // 3. Map uts_name → gateway display channel
        const gatewayChannel = CHANNEL_DISPLAY_MAP[provider.toLowerCase()] ?? provider

        // 4. Build callback URL (mysafari will POST to this on payment completion)
        const appUrl = process.env.NEXT_PUBLIC_APP_URL ?? 'http://localhost:3000'
        const callbackUrl = `${appUrl}/api/payment/callback`

        console.log(`📞 Callback URL: ${callbackUrl}`)

        // 5. Initiate STK push via MySafari gateway
        try {
            const gatewayResponse = await PaymentGatewayService.initiatePushPayment({
                phone_number: phone,
                payment_reference: cargoId,   // ← this becomes utilityref in the callback
                payment_channel: gatewayChannel,
                amount: payment.amount,
                callback_url: callbackUrl,
            })

            console.log(`✅ Gateway response:`, gatewayResponse)
        } catch (gatewayError: any) {
            console.error(`❌ Gateway error for payment ${payment.id}:`, gatewayError)

            await prisma.payment.update({
                where: { id: payment.id },
                data: { status: 'FAILED' },
            })

            return NextResponse.json(
                { error: 'Failed to initiate payment with gateway' },
                { status: 502 }
            )
        }

        // 6. Return payment record — frontend polls /api/payment/status/:paymentId
        return NextResponse.json({
            paymentId: payment.id,
            status: payment.status,
            cargoId: payment.cargoId,
            amount: payment.amount,
            provider: payment.paymentMethod,
            message: `Payment prompt sent to ${phone}. Please check your phone to confirm.`,
        }, { status: 201 })
    } catch (error) {
        console.error('[API] Payment initiation error:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
