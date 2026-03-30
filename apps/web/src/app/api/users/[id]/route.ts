import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

export async function PATCH(
    request: Request,
    context: { params: Promise<{ id: string }> }
) {
    try {
        const session = await auth()
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const { id } = await context.params
        const body = await request.json()
        const { name, email, phone, role: roleName, organizationId, stationId } = body

        // Scoping: ADMIN can only update users in their organization
        if (session.user.role === 'ADMIN') {
            const userToUpdate = await prisma.user.findUnique({
                where: { id },
                select: { organizationId: true }
            })
            if (userToUpdate?.organizationId !== (session.user as any).organizationId) {
                return NextResponse.json({ error: 'Forbidden' }, { status: 403 })
            }
        }

        const updateData: any = {
            name,
            email,
            phone,
            organizationId: organizationId || undefined,
            stationId: stationId || undefined,
        }

        if (roleName) {
            updateData.role = {
                connect: { name: roleName }
            }
        }

        const user = await prisma.user.update({
            where: { id },
            data: updateData,
            select: {
                id: true,
                name: true,
                email: true,
                phone: true,
                role: true,
            }
        })

        return NextResponse.json(user)
    } catch (error: any) {
        console.error('Error updating user:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}

export async function DELETE(
    request: Request,
    context: { params: Promise<{ id: string }> }
) {
    try {
        const session = await auth()
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const { id } = await context.params

        // Scoping: ADMIN can only delete (soft-delete) users in their organization
        if (session.user.role === 'ADMIN') {
            const userToDelete = await prisma.user.findUnique({
                where: { id },
                select: { organizationId: true, role: { select: { name: true } } }
            })
            
            if (!userToDelete || userToDelete.organizationId !== (session.user as any).organizationId) {
                return NextResponse.json({ error: 'Forbidden' }, { status: 403 })
            }

            // Perform soft delete
            await prisma.user.update({
                where: { id },
                data: { isActive: false }
            })
        } else if (session.user.role === 'SUPER_ADMIN') {
            // Super admin can soft delete anyone
            await prisma.user.update({
                where: { id },
                data: { isActive: false }
            })
        } else {
            return NextResponse.json({ error: 'Forbidden' }, { status: 403 })
        }

        return NextResponse.json({ message: 'User deleted successfully' })
    } catch (error: any) {
        console.error('Error deleting user:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
