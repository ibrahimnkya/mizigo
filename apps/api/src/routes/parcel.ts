import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { hashPassword } from "../lib/security";
import { logAudit } from "../lib/audit";
import {
  sendParcelNotificationSms,
  sendDeliveryOtpSms,
  sendParcelReceiptSms,
  sendParcelDispatchSms,
  sendParcelArrivedSms,
} from "../lib/sms";
import { authenticate } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { publicTrackingLimit } from "../middleware/rate-limit";
import { bookSgrParcel, calculateSgrCost } from "../lib/sgr-client";

type ParcelMeta = {
  paymentStatus?: "PENDING" | "PAID" | "FAILED" | "REFUNDED";
  senderName?: string;
  senderPhone?: string;
  itemName?: string;
  packageName?: string; // legacy key — kept for backwards compat
  declaredValue?: number;
  paymentMode?: string;
};

const router: Router = Router();

// Apply global auth to specific segments if needed, or per-route
// Most parcel operations require a valid user context
const secure = [authenticate, requireTenantContext];

const computePrice = async (input: {
  weight: number;
  declaredValue: number;
  urgency: string;
  parcelType: string;
  parcelSize: string;
  condition: string;
  organizationId?: string | null;
}) => {
  const rules = await prisma.pricingRule.findMany({
    where: {
      isActive: true,
      deletedAt: null,
      OR: [
        { organizationId: null },
        { organizationId: input.organizationId || undefined },
      ],
    },
    orderBy: [
      { organizationId: "desc" }, // Scoped/custom rules come first
      { createdAt: "desc" },
    ],
  });

  // Override global rules with organization-specific custom ones of the same name
  const seenNames = new Set<string>();
  const activeRules = [];
  for (const rule of rules) {
    if (!seenNames.has(rule.name)) {
      seenNames.add(rule.name);
      activeRules.push(rule);
    }
  }

  // Base defaults
  let baseFee = 5000;
  let weightFeeRate = 1500;
  let valueFeeRate = 0.01;

  let totalMultiplier = 1;
  let additionalFixedFees = 0;

  for (const rule of activeRules) {
    // SGR_TARIFF rules use a different pricing model — skip in generic engine
    if (rule.type === "SGR_TARIFF") continue;
    let isMatch = true;
    if (rule.condition) {
      const conditions = rule.condition.split("&");
      for (const cond of conditions) {
        const [key, val] = cond.split("=");
        if (key === "urgency" && input.urgency !== val) isMatch = false;
        if (key === "parcel_type" && input.parcelType !== val) isMatch = false;
        if (key === "package_size" && input.parcelSize !== val) isMatch = false;
        if (key === "condition" && input.condition !== val) isMatch = false;
      }
    }

    if (isMatch) {
      if (rule.type === "MULTIPLIER") {
        totalMultiplier *= rule.value;
      } else if (rule.type === "FIXED") {
        // Custom fixed mappings if specified
        if (rule.name === "Base Fee") baseFee = rule.value;
        else if (rule.name === "Weight Rate") weightFeeRate = rule.value;
        else if (rule.name === "Value Rate") valueFeeRate = rule.value;
        else additionalFixedFees += rule.value;
      }
    }
  }

  const weightFee = input.weight * weightFeeRate;
  const valueFee = input.declaredValue * valueFeeRate;
  const subTotal = baseFee + weightFee + valueFee + additionalFixedFees;
  const finalPrice = Math.ceil((subTotal * totalMultiplier) / 100) * 100;

  return {
    totalPrice: finalPrice,
    breakdown: {
      baseFee,
      weightFee,
      weightFeeRate,
      valueFee,
      valueFeeRate,
      additionalFixedFees,
      subTotal,
      totalMultiplier,
    },
  };
};

function generateTracking(index: number) {
  // 1. Calculate the numeric part (001 to 999)
  const numPart = (index % 999) + 1;
  const formattedNum = numPart.toString().padStart(3, "0");

  // 2. Calculate the letter part (AAA, AAB, etc.)
  let letterIndex = Math.floor(index / 999);
  let letters = "";

  for (let i = 0; i < 3; i++) {
    letters = String.fromCharCode(65 + (letterIndex % 26)) + letters;
    letterIndex = Math.floor(letterIndex / 26);
  }

  return letters + formattedNum; // Result is already in CAPSLOCK
}

