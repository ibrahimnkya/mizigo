import { NextResponse } from 'next/server'
import { prisma } from '@repo/database'
import { auth } from '@/auth'

export async function GET(request: Request) {
    try {
        const { searchParams } = new URL(request.url);
        const status = searchParams.get('status');

        const session = await auth();
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
        }

        const isAdmin = session.user.role === 'ADMIN';
        const isSuperAdmin = session.user.role === 'SUPER_ADMIN';
        const userId = session.user.id;

        let where: any = {};
        if (status) {
            where.status = status;
        }

        if (isAdmin) {
            // Admin only sees payments for cargo they approved
            where.approvedById = userId;
        } else if (!isSuperAdmin) {
            // Regular user only sees their own payments
            where.userId = userId;
        }

        const payments = await prisma.payment.findMany({
            where,
            include: {
                cargo: true
            },
            orderBy: { createdAt: 'desc' }
        });

        return NextResponse.json(payments);
    } catch (error) {
        console.error('Error fetching payments:', error);
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 });
    }
}
