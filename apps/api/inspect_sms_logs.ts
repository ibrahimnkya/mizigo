import { prisma } from "@repo/database";

async function inspectLogs() {
  console.log("Retrieving the last 15 SMS status logs from AuditLog...");
  try {
    const logs = await prisma.auditLog.findMany({
      where: { action: "SMS_STATUS" },
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
