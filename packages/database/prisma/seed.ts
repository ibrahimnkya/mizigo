import { PrismaClient } from '@prisma/client'
import bcrypt from 'bcryptjs'

const prisma = new PrismaClient()

const PERMISSIONS = {
    SUPER_ADMIN: [
        'cargo:create', 'cargo:read', 'cargo:update', 'cargo:delete', 'cargo:override',
        'user:create', 'user:read', 'user:update', 'user:delete',
        'payment:read', 'payment:refund',
        'pricing:manage', 'settings:manage', 'reports:view'
    ],
    ADMIN: [
        'cargo:read', 'cargo:update_status', 'cargo:approve', 'cargo:reject',
        'payment:read_limited', 'reports:view_limited'
    ],
    OPERATOR: [
        'cargo:create', 'cargo:read', 'cargo:update_status', 'payment:create'
    ],
    AGENT: [
        'cargo:create', 'cargo:read', 'cargo:update_status', 'payment:create'
    ],
    USER: [
        'cargo:create', 'cargo:read'
    ]
}

async function main() {
    const passwordHash = await bcrypt.hash('password123', 10)

    // 1. Create Permissions
    const allPermissions = new Set([...PERMISSIONS.SUPER_ADMIN, ...PERMISSIONS.ADMIN, ...PERMISSIONS.OPERATOR, ...PERMISSIONS.AGENT, ...PERMISSIONS.USER])
    for (const perm of allPermissions) {
        await (prisma as any).permission.upsert({
            where: { name: perm },
            update: {},
            create: { name: perm }
        })
    }

    // 2. Create Roles & Assign Permissions
    const roles = [
        { name: 'SUPER_ADMIN', permissions: PERMISSIONS.SUPER_ADMIN },
        { name: 'ADMIN', permissions: PERMISSIONS.ADMIN },
        { name: 'OPERATOR', permissions: PERMISSIONS.OPERATOR },
        { name: 'AGENT', permissions: PERMISSIONS.AGENT },
        { name: 'USER', permissions: PERMISSIONS.USER }
    ]

    for (const roleDef of roles) {
        const role = await (prisma as any).role.upsert({
            where: { name: roleDef.name },
            update: {},
            create: { name: roleDef.name }
        })

        // Assign Permissions
        const dbPermissions = await (prisma as any).permission.findMany({
            where: { name: { in: roleDef.permissions } }
        })

        for (const perm of dbPermissions) {
            await (prisma as any).rolePermission.upsert({
                where: {
                    roleId_permissionId: {
                        roleId: role.id,
                        permissionId: perm.id
                    }
                },
                update: {},
                create: {
                    roleId: role.id,
                    permissionId: perm.id
                }
            })
        }
    }

    // 3. Create Users
    const superAdminRole = await (prisma as any).role.findUnique({ where: { name: 'SUPER_ADMIN' } })
    const adminRole = await (prisma as any).role.findUnique({ where: { name: 'ADMIN' } })
    const operatorRole = await (prisma as any).role.findUnique({ where: { name: 'OPERATOR' } })

    const superAdmin = await prisma.user.upsert({
        where: { email: 'superadmin@mizigo.com' },
        update: {
            phone: '0700000001',
            loginCode: '1234',
            role: superAdminRole ? { connect: { id: superAdminRole.id } } : undefined
        },
        create: {
            email: 'superadmin@mizigo.com',
            phone: '0700000001',
            loginCode: '1234',
            name: 'Super Admin',
            passwordHash,
            role: superAdminRole ? { connect: { id: superAdminRole.id } } : undefined
        },
    })

    const admin = await prisma.user.upsert({
        where: { email: 'admin@mizigo.com' },
        update: {
            phone: '0700000002',
            loginCode: '1234',
            role: adminRole ? { connect: { id: adminRole.id } } : undefined
        },
        create: {
            email: 'admin@mizigo.com',
            phone: '0700000002',
            loginCode: '1234',
            name: 'Admin User',
            passwordHash,
            role: adminRole ? { connect: { id: adminRole.id } } : undefined
        },
    })

    const operator = await prisma.user.upsert({
        where: { email: 'operator@mizigo.com' },
        update: {
            phone: '0700000003',
            loginCode: '1234',
            role: operatorRole ? { connect: { id: operatorRole.id } } : undefined
        },
        create: {
            email: 'operator@mizigo.com',
            phone: '0700000003',
            loginCode: '1234',
            name: 'Terminal Operator',
            passwordHash,
            role: operatorRole ? { connect: { id: operatorRole.id } } : undefined
        },
    })

    // 4. Create some cargo requests and payments for testing ownership
    const cargo1 = await (prisma as any).cargoRequest.create({
        data: {
            fromAddress: 'Dar es Salaam',
            toAddress: 'Arusha',
            serviceType: 'EXPRESS',
            cargoType: 'ELECTRONICS',
            cargoSize: 'MEDIUM',
            receiverName: 'Bakari Juma',
            receiverPhone: '0712345678',
            pickupType: 'HOME',
            status: 'APPROVED',
            amount: 2500,
            wagonType: 'EXPRESS',
            approvedById: operator.id,
            userId: operator.id,
        }
    })

    await (prisma as any).payment.create({
        data: {
            cargoId: cargo1.id,
            userId: operator.id,
            amount: 2500,
            status: 'SUCCESS',
            paymentMethod: 'MPESA',
            approvedById: admin.id
        }
    })

    // Additional mock cargo requests for presentation
    const mockCargos = [
        { from: 'Dar es Salaam', to: 'Mwanza', status: 'IN_TRANSIT', amount: 4500, receiver: 'Aisha John', phone: '0754112233', type: 'FURNITURE', size: 'LARGE', wagonType: 'STANDARD', userId: admin.id, approverId: operator.id, pickup: 'HOME' },
        { from: 'Arusha', to: 'Dodoma', status: 'PENDING', amount: null, receiver: 'Paul Smith', phone: '0788990011', type: 'DOCUMENTS', size: 'SMALL', wagonType: 'ECONOMY', userId: operator.id, approverId: null, pickup: 'STATION' },
        { from: 'Dar es Salaam', to: 'Zanzibar', status: 'COMPLETED', amount: 1500, receiver: 'Fatma Ali', phone: '0777556644', type: 'CLOTHING', size: 'MEDIUM', wagonType: 'EXPRESS', userId: admin.id, approverId: admin.id, pickup: 'STATION' },
        { from: 'Dodoma', to: 'Dar es Salaam', status: 'PAYMENT_PENDING', amount: 3000, receiver: 'Juma Kaseja', phone: '0711223344', type: 'ELECTRONICS', size: 'MEDIUM', wagonType: 'STANDARD', userId: superAdmin.id, approverId: operator.id, pickup: 'STATION' },
        { from: 'Tanga', to: 'Dar es Salaam', status: 'APPROVED', amount: 2000, receiver: 'Musa Daud', phone: '0733889900', type: 'PARCEL', size: 'SMALL', wagonType: 'ECONOMY', userId: operator.id, approverId: operator.id, pickup: 'HOME' },
        { from: 'Mbeya', to: 'Arusha', status: 'COMPLETED', amount: 6000, receiver: 'Sara Peter', phone: '0755667788', type: 'EQUIPMENT', size: 'LARGE', wagonType: 'STANDARD', userId: admin.id, approverId: admin.id, pickup: 'STATION' },
        { from: 'Mtwara', to: 'Dar es Salaam', status: 'DELAYED', amount: 3500, receiver: 'Hassan Juma', phone: '0766112233', type: 'GROCERIES', size: 'MEDIUM', wagonType: 'STANDARD', userId: operator.id, approverId: operator.id, pickup: 'HOME' },
        { from: 'Moshi', to: 'Arusha', status: 'REJECTED', amount: null, receiver: 'Grace Simon', phone: '0788112233', type: 'MACHINERY', size: 'LARGE', wagonType: 'EXPRESS', userId: admin.id, approverId: admin.id, pickup: 'STATION', rejection: 'Exceeds standard weight limits' },
        { from: 'Kigoma', to: 'Dodoma', status: 'IN_TRANSIT', amount: 7500, receiver: 'Emmanuel K.', phone: '0711998877', type: 'FURNITURE', size: 'LARGE', wagonType: 'ECONOMY', userId: superAdmin.id, approverId: operator.id, pickup: 'HOME' },
    ];

    for (const c of mockCargos) {
        const rc = await (prisma as any).cargoRequest.create({
            data: {
                fromAddress: c.from,
                toAddress: c.to,
                serviceType: 'STANDARD',
                cargoType: c.type,
                cargoSize: c.size,
                receiverName: c.receiver,
                receiverPhone: c.phone,
                pickupType: c.pickup,
                status: c.status,
                amount: c.amount,
                wagonType: c.wagonType,
                userId: c.userId,
                approvedById: c.approverId,
                rejectionReason: c.rejection || null,
            }
        });

        // Also mock some payments to fill the reports revenue
        if (c.status === 'COMPLETED' || c.status === 'IN_TRANSIT' || c.status === 'APPROVED' || c.status === 'DELAYED') {
             await (prisma as any).payment.create({
                 data: {
                     cargoId: rc.id,
                     userId: c.userId,
                     amount: c.amount || 2000,
                     status: 'SUCCESS',
                     paymentMethod: 'MPESA',
                     approvedById: c.approverId
                 }
             });
        } else if (c.status === 'PAYMENT_PENDING') {
            await (prisma as any).payment.create({
                 data: {
                     cargoId: rc.id,
                     userId: c.userId,
                     amount: c.amount || 2000,
                     status: 'PENDING',
                     paymentMethod: 'MPESA',
                     approvedById: null
                 }
             });
        }
    }

    // Mock failed/refunded payments specifically
    const mockFailedCargo = await (prisma as any).cargoRequest.create({
        data: {
            fromAddress: 'Singida', toAddress: 'Dodoma', serviceType: 'STANDARD', cargoType: 'PARCEL', cargoSize: 'SMALL',
            receiverName: 'Failed Payment User', receiverPhone: '0799112233', pickupType: 'STATION',
            status: 'PAYMENT_PENDING', amount: 1500, wagonType: 'ECONOMY', userId: operator.id, approvedById: admin.id,
        }
    })
    await (prisma as any).payment.create({
        data: { cargoId: mockFailedCargo.id, userId: operator.id, amount: 1500, status: 'FAILED', paymentMethod: 'CARD', approvedById: admin.id }
    })

    const mockRefundedCargo = await (prisma as any).cargoRequest.create({
        data: {
            fromAddress: 'Iringa', toAddress: 'Mwanza', serviceType: 'EXPRESS', cargoType: 'ELECTRONICS', cargoSize: 'MEDIUM',
            receiverName: 'Refunded User', receiverPhone: '0711999999', pickupType: 'STATION',
            status: 'REJECTED', amount: 8000, wagonType: 'EXPRESS', userId: admin.id, approvedById: admin.id, rejectionReason: 'Damaged in transit'
        }
    })
    await (prisma as any).payment.create({
        data: { cargoId: mockRefundedCargo.id, userId: admin.id, amount: 8000, status: 'REFUNDED', paymentMethod: 'MPESA', approvedById: admin.id }
    })

    // 5. Create Service Types
    const services = [
        { name: 'Bodaboda', description: '0.4x0.4x0.4m, up to 20kg – Motorcycle delivery', basePrice: 500 },
        { name: 'Small Vehicle', description: '1x1x1m, up to 150kg – Compact vehicle', basePrice: 1000 },
        { name: 'Minivan/Kirikuu', description: '1.5x1.2x1.2m, up to 300kg – Minivan', basePrice: 1800 },
        { name: 'Canter/Fuso', description: '2.8x2x2m, up to 5000kg – Medium truck', basePrice: 4000 },
        { name: 'Large Truck', description: '4.2x3x3m, up to 10000kg – Heavy haulage', basePrice: 8000 },
    ]

    for (const service of services) {
        await (prisma as any).serviceType.upsert({
            where: { name: service.name },
            update: service,
            create: service
        })
    }

    // 6. Create Stations (Locations) - Clear old ones first to ensure only requested exist
    await (prisma as any).station.deleteMany({})

    const stations = [
        { name: 'Magufuli SGR Station', code: 'JPM-SGR', location: 'Dar Es Salaam' },
        { name: 'Pugu SGR Station', code: 'PGU-SGR', location: 'Pugu' },
        { name: 'Ruvu SGR Station', code: 'RVU-SGR', location: 'Ruvu' },
        { name: 'Soga SGR Station', code: 'SGA-SGR', location: 'Soga' },
        { name: 'Ngerengere SGR Station', code: 'NGR-SGR', location: 'Ngerengere' },
        { name: 'Jakaya SGR Station', code: 'JKW-SGR', location: 'Morogoro' },
        { name: 'Mkata SGR Station', code: 'MKT-SGR', location: 'Mkata' },
        { name: 'Kimamba SGR Station', code: 'KMB-SGR', location: 'Kimamba' },
        { name: 'Kilosa SGR Station', code: 'KLS-SGR', location: 'Kilosa' },
        { name: 'Kidete SGR Station', code: 'KDT-SGR', location: 'Kidete' },
        { name: 'Gulwe SGR Station', code: 'GLW-SGR', location: 'Gulwe' },
        { name: 'Igandu SGR Station', code: 'IGD-SGR', location: 'Igandu' },
        { name: 'Ihumwa SGR Station', code: 'IHM-SGR', location: 'Ihumwa' },
        { name: 'Samia SGR Station', code: 'SSH-SGR', location: 'Dodoma' },
    ]

    for (const station of stations) {
        await (prisma as any).station.upsert({
            where: { name: station.name },
            update: station,
            create: station
        })
    }

    // 7. Create Pricing Rules
    const pricingRules = [
        { name: 'Bulk Discount', type: 'PERCENTAGE', value: 15, condition: 'weight > 500' },
        { name: 'Fragile Handling', type: 'FIXED', value: 500, condition: 'type == FRAGILE' },
        { name: 'Express Surcharge', type: 'PERCENTAGE', value: 25, condition: 'service == EXPRESS' },
    ]

    for (const rule of pricingRules) {
        await (prisma as any).pricingRule.upsert({
            where: { name: rule.name },
            update: rule,
            create: rule
        })
    }

    // 8. Create Audit Logs
    await (prisma as any).auditLog.create({
        data: {
            userId: superAdmin.id,
            action: 'LOGIN',
            resource: 'AUTH',
            details: { ip: '192.168.1.1' }
        }
    })

    await (prisma as any).auditLog.create({
        data: {
            userId: admin.id,
            action: 'UPDATE',
            resource: 'CARGO',
            details: { id: cargo1.id, status: 'APPROVED' }
        }
    })

    await (prisma as any).auditLog.create({
        data: {
            userId: operator.id,
            action: 'CREATE',
            resource: 'PAYMENT',
            details: { amount: 4500, method: 'MPESA' }
        }
    })

    await (prisma as any).auditLog.create({
        data: {
            userId: superAdmin.id,
            action: 'UPDATE',
            resource: 'SETTINGS',
            details: { category: 'PRICING_RULES' }
        }
    })

    // 9. Create Notifications
    await (prisma as any).notification.create({
        data: {
            userId: admin.id,
            title: 'New Cargo Request',
            message: 'A new express cargo request is pending your approval.',
            type: 'INFO'
        }
    })

    await (prisma as any).notification.create({
        data: {
            userId: operator.id,
            title: 'Cargo Dispatched',
            message: 'Cargo to Mwanza has been dispatched successfully.',
            type: 'INFO'
        }
    })

    await (prisma as any).notification.create({
        data: {
            userId: admin.id,
            title: 'Payment Received',
            message: 'Payment of TZS 2,500 confirmed for Cargo #' + cargo1.id.slice(-6).toUpperCase(),
            type: 'SUCCESS'
        }
    })
    
    await (prisma as any).notification.create({
        data: {
            userId: operator.id,
            title: 'Weekly Performance Report',
            message: 'Your weekly workforce performance report is available. You hit 90% target delivery!',
            type: 'SUCCESS'
        }
    })

    console.log('✅ Seed complete:', { superAdmin, admin, cargo1 })
}

main()
    .catch((e) => {
        console.error(e)
        // @ts-ignore
        if (typeof process !== 'undefined') process.exit(1)
    })
    .finally(async () => {
        await prisma.$disconnect()
    })
