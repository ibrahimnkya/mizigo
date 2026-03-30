import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

export async function GET(request: Request) {
    try {
        const { searchParams } = new URL(request.url)
        const status = searchParams.get('status')
        const wagonType = searchParams.get('wagonType')
        const startDate = searchParams.get('startDate')
        const endDate = searchParams.get('endDate')

        const session = await auth()
        const isAdmin = session?.user?.role === 'ADMIN' || session?.user?.role === 'SUPER_ADMIN'
        const userId = session?.user?.id

        const where: any = {}
        if (status) {
            where.status = status
        }
        if (wagonType) {
            where.wagonType = wagonType
        }
        if (startDate || endDate) {
            where.createdAt = {}
            if (startDate) {
                where.createdAt.gte = new Date(startDate)
            }
            if (endDate) {
                where.createdAt.lte = new Date(endDate)
            }
        }

        // Regular users only see their own cargo
        if (!isAdmin && userId) {
            where.userId = userId
        }

        const cargoRequests = await prisma.cargoRequest.findMany({
            where,
            orderBy: { createdAt: 'desc' },
            include: {
                user: {
                    select: { name: true, email: true, phone: true },
                },
                approvedBy: {
                    select: { name: true, email: true },
                },
                payment: {
                    select: { status: true, amount: true, paymentMethod: true },
                },
            },
        })
        return NextResponse.json(cargoRequests)
    } catch (error) {
        console.error('Error fetching cargo requests:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}

export async function POST(request: Request) {
    try {
        const session = await auth()
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const body = await request.json()

        const cargoRequest = await prisma.cargoRequest.create({
            data: {
                userId: session.user.id as string,
                fromAddress: body.fromAddress,
                toAddress: body.toAddress,
                serviceType: body.serviceType,
                peopleNeeded: body.peopleNeeded ?? 0,
                cargoType: body.cargoType,
                cargoSize: body.cargoSize,
                receiverName: body.receiverName,
                receiverPhone: body.receiverPhone,
                receiverPays: body.receiverPays ?? false,
                additionalServices: body.additionalServices ?? [],
                pickupType: body.pickupType ?? 'SGR_STATION',
                status: 'PENDING',
            },
        })

        // Notify all admins of the new request
        // (In production: look up admin users and create a notification for each)
        // await prisma.notification.createMany({ ... })

        return NextResponse.json(cargoRequest, { status: 201 })
    } catch (error) {
        console.error('Error creating cargo request:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
