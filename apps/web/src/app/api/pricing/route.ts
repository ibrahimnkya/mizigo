import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

export async function GET() {
    try {
        const rules = await (prisma as any).pricingRule.findMany({
            orderBy: { name: 'asc' },
        })
        return NextResponse.json(rules)
    } catch (error) {
        console.error('Error fetching pricing rules:', error)
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
        const rule = await (prisma as any).pricingRule.create({
            data: {
                name: body.name,
                type: body.type,
                value: parseFloat(body.value),
                condition: body.condition,
                isActive: body.isActive ?? true,
            },
        })
        return NextResponse.json(rule, { status: 201 })
    } catch (error) {
        console.error('Error creating pricing rule:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
