/**
 * sendPushNotification
 *
 * Sends a Firebase Cloud Messaging push notification to a single device.
 * Silently no-ops if the Admin SDK is not initialised (no service account).
 */
import { getFirebaseAdmin } from './firebase-admin'

export async function sendPushNotification(
    token: string,
    title: string,
    body: string,
    data?: Record<string, string>
): Promise<void> {
    const app = getFirebaseAdmin()
    if (!app) return // FCM not configured — skip silently

    try {
        await app.messaging().send({
            token,
            notification: { title, body },
            data: data ?? {},
            android: {
                priority: 'high',
                notification: {
                    sound: 'default',
                    channelId: 'mizigo_notifications',
                    clickAction: 'FLUTTER_NOTIFICATION_CLICK',
                },
            },
            apns: {
                payload: {
                    aps: {
                        sound: 'default',
                        badge: 1,
                    },
                },
            },
        })
    } catch (err) {
        // Log but don't fail the request — push is best-effort
        console.error('[FCM] Failed to send push notification:', err)
    }
}
