import { NextResponse } from 'next/server';
import { prisma } from '@repo/database';
import bcrypt from 'bcryptjs';

export async function POST(request: Request) {
    try {
        const { identifier, isPhone, code, newPassword } = await request.json();

        if (!identifier || !code || !newPassword) {
            return NextResponse.json({ error: 'Missing required fields' }, { status: 400 });
        }

        // Find the latest valid reset code
        const resetRecord = await prisma.passwordReset.findFirst({
            where: {
                [isPhone ? 'phone' : 'email']: identifier,
                code,
                expiresAt: { gt: new Date() },
            },
            orderBy: { createdAt: 'desc' },
        });

        if (!resetRecord) {
            return NextResponse.json({ error: 'Invalid or expired code' }, { status: 400 });
        }

        // Hash new password
        const hashedPassword = await bcrypt.hash(newPassword, 10);

        // Update user password
        await prisma.user.update({
            where: isPhone ? { phone: identifier } : { email: identifier },
            data: { passwordHash: hashedPassword },
        });

        // Delete the used reset code (and potentially all codes for this user)
        await prisma.passwordReset.deleteMany({
            where: { [isPhone ? 'phone' : 'email']: identifier },
        });

        return NextResponse.json({ message: 'Password reset successful' });
    } catch (error) {
        console.error('Error in reset-password:', error);
        return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
    }
}
