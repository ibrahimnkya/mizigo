import { PrismaClient } from "@prisma/client";
import * as crypto from "crypto";

const prisma = new PrismaClient();

const sha256 = (value: string) =>
  crypto.createHash("sha256").update(value).digest("hex");

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
  STATION_MASTER: [
    "operators:update",
    // Full access to parcel lifecycle
    "pricing:read",
  ],
  CLERK: ["operators:update", "pricing:read"],
  TRAIN_GUARD: [
    // Limited access
  ],
} as const;

async function main() {
  // 1) Wipe ALL existing data (hard delete), respecting FK order.
  await prisma.$transaction([
    prisma.authSession.deleteMany({}),
    prisma.rolePermission.deleteMany({}),
    prisma.payment.deleteMany({}),
    prisma.oTP.deleteMany({}),
    prisma.parcelTracking.deleteMany({}),
    prisma.parcel.deleteMany({}),
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

  // 3) Create Default Roles.
  const superAdminRole = await prisma.role.upsert({
    where: { name: "SUPER_ADMIN" },
    update: {},
    create: {
      name: "SUPER_ADMIN",
      description: "Full system access",
    },
  });
  const adminRole = await prisma.role.upsert({
    where: { name: "ADMIN" },
    update: {},
    create: {
      name: "ADMIN",
      description: "Station and user management",
    },
  });
  const operatorRole = await prisma.role.upsert({
    where: { name: "OPERATOR" },
    update: {},
    create: {
      name: "OPERATOR",
      description: "Station operator",
    },
  });
  const stationMasterRole = await prisma.role.upsert({
    where: { name: "STATION_MASTER" },
    update: {},
    create: {
      name: "STATION_MASTER",
      description: "Station Manager - Full cargo lifecycle control",
    },
  });
  const clerkRole = await prisma.role.upsert({
    where: { name: "CLERK" },
    update: {},
    create: {
      name: "CLERK",
      description: "Station Clerk - Daily parcel operations",
    },
  });
  const trainGuardRole = await prisma.role.upsert({
    where: { name: "TRAIN_GUARD" },
    update: {},
    create: {
      name: "TRAIN_GUARD",
      description: "Train Guard - Transit offloading",
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
    ["STATION_MASTER", stationMasterRole.id],
    ["CLERK", clerkRole.id],
    ["TRAIN_GUARD", trainGuardRole.id],
  ]);

  const rolePermissionRows = Object.entries(ROLE_PERMISSIONS).flatMap(
    ([roleName, permissionNames]) => {
      const roleId = roleByName.get(roleName);
      if (!roleId) return [];
      return permissionNames
        .map((permissionName) => {
          const permissionId = permissionByName.get(permissionName);
          if (!permissionId) return null;
          return { roleId, permissionId };
        })
        .filter(
          (row): row is { roleId: string; permissionId: string } =>
            row !== null,
        );
    },
  );

  await prisma.rolePermission.createMany({
    data: rolePermissionRows,
    skipDuplicates: true,
  });

  // 5) Create Organizations
  const trcOrg = await prisma.organization.upsert({
    where: { name: "Tanzania Railways Corporation" },
    update: {},
    create: {
      name: "Tanzania Railways Corporation",
      description: "National rail logistics provider",
    },
  });

  // 6) Create Default Stations for TRC
  const stations = [
    {
      name: "Dar es Salaam Central",
      code: "DSM-01",
      location: "Dar es Salaam",
    },
    { name: "Dodoma Main Terminal", code: "DOM-02", location: "Dodoma" },
    { name: "Mwanza Port Station", code: "MWZ-03", location: "Mwanza" },
  ];

  for (const s of stations) {
    await prisma.station.upsert({
      where: { code: s.code },
      update: { organizationId: trcOrg.id },
      create: {
        ...s,
        organizationId: trcOrg.id,
      },
    });
  }

  // 7) Create SUPER_ADMIN user (credentials via env; safe defaults).
  const email = process.env.SUPER_ADMIN_EMAIL || "superadmin@mizigo.com";
  const otp = process.env.SUPER_ADMIN_OTP || "123456";
  const phone = process.env.SUPER_ADMIN_PHONE || null;
  const name = process.env.SUPER_ADMIN_NAME || "Super Admin";

  await prisma.user.upsert({
    where: { email },
    update: {
      loginCode: sha256(otp),
      isFirstLogin: false,
      role: { connect: { id: superAdminRole.id } },
    },
    create: {
      email,
      name,
      phone,
      loginCode: sha256(otp),
      isFirstLogin: false,
      role: { connect: { id: superAdminRole.id } },
    },
  });

  // 8) Create TRC Test Admin user
  await prisma.user.upsert({
    where: { email: "admin@trctest.com" },
    update: {
      loginCode: sha256("123456"),
      isFirstLogin: false,
      organization: { connect: { id: trcOrg.id } },
      role: { connect: { id: adminRole.id } },
    },
    create: {
      email: "admin@trctest.com",
      name: "TRC Test Admin",
      loginCode: sha256("123456"),
      isFirstLogin: false,
      organization: { connect: { id: trcOrg.id } },
      role: { connect: { id: adminRole.id } },
    },
  });

  // 9) Create Clerks
  const clerks = [
    { email: "clerk1@trctest.com", name: "TRC Clerk One" },
    { email: "clerk2@trctest.com", name: "TRC Clerk Two" },
  ];

  for (const clerk of clerks) {
    await prisma.user.upsert({
      where: { email: clerk.email },
      update: {
        loginCode: sha256("123456"),
        isFirstLogin: false,
        organization: { connect: { id: trcOrg.id } },
        role: { connect: { id: clerkRole.id } },
      },
      create: {
        email: clerk.email,
        name: clerk.name,
        loginCode: sha256("123456"),
        isFirstLogin: false,
        organization: { connect: { id: trcOrg.id } },
        role: { connect: { id: clerkRole.id } },
      },
    });
  }

  // 10) Create Train Guards
  const guards = [
    { email: "guard1@trctest.com", name: "TRC Guard Alpha" },
    { email: "guard2@trctest.com", name: "TRC Guard Beta" },
  ];

  for (const guard of guards) {
    await prisma.user.upsert({
      where: { email: guard.email },
      update: {
        loginCode: sha256("123456"),
        isFirstLogin: false,
        organization: { connect: { id: trcOrg.id } },
        role: { connect: { id: trainGuardRole.id } },
      },
      create: {
        email: guard.email,
        name: guard.name,
        loginCode: sha256("123456"),
        isFirstLogin: false,
        organization: { connect: { id: trcOrg.id } },
        role: { connect: { id: trainGuardRole.id } },
      },
    });
  }

  console.log("✅ Seed complete. TRC Test environment ready.");
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
