import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

export async function GET(request: Request) {
    try {
        const { searchParams } = new URL(request.url)
        const organizationId = searchParams.get('organizationId')

        const stations = await (prisma as any).station.findMany({
            where: organizationId ? { organizationId } : undefined,
            orderBy: { name: 'asc' },
        })
        return NextResponse.json(stations)
    } catch (error) {
        console.error('Error fetching stations:', error)
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
        const station = await (prisma as any).station.create({
            data: {
                name: body.name,
                code: body.code,
                location: body.location,
                isActive: body.isActive ?? true,
            },
        })
        return NextResponse.json(station, { status: 201 })
    } catch (error) {
        console.error('Error creating station:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
