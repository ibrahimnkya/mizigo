import { prisma } from "@repo/database";

async function inspectLogs() {
  console.log("Retrieving the last 15 audit logs...");
  try {
    const logs = await prisma.auditLog.findMany({
      orderBy: { createdAt: "desc" },
      take: 15,
    });
    console.log("Logs found:", logs.length);
    console.log(JSON.stringify(logs, null, 2));
  } catch (err) {
    console.error("Failed to query AuditLog:", err);
  } finally {
    await prisma.$disconnect();
  }
}

inspectLogs();
