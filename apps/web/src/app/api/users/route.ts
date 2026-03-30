import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import bcrypt from 'bcryptjs'
import { auth } from '@/auth'

export async function GET() {
    try {
        const session = await auth()
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const role = session.user.role
        const stationId = (session.user as any).stationId

        let whereClause: any = { isActive: true }
        if (role === 'ADMIN') {
            const organizationId = (session.user as any).organizationId
            whereClause = {
                ...whereClause,
                organizationId: organizationId || undefined,
                role: {
                    name: {
                        in: ['ADMIN', 'OPERATOR', 'AGENT', 'USER']
                    }
                }
            }
        } else if (role === 'SUPER_ADMIN') {
            // Super admin sees all active users
            whereClause = { isActive: true }
        }

        const users = await prisma.user.findMany({
            where: whereClause,
            select: {
                id: true,
                name: true,
                email: true,
                role: {
                    select: {
                        name: true
                    }
                },
                createdAt: true,
                station: {
                    select: {
                        name: true,
                        code: true
                    }
                },
                organization: {
                    select: {
                        name: true
                    }
                },
                phone: true,
            },
        })
        return NextResponse.json(users)
    } catch (error: any) {
        console.error('Error fetching users:', error)
        return NextResponse.json({ 
            error: 'Internal Server Error', 
            details: error.message 
        }, { status: 500 })
    }
}

export async function POST(request: Request) {
    try {
        const session = await auth()
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }
        
        const currentUserRole = session.user.role
        const currentStationId = (session.user as any).stationId
        const currentOrgId = (session.user as any).organizationId

        const body = await request.json()
        const { name, email, password, phone, role: roleName, organizationId, stationId } = body

        // Prevent ADMIN from creating prohibited roles
        if (currentUserRole === 'ADMIN' && !['ADMIN', 'OPERATOR', 'AGENT', 'USER'].includes(roleName)) {
             return NextResponse.json({ error: 'Forbidden role assignment' }, { status: 403 })
        }

        let finalEmail = email
        let finalPassword = password
        let finalPhone = phone
        let loginCode = null
        let isFirstLogin = false

        if (roleName === 'OPERATOR' || roleName === 'AGENT') {
            finalEmail = email || `${phone}@mizigo.tz`
            finalPassword = password || Math.random().toString(36).slice(-8)
            loginCode = Math.floor(1000 + Math.random() * 9000).toString()
            isFirstLogin = true
            console.log(`[AUTH] Created ${roleName} - Phone: ${phone} - OTP: ${loginCode}`)
        }

        const hashedPassword = await bcrypt.hash(finalPassword, 10)

        // If the creator is an Admin, bind the new user to their station/org automatically
        let newStationId = currentUserRole === 'ADMIN' ? currentStationId : stationId;
        let newOrgId = currentUserRole === 'ADMIN' ? currentOrgId : organizationId;

        // If Super Admin, they can pass these in the body. If empty string passed, set to undefined.
        if (newStationId === "") newStationId = undefined;
        if (newOrgId === "") newOrgId = undefined;

        const user = await prisma.user.create({
            data: {
                name,
                email: finalEmail,
                phone: finalPhone,
                passwordHash: hashedPassword,
                loginCode,
                isFirstLogin,
                stationId: newStationId,
                organizationId: newOrgId,
                isActive: true,
                role: {
                    connect: {
                        name: roleName || 'ADMIN',
                    },
                },
            },
            select: {
                id: true,
                name: true,
                email: true,
                phone: true,
                role: true,
            },
        })

        return NextResponse.json(user, { status: 201 })
    } catch (error) {
        console.error('Error creating user:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
