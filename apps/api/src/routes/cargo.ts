import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";

const router: Router = Router();

router.post("/", async (req: Request, res: Response) => {
  try {
    const payload = req.body;

    if (!payload.fromAddress || !payload.toAddress || !payload.serviceType || !payload.cargoType || !payload.cargoSize || !payload.receiverName || !payload.receiverPhone || !payload.pickupType) {
      return sendError(res, "VALIDATION_ERROR", "Missing required fields", 400);
    }

    const cargo = await prisma.cargoRequest.create({
      data: {
        userId: payload.userId || null,
        fromAddress: payload.fromAddress,
        toAddress: payload.toAddress,
        serviceType: payload.serviceType,
        peopleNeeded: payload.peopleNeeded || 0,
        cargoType: payload.cargoType,
        cargoSize: payload.cargoSize,
        receiverName: payload.receiverName,
        receiverPhone: payload.receiverPhone,
        receiverPays: payload.receiverPays || false,
        additionalServices: payload.additionalServices || null,
        pickupType: payload.pickupType,
        wagonType: payload.wagonType || "STANDARD",
        status: "PENDING",
      },
    });
    return sendSuccess(res, cargo, 201);
  } catch (error: any) {
    console.error("Error creating cargo request", error);
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/space-check", async (_req: Request, res: Response) => {
  try {
    return sendSuccess(res, { hasSpace: true, availableCapacity: 100 });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.patch("/:id/adjudicate", async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { status, adminId, amount, rejectionReason } = req.body;

    if (!status || !["APPROVED", "REJECTED"].includes(status)) {
      return sendError(res, "VALIDATION_ERROR", "Invalid status, must be APPROVED or REJECTED", 400);
    }
    if (status === "APPROVED" && amount === undefined) {
      return sendError(res, "VALIDATION_ERROR", "Amount required for approval", 400);
    }
    if (status === "REJECTED" && !rejectionReason) {
      return sendError(res, "VALIDATION_ERROR", "Rejection reason required for rejection", 400);
    }

    const cargo = await prisma.cargoRequest.update({
      where: { id },
      data: {
        status,
        approvedById: adminId || null,
        amount: status === "APPROVED" ? Number(amount) : null,
        rejectionReason: status === "REJECTED" ? String(rejectionReason) : null,
      },
    });
    return sendSuccess(res, cargo);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/:id/status", async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const cargo = await prisma.cargoRequest.findUnique({
      where: { id },
      select: { id: true, status: true },
    });
    if (!cargo) return sendError(res, "NOT_FOUND", "Cargo request not found", 404);
    return sendSuccess(res, cargo);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/:id/pay", async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { userId, amount, paymentMethod, transactionReference } = req.body;

    if (!userId || amount === undefined) {
      return sendError(res, "VALIDATION_ERROR", "userId and amount are required", 400);
    }

    const cargo = await prisma.cargoRequest.findUnique({ where: { id } });
    if (!cargo) return sendError(res, "NOT_FOUND", "Cargo request not found", 404);

    const [payment, updatedCargo] = await prisma.$transaction([
      prisma.payment.upsert({
        where: { cargoId: id as string },
        update: {
          userId,
          amount: Number(amount),
          status: "SUCCESS",
          paymentMethod: paymentMethod || "M-PESA",
          transactionReference,
          paidAt: new Date(),
        },
        create: {
          cargoId: id as string,
          userId,
          amount: Number(amount),
          status: "SUCCESS",
          paymentMethod: paymentMethod || "M-PESA",
          transactionReference,
          paidAt: new Date(),
        },
      }),
      prisma.cargoRequest.update({
        where: { id },
        data: { status: "PAID" },
      }),
    ]);

    return sendSuccess(res, { payment, cargo: updatedCargo });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/:id/track", async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const cargo = await prisma.cargoRequest.findUnique({
      where: { id },
      select: {
        id: true,
        status: true,
        fromAddress: true,
        toAddress: true,
        createdAt: true,
        updatedAt: true,
      },
    });
    if (!cargo) return sendError(res, "NOT_FOUND", "Cargo request not found", 404);
    return sendSuccess(res, cargo);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/:id", async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const cargo = await prisma.cargoRequest.findUnique({
      where: { id },
      include: {
        user: { select: { id: true, name: true, email: true, phone: true } },
        payment: true,
        approvedBy: { select: { id: true, name: true, email: true } },
      },
    });
    if (!cargo) return sendError(res, "NOT_FOUND", "Cargo request not found", 404);
    return sendSuccess(res, cargo);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
