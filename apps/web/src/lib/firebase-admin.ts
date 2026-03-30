/**
 * Firebase Admin SDK singleton initializer.
 *
 * Reads the service account JSON from FIREBASE_SERVICE_ACCOUNT_JSON env var.
 * If the variable is missing (e.g. in local dev without FCM), the admin app
 * is NOT initialised and sendPushNotification() will silently no-op.
 */
import * as admin from 'firebase-admin'

let initialized = false

export function getFirebaseAdmin(): admin.app.App | null {
    if (initialized) return admin.apps[0] ?? null

    const raw = process.env.FIREBASE_SERVICE_ACCOUNT_JSON
    if (!raw) {
        console.warn('[FCM] FIREBASE_SERVICE_ACCOUNT_JSON is not set – push notifications disabled.')
        initialized = true
        return null
    }

    try {
        const serviceAccount = JSON.parse(raw) as admin.ServiceAccount

        if (!admin.apps.length) {
            admin.initializeApp({
                credential: admin.credential.cert(serviceAccount),
            })
        }

        initialized = true
        return admin.app()
    } catch (err) {
        console.error('[FCM] Failed to parse service account JSON:', err)
        initialized = true
        return null
    }
}
