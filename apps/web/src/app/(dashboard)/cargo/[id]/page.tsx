import { notFound } from 'next/navigation'
import { prisma } from '@repo/database'
import { auth } from '@/auth'
import { CargoDetailPanel } from '@/components/cargo/cargo-detail-panel'

async function getCargo(id: string) {
    return prisma.cargoRequest.findUnique({
        where: { id },
        include: {
            user: { select: { name: true, email: true, phone: true } },
            approvedBy: { select: { name: true, email: true } },
            payment: true,
        },
    })
}

export default async function CargoDetailPage({
    params,
    searchParams,
}: {
    params: Promise<{ id: string }>
    searchParams: Promise<{ tab?: string }>
}) {
    const session = await auth()
    if (!session?.user) return notFound()

    const { id } = await params
    const { tab } = await searchParams
    const cargo = await getCargo(id)

    if (!cargo) return notFound()

    // CargoDetailPanel owns its own page shell (bg, padding, header)
    return <CargoDetailPanel cargo={cargo as any} defaultTab={tab ?? 'details'} userRole={session.user.role} />
}