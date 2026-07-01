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
  "fleet:create",
  "fleet:update",
  "fleet:delete",
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
    "fleet:create",
    "fleet:update",
    "fleet:delete",
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
    prisma.vehicle.deleteMany({}),
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

  // 5.2) Seed Vehicles/Wagons
  const vehiclesToSeed = [
    { plateNumber: "TRC-9021", type: "Standard", class: "Cargo Wagon", carrier: "TRC" },
    { plateNumber: "TRC-1044", type: "Premium", class: "Locomotive", carrier: "TRC" },
    { plateNumber: "TRC-3112", type: "Economy", class: "Flatbed", carrier: "TRC" },
    { plateNumber: "TRC-7590", type: "Heavy Duty", class: "Tanker", carrier: "TRC" },
  ];

  for (const v of vehiclesToSeed) {
    await prisma.vehicle.upsert({
      where: { plateNumber: v.plateNumber },
      update: {
        type: v.type,
        class: v.class,
        carrier: v.carrier,
        status: "ACTIVE",
        organizationId: trcOrg.id,
      },
      create: {
        plateNumber: v.plateNumber,
        type: v.type,
        class: v.class,
        carrier: v.carrier,
        status: "ACTIVE",
        organizationId: trcOrg.id,
      },
    });
  }

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

  // 5.6) Create default SMS Gateway config
  await prisma.integration.upsert({
    where: { id: "default-sms-gateway-integration" },
    update: {
      name: "Sprint SMS",
      type: "SMS_GATEWAY",
      isActive: true,
      config: {
        baseUrl: process.env.API_URL || "https://api.sprintsmsservice.com/api/SendSMS",
        apiId: process.env.API_ID || "API45908501712_MOCK",
        apiPassword: process.env.API_PASSWORD || "HdWpiSsvcG",
        defaultSenderId: process.env.SENDER_ID || "MIZIGO",
      }
    },
    create: {
      id: "default-sms-gateway-integration",
      name: "Sprint SMS",
      type: "SMS_GATEWAY",
      isActive: true,
      config: {
        baseUrl: process.env.API_URL || "https://api.sprintsmsservice.com/api/SendSMS",
        apiId: process.env.API_ID || "API45908501712_MOCK",
        apiPassword: process.env.API_PASSWORD || "HdWpiSsvcG",
        defaultSenderId: process.env.SENDER_ID || "MIZIGO",
      }
    }
  });

  // 5.7) Create default Payment Gateway config
  await prisma.integration.upsert({
    where: { id: "default-payment-gateway-integration" },
    update: {
      name: "MySafari Pay",
      type: "PAYMENT_GATEWAY",
      isActive: true,
      config: {
        baseUrl: process.env.PAYMENT_GATEWAY_URL || "https://mysafari.co.tz",
        apiKey: process.env.PAYMENT_GATEWAY_KEY || "TEST-API-KEY-12345",
      }
    },
    create: {
      id: "default-payment-gateway-integration",
      name: "MySafari Pay",
      type: "PAYMENT_GATEWAY",
      isActive: true,
      config: {
        baseUrl: process.env.PAYMENT_GATEWAY_URL || "https://mysafari.co.tz",
        apiKey: process.env.PAYMENT_GATEWAY_KEY || "TEST-API-KEY-12345",
      }
    }
  });

  // 5.8) Seed Payment Providers
  const providersToSeed = [
    { code: "Tigo", name: "Tigo Pesa", description: "Tigo Pesa Mobile Money" },
    { code: "Airtel", name: "Airtel Money", description: "Airtel Money Mobile Money" },
    { code: "Halopesa", name: "HaloPesa", description: "Halotel HaloPesa Mobile Money" },
    { code: "Vodacom", name: "M-Pesa", description: "Vodacom M-Pesa Mobile Money" },
    { code: "Azampesa", name: "AzamPesa", description: "AzamPesa Mobile Payment" },
  ];

  for (const p of providersToSeed) {
    await prisma.paymentProvider.upsert({
      where: { code: p.code },
      update: {
        name: p.name,
        description: p.description,
        isActive: true,
      },
      create: {
        code: p.code,
        name: p.name,
        description: p.description,
        isActive: true,
      },
    });
  }

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

  // 11) Seed Default System Configs (Parcel types, conditions, and package sizes)
  const defaultConfigs = [
    {
      key: "DEFAULT_SYSTEM_FEE",
      value: "500",
      description: "Default platform transaction fee per parcel",
    },
    {
      key: "SMS_TEMPLATE_RECEIPT_SENDER",
      value: "Mzigo wako umepokelewa\n\nNamba ya Mzigo: {trackingNumber}\n\nAina ya Mzigo: {packageName}\n\nJina la Mpokeaji: {receiverName}\n\nNamba ya Siri: {otp}\n\nJina la Karani: {agentName}\n\n\nKufatilia Safari ya  Mzigo wako. \n\n{trackingUrl}",
      description: "SMS template sent to the sender when parcel is received",
    },
    {
      key: "SMS_TEMPLATE_RECEIPT_RECEIVER",
      value: "Habari {receiverName}!\n\nUmetumiwa mzigo wa {packageName}.\n\nNamba ya Mzigo: {trackingNumber}\nMtumaji: {senderName}\nSafari: {originName} - {destinationName}\nOfisi ya Kupokea: {destinationName}\n\nTafadhali fika na Namba ya Siri (OTP) kupokea mzigo wako.\n\nJina la Wakala: {agentName}\nSimu ya Wakala: {agentPhone}\n\nAsante kwa kutumia {orgName}! Kwa msaada zaidi, tupigie: {helpdesk}\n\nKufatilia Safari ya Mzigo wako: {trackingUrl}",
      description: "SMS template sent to the receiver when parcel is received",
    },
    {
      key: "SMS_TEMPLATE_DISPATCH",
      value: "Mzigo Umetumwa\n\nMpendwa {receiverName}, mzigo namba {trackingNumber} umetoka {originName} kwenda {destinationName} na gari la {carrierName}.\nMsafirishaji: {dispatcherName} Simu ya Msafirishaji {dispatcherPhone}\nNamba ya Siri (OTP): {otp}\n\nAsante kwa kutumia {orgName}! Kufatilia Safari ya Mzigo: {trackingUrl}\nKwa msaada zaidi, tupigie: {support}",
      description: "SMS template sent to the receiver when parcel is dispatched",
    },
    {
      key: "SMS_TEMPLATE_ARRIVED",
      value: "Mzigo wako umewasili.\nNamba ya Mzigo: {trackingNumber}\nJina la Mtumaji: {senderName}\nAina ya Mzigo: {packageName}\nKwajili ya usalama,OTP ya kupokea mzigo imehifadhiwa kwa mtumaji, tafadhali wasiliana na mtumaji kabla ya kuchukua mzigo wako.\nKufatilia Safari ya Mzigo: {trackingUrl}\n\nAsante kwa kutuma Mzigo kupitia TRC.",
      description: "SMS template sent to the receiver when parcel is offloaded/arrived",
    },
    {
      key: "SMS_TEMPLATE_DELIVERY_OTP",
      value: "🔐 Mizigo Secure: Your pickup OTP for #{trackingNumber} is {otp}. Do not share this code. Present it at the station to collect your parcel.",
      description: "SMS template for secure handover pickup OTP",
    },
    {
      key: "PARCEL_TYPES",
      value: JSON.stringify([
        "Document",
        "Envelope",
        "Small package",
        "Medium package",
        "Large package",
        "Fragile item",
        "Commercial Goods",
        "Cargo",
        "Perishable Goods",
        "Other"
      ]),
      description: "Available parcel classification types",
    },
    {
      key: "PARCEL_CONDITIONS",
      value: JSON.stringify([
        "Intact",
        "Minor Damage",
        "Damaged",
        "Opened/Tampered",
        "Wet",
        "Crushed",
        "Leaking",
        "Spoiled",
        "Broken",
        "Not inspected"
      ]),
      description: "Package condition status values",
    },
    {
      key: "PACKAGE_SIZES",
      value: JSON.stringify([
        "Document",
        "Small Parcel",
        "Medium Parcel",
        "Large Parcel",
        "Oversized Parcel",
        "Cargo Item",
        "Bulk Cargo"
      ]),
      description: "Available package volume/size categories",
    },
  ];

  for (const cfg of defaultConfigs) {
    const existing = await prisma.systemConfig.findFirst({
      where: { key: cfg.key, organizationId: null },
    });
    if (existing) {
      await prisma.systemConfig.update({
        where: { id: existing.id },
        data: {
          value: cfg.value,
          description: cfg.description,
        },
      });
    } else {
      await prisma.systemConfig.create({
        data: {
          key: cfg.key,
          value: cfg.value,
          description: cfg.description,
          organizationId: null,
        },
      });
    }
  }

  // 12) Create Default Service Types
  const defaultServiceTypes = [
    {
      name: "Parcel insurance",
      description: "protection against loss, damage or theft",
      basePrice: 5000,
      isActive: true,
    },
    {
      name: "Secure Packaging",
      description: "bubble wrap, secure box sealing, nylon packing, palettes",
      basePrice: 8000,
      isActive: true,
    },
    {
      name: "Special Handling",
      description: "priority placement, fragile sticker and padding",
      basePrice: 6000,
      isActive: true,
    },
  ];

  for (const s of defaultServiceTypes) {
    await prisma.serviceType.upsert({
      where: { name: s.name },
      update: {
        description: s.description,
        basePrice: s.basePrice,
        isActive: s.isActive,
      },
      create: {
        name: s.name,
        description: s.description,
        basePrice: s.basePrice,
        isActive: s.isActive,
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
