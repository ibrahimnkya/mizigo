import { prisma } from "@repo/database";

async function inspectConfig() {
  console.log("Checking SMS gateway integrations in the database...");
  try {
    const integrations = await prisma.integration.findMany({
      where: { type: "SMS_GATEWAY" },
    });
    console.log("Integrations found:", integrations.length);
    console.log(JSON.stringify(integrations, null, 2));
  } catch (err) {
    console.error("Failed to query integrations:", err);
  } finally {
    await prisma.$disconnect();
  }
}

inspectConfig();
