import { NextResponse } from 'next/server'
import { auth } from '@/auth'
import { getStats } from '@/lib/stats'

export async function GET() {
    try {
        const session = await auth();
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
        }

        const stats = await getStats(session.user);
        
        if (!stats) {
            return NextResponse.json({ error: 'Failed to fetch stats' }, { status: 500 });
        }

        return NextResponse.json(stats);
    } catch (error) {
        console.error('Error in stats route:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
