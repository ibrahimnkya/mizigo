import { NextResponse } from 'next/server';
import { prisma } from '@repo/database';
import { auth } from '@/auth';

export async function PUT(request: Request) {
    try {
        const session = await auth();

        if (!session?.user?.id) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
        }

        const body = await request.json();
        const { newCode } = body;

        if (!newCode || newCode.length !== 4) {
            return NextResponse.json({ error: 'Invalid 4-digit code' }, { status: 400 });
        }

        const userId = session.user.id;

        // Update the user
        const updatedUser = await prisma.user.update({
            where: { id: userId },
            data: {
                loginCode: newCode,
                isFirstLogin: false,
            },
            select: {
                id: true,
                isFirstLogin: true,
            }
        });

        return NextResponse.json(updatedUser, { status: 200 });
    } catch (error) {
        console.error('Error changing OTP:', error);
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 });
    }
}
