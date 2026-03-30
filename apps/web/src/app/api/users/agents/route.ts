import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

export async function GET() {
    try {
        const session = await auth()
        const isAdmin = session?.user?.role === 'ADMIN' || session?.user?.role === 'SUPER_ADMIN'
        
        if (!isAdmin) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        // Fetch users who have the role 'AGENT'
        // First get the agent role ID
        const agentRole = await (prisma as any).role.findUnique({
            where: { name: 'AGENT' }
        })

        if (!agentRole) {
            return NextResponse.json([])
        }

        const agents = await (prisma as any).user.findMany({
            where: {
                roleId: agentRole.id
            },
            select: {
                id: true,
                name: true,
                email: true,
                phone: true,
                createdAt: true,
                role: {
                    select: {
                        name: true
                    }
                }
            },
            orderBy: { name: 'asc' }
        })

        return NextResponse.json(agents)
    } catch (error) {
        console.error('Error fetching agents:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
