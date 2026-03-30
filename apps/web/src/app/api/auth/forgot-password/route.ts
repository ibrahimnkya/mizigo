import { NextResponse } from 'next/server';
import { prisma } from '@repo/database';

export async function POST(request: Request) {
    try {
        const { identifier, isPhone } = await request.json();

        if (!identifier) {
            return NextResponse.json({ error: 'Identifier is required' }, { status: 400 });
        }

        // Check if user exists
        const user = await prisma.user.findUnique({
            where: isPhone ? { phone: identifier } : { email: identifier },
        });

        if (!user) {
            // For security reasons, we might return success even if user doesn't exist
            // but for this MVP, we'll be explicit to help with debugging.
            return NextResponse.json({ error: 'User not found' }, { status: 404 });
        }

        // Generate a random 4-digit code
        const code = Math.floor(1000 + Math.random() * 9000).toString();
        const expiresAt = new Date(Date.now() + 15 * 60 * 1000); // 15 minutes expiry

        // Store reset code
        await prisma.passwordReset.create({
            data: {
                [isPhone ? 'phone' : 'email']: identifier,
                code,
                expiresAt,
            },
        });

        // In a real app, send Email/SMS here.
        // For development, we'll return it in the response.
        console.log(`[DEV] Password reset code for ${identifier}: ${code}`);

        return NextResponse.json({ 
            message: 'Reset code sent successfully',
            code: process.env.NODE_ENV === 'development' ? code : undefined 
        });
    } catch (error) {
        console.error('Error in forgot-password:', error);
        return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
    }
}
