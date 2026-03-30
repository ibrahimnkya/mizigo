import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'
import { sendPushNotification } from '@/lib/notifications'
import { revalidatePath } from 'next/cache'

// Valid status transitions map
const VALID_TRANSITIONS: Record<string, string[]> = {
    PENDING: ['APPROVED', 'REJECTED'],
    APPROVED: ['PAYMENT_PENDING', 'REJECTED'],
    PAYMENT_PENDING: ['PAID'],
    PAID: ['COMPLETED'],
    REJECTED: [],
    COMPLETED: [],
}

export async function GET(
    request: Request,
    { params }: { params: Promise<{ id: string }> }
) {
    try {
        const { id } = await params
        const cargoRequest = await prisma.cargoRequest.findUnique({
            where: { id },
            include: {
                user: {
                    select: { name: true, email: true, phone: true },
                },
                approvedBy: {
                    select: { name: true, email: true },
                },
                payment: true,
            },
        })

        if (!cargoRequest) {
            return NextResponse.json({ error: 'Cargo request not found' }, { status: 404 })
        }

        return NextResponse.json(cargoRequest)
    } catch (error) {
        console.error('Error fetching cargo request details:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}

export async function PUT(
    request: Request,
    { params }: { params: Promise<{ id: string }> }
) {
    try {
        const { id } = await params
        const body = await request.json()
        const { status, reason, amount } = body

        const session = await auth()
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const isAdmin = session.user.role === 'ADMIN' || session.user.role === 'SUPER_ADMIN'
        const isOperator = session.user.role === 'OPERATOR'

        if (!isAdmin && !isOperator) {
            return NextResponse.json({ error: 'Forbidden: Agents cannot adjudicate cargo' }, { status: 403 })
        }

        const adminId = session.user.id

        // Fetch current cargo to validate the transition
        const current = await prisma.cargoRequest.findUnique({ where: { id } })
        if (!current) {
            return NextResponse.json({ error: 'Cargo request not found' }, { status: 404 })
        }

        const allowedNext = VALID_TRANSITIONS[current.status] ?? []
        if (!allowedNext.includes(status)) {
            return NextResponse.json(
                { error: `Cannot transition from ${current.status} to ${status}` },
                { status: 400 }
            )
        }

        const updateData: any = { status }

        if (status === 'REJECTED') {
            updateData.rejectionReason = reason ?? null
            updateData.reason = reason ?? null
        }

        if (status === 'APPROVED') {
            updateData.approvedById = adminId
            // Auto-transition to PAYMENT_PENDING
            updateData.status = 'PAYMENT_PENDING'
        }

        if (amount !== undefined) {
            updateData.amount = amount
        }

        const updatedCargo = await prisma.cargoRequest.update({
            where: { id },
            data: updateData,
            include: {
                user: { select: { name: true, email: true, phone: true } },
                payment: true,
            },
        })

        // Auto-create a pending Payment record when transitioning to PAYMENT_PENDING
        if (status === 'APPROVED' || status === 'PAYMENT_PENDING') {
            const existingPayment = await prisma.payment.findUnique({ where: { cargoId: id } })
            if (!existingPayment && updatedCargo.userId) {
                await prisma.payment.create({
                    data: {
                        cargoId: id,
                        userId: updatedCargo.userId,
                        amount: updatedCargo.amount ?? 0,
                        status: 'PENDING',
                        approvedById: adminId,
                    }
                })
            }
        }

        // Create notification for the user
        if (updatedCargo.userId) {
            const messages: Record<string, { title: string; message: string; type: string }> = {
                PAYMENT_PENDING: {
                    title: 'Cargo Approved – Payment Required',
                    message: `Your cargo request #${id.slice(-6).toUpperCase()} has been approved. Please proceed to complete payment.`,
                    type: 'SUCCESS'
                },
                REJECTED: {
                    title: 'Cargo Request Rejected',
                    message: `Your cargo request #${id.slice(-6).toUpperCase()} was rejected. Reason: ${reason ?? 'No reason provided'}`,
                    type: 'WARNING'
                },
                COMPLETED: {
                    title: 'Cargo Delivered',
                    message: `Your cargo #${id.slice(-6).toUpperCase()} has been marked as delivered. Thank you!`,
                    type: 'SUCCESS'
                },
            }

            const notifData = messages[status as string] ?? messages['PAYMENT_PENDING']
            if (notifData) {
                await (prisma as any).notification.create({
                    data: {
                        userId: updatedCargo.userId,
                        title: notifData.title,
                        message: notifData.message,
                        type: notifData.type,
                    }
                })

                // Send FCM push notification if the user has a device token
                const userWithToken = await prisma.user.findUnique({
                    where: { id: updatedCargo.userId },
                    select: { fcmToken: true },
                })
                if (userWithToken?.fcmToken) {
                    await sendPushNotification(
                        userWithToken.fcmToken,
                        notifData.title,
                        notifData.message,
                        { cargoId: id, status: status as string }
                    )
                }
            }
        }
        
        // Revalidate paths to ensure dashboards and lists reflect the changes
        revalidatePath('/dashboard')
        revalidatePath('/cargo')
        revalidatePath(`/cargo/${id}`)

        return NextResponse.json(updatedCargo)
    } catch (error) {
        console.error('Error updating cargo request:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
