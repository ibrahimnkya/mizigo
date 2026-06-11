import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate } from "../middleware/auth";
import {
  fetchExternalProviders,
  calculatePaymentSplit,
  ensurePlatformWallet,
  ensureOrganizationWallet,
  initiatePushPayment,
  verifyCallbackSignature,
} from "../lib/payment-gateway";
import { createServiceLogger } from "../lib/logger";

const logger = createServiceLogger("payments");
const router: Router = Router();

export const getCallbackUrl = () => {
  const host = process.env.PUBLIC_URL || "https://api.mizigo.co.tz";
  return `${host}/api/v1/payments/callback`;
};

/**
 * GET /api/v1/payments
 * Returns the list of payments for the current organization or all if SUPER_ADMIN.
 */
router.get("/", authenticate, async (req: Request, res: Response) => {
  try {
    const { status, stationId } = req.query;
    const where: any = { deletedAt: null };
    if (req.user?.role !== "SUPER_ADMIN") {
      where.organizationId = req.user?.organizationId ?? null;
    }
    if (status) {
      where.status = String(status);
    }
    if (stationId) {
      where.parcel = {
        OR: [
          { originId: String(stationId) },
          { fromAddress: String(stationId) }
        ]
      };
    }
    const payments = await prisma.payment.findMany({
      where,
      orderBy: { createdAt: "desc" },
      include: {
        parcel: {
          select: {
            id: true,
            trackingNumber: true,
            receiverName: true,
            receiverPhone: true,
            serviceType: true,
            origin: {
              select: {
                id: true,
                name: true,
                code: true,
              }
            }
          },
        },
      },
    });
    return sendSuccess(res, payments);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

/**
 * GET /api/v1/payments/providers
 * Returns the list of active payment providers from the external gateway.
 */
router.get("/providers", authenticate, async (req: Request, res: Response) => {
  try {
    const providers = await fetchExternalProviders();
    return sendSuccess(res, providers);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

/**
 * GET /api/v1/payments/wallet/balance
 * Returns the current balance for the organization's wallet.
 */
router.get(
  "/wallet/balance",
  authenticate,
  async (req: Request, res: Response) => {
    try {
      if (!req.user?.organizationId) {
        if (req.user?.role !== "SUPER_ADMIN") {
          return sendError(
            res,
            "FORBIDDEN",
            "Organization context missing",
            403,
          );
        }

        const platformWallet = await ensurePlatformWallet();
        return sendSuccess(res, {
          type: "PLATFORM",
          balance: platformWallet.balance,
        });
      }

      const wallet = await ensureOrganizationWallet(req.user.organizationId);
      return sendSuccess(res, {
        type: "ORGANIZATION",
        balance: wallet.balance,
      });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

/**
 * POST /api/v1/payments/initiate-push
 * Triggers a mobile push payment request.
 */
router.post(
  "/initiate-push",
  authenticate,
  async (req: Request, res: Response) => {
    try {
      const { parcelId, paymentChannel, phoneNumber } = req.body;

      if (!parcelId || !paymentChannel || !phoneNumber) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "parcelId, paymentChannel, and phoneNumber are required",
          400,
        );
      }

      const payment = await (prisma as any).payment.findUnique({
        where: { parcelId },
        include: { parcel: true },
      });

      if (!payment) {
        return sendError(
          res,
          "NOT_FOUND",
          "Payment record for this parcel not found",
          404,
        );
      }

      const result = await initiatePushPayment({
        paymentChannel,
        phoneNumber,
        amount: payment.amount,
        reference: parcelId,
        callbackUrl: getCallbackUrl(),
        additionalData: {
          paymentId: payment.id,
          organizationId: payment.parcel.organizationId,
        },
      });

      // Update payment with provider info
      await (prisma as any).payment.update({
        where: { id: payment.id },
        data: {
          paymentMethod: paymentChannel,
          updatedAt: new Date(),
        },
      });

      return sendSuccess(res, {
        message: "Push payment initiated",
        transactionId: result.transaction_id,
        status: true,
      });
    } catch (error: any) {
      logger.error("push_initiation_failed", { error: error.message });
      return sendError(res, "PAYMENT_GATEWAY_ERROR", error.message, 502);
    }
  },
);

/**
 * POST /api/v1/payments/callback
 * Public endpoint to receive payment status updates from external gateways.
 */
router.post("/callback", async (req: Request, res: Response) => {
  try {
    const { parcelId, transactionId, status, amount } = req.body;

    if (!parcelId || !status) {
      return sendError(
        res,
        "VALIDATION_ERROR",
        "parcelId and status are required",
        400,
      );
    }

    logger.info("received_payment_callback", { parcelId, status, amount });

    const payment = await (prisma as any).payment.findUnique({
      where: { parcelId },
      include: {
        parcel: {
          select: { organizationId: true },
        },
      },
    });

    if (!payment) {
      return sendError(res, "NOT_FOUND", "Payment record not found", 404);
    }

    // 1. Idempotency Guard: Ignore if already processed
    if (payment.status === "SUCCESS") {
      logger.info("payment_already_processed_ignoring", {
        parcelId,
        transactionId,
      });
      return sendSuccess(res, {
        message: "Payment already successfully processed",
        alreadyCompleted: true,
      });
    }

    // 2. Cryptographic Security: Verify Signature
    const signature = req.headers["x-mzg-signature"] as string;
    const isValid = await verifyCallbackSignature(req.body, signature);
    if (!isValid) {
      logger.warn("unauthorized_payment_callback_signature_mismatch", {
        parcelId,
        transactionId,
      });
      return sendError(
        res,
        "UNAUTHORIZED",
        "Invalid callback signature header",
        401,
      );
    }

    if (status !== "success" && status !== "PAID") {
      await (prisma as any).payment.update({
        where: { id: payment.id },
        data: { status: "FAILED", updatedAt: new Date() },
      });
      return sendSuccess(res, { message: "Payment failed marked" });
    }

    // Process successful payment
    const grossAmount = Number(amount || payment.amount);
    const split = await calculatePaymentSplit(
      payment.parcel?.organizationId || null,
      grossAmount,
    );

    await (prisma as any).$transaction(async (tx: any) => {
      const platformWallet = await ensurePlatformWallet(tx);
      const orgWallet = payment.parcel?.organizationId
        ? await ensureOrganizationWallet(payment.parcel.organizationId, tx)
        : null;

      // 1. Update Payment record with split details
      await tx.payment.update({
        where: { id: payment.id },
        data: {
          status: "SUCCESS",
          paidAt: new Date(),
          transactionReference: transactionId,
          systemFee: split.systemFee,
          commission: split.commission,
          netAmount: split.netAmount,
          updatedAt: new Date(),
        },
      });

      // 2. Update Platform Wallet (Fees + Commission)
      await tx.wallet.update({
        where: { id: platformWallet.id },
        data: {
          balance: { increment: split.systemFee + split.commission },
        },
      });

      // 3. Record Platform Transaction
      await tx.walletTransaction.create({
        data: {
          walletId: platformWallet.id,
          amount: split.systemFee + split.commission,
          type: "CREDIT",
          description: `Platform earnings from Parcel ${parcelId}`,
          paymentId: payment.id,
        },
      });

      // 4. Update Organization Wallet (Net Amount)
      if (orgWallet) {
        await tx.wallet.update({
          where: { id: orgWallet.id },
          data: {
            balance: { increment: split.netAmount },
          },
        });

        // 5. Record Org Transaction
        await tx.walletTransaction.create({
          data: {
            walletId: orgWallet.id,
            amount: split.netAmount,
            type: "CREDIT",
            description: `Payment received for Parcel ${parcelId}`,
            paymentId: payment.id,
          },
        });
      }

      // 6. Update Parcel status
      await tx.parcel.update({
        where: { id: parcelId },
        data: { status: "PAID", updatedAt: new Date() },
      });
    });

    return sendSuccess(res, {
      message: "Payment processed and wallets updated",
    });
  } catch (error: any) {
    logger.error("callback_processing_failed", { error: error.message });
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
