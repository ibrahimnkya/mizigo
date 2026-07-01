import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { fetchSgrTariffs } from "../lib/sgr-client";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

router.post(
  "/",
  requirePermission("pricing:create"),
  async (req: Request, res: Response) => {
    try {
      const { name, type, value, condition, isActive = true, organizationId } = req.body;
      if (!name || !type || value === undefined) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "name, type and value are required",
          400,
        );
      }

      const targetOrganizationId =
        req.user?.role === "SUPER_ADMIN"
          ? (organizationId === "null" || organizationId === "" ? null : organizationId)
          : req.user?.organizationId || null;

      const rule = await prisma.pricingRule.create({
        data: {
          name,
          type,
          value: Number(value),
          condition: condition || null,
          isActive: Boolean(isActive),
          organizationId: targetOrganizationId,
        },
      });

      return sendSuccess(res, rule, 201);
    } catch (error: any) {
      if (error.code === "P2002") {
        return sendError(res, "CONFLICT", "Pricing rule already exists", 409);
      }
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.put(
  "/:id",
  requirePermission("pricing:update"),
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      const { name, type, value, condition, isActive, organizationId } = req.body;

      const existing = await prisma.pricingRule.findUnique({ where: { id } });
      if (!existing) {
        return sendError(res, "NOT_FOUND", "Pricing rule not found", 404);
      }

      if (req.user?.role !== "SUPER_ADMIN" && existing.organizationId !== req.user?.organizationId) {
        return sendError(res, "FORBIDDEN", "Cannot update pricing rule outside your organization", 403);
      }

      const rule = await prisma.pricingRule.update({
        where: { id },
        data: {
          name: name !== undefined ? name : undefined,
          type: type !== undefined ? type : undefined,
          value: value === undefined ? undefined : Number(value),
          condition: condition !== undefined ? condition : undefined,
          isActive: isActive !== undefined ? Boolean(isActive) : undefined,
          organizationId: req.user?.role === "SUPER_ADMIN"
            ? (organizationId === "null" || organizationId === "" ? null : organizationId)
            : undefined,
        },
      });
      return sendSuccess(res, rule);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.get("/", async (req: Request, res: Response) => {
  try {
    const organizationId = req.query.organizationId as string | undefined;

    // 1) Sync tariffs from TRC SGR API
    try {
      const trcOrg = await prisma.organization.findUnique({
        where: { name: "Tanzania Railways Corporation" },
      });
      const trcOrgId = trcOrg?.id ?? null;

      const sgrTariffs = await fetchSgrTariffs();
      for (const t of sgrTariffs) {
        await prisma.pricingRule.upsert({
          where: { name: t.name },
          update: {
            type: "SGR_TARIFF",
            value: t.minimumCharge,
            organizationId: trcOrgId,
            condition: JSON.stringify({
              description: t.description,
              distanceRate: t.distanceRate,
              weightRate: t.weightRate,
              parcelCategory: t.parcelCategory,
              sgrId: t.id,
            }),
            isActive: true,
          },
          create: {
            name: t.name,
            type: "SGR_TARIFF",
            value: t.minimumCharge,
            organizationId: trcOrgId,
            condition: JSON.stringify({
              description: t.description,
              distanceRate: t.distanceRate,
              weightRate: t.weightRate,
              parcelCategory: t.parcelCategory,
              sgrId: t.id,
            }),
            isActive: true,
          },
        });
      }
    } catch (sgrErr: any) {
      console.error("[Pricing Sync] SGR tariff sync failed:", sgrErr.message);
    }

    // 2) Return pricing rules, scoping by organizationId if supplied
    const where: any = { deletedAt: null };
    if (req.user?.role !== "SUPER_ADMIN") {
      where.OR = [
        { organizationId: null },
        { organizationId: req.user?.organizationId || "" },
      ];
    } else if (organizationId !== undefined) {
      where.organizationId = organizationId === "null" || organizationId === "" ? null : organizationId;
    }

    const rules = await prisma.pricingRule.findMany({
      where,
      orderBy: { createdAt: "desc" },
    });

    const enriched = rules.map((r) => {
      if (r.type === "SGR_TARIFF" && r.condition) {
        try {
          const meta = JSON.parse(r.condition);
          return {
            ...r,
            minimumCharge: r.value,
            distanceRate: meta.distanceRate,
            weightRate: meta.weightRate,
            description: meta.description,
            parcelCategory: meta.parcelCategory,
            sgrId: meta.sgrId,
          };
        } catch {
          return r;
        }
      }
      return r;
    });

    return sendSuccess(res, enriched);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.delete(
  "/:id",
  requirePermission("pricing:delete"),
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      const rule = await prisma.pricingRule.update({
        where: { id },
        data: {
          deletedAt: new Date(),
          isActive: false,
        },
      });
      return sendSuccess(res, rule);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.get("/:id/transactions", async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const rule = await prisma.pricingRule.findUnique({
      where: { id },
    });

    if (!rule) {
      return sendError(res, "NOT_FOUND", "Pricing rule not found", 404);
    }

    const where: any = { deletedAt: null };
    if (req.user?.role !== "SUPER_ADMIN") {
      where.organizationId = req.user?.organizationId ?? null;
    }

    const payments = await prisma.payment.findMany({
      where,
      include: {
        parcel: true,
      },
      orderBy: { createdAt: "desc" },
    });

    const matchedPayments = payments.filter((payment) => {
      const parcel = payment.parcel;
      if (!parcel) return false;

      if (rule.type === "SGR_TARIFF") {
        return (
          parcel.serviceType?.toLowerCase() === rule.name.toLowerCase() ||
          parcel.pickupType === "SGR_STATION"
        );
      }

      if (!rule.condition) {
        return parcel.pickupType !== "SGR_STATION";
      }

      const conditions = rule.condition.split("&");
      for (const cond of conditions) {
        const [key, val] = cond.split("=");
        if (key === "urgency" && parcel.urgency !== val) return false;
        if (key === "parcel_type" && parcel.parcelType !== val) return false;
        if (key === "package_size" && parcel.parcelSize !== val) return false;
        if (key === "condition" && parcel.condition !== val) return false;
      }

      return true;
    });

    const transactions = matchedPayments.map((p) => ({
      id: p.id,
      parcelId: p.parcelId,
      trackingNumber: p.parcel?.trackingNumber,
      amount: p.amount,
      status: p.status,
      createdAt: p.createdAt,
      receiverName: p.parcel?.receiverName,
      receiverPhone: p.parcel?.receiverPhone,
      senderName: (p.parcel?.additionalServices as any)?.senderName || "Sender",
    }));

    return sendSuccess(res, transactions);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;

