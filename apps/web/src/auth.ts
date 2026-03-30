import NextAuth from 'next-auth';
import { authConfig } from './auth.config';
import Credentials from 'next-auth/providers/credentials';
import { z } from 'zod';
import { prisma } from '@repo/database';
import bcrypt from 'bcryptjs';

async function getUserByEmail(email: string) {
    try {
        const user = await prisma.user.findUnique({
            where: { email },
            include: {
                role: {
                    include: {
                        permissions: {
                            include: {
                                permission: true
                            }
                        }
                    }
                }
            }
        });
        return user;
    } catch (error) {
        console.error('Failed to fetch user by email:', error);
        return null;
    }
}

async function getUserByPhone(phone: string) {
    try {
        const user = await prisma.user.findUnique({
            where: { phone },
            include: {
                role: {
                    include: {
                        permissions: {
                            include: {
                                permission: true
                            }
                        }
                    }
                }
            }
        });
        return user;
    } catch (error) {
        console.error('Failed to fetch user by phone:', error);
        return null;
    }
}

export const { auth, signIn, signOut, handlers } = NextAuth({
    ...authConfig,
    providers: [
        Credentials({
            async authorize(credentials) {
                // Support either 'identifier' + 'secret' or specifically 'email'/'phone' + 'password'/'code' from forms
                const identifier = (credentials?.email || credentials?.phone || credentials?.identifier) as string;
                const secret = (credentials?.password || credentials?.code || credentials?.secret) as string;

                if (!identifier || !secret) return null;

                let user = null;
                // Simple heuristic: if it has an '@', treat as email. Otherwise, treat as phone.
                if (identifier.includes('@')) {
                    user = await getUserByEmail(identifier);
                } else {
                    user = await getUserByPhone(identifier);
                }

                if (!user) return null;

                // Check secret against loginCode OR passwordHash
                const isOtpMatch = user.loginCode === secret;
                let isPasswordMatch = false;
                
                if (user.passwordHash && !isOtpMatch) {
                    isPasswordMatch = await bcrypt.compare(secret, user.passwordHash);
                }

                if (isOtpMatch || isPasswordMatch) {
                    return {
                        id: user.id,
                        name: user.name,
                        email: user.email,
                        role: user.role?.name || '',
                        isFirstLogin: user.isFirstLogin,
                        createdAt: user.createdAt.toISOString(),
                        permissions: user.role?.permissions.map((p: any) => p.permission.name) || [],
                        stationId: (user as any).stationId,
                        organizationId: (user as any).organizationId,
                    };
                }

                return null;
            },
        }),
    ],
}) as any;
