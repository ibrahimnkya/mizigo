import { Router, Request, Response } from "express";
import crypto from "crypto";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { logAudit } from "../lib/audit";
import { rateLimit } from "../middleware/rate-limit";
import { createServiceLogger } from "../lib/logger";

const router: Router = Router();
const paymentLogger = createServiceLogger("payments");

const PAYMENT_CALLBACK_SECRET = process.env.PAYMENT_CALLBACK_SECRET || "dev_callback_secret";

router.get("/providers", authenticate, requireTenantContext, async (_req: Request, res: Response) => {
  const providers = await prisma.paymentProvider.findMany({
    where: { deletedAt: null },
    orderBy: { name: "asc" },
  });
  return sendSuccess(res, providers);
});

router.get("/providers/active", authenticate, requireTenantContext, async (_req: Request, res: Response) => {
  const providers = await prisma.paymentProvider.findMany({
    where: { deletedAt: null, isActive: true },
    orderBy: { name: "asc" },
  });
  return sendSuccess(res, providers);
});

router.get("/providers/stats", authenticate, requireTenantContext, async (req: Request, res: Response) => {
  if (!req.user) return sendError(res, "UNAUTHORIZED", "Unauthorized", 401);
  if (!["SUPER_ADMIN", "ADMIN", "OPS"].includes(req.user.role)) {
    return sendError(res, "FORBIDDEN", "Forbidden", 403);
  }

  const providers = await prisma.paymentProvider.findMany({ where: { deletedAt: null } });
  const providerStats = await Promise.all(providers.map(async (provider) => {
    const transactions = await prisma.payment.findMany({
      where: { providerId: provider.id },
      select: { id: true, amount: true, status: true, createdAt: true },
    });

    const totalTransactions = transactions.length;
    const totalAmount = transactions.reduce((sum, tx) => sum + Number(tx.amount), 0);
    const successfulTransactions = transactions.filter((tx) => tx.status === "SUCCESS");
    const failedTransactions = transactions.filter((tx) => tx.status === "FAILED");

    return {
      provider: {
        id: provider.id,
        name: provider.name,
        code: provider.code,
        isActive: provider.isActive,
      },
      stats: {
        totalTransactions,
        totalAmount,
        successfulTransactions: successfulTransactions.length,
        successfulAmount: successfulTransactions.reduce((sum, tx) => sum + Number(tx.amount), 0),
        failedTransactions: failedTransactions.length,
        failedAmount: failedTransactions.reduce((sum, tx) => sum + Number(tx.amount), 0),
      },
    };
  }));

  return sendSuccess(res, providerStats);
});

router.get("/providers/:id", authenticate, requireTenantContext, async (req: Request, res: Response) => {
  const provider = await prisma.paymentProvider.findUnique({ where: { id: req.params.id } });
  if (!provider || provider.deletedAt) return sendError(res, "NOT_FOUND", "Payment provider not found", 404);
  return sendSuccess(res, provider);
});

