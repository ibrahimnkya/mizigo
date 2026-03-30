import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

export async function GET() {
    try {
        const session = await auth()
        if (!session?.user || session.user.role !== 'SUPER_ADMIN') {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const organizations = await prisma.organization.findMany({
            orderBy: { createdAt: 'desc' },
            include: {
                _count: {
                    select: { stations: true, users: true }
                }
            }
        })
        return NextResponse.json(organizations)
    } catch (error) {
        console.error('Error fetching organizations:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}

export async function POST(request: Request) {
    try {
        const session = await auth()
        if (!session?.user || session.user.role !== 'SUPER_ADMIN') {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const body = await request.json()
        const { name, description } = body

        if (!name) {
            return NextResponse.json({ error: 'Organization name is required' }, { status: 400 })
        }

        // Check if organization with same name already exists
        const existingOrg = await prisma.organization.findUnique({
            where: { name }
        })

        if (existingOrg) {
            return NextResponse.json({ error: 'An organization with this name already exists' }, { status: 400 })
        }

        const organization = await prisma.organization.create({
            data: {
                name,
                description: description || null,
            }
        })

        return NextResponse.json(organization, { status: 201 })
    } catch (error) {
        console.error('Error creating organization:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