const createDeliveryOtp = () =>
  Math.floor(100000 + Math.random() * 900000).toString();
const normalizeStatus = (status: string) => status;

const readParcelMeta = (jsonValue: unknown): ParcelMeta => {
  if (jsonValue && typeof jsonValue === "object" && !Array.isArray(jsonValue)) {
    return jsonValue as ParcelMeta;
  }
  return {};
};

const formatParcelResponse = (parcel: any) => {
  const meta = readParcelMeta(parcel.additionalServices);
  return {
    id: parcel.id,
    trackingNumber: parcel.trackingNumber || parcel.reason || parcel.id,
    route: {
      receivingStation: parcel.origin?.name || parcel.fromAddress,
      destinationStation: parcel.destination?.name || parcel.toAddress,
    },
    itemName: meta.itemName || meta.packageName || parcel.specialInstructions || null,
    packageSize: parcel.parcelSize,
    parcelType: parcel.parcelType,
    parcelSize: parcel.parcelSize,
    condition: parcel.condition,
    urgency: parcel.urgency,
    serviceType: parcel.serviceType,
    declaredValue: meta.declaredValue ?? null,
    receiver: {
      name: parcel.receiverName,
      phone: parcel.receiverPhone,
    },
    sender: {
      name: meta.senderName || null,
      phone: meta.senderPhone || null,
    },
    paymentStatus: meta.paymentStatus || "PENDING",
    paymentMode: meta.paymentMode || "PAY_AS_YOU_GO",
    status: normalizeStatus(parcel.status),
    price: parcel.amount ?? null,
    createdAt: parcel.createdAt,
    updatedAt: parcel.updatedAt,
    organization: parcel.organization
      ? { id: parcel.organization.id, name: parcel.organization.name }
      : parcel.organizationId ? { id: parcel.organizationId } : null,
    origin: parcel.origin
      ? { id: parcel.origin.id, name: parcel.origin.name, code: parcel.origin.code }
      : parcel.originId ? { id: parcel.originId } : null,
    destination: parcel.destination
      ? { id: parcel.destination.id, name: parcel.destination.name, code: parcel.destination.code }
      : parcel.destinationId ? { id: parcel.destinationId } : null,
  };
};

