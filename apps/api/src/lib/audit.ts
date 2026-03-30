import { prisma } from "@repo/database";

type AuditInput = {
  userId?: string | null;
  action: string;
  resource: string;
  details?: Record<string, unknown>;
};

export const logAudit = async ({ userId, action, resource, details }: AuditInput) => {
  await prisma.auditLog.create({
    data: {
      userId: userId ?? null,
      action,
      resource,
      details: details ?? {},
    },
  });
};
