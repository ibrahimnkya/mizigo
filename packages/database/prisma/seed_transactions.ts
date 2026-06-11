import { PrismaClient, ParcelStatus } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  console.log("Starting transaction seeding...");

  // 1. Get existing records
  const stations = await prisma.station.findMany();
  if (stations.length === 0) {
    console.error("No stations found. Please seed the database first.");
    return;
  }

  const users = await prisma.user.findMany({
    include: { role: true }
  });
  if (users.length === 0) {
    console.error("No users found. Please seed the database first.");
    return;
  }

  const organizations = await prisma.organization.findMany();
  if (organizations.length === 0) {
    console.error("No organizations found. Please seed the database first.");
    return;
  }

  const orgId = organizations[0].id;
  // Find a clerk/operator or admin to associate with
  const adminUser = users.find(u => u.role?.name === "SUPER_ADMIN" || u.role?.name === "ADMIN") || users[0];
  const clerkUser = users.find(u => u.role?.name === "CLERK" || u.role?.name === "OPERATOR") || users[0];

  console.log(`Using admin user: ${adminUser.email}, clerk user: ${clerkUser.email}, org: ${organizations[0].name}`);

  // Clean up existing parcels and payments
  await prisma.payment.deleteMany({});
  await prisma.parcelTracking.deleteMany({});
  await prisma.parcel.deleteMany({});
  console.log("Cleared existing payments and parcels.");

  // 2. Generate parcels and payments for the last 60 days
  const paymentMethods = ["MOBILE_MONEY", "CARD", "CASH", "BANK_TRANSFER"];
  const statuses: ParcelStatus[] = ["DELIVERED", "IN_TRANSIT", "RECEIVED", "PENDING", "DELAYED"];

  let totalRevenue = 0;
  let parcelCount = 0;
  const now = new Date();

  for (let i = 0; i < 150; i++) {
    // Generate a date between 60 days ago and now
    const daysAgo = Math.floor(Math.random() * 60);
    const date = new Date(now.getTime() - daysAgo * 24 * 60 * 60 * 1000);

    const origin = stations[Math.floor(Math.random() * stations.length)];
    let dest = stations[Math.floor(Math.random() * stations.length)];
    while (dest.id === origin.id) {
      dest = stations[Math.floor(Math.random() * stations.length)];
    }

    const weight = Math.random() * 25 + 0.5; // 0.5kg to 25.5kg
    // Standard rate calculation TSh 5,000 base + TSh 1,000 per kg
    const amount = Math.round(5000 + weight * 1000);
    const commission = Math.round(amount * 0.1); // 10% commission

    const status = statuses[Math.floor(Math.random() * statuses.length)];

    const trackingId = `MZG${date.getFullYear().toString().slice(-2)}${(date.getMonth() + 1).toString().padStart(2, "0")}${date.getDate().toString().padStart(2, "0")}${Math.floor(1000 + Math.random() * 9000)}`;

    const parcel = await prisma.parcel.create({
      data: {
        id: trackingId,
        user: { connect: { id: clerkUser.id } },
        origin: { connect: { id: origin.id } },
        destination: { connect: { id: dest.id } },
        status: status,
        weight: weight,
        amount: amount,
        serviceType: "STANDARD",
        parcelType: "BOX",
        parcelSize: "MEDIUM",
        pickupType: "STATION_TO_STATION",
        receiverName: `Receiver ${i + 1}`,
        receiverPhone: `+2556${Math.floor(10000000 + Math.random() * 90000000)}`,
        fromAddress: origin.name,
        toAddress: dest.name,
        createdAt: date,
        updatedAt: date,
      }
    });

    // Create payment
    const paymentStatus = Math.random() > 0.15 ? "SUCCESS" : "PENDING";
    const paymentMethod = paymentMethods[Math.floor(Math.random() * paymentMethods.length)];

    await prisma.payment.create({
      data: {
        parcelId: parcel.id,
        userId: clerkUser.id,
        approvedById: adminUser.id,
        amount: amount,
        status: paymentStatus,
        transactionReference: `TX-${Math.random().toString(36).substring(2, 11).toUpperCase()}`,
        paymentMethod: paymentMethod,
        commission: commission,
        netAmount: amount - commission,
        systemFee: 500,
        organizationId: orgId,
        createdAt: date,
        updatedAt: date,
        paidAt: paymentStatus === "SUCCESS" ? date : null,
      }
    });

    parcelCount++;
    if (paymentStatus === "SUCCESS") {
      totalRevenue += amount;
    }
  }

  console.log(`Seeding finished successfully!`);
  console.log(`Seeded ${parcelCount} parcels and payments.`);
  console.log(`Total Success Revenue generated: TSh ${totalRevenue.toLocaleString()}`);
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