router.post("/receive", ...secure, async (req: Request, res: Response) => {
  try {
    const {
      receivingStationId,
      destinationStationId,
      packageName,
      declaredValue,
      weight,
      condition,
      parcelType,
      urgency,
      packageSize,
      description,
      senderName,
      senderPhone,
      receiverName,
      receiverPhone,
      isPaid,
      paymentMethod,
      userId,
      paymentMode = "PAY_AS_YOU_GO",
    } = req.body;

    if (
      !receivingStationId ||
      !destinationStationId ||
      !receiverName ||
      !receiverPhone ||
      !weight
    ) {
      return sendError(
        res,
        "VALIDATION_ERROR",
        "Missing required fields for receive operation",
        400,
      );
    }

    const originStation = await prisma.station.findUnique({
      where: { id: receivingStationId },
    });
    const destinationStation = await prisma.station.findUnique({
      where: { id: destinationStationId },
    });

    // Look up tariff by parcelType first (maps SGR category to local rule),
    // then fall back to any active SGR tariff. packageName is the item name, not the tariff.
    const tariffRule =
      (await prisma.pricingRule.findFirst({
        where: { name: String(parcelType || ""), type: "SGR_TARIFF", isActive: true },
      })) ??
      (await prisma.pricingRule.findFirst({
        where: { type: "SGR_TARIFF", isActive: true },
      }));

    let totalPriceVal = 0;
    let trackingNumberVal = "";
    let isSgrBookingSuccess = false;
    let breakdownVal: any = {};

    if (originStation && destinationStation) {
      try {
        // Resolve tariff fields from the local rule if found, otherwise use safe defaults
        let sgrTariffId = tariffRule?.id ?? "default";
        let sgrTariffCode = "TRCPN";
        let sgrTariffName = tariffRule?.name ?? String(packageName || "Standard");
        if (tariffRule?.condition) {
          try {
            const meta = JSON.parse(tariffRule.condition);
            if (meta.sgrId) sgrTariffId = meta.sgrId;
            if (meta.parcelCategory?.code) sgrTariffCode = meta.parcelCategory.code;
          } catch (_) {}
        }

        // 1. Fetch live price from TRC SGR (station-to-station weight-based cost)
        const sgrCost = await calculateSgrCost({
          originStation: {
            id: originStation.id,
            name: originStation.name,
            code: originStation.code,
          },
          destinationStation: {
            id: destinationStation.id,
            name: destinationStation.name,
            code: destinationStation.code,
          },
          weightInKg: Number(weight || 0.1),
        });

        if (sgrCost && sgrCost.totalCharge) {
          totalPriceVal = sgrCost.totalCharge;
        }

        // 2. Register the booking with TRC SGR to get an official parcelRef
        const sgrBooking = await bookSgrParcel({
          sourceRef: `MZG-${Date.now()}-${Math.floor(1000 + Math.random() * 9000)}`,
          senderName: String(senderName || "Sender"),
          senderPhoneNumber: String(senderPhone || ""),
          parcelName: String(parcelType || "Parcel"),
          parcelDescription: String(description || "No description"),
          originStation: {
            id: originStation.id,
            name: originStation.name,
            code: originStation.code,
          },
          destinationStation: {
            id: destinationStation.id,
            name: destinationStation.name,
            code: destinationStation.code,
          },
          tariff: {
            id: sgrTariffId,
            name: sgrTariffName,
            code: sgrTariffCode,
          },
          declaration: {
            declaredPrice: Number(declaredValue || 0),
          },
        });

        if (sgrBooking && sgrBooking.parcelRef) {
          trackingNumberVal = sgrBooking.parcelRef;
          isSgrBookingSuccess = true;
        }
      } catch (sgrErr: any) {
        console.error("[SGR Integration Error] Bypassing and falling back to local computation:", sgrErr.message);
      }
    }

    if (!isSgrBookingSuccess) {
      const { totalPrice, breakdown } = await computePrice({
        weight: Number(weight),
        declaredValue: Number(declaredValue),
        urgency: String(urgency),
        parcelType: String(parcelType),
        parcelSize: String(packageSize),
        condition: String(condition),
        organizationId: req.user?.organizationId ?? null,
      });
      totalPriceVal = totalPrice;
      breakdownVal = breakdown;

      const parcelCount = await (prisma as any).parcel.count();
      trackingNumberVal = generateTracking(parcelCount);
    }

    const deliveryOtpValue = createDeliveryOtp();

    let amountToCollect = totalPriceVal;
    let receiverPays = false;

    if (paymentMode === "TO_PAY") {
      amountToCollect = totalPriceVal / 2;
      receiverPays = true;
    } else {
      amountToCollect = totalPriceVal;
      receiverPays = false;
    }

    const parcel = await (prisma as any).parcel.create({
      data: {
        organizationId: req.user?.organizationId ?? null,
        userId: userId ? String(userId) : req.user?.id,
        trackingNumber: trackingNumberVal,
        deliveryOtp: hashPassword(deliveryOtpValue),
        fromAddress: String(receivingStationId), // Mapping to existing field
        toAddress: String(destinationStationId), // Mapping to existing field
        originId: receivingStationId,
        destinationId: destinationStationId,
        receiverName: String(receiverName),
        receiverPhone: String(receiverPhone),
        receiverPays,
        serviceType: String(parcelType || urgency || "Standard"),
        parcelType: String(parcelType || "Parcel"),
        parcelSize: String(packageSize || "Standard"),
        weight: Number(weight),
        condition: String(condition),
        urgency: String(urgency),
        pickupType: "STATION_DROP",
        specialInstructions: String(description || packageName || ""),
        amount: totalPriceVal,
        status: "RECEIVED",
        additionalServices: {
          itemName: String(packageName || ""),
          declaredValue: Number(declaredValue),
          senderName: String(senderName || ""),
          senderPhone: String(senderPhone || ""),
          paymentMode,
          paymentStatus: isPaid ? "PAID" : "PENDING",
        },
      },
      include: {
        organization: true,
        origin: true,
        destination: true,
      },
    });

    await (prisma.payment as any).create({
      data: {
        organizationId: req.user?.organizationId ?? null,
        parcelId: parcel.id,
        userId: userId ? String(userId) : req.user?.id || "unknown",
        amount: amountToCollect,
        status: isPaid && amountToCollect > 0 ? "SUCCESS" : "PENDING",
        paymentMethod: String(paymentMethod || "CASH"),
        paidAt: isPaid && amountToCollect > 0 ? new Date() : null,
      },
    });

    // Create OTP record as well for new plural relation if needed
    await (prisma as any).oTP.create({
      data: {
        parcelId: parcel.id,
        code: deliveryOtpValue,
        expiresAt: new Date(Date.now() + 24 * 60 * 60 * 1000), // 24h
      },
    });

    // Create Tracking entry
    await (prisma as any).parcelTracking.create({
      data: {
        parcelId: parcel.id,
        status: "RECEIVED",
        location: String(receivingStationId),
        description: `Parcel received at station by ${(req.user as any)?.name}`,
      },
    });

    await sendParcelReceiptSms({
      trackingNumber: trackingNumberVal,
      otp: deliveryOtpValue,
      senderName: String(senderName || "Mtumaji"),
      senderPhone: String(senderPhone || ""),
      receiverName: String(receiverName),
      receiverPhone: String(receiverPhone),
      originName: originStation?.name || String(receivingStationId),
      destinationName: destinationStation?.name || String(destinationStationId),
      packageName: String(packageName || "Parcel"),
      stationName: originStation?.name || String(receivingStationId),
      agentName: (req.user as any)?.name || "Agent",
      agentPhone: (req.user as any)?.phone || "",
      organizationId: req.user?.organizationId,
    }).catch((e) => console.error("Receipt SMS fail", e));

    await logAudit({
      userId: req.user?.id,
      action: "CREATE",
      resource: "parcel.receive",
      details: { id: parcel.id, trackingNumber: trackingNumberVal },
    });

    return sendSuccess(
      res,
      {
        parcel: formatParcelResponse(parcel),
        pricing: { currency: "TZS", amount: totalPriceVal, breakdown: breakdownVal },
        trackingNumber: trackingNumberVal,
        deliveryOtp: deliveryOtpValue,
      },
      201,
    );
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/stats/operator", ...secure, async (req: Request, res: Response) => {
  try {
    let stationId = req.user?.stationId;
    if (!stationId) {
      if (req.user?.organizationId) {
        const firstStation = await prisma.station.findFirst({
          where: { organizationId: req.user.organizationId, isActive: true, deletedAt: null },
          select: { id: true },
        });
        if (firstStation) {
          stationId = firstStation.id;
        }
      }
      if (!stationId) {
        const firstStation = await prisma.station.findFirst({
          where: { isActive: true, deletedAt: null },
          select: { id: true },
        });
        if (firstStation) {
          stationId = firstStation.id;
        }
      }
    }

    if (!stationId) {
      return sendSuccess(res, {
        today: { received: 0, delivered: 0, sent: 0, atWarehouse: 0 },
        week: { received: 0, delivered: 0, sent: 0, atWarehouse: 0 },
        month: { received: 0, delivered: 0, sent: 0, atWarehouse: 0 },
        allTime: { received: 0, delivered: 0, sent: 0, atWarehouse: 0 },
      });
    }

    const getStatsForRange = async (stationId: string, minDate?: Date) => {
      const dateFilter = minDate ? { createdAt: { gte: minDate } } : {};
      
      const [received, delivered, sent, atWarehouse] = await Promise.all([
        (prisma as any).parcel.count({
          where: {
            OR: [{ originId: stationId }, { fromAddress: stationId }],
            ...dateFilter,
          },
        }),
        (prisma as any).parcel.count({
          where: {
            OR: [{ destinationId: stationId }, { toAddress: stationId }],
            status: "DELIVERED",
            ...dateFilter,
          },
        }),
        (prisma as any).parcel.count({
          where: {
            OR: [{ originId: stationId }, { fromAddress: stationId }],
            status: { in: ["DISPATCHED", "SENT", "IN_TRANSIT"] },
            ...dateFilter,
          },
        }),
        (prisma as any).parcel.count({
          where: {
            OR: [
              { originId: stationId, status: { in: ["RECEIVED", "AT_STATION"] } },
              { destinationId: stationId, status: "OFFLOADED" }
            ],
            ...dateFilter,
          },
        }),
      ]);

      return { received, delivered, sent, atWarehouse };
    };

    const now = Date.now();
    const oneDayAgo = new Date(now - 24 * 60 * 60 * 1000);
    const oneWeekAgo = new Date(now - 7 * 24 * 60 * 60 * 1000);
    const oneMonthAgo = new Date(now - 30 * 24 * 60 * 60 * 1000);

    const [overall, daily, weekly, monthly] = await Promise.all([
      getStatsForRange(stationId),
      getStatsForRange(stationId, oneDayAgo),
      getStatsForRange(stationId, oneWeekAgo),
      getStatsForRange(stationId, oneMonthAgo),
    ]);

    return sendSuccess(res, {
      ...overall,
      daily,
      weekly,
      monthly,
      last30: monthly,
      last90: await getStatsForRange(stationId, new Date(now - 90 * 24 * 60 * 60 * 1000)),
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

const VALID_STATUSES = [
  "PENDING",
  "APPROVED",
  "REJECTED",
  "PAYMENT_PENDING",
  "PAID",
  "RECEIVED",
  "SENT",
  "DISPATCHED",
  "OFFLOADED",
  "AT_STATION",
  "IN_TRANSIT",
  "DELAYED",
  "DELIVERED",
  "CANCELED",
  "LOST"
];

const mapParcelStatus = (status: any): string | null => {
  if (!status) return null;
  let mapped = String(status).toUpperCase().replace(/\s+/g, "_");
  if (mapped === "CANCELLED") {
    mapped = "CANCELED";
  }
  return VALID_STATUSES.includes(mapped) ? mapped : null;
};

router.get("/parcel-parameters", authenticate, async (req: Request, res: Response) => {
  try {
    const configs = await prisma.systemConfig.findMany({
      where: {
        key: {
          in: ["PARCEL_TYPES", "PARCEL_CONDITIONS", "PACKAGE_SIZES", "DELIVERY_PRIORITIES"]
        }
      }
    });

    const result = configs.reduce((acc: Record<string, any>, curr: any) => {
      try {
        acc[curr.key] = JSON.parse(curr.value);
      } catch {
        acc[curr.key] = curr.value;
      }
      return acc;
    }, {});

    const defaultTypes = [
      { name: "Document", description: "Envelopes, paper records, certificates" },
      { name: "Envelope", description: "Letters and flat documents" },
      { name: "Small package", description: "Up to 5 kg" },
      { name: "Medium package", description: "5 kg to 15 kg" },
      { name: "Large package", description: "15 kg to 30 kg" },
      { name: "Fragile", description: "Glassware, ceramics, electronics" },
      { name: "Box", description: "Cardboard boxes" },
      { name: "Other", description: "Uncategorized goods" }
    ];

    const defaultConditions = [
      { name: "Intact", description: "Brand new or perfect condition" },
      { name: "Minor Damage", description: "Small scratches or dents" },
      { name: "Damaged", description: "Broken or failed components" },
      { name: "Opened/Tampered", description: "Seal is broken" },
      { name: "Wet", description: "Water damage present" },
      { name: "Crushed", description: "Structural box damage" },
      { name: "Leaking", description: "Liquid container failure" },
      { name: "Dented", description: "Metal or plastic indentation" }
    ];

    const defaultSizes = [
      { name: "Document", description: "Flat letter size" },
      { name: "Small Parcel", description: "Shoebox size" },
      { name: "Medium Parcel", description: "Microwave size" },
      { name: "Large Parcel", description: "Suitcase size" },
      { name: "Oversized Parcel", description: "Large cargo" },
      { name: "Crate", description: "Wooden shipping crate" },
      { name: "Pallet", description: "Standard warehouse pallet" }
    ];

    const defaultPriorities = [
      { name: "Express", description: "High-priority, same-day or next-day delivery" },
      { name: "Standard", description: "Regular ground delivery service" },
      { name: "MGR", description: "Mizigo Golden Route - scheduled premium service" }
    ];

    return sendSuccess(res, {
      parcelTypes: result.PARCEL_TYPES || defaultTypes,
      parcelConditions: result.PARCEL_CONDITIONS || defaultConditions,
      packageSizes: result.PACKAGE_SIZES || defaultSizes,
      deliveryPriorities: result.DELIVERY_PRIORITIES || defaultPriorities,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/", ...secure, async (req: Request, res: Response) => {
  try {
    const { status, trackingNumber } = req.query;
    const where: any = { organizationId: req.user?.organizationId ?? null };

    if (status) {
      const mapped = mapParcelStatus(status);
      if (!mapped) {
        return sendError(res, "VALIDATION_ERROR", `Invalid status value: ${status}`, 400);
      }
      where.status = mapped;
    }
    if (trackingNumber)
      where.trackingNumber = {
        contains: String(trackingNumber),
        mode: "insensitive",
      };

    const parcels = await (prisma as any).parcel.findMany({
      where,
      orderBy: { createdAt: "desc" },
      take: 50,
      include: {
        organization: true,
        origin: true,
        destination: true,
      },
    });

    return sendSuccess(
      res,
      parcels.map((p: any) => formatParcelResponse(p)),
    );
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/dispatch", ...secure, async (req: Request, res: Response) => {
  const { parcelId, vehicleId, travelDate } = req.body;
  const userId = req.user?.id!;

  try {
    if (!parcelId || !vehicleId || !travelDate) {
      return sendError(
        res,
        "VALIDATION_ERROR",
        "ParcelID, VehicleID, and TravelDate are required",
        400,
      );
    }

    const parcel = await (prisma as any).parcel.findUnique({
      where: { id: parcelId },
      include: {
        otps: {
          where: { used: false },
          orderBy: { createdAt: "desc" },
          take: 1,
        },
      },
    });

    if (!parcel) return sendError(res, "NOT_FOUND", "Parcel not found", 404);

    if (
      ["DISPATCHED", "OFFLOADED", "DELIVERED", "CANCELED"].includes(
        parcel.status,
      )
    ) {
      return sendError(
        res,
        "CONFLICT",
        `This parcel has already been ${parcel.status.toLowerCase()}`,
        400,
      );
    }

    const otpCode = parcel.otps.length > 0 ? parcel.otps[0].code : "N/A";

    const updatedParcel = await (prisma as any).parcel.update({
      where: { id: parcelId },
      data: {
        status: "DISPATCHED",
        dispatcherId: userId,
        vehicleId: vehicleId,
        travelDate: new Date(travelDate),
      },
      include: {
        dispatcher: {
          include: { organization: true },
        },
        vehicle: true,
        origin: true,
        destination: true,
        organization: true,
      },
    });

    await (prisma as any).parcelTracking.create({
      data: {
        parcelId: parcelId,
        status: "DISPATCHED",
        location: updatedParcel.origin?.name || "Hub",
        description: `Dispatched by ${(req.user as any)?.name} with vehicle ${updatedParcel.vehicle?.plateNumber || "Unknown"}`,
      },
    });

    const smsMessage = `Mzigo Umetumwa\n\nMpendwa ${updatedParcel.receiverName}, mzigo namba ${updatedParcel.trackingNumber} umetoka ${updatedParcel.origin?.name || updatedParcel.fromAddress} kwenda ${updatedParcel.destination?.name || updatedParcel.toAddress} na gari la ${updatedParcel.vehicle?.carrier || ""}.\nMsafirishaji: ${updatedParcel.dispatcher?.name} Simu ya Msafirishaji ${updatedParcel.dispatcher?.phone || ""}\nNamba ya Siri (OTP): ${otpCode}\n\nAsante kwa kutumia ${updatedParcel.dispatcher?.organization?.name || "Mizigo"}! Kwa msaada zaidi, tupigie: ${updatedParcel.dispatcher?.organization?.supportUrl || "0736699593"}`;

    await sendParcelDispatchSms({
      receiverName: updatedParcel.receiverName,
      receiverPhone: updatedParcel.receiverPhone,
      trackingNumber: updatedParcel.trackingNumber,
      originName: updatedParcel.origin?.name || updatedParcel.fromAddress,
      destinationName:
        updatedParcel.destination?.name || updatedParcel.toAddress,
      carrierName: updatedParcel.vehicle?.carrier || "Mizigo",
      dispatcherName: updatedParcel.dispatcher?.name || "Msafirishaji",
      dispatcherPhone: updatedParcel.dispatcher?.phone || "",
      otp: otpCode,
      organizationId: updatedParcel.organizationId,
    }).catch(() => null);

    // Also send the custom swahili SMS if possible
    // (Existing sendSms lib could be used for the exact custom string)

    await logAudit({
      userId: userId,
      action: "UPDATE",
      resource: "parcel.dispatch",
      details: { parcelId, vehicleId, trackingNumber: parcel.trackingNumber },
    });

    return sendSuccess(res, formatParcelResponse(updatedParcel));
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/offload", ...secure, async (req: Request, res: Response) => {
  const { parcelId } = req.body;
  const userId = req.user?.id!;

  try {
    if (!parcelId)
      return sendError(res, "VALIDATION_ERROR", "ParcelID is required", 400);

    const parcel = await (prisma as any).parcel.findUnique({
      where: { id: parcelId },
    });
    if (!parcel) return sendError(res, "NOT_FOUND", "Parcel not found", 404);

    if (["OFFLOADED", "DELIVERED", "CANCELED"].includes(parcel.status)) {
      return sendError(
        res,
        "CONFLICT",
        `This parcel has already been ${parcel.status.toLowerCase()}`,
        400,
      );
    }

    if (
      parcel.status !== "DISPATCHED" &&
      parcel.status !== "IN_TRANSIT" &&
      parcel.status !== "SENT"
    ) {
      return sendError(
        res,
        "VALIDATION_ERROR",
        "Cannot offload parcel that hasn't been dispatched",
        400,
      );
    }

    const updatedParcel = await (prisma as any).parcel.update({
      where: { id: parcelId },
      data: {
        status: "OFFLOADED",
        offloaderId: userId,
      },
      include: {
        offloader: { include: { organization: true } },
        destination: true,
        origin: true,
        organization: true,
      },
    });

    await (prisma as any).parcelTracking.create({
      data: {
        parcelId: parcelId,
        status: "OFFLOADED",
        location: updatedParcel.destination?.name || "Station",
        description: `Offloaded by ${(req.user as any)?.name} at ${updatedParcel.destination?.name || "Station"}`,
      },
    });

    const extraInfo = (updatedParcel.additionalServices || {}) as Record<string, any>;
    const senderName = extraInfo.senderName || "Mtumaji";
    const packageName = extraInfo.packageName || updatedParcel.parcelType || "Parcel";

    await sendParcelArrivedSms({
      receiverName: updatedParcel.receiverName,
      receiverPhone: updatedParcel.receiverPhone,
      trackingNumber: updatedParcel.trackingNumber,
      destinationName: updatedParcel.destination?.name || "kupokelea",
      senderName,
      packageName,
      organizationId: updatedParcel.organizationId,
    }).catch(() => null);

    await logAudit({
      userId: userId,
      action: "UPDATE",
      resource: "parcel.offload",
      details: { parcelId, trackingNumber: parcel.trackingNumber },
    });

    return sendSuccess(res, formatParcelResponse(updatedParcel));
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/:id/deliver", ...secure, async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { otp } = req.body;
    const userId = req.user?.id!;

    if (!otp)
      return sendError(
        res,
        "VALIDATION_ERROR",
        "OTP is required for delivery verification",
        400,
      );

    const parcel = await (prisma as any).parcel.findUnique({
      where: { id },
      include: { otps: { where: { code: otp, used: false } } },
    });

    if (!parcel) return sendError(res, "NOT_FOUND", "Parcel not found", 404);
    if (parcel.status === "DELIVERED")
      return sendError(
        res,
        "VALIDATION_ERROR",
        "Parcel is already delivered",
        400,
      );

    // Verify OTP (either via hashed deliveryOtp field or the new OTP model)
    const hashedInput = hashPassword(String(otp));
    const isModelOtpValid = parcel.otps.length > 0;
    const isFieldOtpValid = hashedInput === parcel.deliveryOtp;

    if (!isModelOtpValid && !isFieldOtpValid) {
      return sendError(
        res,
        "UNAUTHORIZED",
        "Invalid delivery OTP. Handover denied.",
        401,
      );
    }

    const updatedParcel = await (prisma as any).parcel.update({
      where: { id },
      data: {
        status: "DELIVERED",
        delivererId: userId,
        updatedAt: new Date(),
      },
      include: {
        organization: true,
        origin: true,
        destination: true,
      },
    });

    // Mark OTP as used if found in model
    if (isModelOtpValid) {
      await (prisma as any).oTP.update({
        where: { id: parcel.otps[0].id },
        data: { used: true },
      });
    }

    await (prisma as any).parcelTracking.create({
      data: {
        parcelId: id,
        status: "DELIVERED",
        location: "Receiver Address",
        description: `Delivered by ${(req.user as any)?.name}`,
      },
    });

    await logAudit({
      userId: userId,
      action: "DELIVER_VERIFIED",
      resource: "parcel",
      details: { id, trackingNumber: parcel.trackingNumber },
    });

    return sendSuccess(res, formatParcelResponse(updatedParcel));
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/:id/cancel", ...secure, async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { cancellationReason } = req.body;
    const userId = req.user?.id!;

    const parcel = await (prisma as any).parcel.findUnique({ where: { id } });
    if (!parcel) return sendError(res, "NOT_FOUND", "Parcel not found", 404);
    if (parcel.status === "DELIVERED")
      return sendError(
        res,
        "VALIDATION_ERROR",
        "Cannot cancel a delivered parcel",
        400,
      );

    const updatedParcel = await (prisma as any).parcel.update({
      where: { id },
      data: {
        status: "CANCELED",
        cancelerId: userId,
        cancellationReason,
        isCanceled: true,
      },
      include: {
        organization: true,
        origin: true,
        destination: true,
      },
    });

    await (prisma as any).parcelTracking.create({
      data: {
        parcelId: id,
        status: "CANCELED",
        description: `Canceled by ${(req.user as any)?.name}. Reason: ${cancellationReason}`,
      },
    });

    await logAudit({
      userId,
      action: "CANCEL",
      resource: "parcel",
      details: {
        id,
        trackingNumber: parcel.trackingNumber,
        reason: cancellationReason,
      },
    });

    return sendSuccess(res, formatParcelResponse(updatedParcel));
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get(
  "/track/:trackingNumber",
  publicTrackingLimit,
  async (req: Request, res: Response) => {
    try {
      const { trackingNumber } = req.params;
      const parcel = await (prisma as any).parcel.findFirst({
        where: {
          OR: [
            { id: trackingNumber },
            { trackingNumber: trackingNumber },
            { reason: trackingNumber },
            { receiverName: trackingNumber },
            { receiverPhone: trackingNumber },
          ],
        },
        include: {
          organization: true,
          origin: true,
          destination: true,
        },
        orderBy: { createdAt: "desc" },
      });

      if (!parcel)
        return sendError(res, "NOT_FOUND", "Parcel request not found", 404);

      const isPhoneSearch = trackingNumber === parcel.receiverPhone;
      const formattedParcel = formatParcelResponse(parcel);

      if (isPhoneSearch) {
        const rawTN = formattedParcel.trackingNumber || "";
        formattedParcel.trackingNumber =
          rawTN.length > 6
            ? `${rawTN.slice(0, 4)}***${rawTN.slice(-3)}`
            : "***MASKED***";

        formattedParcel.route = {
          receivingStation:
            formattedParcel.route.receivingStation.split(",")[0],
          destinationStation:
            formattedParcel.route.destinationStation.split(",")[0],
        };
      }

      const trackingHistory = await (prisma as any).parcelTracking.findMany({
        where: { parcelId: parcel.id },
        orderBy: { timestamp: "asc" },
      });

      return sendSuccess(res, {
        parcel: formattedParcel,
        isPrivacyMasked: isPhoneSearch,
        trackingHistory,
        statusTimeline: [
          { status: "PENDING", reached: true },
          {
            status: "RECEIVED",
            reached: [
              "RECEIVED",
              "DISPATCHED",
              "OFFLOADED",
              "AT_STATION",
              "IN_TRANSIT",
              "DELIVERED",
            ].includes(parcel.status),
          },
          {
            status: "IN_TRANSIT",
            reached: [
              "DISPATCHED",
              "IN_TRANSIT",
              "OFFLOADED",
              "AT_STATION",
              "DELIVERED",
            ].includes(parcel.status),
          },
          {
            status: "AT_STATION",
            reached: ["OFFLOADED", "AT_STATION", "DELIVERED"].includes(
              parcel.status,
            ),
          },
          { status: "DELIVERED", reached: parcel.status === "DELIVERED" },
        ],
      });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.get("/:id", ...secure, async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const parcel = await (prisma as any).parcel.findUnique({
      where: { id },
      include: {
        user: { select: { id: true, name: true, email: true, phone: true } },
        payment: true,
        approvedBy: { select: { id: true, name: true, email: true } },
        dispatcher: { select: { id: true, name: true, phone: true } },
        offloader: { select: { id: true, name: true, phone: true } },
        deliverer: { select: { id: true, name: true, phone: true } },
        tracking: { orderBy: { timestamp: "desc" } },
        organization: true,
        origin: true,
        destination: true,
      },
    });

    if (!parcel)
      return sendError(res, "NOT_FOUND", "Parcel request not found", 404);
    return sendSuccess(res, formatParcelResponse(parcel));
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
