const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const REAL_SGR_STATION_IDS = [
  "01KPWEWYACW1NRAFBTTGFRSKYS", // Dar es Salaam
  "01KPWEWYAH1EWYZA9A87M6JVHN", // Pugu
  "01KPWEWYAMDJWDA4V46CYERGK0", // Soga
  "01KPWEWYAQ78HT4H60XPXPM199", // Ruvu
  "01KPWEWYATH95AFXQTNXAPHK0H", // Ngerengere
  "01KPWEWYAXQKQE805RXDFP5327", // Morogoro
  "01KPWEWYB0DXCZSXJHPJJ4NEJX", // Mkata
  "01KPWEWYB3MBYH1ATFDHT5C9QA", // Kilosa
  "01KPWEWYB64BN465AYCY0ANFF8", // Kidete
  "01KPWEWYB8HQWA38MK5VMY1S7B", // Gulwe
  "01KPWEWYBBNAD6DQYCXJ7CBS22", // Igandu
  "01KPWEWYBDHMSDJKHNQYKJBV4M", // Dodoma
];

async function main() {
  try {
    const fakeStations = await prisma.station.findMany({
      where: {
        id: {
          notIn: REAL_SGR_STATION_IDS,
        },
      },
    });

    console.log(`Found ${fakeStations.length} non-SGR stations in database:`);
    fakeStations.forEach((s) =>
      console.log(`  - [${s.code}] ${s.name} (id: ${s.id})`)
    );

    if (fakeStations.length === 0) {
      console.log("No non-SGR stations to delete.");
      await prisma.$disconnect();
      return;
    }

    const ids = fakeStations.map((s) => s.id);

    console.log("\nNullifying references to non-SGR stations...");

    // 1) Nullify User.stationId
    const updatedUsers = await prisma.user.updateMany({
      where: { stationId: { in: ids } },
      data: { stationId: null },
    });
    console.log(`- Nullified stationId for ${updatedUsers.count} users.`);

    // 2) Nullify Parcel.originId
    const updatedOriginParcels = await prisma.parcel.updateMany({
      where: { originId: { in: ids } },
      data: { originId: null },
    });
    console.log(`- Nullified originId for ${updatedOriginParcels.count} parcels.`);

    // 3) Nullify Parcel.destinationId
    const updatedDestParcels = await prisma.parcel.updateMany({
      where: { destinationId: { in: ids } },
      data: { destinationId: null },
    });
    console.log(`- Nullified destinationId for ${updatedDestParcels.count} parcels.`);

    console.log("\nDeleting non-SGR stations from database...");
    const result = await prisma.station.deleteMany({
      where: { id: { in: ids } },
    });
    console.log(`✅ Deleted ${result.count} non-SGR stations.`);

    const remaining = await prisma.station.findMany({ orderBy: { name: "asc" } });
    console.log(`\nRemaining stations (${remaining.length}):`);
    remaining.forEach((s) => console.log(`  - [${s.code}] ${s.name}`));

  } catch (err) {
    console.error("Error during cleanup:", err);
  } finally {
    await prisma.$disconnect();
  }
}

main();
