import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  console.log("Cleaning up seeded transaction and parcel data...");

  await prisma.$transaction([
    prisma.payment.deleteMany({}),
    prisma.parcelTracking.deleteMany({}),
    prisma.parcel.deleteMany({}),
  ]);

  console.log("✅ Successfully removed all payments, parcel tracking logs, and parcels. Database is now clean.");
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
