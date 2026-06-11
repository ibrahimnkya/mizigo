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

  // 5.5) Create SGR Portal Integration Config
  await prisma.integration.upsert({
    where: { id: "sgr-portal-default-integration" },
    update: {
      name: "TRC SGR Portal",
      type: "SGR_PORTAL",
      isActive: true,
      config: {
        baseUrl: "https://dev.trc.co.tz/ecargo_sgr",
        serviceName: "SETL_SERVICE",
        headerService: "ANONYMOUS_SERVICE",
        clientRef: "XCNT202606830874",
        publicKey: "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCpNs5Vm1uwxrA0EEwbCACylnqzwf4kJaENxn/vbklopzyTxZjnv0eSumA7oytlwzHwQuadMS44zx0dc2xno+jNrGDYRf8Cd5iN0V1xPRhwOJeyhQhuiziw57YuUhu70gEGklb2SAFxM3DWtzecJnR17lrsCYwZ8q/0cXjbTCQUYQIDAQAB",
      }
    },
    create: {
      id: "sgr-portal-default-integration",
      name: "TRC SGR Portal",
      type: "SGR_PORTAL",
      isActive: true,
      config: {
        baseUrl: "https://dev.trc.co.tz/ecargo_sgr",
        serviceName: "SETL_SERVICE",
        headerService: "ANONYMOUS_SERVICE",
        clientRef: "XCNT202606830874",
        publicKey: "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCpNs5Vm1uwxrA0EEwbCACylnqzwf4kJaENxn/vbklopzyTxZjnv0eSumA7oytlwzHwQuadMS44zx0dc2xno+jNrGDYRf8Cd5iN0V1xPRhwOJeyhQhuiziw57YuUhu70gEGklb2SAFxM3DWtzecJnR17lrsCYwZ8q/0cXjbTCQUYQIDAQAB",
      }
    }
  });

  // 6) Seed Stations
  const stationsToSeed = [
    { id: "01KPWEWYACW1NRAFBTTGFRSKYS", code: "DSM", name: "Dar es Salaam" },
    { id: "01KPWEWYAH1EWYZA9A87M6JVHN", code: "PUG", name: "Pugu" },
    { id: "01KPWEWYAMDJWDA4V46CYERGK0", code: "SOG", name: "Soga" },
    { id: "01KPWEWYAQ78HT4H60XPXPM199", code: "RUV", name: "Ruvu" },
    { id: "01KPWEWYATH95AFXQTNXAPHK0H", code: "NGR", name: "Ngerengere" },
    { id: "01KPWEWYAXQKQE805RXDFP5327", code: "MOR", name: "Morogoro" },
    { id: "01KPWEWYB0DXCZSXJHPJJ4NEJX", code: "MkA", name: "Mkata" },
    { id: "01KPWEWYB3MBYH1ATFDHT5C9QA", code: "KLO", name: "Kilosa" },
    { id: "01KPWEWYB64BN465AYCY0ANFF8", code: "KID", name: "Kidete" },
    { id: "01KPWEWYB8HQWA38MK5VMY1S7B", code: "GLW", name: "Gulwe" },
    { id: "01KPWEWYBBNAD6DQYCXJ7CBS22", code: "IGD", name: "Igandu" },
    { id: "01KPWEWYBDHMSDJKHNQYKJBV4M", code: "DOM", name: "Dodoma" }
  ];

  for (const s of stationsToSeed) {
    await prisma.station.upsert({
      where: { id: s.id },
      update: {
        code: s.code,
        name: s.name,
        isActive: true,
        organizationId: trcOrg.id,
      },
      create: {
        id: s.id,
        code: s.code,
        name: s.name,
        isActive: true,
        organizationId: trcOrg.id,
      }
    });
  }

  // 6.5) Seed Pricing Rules / SGR Tariffs
  const tariffsToSeed = [
    {
      name: "ENVOLOP TARRIF FOR SAFARI EXPR",
      type: "SGR_TARIFF",
      value: 10000,
      condition: JSON.stringify({
        description: "ENVOLOP PRICE",
        distanceRate: 1,
        weightRate: 1,
        sgrId: "01KTC2KADYQR2TCGBH0PWQ0DW9",
        parcelCategory: {
          id: "01KQ7EGD31TD4ES1C57N2XPW7M",
          name: "ENVOLOP PRICE",
          code: "TRCEP",
          description: "BAHASHAYENYEUKUBWAA4",
          chargingMode: "Fixed_Amount",
          maxWeightInKg: 0.5,
        }
      })
    },
    {
      name: "OTHER PARCEL FOR SAFAR EXP",
      type: "SGR_TARIFF",
      value: 1,
      condition: JSON.stringify({
        description: "OTHER PARCEL FOR SAFARI",
        distanceRate: 1,
        weightRate: 1,
        sgrId: "01KTC3GH2GW8YDDDW9SBK9PMA4",
        parcelCategory: {
          id: "01KQ7EKJX6GQ0K8Y2NTJ2E6R95",
          name: "PARCEL NYINGINEZO",
          code: "TRCPN",
          description: "MINGINEYOMIZIGO",
          chargingMode: "Percentage_Wise",
          maxWeightInKg: 5,
          maxLengthInCm: 30,
          maxWidthInCm: 30,
          maxHeightInCm: 30,
          cubicVolumeLimit: 27000
        }
      })
    }
  ];

  for (const t of tariffsToSeed) {
    await prisma.pricingRule.upsert({
      where: { name: t.name },
      update: {
        type: t.type,
        value: t.value,
        condition: t.condition,
        isActive: true,
      },
      create: {
        name: t.name,
        type: t.type,
        value: t.value,
        condition: t.condition,
        isActive: true,
      }
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

  // // 9) Create Clerks
  // const clerks = [
  //   { email: "clerk1@trctest.com", name: "TRC Clerk One" },
  //   { email: "clerk2@trctest.com", name: "TRC Clerk Two" },
  // ];

  // for (const clerk of clerks) {
  //   await prisma.user.upsert({
  //     where: { email: clerk.email },
  //     update: {
  //       loginCode: sha256("123456"),
  //       isFirstLogin: false,
  //       organization: { connect: { id: trcOrg.id } },
  //       role: { connect: { id: clerkRole.id } },
  //     },
  //     create: {
  //       email: clerk.email,
  //       name: clerk.name,
  //       loginCode: sha256("123456"),
  //       isFirstLogin: false,
  //       organization: { connect: { id: trcOrg.id } },
  //       role: { connect: { id: clerkRole.id } },
  //     },
  //   });
  // }

  // // 10) Create Train Guards
  // const guards = [
  //   { email: "guard1@trctest.com", name: "TRC Guard Alpha" },
  //   { email: "guard2@trctest.com", name: "TRC Guard Beta" },
  // ];

  // for (const guard of guards) {
  //   await prisma.user.upsert({
  //     where: { email: guard.email },
  //     update: {
  //       loginCode: sha256("123456"),
  //       isFirstLogin: false,
  //       organization: { connect: { id: trcOrg.id } },
  //       role: { connect: { id: trainGuardRole.id } },
  //     },
  //     create: {
  //       email: guard.email,
  //       name: guard.name,
  //       loginCode: sha256("123456"),
  //       isFirstLogin: false,
  //       organization: { connect: { id: trcOrg.id } },
  //       role: { connect: { id: trainGuardRole.id } },
  //     },
  //   });
  // }

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
