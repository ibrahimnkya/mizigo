import { PrismaClient } from "@repo/database";
const prisma = new PrismaClient();
async function main() {
  const stations = await prisma.station.findMany({ orderBy: { name: "asc" } });
  console.log(`Stations in DB (${stations.length}):`);
  stations.forEach(s => console.log(`  - [${s.code}] ${s.name} (id: ${s.id}, active: ${s.isActive})`));
  await prisma.$disconnect();
}
main();
