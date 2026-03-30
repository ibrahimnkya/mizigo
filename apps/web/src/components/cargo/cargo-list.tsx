import { Package } from 'lucide-react'
import { prisma } from '@repo/database'
import { auth } from '@/auth'
import { CargoAdminTable, type CargoItem } from './cargo-admin-table'

async function getCargoRequests(filters: { 
    status?: string | string[]; 
    wagonType?: string; 
    startDate?: string; 
    endDate?: string; 
    receiverPays?: boolean;
}): Promise<CargoItem[]> {
    const session = await auth()
    const isAdmin = session?.user?.role === 'ADMIN' || session?.user?.role === 'SUPER_ADMIN' || session?.user?.role === 'OPERATOR'
    const userId = session?.user?.id

    const where: any = {}
    if (filters.status) {
        if (Array.isArray(filters.status)) {
            where.status = { in: filters.status }
        } else {
            where.status = filters.status
        }
    }
    if (filters.wagonType) where.wagonType = filters.wagonType
    if (filters.receiverPays !== undefined) where.receiverPays = filters.receiverPays
    
    if (filters.startDate || filters.endDate) {
        where.createdAt = {}
        if (filters.startDate) where.createdAt.gte = new Date(filters.startDate)
        if (filters.endDate) where.createdAt.lte = new Date(filters.endDate)
    }

    // Regular users only see their own cargo
    if (!isAdmin && userId) {
        where.userId = userId
    }

    try {
        const cargoRequests = await prisma.cargoRequest.findMany({
            where,
            orderBy: { createdAt: 'desc' },
            include: {
                user: {
                    select: { name: true, email: true, phone: true },
                },
                payment: {
                    select: { status: true, transactionReference: true },
                },
            },
        })

        // Map Prisma result to match CargoItem interface
        return cargoRequests.map(item => ({
            ...item,
            createdAt: item.createdAt.toISOString(),
            status: item.status as string,
            wagonType: item.wagonType,
            amount: item.amount,
            receiverName: item.receiverName,
            receiverPhone: item.receiverPhone,
            peopleNeeded: item.peopleNeeded,
            user: item.user,
            payment: item.payment,
        })) as any[]
    } catch (error) {
        console.error('[CargoList] Database query failed:', error)
        return []
    }
}

export async function CargoList(filters: { 
    status?: string | string[]; 
    wagonType?: string; 
    startDate?: string; 
    endDate?: string; 
    receiverPays?: boolean;
}) {
    const items = await getCargoRequests(filters)

    return (
        <CargoAdminTable initialItems={items} />
    )
}
