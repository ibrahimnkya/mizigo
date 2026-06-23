import { PrismaClient } from "@repo/database";

const prisma = new PrismaClient();

async function main() {
  const stations = await prisma.station.findMany({
    orderBy: { name: "asc" },
  });

  console.log(`Total stations: ${stations.length}`);
  stations.forEach(s => {
    console.log(`- ID: ${s.id} | Code: ${s.code} | Name: ${s.name} | Active: ${s.isActive}`);
  });

  await prisma.$disconnect();
}

main().catch(async e => {
  console.error(e);
  await prisma.$disconnect();
});
