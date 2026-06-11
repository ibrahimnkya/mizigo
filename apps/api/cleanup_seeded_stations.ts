/**
 * Cleanup script: remove fake seeded stations that don't come from TRC SGR.
 * SGR station IDs use ULID format (26 chars, uppercase).
 * Old seeded stations use cuid format (starts with 'c', 25 chars).
 */
import { PrismaClient } from "@repo/database";

const prisma = new PrismaClient();

async function main() {
  // The fake seeded stations have cuid-style IDs (start with 'c')
  // Real SGR stations have ULID-style IDs (e.g. 01KPWEWYAC...)
  const fakeStations = await prisma.station.findMany({
    where: {
      id: { startsWith: "c" },
    },
  });

  console.log(`Found ${fakeStations.length} seeded (non-SGR) stations:`);
  fakeStations.forEach(s => console.log(`  - [${s.code}] ${s.name}  (id: ${s.id})`));

  if (fakeStations.length === 0) {
    console.log("Nothing to delete.");
    await prisma.$disconnect();
    return;
  }

  const ids = fakeStations.map(s => s.id);
  const result = await prisma.station.deleteMany({ where: { id: { in: ids } } });
  console.log(`\n✅ Deleted ${result.count} seeded stations.`);

  const remaining = await prisma.station.findMany({ orderBy: { name: "asc" } });
  console.log(`\nRemaining stations (${remaining.length}):`);
  remaining.forEach(s => console.log(`  - [${s.code}] ${s.name}`));

  await prisma.$disconnect();
}

main().catch(async e => {
  console.error(e);
  await prisma.$disconnect();
  process.exit(1);
});
