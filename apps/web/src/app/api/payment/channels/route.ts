import { NextResponse } from 'next/server'
import { PaymentGatewayService } from '@/services/paymentGatewayService'

export const dynamic = 'force-dynamic'

/**
 * GET /api/payment/channels
 * Returns available mobile money payment channels from the MySafari gateway.
 * Falls back to hardcoded channels if the gateway is unreachable.
 */
export async function GET() {
    try {
        const channels = await PaymentGatewayService.getChannels()
        return NextResponse.json(channels)
    } catch (error: any) {
        console.error('[API] Payment channels error:', error)
        return NextResponse.json(
            { error: error.message ?? 'Failed to fetch payment channels' },
            { status: 500 }
        )
    }
}
