import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate } from "../middleware/auth";
import { logAudit } from "../lib/audit";

const router: Router = Router();

router.use(authenticate);

// GET /api/v1/agent-commissions?agentId=... — list commissions (optionally for a specific agent)
router.get("/", async (req: Request, res: Response) => {
  try {
    if (req.user?.role !== "SUPER_ADMIN") {
      return sendError(res, "FORBIDDEN", "Only super admins can access agent commissions", 403);
    }

    const { agentId } = req.query;
    const where: any = {};

    if (agentId) {
      where.agentId = String(agentId);
    }

    const commissions = await prisma.agentCommission.findMany({
      where,
      orderBy: { periodStart: "desc" },
      include: {
        agent: {
          select: { id: true, name: true, type: true, email: true, businessName: true },
        },
      },
    });

    return sendSuccess(res, commissions);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// GET /api/v1/agent-commissions/summary — aggregate stats across all agents
router.get("/summary", async (req: Request, res: Response) => {
  try {
    if (req.user?.role !== "SUPER_ADMIN") {
      return sendError(res, "FORBIDDEN", "Only super admins can access commission summary", 403);
    }

    const [totalRecords, totalDue, totalCollected, pendingCount] = await Promise.all([
      prisma.agentCommission.count(),
      prisma.agentCommission.aggregate({ _sum: { commissionDue: true } }),
      prisma.agentCommission.aggregate({
        _sum: { commissionDue: true },
        where: { collectedAt: { not: null } },
      }),
      prisma.agentCommission.count({ where: { collectedAt: null } }),
    ]);

    return sendSuccess(res, {
      totalRecords,
      totalDue: totalDue._sum.commissionDue || 0,
      totalCollected: totalCollected._sum.commissionDue || 0,
      pendingCount,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// POST /api/v1/agent-commissions — create a commission billing period
router.post("/", async (req: Request, res: Response) => {
  try {
    if (req.user?.role !== "SUPER_ADMIN") {
      return sendError(res, "FORBIDDEN", "Only super admins can create commissions", 403);
    }

    const { agentId, periodStart, periodEnd, grossRevenue, notes } = req.body;

    if (!agentId || !periodStart || !periodEnd || grossRevenue === undefined) {
      return sendError(
        res,
        "VALIDATION_ERROR",
        "agentId, periodStart, periodEnd, and grossRevenue are required",
        400
      );
    }

    const agent = await prisma.platformAgent.findFirst({
      where: { id: String(agentId), deletedAt: null },
    });

    if (!agent) {
      return sendError(res, "NOT_FOUND", "Platform agent not found", 404);
    }

    if (!agent.commissionRate) {
      return sendError(
        res,
        "VALIDATION_ERROR",
        "Agent does not have a commission rate set. Please set it first.",
        400
      );
    }

    const gross = Number(grossRevenue);
    if (isNaN(gross) || gross < 0) {
      return sendError(res, "VALIDATION_ERROR", "grossRevenue must be a positive number", 400);
    }

    const commissionDue = gross * agent.commissionRate;

    const commission = await prisma.agentCommission.create({
      data: {
        agentId: String(agentId),
        periodStart: new Date(periodStart),
        periodEnd: new Date(periodEnd),
        grossRevenue: gross,
        commissionRate: agent.commissionRate,
        commissionDue,
        notes: notes ? String(notes).trim() : null,
      },
      include: {
        agent: {
          select: { id: true, name: true, type: true, email: true },
        },
      },
    });

    await logAudit({
      userId: req.user?.id,
      action: "CREATE",
      resource: "agent_commission",
      details: { commissionId: commission.id, agentId, commissionDue },
    });

    return sendSuccess(res, commission, 201);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// PUT /api/v1/agent-commissions/:id/collect — mark a commission period as collected
router.put("/:id/collect", async (req: Request, res: Response) => {
  try {
    if (req.user?.role !== "SUPER_ADMIN") {
      return sendError(res, "FORBIDDEN", "Only super admins can collect commissions", 403);
    }

    const { id } = req.params;
    const existing = await prisma.agentCommission.findUnique({ where: { id } });

    if (!existing) {
      return sendError(res, "NOT_FOUND", "Commission record not found", 404);
    }

    if (existing.collectedAt) {
      return sendError(res, "CONFLICT", "Commission has already been collected", 409);
    }

    const commission = await prisma.agentCommission.update({
      where: { id },
      data: {
        collectedAt: new Date(),
        notes: req.body.notes ? String(req.body.notes).trim() : existing.notes,
      },
      include: {
        agent: {
          select: { id: true, name: true, type: true, email: true },
        },
      },
    });

    await logAudit({
      userId: req.user?.id,
      action: "COLLECT",
      resource: "agent_commission",
      details: { commissionId: id, agentId: existing.agentId, amount: existing.commissionDue },
    });

    return sendSuccess(res, commission);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// DELETE /api/v1/agent-commissions/:id — delete a commission record
router.delete("/:id", async (req: Request, res: Response) => {
  try {
    if (req.user?.role !== "SUPER_ADMIN") {
      return sendError(res, "FORBIDDEN", "Only super admins can delete commissions", 403);
    }

    const { id } = req.params;
    const existing = await prisma.agentCommission.findUnique({ where: { id } });

    if (!existing) {
      return sendError(res, "NOT_FOUND", "Commission record not found", 404);
    }

    await prisma.agentCommission.delete({ where: { id } });

    return sendSuccess(res, { deleted: true, id });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