router.post("/providers", authenticate, requireTenantContext, async (req: Request, res: Response) => {
  try {
    if (!req.user || !["SUPER_ADMIN", "ADMIN"].includes(req.user.role)) {
      return sendError(res, "FORBIDDEN", "Only admins can create payment providers", 403);
    }
    const { name, code, description, isActive = true } = req.body;
    if (!name || !code) return sendError(res, "VALIDATION_ERROR", "name and code are required", 400);

    const existing = await prisma.paymentProvider.findFirst({
      where: {
        OR: [{ name: { equals: String(name), mode: "insensitive" } }, { code: { equals: String(code), mode: "insensitive" } }],
      },
    });
    if (existing) return sendError(res, "CONFLICT", "Payment provider already exists", 409);

    const provider = await prisma.paymentProvider.create({
      data: { name: String(name), code: String(code), description: description || null, isActive: Boolean(isActive) },
    });

    return sendSuccess(res, provider, 201);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.put("/providers/:id", authenticate, requireTenantContext, async (req: Request, res: Response) => {
  try {
    if (!req.user || !["SUPER_ADMIN", "ADMIN"].includes(req.user.role)) {
      return sendError(res, "FORBIDDEN", "Only admins can update payment providers", 403);
    }
    const provider = await prisma.paymentProvider.findUnique({ where: { id: req.params.id } });
    if (!provider || provider.deletedAt) return sendError(res, "NOT_FOUND", "Payment provider not found", 404);

    const updated = await prisma.paymentProvider.update({
      where: { id: provider.id },
      data: {
        name: req.body.name,
        code: req.body.code,
        description: req.body.description,
        isActive: req.body.isActive,
      },
    });
    return sendSuccess(res, updated);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.delete("/providers/:id", authenticate, requireTenantContext, async (req: Request, res: Response) => {
  try {
    if (!req.user || !["SUPER_ADMIN", "ADMIN"].includes(req.user.role)) {
      return sendError(res, "FORBIDDEN", "Only admins can delete payment providers", 403);
    }
    const provider = await prisma.paymentProvider.findUnique({ where: { id: req.params.id } });
    if (!provider || provider.deletedAt) return sendError(res, "NOT_FOUND", "Payment provider not found", 404);

    const usageCount = await prisma.payment.count({ where: { providerId: provider.id } });
    if (usageCount > 0) {
      return sendError(res, "CONFLICT", `Provider is used by ${usageCount} payments; deactivate instead`, 409);
    }

    const deleted = await prisma.paymentProvider.update({
      where: { id: provider.id },
      data: { deletedAt: new Date(), isActive: false },
    });
    return sendSuccess(res, deleted);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/:id", authenticate, requireTenantContext, async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const payment = await prisma.payment.findUnique({
      where: { id },
      include: {
        cargo: {
          select: {
            id: true,
            userId: true,
            fromAddress: true,
            toAddress: true,
            amount: true,
            status: true,
          },
        },
      },
    });

    if (!payment) {
      return sendError(res, "NOT_FOUND", "Payment not found", 404);
    }

    if (
      req.user?.role !== "SUPER_ADMIN" &&
      payment.cargo?.userId &&
      req.user?.organizationId
    ) {
      const owner = await prisma.user.findUnique({
        where: { id: payment.cargo.userId },
        select: { organizationId: true },
      });

      if (owner?.organizationId !== req.user.organizationId) {
        return sendError(res, "FORBIDDEN", "Cannot access payment outside your organization", 403);
      }
    }

    return sendSuccess(res, payment);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/bulk-status", authenticate, requireTenantContext, async (req: Request, res: Response) => {
  try {
    const { paymentIds } = req.body as { paymentIds?: string[] };
    if (!Array.isArray(paymentIds) || paymentIds.length === 0) {
      return sendError(res, "VALIDATION_ERROR", "paymentIds must be a non-empty array", 400);
    }

    const payments = await prisma.payment.findMany({
      where: { id: { in: paymentIds } },
      select: {
        id: true,
        status: true,
        amount: true,
        transactionReference: true,
        paidAt: true,
        updatedAt: true,
      },
    });

    return sendSuccess(res, payments);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/callback", rateLimit({ windowMs: 60 * 1000, maxRequests: 120, keyPrefix: "payments-callback" }), async (req: Request, res: Response) => {
  try {
    paymentLogger.info("received_payment_callback", { body: req.body, requestId: req.requestId });
    const signature = req.headers["x-callback-signature"];
    if (!signature || typeof signature !== "string") {
      return sendError(res, "UNAUTHORIZED", "Missing callback signature", 401);
    }

    const rawPayload = JSON.stringify(req.body ?? {});
    const expectedSignature = crypto
      .createHmac("sha256", PAYMENT_CALLBACK_SECRET)
      .update(rawPayload)
      .digest("hex");

    if (expectedSignature !== signature) {
      return sendError(res, "UNAUTHORIZED", "Invalid callback signature", 401);
    }

    const { transactionReference, status, utilityref, transid, reference, transactionstatus, additionalProperties } = req.body as {
      transactionReference?: string;
      status?: string;
      utilityref?: string;
      transid?: string;
      reference?: string;
      transactionstatus?: string;
      additionalProperties?: { parcel_transaction_uuid?: string };
    };
    const resolvedTransactionReference = transactionReference || reference || transid;
    const resolvedStatus = status || (transactionstatus === "success" ? "SUCCESS" : transactionstatus ? "FAILED" : undefined);

    if (!resolvedTransactionReference || !resolvedStatus) {
      return sendError(res, "VALIDATION_ERROR", "transaction reference and status are required", 400);
    }

    const payment = await prisma.payment.findFirst({
      where: { OR: [{ transactionReference: resolvedTransactionReference }, { id: additionalProperties?.parcel_transaction_uuid }] },
      include: { cargo: true },
    });

    if (!payment) {
      return sendError(res, "NOT_FOUND", "Payment not found for callback", 404);
    }

    if (payment.status === resolvedStatus) {
      return sendSuccess(res, { message: "Callback already processed", paymentId: payment.id });
    }

    const updatedPayment = await prisma.payment.update({
      where: { id: payment.id },
      data: {
        organizationId: payment.organizationId ?? payment.cargo?.organizationId ?? null,
        transactionReference: resolvedTransactionReference,
        status: resolvedStatus,
        paidAt: resolvedStatus === "SUCCESS" ? new Date() : payment.paidAt,
      },
    });

    if (payment.cargo) {
      const metadata =
        payment.cargo.additionalServices && typeof payment.cargo.additionalServices === "object"
          ? (payment.cargo.additionalServices as Record<string, unknown>)
          : {};

      await prisma.cargoRequest.update({
        where: { id: payment.cargo.id },
        data: {
          additionalServices: {
            ...metadata,
            paymentStatus: resolvedStatus === "SUCCESS" ? "PAID" : "FAILED",
            callbackPayload: req.body,
            utilityref,
          },
          status: resolvedStatus === "SUCCESS" ? "RECEIVED" : payment.cargo.status,
        },
      });
    }

    await logAudit({
      action: "CALLBACK",
      resource: "payment",
      details: { paymentId: payment.id, transactionReference: resolvedTransactionReference, status: resolvedStatus },
    });

    paymentLogger.info("processed_payment_callback", {
      paymentId: payment.id,
      transactionReference: resolvedTransactionReference,
      status: resolvedStatus,
    });
    return sendSuccess(res, updatedPayment);
  } catch (error: any) {
    paymentLogger.error("payment_callback_error", { error: error.message });
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
