import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

export async function GET() {
    try {
        const services = await (prisma as any).serviceType.findMany({
            orderBy: { name: 'asc' },
        })
        return NextResponse.json(services)
    } catch (error) {
        console.error('Error fetching services:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}

export async function POST(request: Request) {
    const session = await auth()
    if (session?.user?.role !== 'SUPER_ADMIN') {
        return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }

    try {
        const body = await request.json()
        const service = await (prisma as any).serviceType.create({
            data: {
                name: body.name,
                description: body.description,
                basePrice: parseFloat(body.basePrice),
                isActive: body.isActive ?? true,
            },
        })
        return NextResponse.json(service, { status: 201 })
    } catch (error) {
        console.error('Error creating service:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
