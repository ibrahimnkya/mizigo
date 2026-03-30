import { Router, Request, Response } from "express";
import crypto from "crypto";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { logAudit } from "../lib/audit";
import { rateLimit } from "../middleware/rate-limit";

const router: Router = Router();

const PAYMENT_CALLBACK_SECRET = process.env.PAYMENT_CALLBACK_SECRET || "dev_callback_secret";

router.get("/providers", authenticate, requireTenantContext, async (_req: Request, res: Response) => {
  return sendSuccess(res, [
    { code: "M_PESA", name: "M-Pesa", active: true },
    { code: "AIRTEL_MONEY", name: "Airtel Money", active: true },
    { code: "TIGO_PESA", name: "Tigo Pesa", active: true },
    { code: "CARD", name: "Card", active: false },
  ]);
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

    const { transactionReference, status } = req.body as {
      transactionReference?: string;
      status?: string;
    };

    if (!transactionReference || !status) {
      return sendError(res, "VALIDATION_ERROR", "transactionReference and status are required", 400);
    }

    const payment = await prisma.payment.findFirst({
      where: { transactionReference },
      include: { cargo: true },
    });

    if (!payment) {
      return sendError(res, "NOT_FOUND", "Payment not found for callback", 404);
    }

    if (payment.status === status) {
      return sendSuccess(res, { message: "Callback already processed", paymentId: payment.id });
    }

    const updatedPayment = await prisma.payment.update({
      where: { id: payment.id },
      data: {
        status,
        paidAt: status === "SUCCESS" ? new Date() : payment.paidAt,
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
            paymentStatus: status === "SUCCESS" ? "PAID" : "FAILED",
          },
          status: status === "SUCCESS" ? "RECEIVED" : payment.cargo.status,
        },
      });
    }

    await logAudit({
      action: "CALLBACK",
      resource: "payment",
      details: { paymentId: payment.id, transactionReference, status },
    });

    return sendSuccess(res, updatedPayment);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
