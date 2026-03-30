import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { hashPassword } from "../lib/security";
import { logAudit } from "../lib/audit";
import { sendCargoNotificationSms } from "../lib/sms";

type CargoMeta = {
  paymentStatus?: "PENDING" | "PAID" | "FAILED" | "REFUNDED";
  deliveryOtpHash?: string;
  deliveryOtpExpiresAt?: string;
  senderName?: string;
  senderPhone?: string;
  packageName?: string;
  declaredValue?: number;
  condition?: string;
  urgency?: string;
  dispatch?: {
    trainId: string;
    dispatchedAt: string;
  };
  notification?: {
    sentTo: Array<"SENDER" | "RECEIVER">;
    templateParams: string[];
  };
};

const router: Router = Router();

const computePrice = (input: {
  weight: number;
  declaredValue: number;
  urgency: string;
  cargoType: string;
  packageSize: string;
}) => {
  const base = 1000;
  const weightPrice = input.weight * 500;
  const valueSurcharge = input.declaredValue * 0.01;
  const urgencyMultiplier = input.urgency === "EXPRESS" ? 1.3 : input.urgency === "MGR" ? 1.15 : 1;
  const cargoTypeMultiplier = input.cargoType === "FRAGILE_GOODS" ? 1.2 : 1;
  const packageSizeMultiplier = input.packageSize === "SIZE_3" ? 1.4 : input.packageSize === "SIZE_2" ? 1.2 : 1;

  return Math.round((base + weightPrice + valueSurcharge) * urgencyMultiplier * cargoTypeMultiplier * packageSizeMultiplier);
};

const createDeliveryOtp = () => Math.floor(100000 + Math.random() * 900000).toString();
const normalizeStatus = (status: string) => {
  return status;
};

const readCargoMeta = (jsonValue: unknown): CargoMeta => {
  if (jsonValue && typeof jsonValue === "object" && !Array.isArray(jsonValue)) {
    return jsonValue as CargoMeta;
  }
  return {};
};

const formatCargoResponse = (cargo: any) => {
  const meta = readCargoMeta(cargo.additionalServices);
  return {
    id: cargo.id,
    trackingNumber: meta.trackingNumber || cargo.reason || cargo.id,
    route: {
      receivingStation: cargo.fromAddress,
      destinationStation: cargo.toAddress,
    },
    cargoType: cargo.cargoType,
    packageSize: cargo.cargoSize,
    condition: cargo.condition,
    urgency: cargo.urgency,
    receiver: {
      name: cargo.receiverName,
      phone: cargo.receiverPhone,
    },
    sender: {
      name: meta.senderName || null,
      phone: meta.senderPhone || null,
    },
    paymentStatus: meta.paymentStatus || "PENDING",
    status: normalizeStatus(cargo.status),
    price: cargo.amount ?? null,
    createdAt: cargo.createdAt,
    updatedAt: cargo.updatedAt,
  };
};

