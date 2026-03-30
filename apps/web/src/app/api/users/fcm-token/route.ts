import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

/**
 * PUT /api/users/fcm-token
 * Body: { token: string }
 *
 * Saves or clears the caller's Firebase Cloud Messaging device token.
 * Used by the Flutter app after firebase_messaging.getToken().
 */
export async function PUT(request: Request) {
    try {
        const session = await auth()
        if (!session?.user?.id) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const { token } = await request.json() as { token?: string }

        await prisma.user.update({
            where: { id: session.user.id },
            data: { fcmToken: token ?? null },
        })

        return NextResponse.json({ ok: true })
    } catch (error) {
        console.error('[FCM Token] Error:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
