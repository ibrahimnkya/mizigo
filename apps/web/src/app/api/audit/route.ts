import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

export async function GET() {
    const session = await auth()
    if (session?.user?.role !== 'SUPER_ADMIN') {
        return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }

    try {
        const logs = await (prisma as any).auditLog.findMany({
            orderBy: { createdAt: 'desc' },
            take: 100,
        })
        return NextResponse.json(logs)
    } catch (error) {
        console.error('Error fetching audit logs:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
