import { PrismaClient } from "@prisma/client";
import crypto from "node:crypto";

const prisma = new PrismaClient();

const sha256 = (value: string) => crypto.createHash("sha256").update(value).digest("hex");

const ALL_PERMISSIONS = [
  "admins:create",
  "admins:update",
  "admins:delete",
  "operators:create",
  "operators:update",
  "operators:delete",
  "organizations:create",
  "organizations:update",
  "organizations:delete",
  "stations:create",
  "stations:update",
  "stations:delete",
  "roles:create",
  "roles:assign_permissions",
  "permissions:create",
  "pricing:create",
  "pricing:update",
  "app_versions:create",
  "integrations:create",
  "integrations:update",
  "sms_config:create",
  "sms_config:read",
  "sms_config:approve_sender",
] as const;

const ROLE_PERMISSIONS = {
  SUPER_ADMIN: [...ALL_PERMISSIONS],
  ADMIN: [
    "admins:create",
    "admins:update",
    "operators:create",
    "operators:update",
    "organizations:update",
    "stations:create",
    "stations:update",
    "pricing:create",
    "pricing:update",
    "app_versions:create",
  ],
  OPERATOR: [
    // Operator role is mostly governed by route scoping/auth today.
    // Keep explicit permissions minimal and tied to operator lifecycle.
    "operators:update",
  ],
} as const;

async function main() {
  // 1) Wipe ALL existing data (hard delete), respecting FK order.
  await prisma.$transaction([
    prisma.authSession.deleteMany({}),
    prisma.rolePermission.deleteMany({}),
    prisma.payment.deleteMany({}),
    prisma.cargoRequest.deleteMany({}),
    prisma.passwordReset.deleteMany({}),
    prisma.notification.deleteMany({}),
    prisma.auditLog.deleteMany({}),
    prisma.appVersion.deleteMany({}),
    prisma.integration.deleteMany({}),
    prisma.pricingRule.deleteMany({}),
    prisma.serviceType.deleteMany({}),
    prisma.station.deleteMany({}),
    prisma.user.deleteMany({}),
    prisma.permission.deleteMany({}),
    prisma.role.deleteMany({}),
    prisma.paymentProvider.deleteMany({}),
    prisma.organization.deleteMany({}),
  ]);

  // 2) Seed permission catalog used by API route guards.
  await prisma.permission.createMany({
    data: ALL_PERMISSIONS.map((name) => ({ name })),
    skipDuplicates: true,
  });

  // 3) Create core roles.
  const superAdminRole = await prisma.role.create({
    data: {
      name: "SUPER_ADMIN",
      description: "Platform super admin",
    },
  });
  const adminRole = await prisma.role.create({
    data: {
      name: "ADMIN",
      description: "Organization admin",
    },
  });
  const operatorRole = await prisma.role.create({
    data: {
      name: "OPERATOR",
      description: "Station operator",
    },
  });

  // 4) Assign permissions to roles.
  const permissions = await prisma.permission.findMany({
    where: { name: { in: [...ALL_PERMISSIONS] } },
  });
  const permissionByName = new Map(permissions.map((p) => [p.name, p.id]));

  const roleByName = new Map<string, string>([
    ["SUPER_ADMIN", superAdminRole.id],
    ["ADMIN", adminRole.id],
    ["OPERATOR", operatorRole.id],
  ]);

  const rolePermissionRows = Object.entries(ROLE_PERMISSIONS).flatMap(([roleName, permissionNames]) => {
    const roleId = roleByName.get(roleName);
    if (!roleId) return [];
    return permissionNames
      .map((permissionName) => {
        const permissionId = permissionByName.get(permissionName);
        if (!permissionId) return null;
        return { roleId, permissionId };
      })
      .filter((row): row is { roleId: string; permissionId: string } => row !== null);
  });

  await prisma.rolePermission.createMany({
    data: rolePermissionRows,
    skipDuplicates: true,
  });

  // 5) Create SUPER_ADMIN user (credentials via env; safe defaults).
  const email = process.env.SUPER_ADMIN_EMAIL || "superadmin@mizigo.com";
  const otp = process.env.SUPER_ADMIN_OTP || "123456";
  const phone = process.env.SUPER_ADMIN_PHONE || null;
  const name = process.env.SUPER_ADMIN_NAME || "Super Admin";

  const superAdmin = await prisma.user.create({
    data: {
      email,
      name,
      phone,
      loginCode: sha256(otp),
      isFirstLogin: false,
      role: { connect: { id: superAdminRole.id } },
    },
  });

  console.log("✅ Seed complete. Super admin user created:", {
    id: superAdmin.id,
    email: superAdmin.email,
    role: superAdminRole.name,
    permissionsSeeded: permissions.length,
    rolesSeeded: 3,
  });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