// New flow: Receive cargo and return calculated price with PENDING paymentStatus.
router.post("/receive", async (req: Request, res: Response) => {
  try {
    const {
      receivingStation,
      destinationStation,
      packageName,
      declaredValue,
      weight,
      condition,
      cargoType,
      urgency,
      packageSize,
      cargoDescription,
      senderName,
      senderPhone,
      receiverName,
      receiverPhone,
    } = req.body;

    if (!receivingStation || !destinationStation || !packageName || declaredValue === undefined || weight === undefined || !condition || !cargoType || !urgency || !packageSize || !senderName || !senderPhone || !receiverName || !receiverPhone) {
      return sendError(res, "VALIDATION_ERROR", "Missing required fields for receive operation", 400);
    }

    const amount = computePrice({
      weight: Number(weight),
      declaredValue: Number(declaredValue),
      urgency: String(urgency),
      cargoType: String(cargoType),
      packageSize: String(packageSize),
    });

    const deliveryOtp = createDeliveryOtp();
    const otpExpiresAt = new Date(Date.now() + 30 * 60 * 1000);

    const trackingNumber = `MZG-${Date.now().toString().slice(-8)}${Math.floor(Math.random() * 90 + 10)}`;

    const cargo = await prisma.cargoRequest.create({
      data: {
        organizationId: req.user?.organizationId ?? null,
        userId: req.user?.id ?? null,
        reason: trackingNumber,
        fromAddress: String(receivingStation),
        toAddress: String(destinationStation),
        serviceType: String(packageName),
        cargoType: String(cargoType),
        cargoSize: String(packageSize),
        weight: Number(weight),
        condition: String(condition),
        urgency: String(urgency),
        receiverName: String(receiverName),
        receiverPhone: String(receiverPhone),
        pickupType: "STATION_DROP",
        specialInstructions: cargoDescription || null,
        amount,
        status: "PENDING",
        additionalServices: {
          packageName,
          declaredValue: Number(declaredValue),
          senderName,
          senderPhone,
          paymentStatus: "PENDING",
          deliveryOtpHash: hashPassword(deliveryOtp),
          deliveryOtpExpiresAt: otpExpiresAt.toISOString(),
          trackingNumber,
        } as CargoMeta,
      },
    });

    await logAudit({
      userId: req.user?.id,
      action: "CREATE",
      resource: "cargo.receive",
      details: { cargoId: cargo.id, amount },
    });

    const smsRecipients: Array<"SENDER" | "RECEIVER"> = Array.isArray(req.body.notifyRecipients)
      ? req.body.notifyRecipients
      : ["RECEIVER"];

    await sendCargoNotificationSms({
      event: "RECEIVED",
      trackingNumber,
      receiverPhone: receiverPhone || null,
      senderPhone: senderPhone || null,
      organizationId: req.user?.organizationId ?? null,
      recipients: smsRecipients,
      helpdeskNumber: req.body.helpdeskNumber,
      trackUrl: req.body.trackUrl,
    }).catch(() => null);

    return sendSuccess(
      res,
      {
        cargo: formatCargoResponse(cargo),
        pricing: {
          currency: "TZS",
          amount,
        },
        trackingNumber,
        deliveryOtp,
      },
      201,
    );
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// Confirm payment and move cargo from PENDING -> RECEIVED.
router.post("/:id/pay", async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { userId, amount, paymentMethod, transactionReference } = req.body;

    if (!userId || amount === undefined) {
      return sendError(res, "VALIDATION_ERROR", "userId and amount are required", 400);
    }

    const cargo = await prisma.cargoRequest.findUnique({ where: { id } });
    if (!cargo) return sendError(res, "NOT_FOUND", "Cargo request not found", 404);

    const existingMeta = readCargoMeta(cargo.additionalServices);

    const [payment, updatedCargo] = await prisma.$transaction([
      prisma.payment.upsert({
        where: { cargoId: id },
        update: {
          organizationId: cargo.organizationId ?? req.user?.organizationId ?? null,
          userId,
          amount: Number(amount),
          status: "SUCCESS",
          paymentMethod: paymentMethod || "M-PESA",
          transactionReference,
          paidAt: new Date(),
        },
        create: {
          organizationId: cargo.organizationId ?? req.user?.organizationId ?? null,
          cargoId: id,
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
        data: {
          status: "RECEIVED",
          additionalServices: {
            ...existingMeta,
            paymentStatus: "PAID",
          },
        },
      }),
    ]);

    await logAudit({
      userId: req.user?.id,
      action: "UPDATE",
      resource: "cargo.payment",
      details: { cargoId: id, paymentId: payment.id },
    });

    return sendSuccess(res, { payment, cargo: formatCargoResponse(updatedCargo) });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// Dispatch cargo: select cargo + train, then set IN_TRANSIT.
router.post("/send", async (req: Request, res: Response) => {
  try {
    const { cargoId, trainId } = req.body;
    if (!cargoId || !trainId) {
      return sendError(res, "VALIDATION_ERROR", "cargoId and trainId are required", 400);
    }

    const cargo = await prisma.cargoRequest.findUnique({ where: { id: String(cargoId) } });
    if (!cargo) {
      return sendError(res, "NOT_FOUND", "Cargo request not found", 404);
    }

    if (!["RECEIVED", "AT_STATION"].includes(cargo.status)) {
      return sendError(res, "CONFLICT", "Cargo must be RECEIVED/AT_STATION before dispatch", 409);
    }

    const existingMeta = readCargoMeta(cargo.additionalServices);

    const updatedCargo = await prisma.cargoRequest.update({
      where: { id: cargo.id },
      data: {
        status: "IN_TRANSIT",
        additionalServices: {
          ...existingMeta,
          dispatch: {
            trainId: String(trainId),
            dispatchedAt: new Date().toISOString(),
          },
        },
      },
    });

    await logAudit({
      userId: req.user?.id,
      action: "UPDATE",
      resource: "cargo.dispatch",
      details: { cargoId, trainId },
    });

    const dispatchMeta = readCargoMeta(updatedCargo.additionalServices);
    await sendCargoNotificationSms({
      event: "IN_TRANSIT",
      trackingNumber: String(dispatchMeta.trackingNumber || updatedCargo.reason || updatedCargo.id),
      receiverPhone: updatedCargo.receiverPhone,
      senderPhone: dispatchMeta.senderPhone || null,
      organizationId: updatedCargo.organizationId,
      recipients: ["RECEIVER", "SENDER"],
    }).catch(() => null);

    return sendSuccess(res, formatCargoResponse(updatedCargo));
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/:id/verify-delivery-otp", async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { otp } = req.body;
    if (!otp) {
      return sendError(res, "VALIDATION_ERROR", "otp is required", 400);
    }

    const cargo = await prisma.cargoRequest.findUnique({ where: { id } });
    if (!cargo) {
      return sendError(res, "NOT_FOUND", "Cargo request not found", 404);
    }

    const meta = readCargoMeta(cargo.additionalServices);
    if (!meta.deliveryOtpHash || !meta.deliveryOtpExpiresAt) {
      return sendError(res, "CONFLICT", "Delivery OTP not set for this cargo", 409);
    }

    const isExpired = new Date(meta.deliveryOtpExpiresAt).getTime() < Date.now();
    if (isExpired) {
      return sendError(res, "UNAUTHORIZED", "Delivery OTP expired", 401);
    }

    const validOtp = hashPassword(String(otp)) === meta.deliveryOtpHash;
    if (!validOtp) {
      return sendError(res, "UNAUTHORIZED", "Invalid delivery OTP", 401);
    }

    const updatedCargo = await prisma.cargoRequest.update({
      where: { id },
      data: {
        status: "DELIVERED",
      },
    });

    await logAudit({
      userId: req.user?.id,
      action: "UPDATE",
      resource: "cargo.delivery",
      details: { cargoId: id },
    });

    await sendCargoNotificationSms({
      event: "DELIVERED",
      trackingNumber: String(meta.trackingNumber || cargo.reason || cargo.id),
      receiverPhone: cargo.receiverPhone,
      senderPhone: meta.senderPhone || null,
      organizationId: cargo.organizationId,
      recipients: ["RECEIVER", "SENDER"],
    }).catch(() => null);

    return sendSuccess(res, formatCargoResponse(updatedCargo));
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// UX helper endpoint: allows the 3-step flow to enter tracking ID, show card, then deliver.
router.post("/deliver", async (req: Request, res: Response) => {
  try {
    const { cargoId, otp } = req.body;
    if (!cargoId || !otp) {
      return sendError(res, "VALIDATION_ERROR", "cargoId and otp are required", 400);
    }

    const cargo = await prisma.cargoRequest.findUnique({ where: { id: String(cargoId) } });
    if (!cargo) {
      return sendError(res, "NOT_FOUND", "Cargo request not found", 404);
    }

    const meta = readCargoMeta(cargo.additionalServices);
    const validOtp = !!meta.deliveryOtpHash && hashPassword(String(otp)) === meta.deliveryOtpHash;

    if (!validOtp) {
      return sendError(res, "UNAUTHORIZED", "Invalid delivery OTP", 401);
    }

    const updatedCargo = await prisma.cargoRequest.update({
      where: { id: cargo.id },
      data: { status: "DELIVERED" },
    });

    await sendCargoNotificationSms({
      event: "DELIVERED",
      trackingNumber: String(meta.trackingNumber || cargo.reason || cargo.id),
      receiverPhone: cargo.receiverPhone,
      senderPhone: meta.senderPhone || null,
      organizationId: cargo.organizationId,
      recipients: ["RECEIVER", "SENDER"],
    }).catch(() => null);

    return sendSuccess(res, formatCargoResponse(updatedCargo));
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/track/:trackingNumber", async (req: Request, res: Response) => {
  try {
    const { trackingNumber } = req.params;
    const cargo = await prisma.cargoRequest.findUnique({
      where: { id: trackingNumber },
      select: {
        id: true,
        status: true,
        fromAddress: true,
        toAddress: true,
        amount: true,
        createdAt: true,
        updatedAt: true,
        additionalServices: true,
      },
    });

    let byReason = cargo;
    if (!byReason) {
      byReason = await prisma.cargoRequest.findFirst({
        where: { reason: trackingNumber },
        select: {
          id: true,
          status: true,
          fromAddress: true,
          toAddress: true,
          amount: true,
          createdAt: true,
          updatedAt: true,
          additionalServices: true,
          reason: true,
        } as any,
      }) as any;
    }

    if (!byReason) return sendError(res, "NOT_FOUND", "Cargo request not found", 404);
    return sendSuccess(res, {
      cargo: formatCargoResponse(byReason),
      statusTimeline: [
        { status: "PENDING", reached: true },
        { status: "RECEIVED", reached: ["RECEIVED", "IN_TRANSIT", "DELIVERED"].includes(byReason.status) },
        { status: "IN_TRANSIT", reached: ["IN_TRANSIT", "DELIVERED"].includes(byReason.status) },
        { status: "DELIVERED", reached: byReason.status === "DELIVERED" },
      ],
    });
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
    return sendSuccess(res, formatCargoResponse(cargo));
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/details/:trackingNumber", async (req: Request, res: Response) => {
  try {
    const { trackingNumber } = req.params;
    const cargo = await prisma.cargoRequest.findFirst({
      where: {
        OR: [{ id: trackingNumber }, { reason: trackingNumber }],
      },
    });
    if (!cargo) return sendError(res, "NOT_FOUND", "Cargo request not found", 404);
    return sendSuccess(res, formatCargoResponse(cargo));
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
