import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { logAudit } from "../lib/audit";

const router: Router = Router();

router.use(authenticate);

// GET /api/v1/platform-agents — list all agents
router.get("/", async (req: Request, res: Response) => {
  try {
    if (req.user?.role !== "SUPER_ADMIN") {
      return sendError(res, "FORBIDDEN", "Only super admins can access platform agents", 403);
    }

    const { type, kycStatus, includeInactive } = req.query;

    const where: any = {
      deletedAt: null,
    };

    if (!includeInactive || includeInactive !== "true") {
      // Don't filter out inactive ones – show all by default for management
    }

    if (type) {
      where.type = String(type).toUpperCase();
    }

    if (kycStatus) {
      where.kycStatus = String(kycStatus).toUpperCase();
    }

    const agents = await prisma.platformAgent.findMany({
      where,
      orderBy: { createdAt: "desc" },
      include: {
        _count: {
          select: { commissions: true },
        },
      },
    });

    return sendSuccess(res, agents);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// GET /api/v1/platform-agents/network — list active, approved agent offices (accessible to SUPER_ADMIN and ADMIN)
router.get("/network", async (req: Request, res: Response) => {
  try {
    if (req.user?.role !== "SUPER_ADMIN" && req.user?.role !== "ADMIN") {
      return sendError(res, "FORBIDDEN", "Access denied", 403);
    }

    const agents = await prisma.platformAgent.findMany({
      where: {
        deletedAt: null,
        isActive: true,
        kycStatus: "APPROVED",
      },
      orderBy: { name: "asc" },
    });

    return sendSuccess(res, agents);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// GET /api/v1/platform-agents/:id — get agent detail with commissions
router.get("/:id", async (req: Request, res: Response) => {
  try {
    if (req.user?.role !== "SUPER_ADMIN") {
      return sendError(res, "FORBIDDEN", "Only super admins can access platform agents", 403);
    }

    const { id } = req.params;
    const agent = await prisma.platformAgent.findFirst({
      where: { id, deletedAt: null },
      include: {
        commissions: {
          orderBy: { periodStart: "desc" },
        },
      },
    });

    if (!agent) {
      return sendError(res, "NOT_FOUND", "Platform agent not found", 404);
    }

    return sendSuccess(res, agent);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// POST /api/v1/platform-agents — create a new agent/business
router.post("/", requirePermission("organizations:create"), async (req: Request, res: Response) => {
  try {
    if (req.user?.role !== "SUPER_ADMIN") {
      return sendError(res, "FORBIDDEN", "Only super admins can create platform agents", 403);
    }

    const {
      type,
      name,
      email,
      phone,
      businessName,
      businessReg,
      address,
      commissionRate,
    } = req.body;

    if (!type || !name || !email) {
      return sendError(res, "VALIDATION_ERROR", "type, name, and email are required", 400);
    }

    if (!["INDEPENDENT", "BUSINESS"].includes(String(type).toUpperCase())) {
      return sendError(res, "VALIDATION_ERROR", "type must be INDEPENDENT or BUSINESS", 400);
    }

    if (commissionRate !== undefined) {
      const rate = Number(commissionRate);
      if (isNaN(rate) || rate < 0 || rate > 1) {
        return sendError(res, "VALIDATION_ERROR", "commissionRate must be between 0 and 1", 400);
      }
    }

    const agent = await prisma.platformAgent.create({
      data: {
        type: String(type).toUpperCase() as any,
        name: String(name).trim(),
        email: String(email).trim().toLowerCase(),
        phone: phone ? String(phone).trim() : null,
        businessName: businessName ? String(businessName).trim() : null,
        businessReg: businessReg ? String(businessReg).trim() : null,
        address: address ? String(address).trim() : null,
        commissionRate: commissionRate !== undefined ? Number(commissionRate) : null,
        kycStatus: "PENDING",
        isActive: false,
      },
    });

    await logAudit({
      userId: req.user?.id,
      action: "CREATE",
      resource: "platform_agent",
      details: { agentId: agent.id, type: agent.type },
    });

    return sendSuccess(res, agent, 201);
  } catch (error: any) {
    if (error.code === "P2002") {
      const field = error.meta?.target?.includes("email") ? "Email" : "Phone";
      return sendError(res, "CONFLICT", `${field} is already registered`, 409);
    }
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// PUT /api/v1/platform-agents/:id — update agent info, KYC status, commission rate
router.put("/:id", async (req: Request, res: Response) => {
  try {
    if (req.user?.role !== "SUPER_ADMIN") {
      return sendError(res, "FORBIDDEN", "Only super admins can update platform agents", 403);
    }

    const { id } = req.params;
    const existing = await prisma.platformAgent.findFirst({ where: { id, deletedAt: null } });
    if (!existing) {
      return sendError(res, "NOT_FOUND", "Platform agent not found", 404);
    }

    const {
      name,
      email,
      phone,
      businessName,
      businessReg,
      address,
      kycStatus,
      kycNotes,
      commissionRate,
      isActive,
    } = req.body;

    if (commissionRate !== undefined) {
      const rate = Number(commissionRate);
      if (isNaN(rate) || rate < 0 || rate > 1) {
        return sendError(res, "VALIDATION_ERROR", "commissionRate must be between 0 and 1", 400);
      }
    }

    const validKycStatuses = ["PENDING", "UNDER_REVIEW", "APPROVED", "REJECTED"];
    if (kycStatus && !validKycStatuses.includes(String(kycStatus).toUpperCase())) {
      return sendError(res, "VALIDATION_ERROR", "Invalid KYC status", 400);
    }

    const data: any = {};
    if (name !== undefined) data.name = String(name).trim();
    if (email !== undefined) data.email = String(email).trim().toLowerCase();
    if (phone !== undefined) data.phone = phone ? String(phone).trim() : null;
    if (businessName !== undefined) data.businessName = businessName ? String(businessName).trim() : null;
    if (businessReg !== undefined) data.businessReg = businessReg ? String(businessReg).trim() : null;
    if (address !== undefined) data.address = address ? String(address).trim() : null;
    if (kycNotes !== undefined) data.kycNotes = kycNotes || null;
    if (commissionRate !== undefined) data.commissionRate = Number(commissionRate);
    if (isActive !== undefined) data.isActive = Boolean(isActive);

    if (kycStatus !== undefined) {
      data.kycStatus = String(kycStatus).toUpperCase();
      // Auto set isActive when KYC is approved
      if (data.kycStatus === "APPROVED") {
        data.isActive = true;
        data.reviewedBy = req.user?.id || null;
        data.reviewedAt = new Date();
      } else if (data.kycStatus === "REJECTED") {
        data.isActive = false;
        data.reviewedBy = req.user?.id || null;
        data.reviewedAt = new Date();
      }
    }

    const agent = await prisma.platformAgent.update({ where: { id }, data });

    await logAudit({
      userId: req.user?.id,
      action: "UPDATE",
      resource: "platform_agent",
      details: { agentId: id, changes: Object.keys(data) },
    });

    return sendSuccess(res, agent);
  } catch (error: any) {
    if (error.code === "P2002") {
      const field = error.meta?.target?.includes("email") ? "Email" : "Phone";
      return sendError(res, "CONFLICT", `${field} is already registered`, 409);
    }
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// DELETE /api/v1/platform-agents/:id — soft delete
router.delete("/:id", async (req: Request, res: Response) => {
  try {
    if (req.user?.role !== "SUPER_ADMIN") {
      return sendError(res, "FORBIDDEN", "Only super admins can delete platform agents", 403);
    }

    const { id } = req.params;
    const existing = await prisma.platformAgent.findFirst({ where: { id, deletedAt: null } });
    if (!existing) {
      return sendError(res, "NOT_FOUND", "Platform agent not found", 404);
    }

    await prisma.platformAgent.update({
      where: { id },
      data: { deletedAt: new Date(), isActive: false },
    });

    await logAudit({
      userId: req.user?.id,
      action: "SOFT_DELETE",
      resource: "platform_agent",
      details: { agentId: id },
    });

    return sendSuccess(res, { deleted: true, id });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
