import { prisma } from "@repo/database";
import { createServiceLogger } from "./logger";

const logger = createServiceLogger("escalation");

export interface EscalationStatus {
  level: number;
  reason: string | null;
  timestamp: Date;
}

export const checkEscalation = async (): Promise<EscalationStatus> => {
  try {
    // 1. Integration Failures Check
    const oneHourAgo = new Date(Date.now() - 60 * 60 * 1000);
    const smsFailures = await prisma.auditLog.count({
      where: {
        action: "SMS_STATUS",
        createdAt: { gte: oneHourAgo },
        details: { path: ["status"], equals: "FAILED" },
      },
    });

    if (smsFailures > 5) {
      return {
        level: 2,
        reason: "Multiple SMS Integration Failures in last hour",
        timestamp: new Date(),
      };
    }

    // 2. Backup Miss Check
    // Mock check for now, can be linked to a real backup log
    const lastSuccessfulBackup = new Date(Date.now() - 26 * 60 * 60 * 1000); // Mock 26 hours ago
    const hoursSinceBackup =
      (Date.now() - lastSuccessfulBackup.getTime()) / (1000 * 60 * 60);

    if (hoursSinceBackup > 25) {
      return {
        level: 3,
        reason: "Database backup missed (last > 25h)",
        timestamp: new Date(),
      };
    }

    return { level: 0, reason: null, timestamp: new Date() };
  } catch (error) {
    logger.error("escalation_check_failed", { error });
    return { level: 0, reason: null, timestamp: new Date() };
  }
};
