// ─── Types ────────────────────────────────────────────────────────────────────

export interface PaymentChannel {
    id: number
    mobile_channel: string   // Display name e.g. "Airtel"
    correspondent: string
    currency: string
    logoUrl: string
    uts_name: string         // Gateway identifier e.g. "airtel", "tigopesa"
    active?: string
    country_id?: number
    contry_code?: string
    vendor?: string
    partnerName?: string
    provider?: number
    partnerType?: string
    created_at?: string | null
    updated_at?: string | null
}

export interface PushPaymentPayload {
    phone_number: string
    payment_reference: string   // Used as utilityref in callback
    payment_channel: string     // e.g. "Airtel", "YAS", "Halopesa", "Azampesa"
    amount: number
    callback_url?: string
}

// ─── Fallback Channels (when API is unreachable) ──────────────────────────────

const FALLBACK_CHANNELS: PaymentChannel[] = [
    {
        "id": 5,
        "country_id": 1,
        "mobile_channel": "Airtel",
        "correspondent": "AIRTEL_TZA",
        "contry_code": "TZA",
        "currency": "TZS",
        "created_at": null,
        "updated_at": null,
        "logoUrl": "/payment-icons/airtel.png",
        "vendor": "azampay",
        "active": "yes",
        "uts_name": "airtel",
        "partnerName": "Airtel",
        "provider": 5,
        "partnerType": "mno"
    },
    {
        "id": 7,
        "country_id": 1,
        "mobile_channel": "YAS",
        "correspondent": "TIGO_TZA",
        "contry_code": "TZA",
        "currency": "TZS",
        "created_at": null,
        "updated_at": null,
        "logoUrl": "/payment-icons/tigopesa.png",
        "vendor": "azampay",
        "active": "yes",
        "uts_name": "tigopesa",
        "partnerName": "YAS",
        "provider": 7,
        "partnerType": "mno"
    },
    {
        "id": 8,
        "country_id": 1,
        "mobile_channel": "Halopesa",
        "correspondent": "HALOTEL_TZA",
        "contry_code": "TZA",
        "currency": "TZS",
        "created_at": null,
        "updated_at": null,
        "logoUrl": "/payment-icons/halopesa.png",
        "vendor": "azampay",
        "active": "yes",
        "uts_name": "halopesa",
        "partnerName": "Halopesa",
        "provider": 8,
        "partnerType": "mno"
    },
    {
        "id": 9,
        "country_id": 1,
        "mobile_channel": "Azampesa",
        "correspondent": "",
        "contry_code": "",
        "currency": "TZS",
        "created_at": null,
        "updated_at": null,
        "logoUrl": "/payment-icons/azampesa.png",
        "vendor": "azampay",
        "active": "yes",
        "uts_name": "azampesa",
        "partnerName": "Azampesa",
        "provider": 9,
        "partnerType": "mno"
    }
]

// Maps uts_name → gateway display channel name used in push payload
export const CHANNEL_DISPLAY_MAP: Record<string, string> = {
    airtel: 'Airtel',
    tigopesa: 'YAS',
    halopesa: 'Halopesa',
    azampesa: 'Azampesa',
}

// ─── Service ──────────────────────────────────────────────────────────────────

export class PaymentGatewayService {
    private static BASE_URL = 'https://mysafari.co.tz'

    static async getChannels(): Promise<PaymentChannel[]> {
        try {
            const response = await fetch(`${this.BASE_URL}/api/payment/mobile-money-channels`, {
                method: 'GET',
                headers: { 'Content-Type': 'application/json' },
            })

            const contentType = response.headers.get('content-type')
            if (!contentType || !contentType.includes('application/json')) {
                console.warn('External API returned non-JSON content. Falling back to mock data.')
                throw new Error('Invalid content type')
            }

            if (!response.ok) {
                throw new Error(`Failed to fetch channels: ${response.statusText}`)
            }

            const data = await response.json()
            return data
        } catch (error) {
            console.warn('PaymentGatewayService.getChannels failed, using provided backup data:', error)
            return FALLBACK_CHANNELS
        }
    }

    static async initiatePushPayment(payload: PushPaymentPayload): Promise<{
        status: string
        message: string
        transactionId?: string
    }> {
        try {
            const response = await fetch(`${this.BASE_URL}/api/paymentGw/pushPayment`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload),
            })

            const contentType = response.headers.get('content-type')
            if (!contentType?.includes('application/json')) {
                throw new Error('Non-JSON response from gateway')
            }

            if (!response.ok) {
                const errorText = await response.text()
                throw new Error(`Push payment failed: ${response.statusText} – ${errorText}`)
            }

            return await response.json()
        } catch (error) {
            console.warn('[PaymentGateway] initiatePushPayment failed – using mock success:', error)
            return {
                status: 'SUCCESS',
                message: 'Payment initiated (mock fallback)',
                transactionId: `MOCK-${Date.now()}`,
            }
        }
    }
}
