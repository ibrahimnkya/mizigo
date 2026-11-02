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
  /** Customer report that the parcel is missing, pending staff review. */
  lostReport?: {
    reportedAt: string;
    reportedBy: "SENDER" | "RECEIVER";
    details?: string;
    resolved?: boolean;
    resolvedAt?: string;
    resolution?: "MARKED_LOST" | "FOUND";
  };
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
      const recognizedKeys = new Set([
        "urgency",
        "parcel_type",
        "package_size",
        "condition",
      ]);
      const conditions = rule.condition.split("&");
      for (const cond of conditions) {
        const parts = cond.split("=");
        const key = parts[0];
        const val = parts[1];
        // Unparseable or unrecognized conditions must never fall back to
        // "match everything" — that would silently apply the rule to every
        // parcel instead of the intended scoped subset.
        if (parts.length !== 2 || !key || !recognizedKeys.has(key)) {
          isMatch = false;
          continue;
        }
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

// ── Extra services ────────────────────────────────────────────────────────
// Each service's fee comes from an active FIXED pricing rule whose condition
// is "service=<id>" (org rule wins over global); otherwise these defaults.
// computePrice() ignores such rules (unrecognised condition key), so they
// only ever apply here.
const SERVICE_DEFAULTS: Record<string, { label: string; fee: number }> = {
  insurance: { label: "Cargo insurance", fee: 3000 },
  packaging: { label: "Secure packaging", fee: 2000 },
  fragile: { label: "Special handling", fee: 2500 },
};

const computeServiceFees = async (services: unknown, organizationId?: string | null) => {
  const ids = Array.isArray(services)
    ? [...new Set(services.filter((x): x is string => typeof x === "string" && x in SERVICE_DEFAULTS))]
    : [];
  if (ids.length === 0) return { total: 0, lines: [] as { id: string; label: string; amount: number }[] };

  const rules = await prisma.pricingRule.findMany({
    where: {
      isActive: true,
      deletedAt: null,
      type: "FIXED",
      condition: { in: ids.map((id) => `service=${id}`) },
      OR: [{ organizationId: null }, { organizationId: organizationId || undefined }],
    },
    orderBy: [{ organizationId: "desc" }],
  });

  const lines = ids.map((id) => {
    const rule = rules.find((r) => r.condition === `service=${id}`);
    return { id, label: SERVICE_DEFAULTS[id].label, amount: rule ? rule.value : SERVICE_DEFAULTS[id].fee };
  });
  return { total: lines.reduce((sum, l) => sum + l.amount, 0), lines };
};

/// Name of the staff member making the request, for tracking notes.
/// The login token only carries id/role, so look the name up.
const actorName = async (req: Request): Promise<string> => {
  const fromToken = (req.user as any)?.name;
  if (fromToken) return fromToken;
  if (!req.user?.id) return "station staff";
  const user = await prisma.user.findUnique({ where: { id: req.user.id }, select: { name: true } });
  return user?.name || "station staff";
};

/// Picks the SGR tariff purely by weight: the tariff with the smallest weight
/// limit that can still carry the parcel (e.g. ≤ 0.5 kg → envelope tariff,
/// above that → other parcels, including anything over 5 kg). Parcel type and
/// size don't affect the choice. Returns null only when no tariff exists.
const tariffMeta = (rule: { condition: string | null }) => {
  try {
    const meta = JSON.parse(rule.condition || "{}");
    const category = meta.parcelCategory ?? {};
    return {
      sgrId: meta.sgrId as string | undefined,
      mode: String(category.chargingMode || "Fixed_Amount"),
      maxKg: Number(category.maxWeightInKg) || null,
    };
  } catch (_) {
    return { sgrId: undefined, mode: "Fixed_Amount", maxKg: null };
  }
};

const findSgrTariff = async (input: { weight?: number | null; organizationId?: string | null }) => {
  const rules = await prisma.pricingRule.findMany({
    where: {
      type: "SGR_TARIFF",
      isActive: true,
      deletedAt: null,
      OR: [{ organizationId: null }, { organizationId: input.organizationId ?? undefined }],
    },
    orderBy: [{ organizationId: "desc" }, { createdAt: "asc" }],
  });
  const weight = Number(input.weight) || 0;
  const sorted = rules
    .map((rule) => ({ rule, maxKg: tariffMeta(rule).maxKg }))
    .sort((a, b) => (a.maxKg ?? Infinity) - (b.maxKg ?? Infinity));
  // Heavier than every limit → the largest tariff (other parcels) still applies.
  return (sorted.find((t) => t.maxKg == null || weight <= t.maxKg) ?? sorted[sorted.length - 1])?.rule ?? null;
};

/// Local charge for a tariff: Fixed_Amount → the rule value;
/// Percentage_Wise → value% of the declared parcel value.
const tariffCharge = (rule: { value: number; name: string; condition: string | null }, declaredValue: number) => {
  const { mode } = tariffMeta(rule);
  if (mode === "Percentage_Wise") {
    return {
      amount: Math.ceil(((Number(rule.value) || 0) / 100) * (Number(declaredValue) || 0)),
      detail: `${+Number(rule.value)}% of declared value TSh ${(Number(declaredValue) || 0).toLocaleString("en-US")}`,
    };
  }
  return { amount: Math.ceil(Number(rule.value) || 0), detail: `${rule.name} · fixed` };
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
    lostReport: meta.lostReport
      ? { reportedAt: meta.lostReport.reportedAt, resolved: !!meta.lostReport.resolved }
      : null,
    paymentMode: meta.paymentMode || "PAY_AS_YOU_GO",
    status: normalizeStatus(parcel.status),
    price: parcel.amount ?? null,
    createdAt: parcel.createdAt,
    updatedAt: parcel.updatedAt,
    organization: parcel.organization
      ? {
          id: parcel.organization.id,
          name: parcel.organization.name,
          logoUrl: parcel.organization.logoUrl ?? null,
          primaryColor: parcel.organization.primaryColor ?? null,
          secondaryColor: parcel.organization.secondaryColor ?? null,
        }
      : parcel.organizationId ? { id: parcel.organizationId } : null,
    origin: parcel.origin
      ? { id: parcel.origin.id, name: parcel.origin.name, code: parcel.origin.code }
      : parcel.originId ? { id: parcel.originId } : null,
    destination: parcel.destination
      ? { id: parcel.destination.id, name: parcel.destination.name, code: parcel.destination.code }
      : parcel.destinationId ? { id: parcel.destinationId } : null,
    agent: parcel.approvedBy
      ? { name: parcel.approvedBy.name, phone: parcel.approvedBy.phone || null }
      : parcel.user
        ? { name: parcel.user.name, phone: parcel.user.phone || null }
        : null,
    additionalServices: parcel.additionalServices,
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
      additionalServices: extraServices,
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

    if (Number(weight) > 0.5 && !(Number(declaredValue) > 0)) {
      return sendError(res, "VALIDATION_ERROR", "Declared value is required for parcels over 0.5 kg", 400);
    }

    // Same tariff selection as /quote (by weight).
    const tariffRule = await findSgrTariff({
      weight: Number(weight),
      organizationId: req.user?.organizationId ?? null,
    });

    let totalPriceVal = 0;
    let trackingNumberVal = "";
    let isSgrBookingSuccess = false;
    let breakdownVal: any = {};

    if (originStation && destinationStation) {
      try {
        // Resolve tariff fields from the local rule if found, otherwise use safe defaults
        let sgrTariffId = tariffRule?.id ?? "default";
        let sgrTariffName = tariffRule?.name ?? String(packageName || "Standard");
        if (tariffRule?.condition) {
          try {
            const meta = JSON.parse(tariffRule.condition);
            if (meta.sgrId) sgrTariffId = meta.sgrId;
          } catch (_) {}
        }

        // 1. Fetch live price from TRC SGR (station-to-station weight-based cost)
        const sgrCost = await calculateSgrCost({
          originStation: {
            id: originStation.id,
            name: originStation.name,
          },
          destinationStation: {
            id: destinationStation.id,
            name: destinationStation.name,
          },
          weightInKg: Number(weight || 0.1),
          tariffId: {
            id: sgrTariffId,
            name: sgrTariffName,
          },
          declaration: {
            itemName: String(packageName || parcelType || "Parcel"),
            currency: "TZS",
            declaredPrice: Number(declaredValue || 0),
          },
        });

        if (sgrCost && sgrCost.totalCharge) {
          totalPriceVal = sgrCost.totalCharge;
        }

        // 2. Register the booking with TRC SGR to get an official parcelRef
        const sgrBooking = await bookSgrParcel({
          sourceRef: `MZG-${Date.now()}-${Math.floor(1000 + Math.random() * 9000)}`,
          senderName: String(senderName || "Sender"),
          senderAddress: originStation.name,
          senderPhoneNumber: String(senderPhone || ""),
          sameAsSender: false,
          receiverName: String(receiverName || "Receiver"),
          receiverAddress: destinationStation.name,
          receiverPhoneNumber: String(receiverPhone || ""),
          parcelName: String(parcelType || "Parcel"),
          parcelDescription: String(description || "No description"),
          totalItems: 1,
          declaredWeightInKg: Number(weight || 0),
          declaredLengthInCm: 0,
          declaredWidthInCm: 0,
          declaredHeightInCm: 0,
          declaredCubicVolume: 0,
          originStation: {
            id: originStation.id,
            name: originStation.name,
          },
          destinationStation: {
            id: destinationStation.id,
            name: destinationStation.name,
          },
          tariff: {
            id: sgrTariffId,
            name: sgrTariffName,
          },
          declaration: {
            itemName: String(packageName || parcelType || "Parcel"),
            currency: "TZS",
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

    if (!isSgrBookingSuccess && totalPriceVal <= 0 && tariffRule) {
      // SGR gave no price: charge the matched tariff (fixed or % of value).
      const charge = tariffCharge(tariffRule, Number(declaredValue || 0));
      totalPriceVal = charge.amount;
      breakdownVal = { tariff: tariffRule.name, detail: charge.detail, transport: charge.amount };
    } else if (!isSgrBookingSuccess && totalPriceVal <= 0) {
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
    }

    if (!isSgrBookingSuccess) {
      const parcelCount = await (prisma as any).parcel.count();
      trackingNumberVal = generateTracking(parcelCount);
    }

    // Extra services are charged on top of the transport price.
    const serviceFees = await computeServiceFees(extraServices, req.user?.organizationId ?? null);
    totalPriceVal += serviceFees.total;
    breakdownVal = { ...breakdownVal, services: serviceFees.lines, servicesTotal: serviceFees.total };

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
        approvedById: req.user?.id,
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
          // Extra services picked at the counter (e.g. insurance, packaging, fragile).
          services: Array.isArray(extraServices)
            ? extraServices.filter((x: unknown) => typeof x === "string").slice(0, 10)
            : [],
        },
      },
      include: {
        organization: true,
        origin: true,
        destination: true,
        approvedBy: { select: { id: true, name: true, email: true, phone: true } },
        user: { select: { id: true, name: true, email: true, phone: true } },
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

    // req.user only carries ids/role from the token, so load the clerk's
    // name and phone for the tracking note and the receipt SMS.
    const clerk = req.user?.id
      ? await prisma.user.findUnique({
          where: { id: String(req.user.id) },
          select: { name: true, phone: true },
        })
      : null;

    // Create Tracking entry
    await (prisma as any).parcelTracking.create({
      data: {
        parcelId: parcel.id,
        status: "RECEIVED",
        location: originStation?.name ?? null,
        description: `Received by ${clerk?.name || "station staff"}`,
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
      agentName: clerk?.name || "Karani",
      agentPhone: clerk?.phone || "",
      orgName: (parcel as any).organization?.name || undefined,
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

// Customer self-service parcel request. Unlike /receive (operator-mediated,
// station-to-station, requires org/station tenant context), this is a
// door-to-door request submitted by any authenticated user — including
// plain customers with no organizationId — left in PENDING status for an
// admin to review, price, and assign to stations/organization/vehicle.
router.post("/", authenticate, async (req: Request, res: Response) => {
  try {
    const {
      fromAddress,
      toAddress,
      pickup,
      delivery,
      pickupType,
      serviceType,
      vehicle,
      peopleNeeded,
      parcelType,
      parcelSize,
      packageSize,
      receiverName,
      receiverPhone,
      receiverPays,
      additionalServices,
      weight,
      condition,
      urgency,
      packageName,
      packageValue,
      parcelDescription,
      total,
    } = req.body;

    const resolvedFromAddress = fromAddress || pickup;
    const resolvedToAddress = toAddress || delivery;
    const resolvedServiceType = serviceType || vehicle;
    const resolvedParcelSize = parcelSize || packageSize;

    if (
      !resolvedFromAddress ||
      !resolvedToAddress ||
      !receiverName ||
      !receiverPhone ||
      !parcelType ||
      !resolvedParcelSize
    ) {
      return sendError(
        res,
        "VALIDATION_ERROR",
        "Missing required fields for parcel request",
        400,
      );
    }

    const noteParts: string[] = [];
    if (packageName) noteParts.push(`Package: ${packageName}`);
    if (packageValue) noteParts.push(`Declared value: ${packageValue}`);
    if (typeof total === "number") noteParts.push(`Customer-estimated total: ${total}`);
    if (parcelDescription) noteParts.push(String(parcelDescription));

    const parcelCount = await (prisma as any).parcel.count();

    const parcel = await (prisma as any).parcel.create({
      data: {
        userId: req.user?.id,
        organizationId: req.user?.organizationId ?? null,
        trackingNumber: generateTracking(parcelCount),
        fromAddress: String(resolvedFromAddress),
        toAddress: String(resolvedToAddress),
        pickupType: String(pickupType || "DOOR_PICKUP"),
        serviceType: String(resolvedServiceType || "Standard"),
        peopleNeeded: Number(peopleNeeded || 0),
        parcelType: String(parcelType),
        parcelSize: String(resolvedParcelSize),
        receiverName: String(receiverName),
        receiverPhone: String(receiverPhone),
        receiverPays: Boolean(receiverPays || false),
        condition: condition ? String(condition) : null,
        urgency: urgency ? String(urgency) : "Normal",
        weight: Number(weight || 0),
        specialInstructions: noteParts.length ? noteParts.join(" | ") : null,
        // Extra services requested (packaging/insurance/etc) — kept as a
        // plain array here, distinct from /receive's use of this same JSON
        // column to store sender/payment metadata (readParcelMeta() already
        // guards on Array.isArray so the two usages never collide).
        additionalServices: Array.isArray(additionalServices) ? additionalServices : [],
        // No authoritative price yet — the client's estimate is never
        // trusted as a charge. An admin sets/confirms amount on review.
        amount: null,
        status: "PENDING",
      },
    });

    await (prisma as any).parcelTracking.create({
      data: {
        parcelId: parcel.id,
        status: "PENDING",
        description: "Parcel request submitted by customer, pending admin review",
      },
    });

    await logAudit({
      userId: req.user?.id,
      action: "CREATE",
      resource: "parcel.request",
      details: { id: parcel.id, trackingNumber: parcel.trackingNumber },
    });

    return sendSuccess(res, formatParcelResponse(parcel), 201);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/search", ...secure, async (req: Request, res: Response) => {
  try {
    const q = String(req.query.q || "");
    if (!q) {
      return sendSuccess(res, []);
    }
    
    const parcels = await (prisma as any).parcel.findMany({
      where: {
        OR: [
          { id: { contains: q, mode: "insensitive" } },
          { trackingNumber: { contains: q, mode: "insensitive" } },
          { receiverPhone: { contains: q, mode: "insensitive" } },
          { receiverName: { contains: q, mode: "insensitive" } },
        ],
      },
      orderBy: { createdAt: "desc" },
      take: 20,
      include: {
        organization: true,
        origin: true,
        destination: true,
        approvedBy: { select: { id: true, name: true, email: true, phone: true } },
        user: { select: { id: true, name: true, email: true, phone: true } },
      },
    });

    return sendSuccess(res, parcels.map((p: any) => formatParcelResponse(p)));
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
      
      const [received, delivered, sent, atWarehouse, total] = await Promise.all([
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
        (prisma as any).parcel.count({
          where: {
            OR: [
              { originId: stationId },
              { fromAddress: stationId },
              { destinationId: stationId },
              { toAddress: stationId }
            ],
            ...dateFilter,
          },
        }),
      ]);

      return { received, delivered, sent, atWarehouse, total };
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

// Pre-submission price quote using the same tariff engine (computePrice())
// that /receive charges from — so a quote shown to a customer before they
// submit a request always matches what an operator/admin would actually
// charge for the same inputs. No org/station required, so plain customers
// (no organizationId) can get a quote too.
router.post("/quote", authenticate, async (req: Request, res: Response) => {
  try {
    const {
      weight,
      declaredValue,
      urgency,
      parcelType,
      packageSize,
      condition,
      packageName,
      receivingStationId,
      destinationStationId,
      additionalServices,
    } = req.body;

    if (!weight || !urgency || !parcelType || !packageSize) {
      return sendError(
        res,
        "VALIDATION_ERROR",
        "weight, urgency, parcelType and packageSize are required for a price quote",
        400,
      );
    }

    if (Number(weight) > 0.5 && !(Number(declaredValue) > 0)) {
      return sendError(res, "VALIDATION_ERROR", "Declared value is required for parcels over 0.5 kg", 400);
    }

    const orgId = req.user?.organizationId ?? null;
    const lines: { label: string; detail?: string; amount: number }[] = [];
    let transport = 0;
    let source: "SGR" | "TARIFF" = "TARIFF";
    let distanceInKm: number | null = null;
    let tariff: Awaited<ReturnType<typeof findSgrTariff>> = null;

    // Same order as /receive: live SGR cost when both stations are known…
    if (receivingStationId && destinationStationId) {
      const [origin, destination] = await Promise.all([
        prisma.station.findUnique({ where: { id: String(receivingStationId) } }),
        prisma.station.findUnique({ where: { id: String(destinationStationId) } }),
      ]);
      if (origin && destination) {
        try {
          tariff = await findSgrTariff({
            weight: Number(weight),
            organizationId: orgId,
          });
          let tariffId = tariff?.id ?? "default";
          if (tariff?.condition) {
            try {
              const meta = JSON.parse(tariff.condition);
              if (meta.sgrId) tariffId = meta.sgrId;
            } catch (_) {}
          }
          const sgr = await calculateSgrCost({
            originStation: { id: origin.id, name: origin.name },
            destinationStation: { id: destination.id, name: destination.name },
            weightInKg: Number(weight || 0.1),
            tariffId: { id: tariffId, name: tariff?.name ?? String(packageName || "Standard") },
            declaration: {
              itemName: String(packageName || parcelType || "Parcel"),
              currency: "TZS",
              declaredPrice: Number(declaredValue || 0),
            },
          });
          if (sgr?.totalCharge) {
            source = "SGR";
            transport = sgr.totalCharge;
            distanceInKm = sgr.distanceInKm ?? null;
            lines.push({
              label: "Transport",
              detail: `${tariff?.name ?? "SGR"} tariff${sgr.distanceInKm ? ` · ${sgr.distanceInKm} km` : ""}`,
              amount: sgr.parcelCharge,
            });
            if (sgr.taxedAmount) lines.push({ label: "Tax", amount: sgr.taxedAmount });
          }
        } catch (_) {
          // Fall through to the tariff engine, exactly like /receive.
        }
      }
    }

    // SGR gave no price: charge the weight-matched tariff locally.
    if (source === "TARIFF" && !tariff) {
      tariff = await findSgrTariff({ weight: Number(weight), organizationId: orgId });
    }
    if (source === "TARIFF" && tariff) {
      const charge = tariffCharge(tariff, Number(declaredValue || 0));
      transport = charge.amount;
      lines.push({ label: "Transport", detail: charge.detail, amount: charge.amount });
    } else if (source === "TARIFF") {
      // …and only when no tariff can carry the weight, the general pricing rules.
      const { totalPrice, breakdown } = await computePrice({
        weight: Number(weight),
        declaredValue: Number(declaredValue || 0),
        urgency: String(urgency),
        parcelType: String(parcelType),
        parcelSize: String(packageSize),
        condition: String(condition || ""),
        organizationId: orgId,
      });
      transport = totalPrice;
      lines.push({ label: "Base fee", amount: breakdown.baseFee });
      if (breakdown.weightFee) {
        lines.push({
          label: "Weight",
          detail: `${Number(weight)} kg × TSh ${breakdown.weightFeeRate.toLocaleString("en-US")}`,
          amount: breakdown.weightFee,
        });
      }
      if (breakdown.valueFee) {
        lines.push({
          label: "Declared value",
          detail: `${+(breakdown.valueFeeRate * 100).toFixed(2)}% of value`,
          amount: breakdown.valueFee,
        });
      }
      if (breakdown.additionalFixedFees) lines.push({ label: "Other fees", amount: breakdown.additionalFixedFees });
      const adjustment = totalPrice - breakdown.subTotal;
      if (Math.abs(adjustment) >= 1) {
        lines.push({
          label: breakdown.totalMultiplier !== 1 ? "Priority & type adjustment" : "Rounding",
          detail: breakdown.totalMultiplier !== 1 ? `× ${+breakdown.totalMultiplier.toFixed(2)}` : undefined,
          amount: adjustment,
        });
      }
    }

    const services = await computeServiceFees(additionalServices, orgId);

    return sendSuccess(res, {
      currency: "TZS",
      source,
      distanceInKm,
      transport,
      lines,
      services: services.lines,
      servicesTotal: services.total,
      amount: transport + services.total,
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
        approvedBy: { select: { id: true, name: true, email: true, phone: true } },
        user: { select: { id: true, name: true, email: true, phone: true } },
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
        description: `Dispatched by ${await actorName(req)} with vehicle ${updatedParcel.vehicle?.plateNumber || "Unknown"}`,
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
  // receivingClerkId (optional): the destination clerk the parcel is handed to.
  const { parcelId, receivingClerkId } = req.body;
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

    let receivingClerk: { id: string; name: string | null } | null = null;
    if (receivingClerkId) {
      receivingClerk = await prisma.user.findFirst({
        where: {
          id: String(receivingClerkId),
          role: { name: "CLERK" },
          ...(req.user?.organizationId
            ? { organizationId: req.user.organizationId }
            : {}),
        },
        select: { id: true, name: true },
      });
      if (!receivingClerk) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "Receiving clerk not found in your organization",
          400,
        );
      }
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
        description:
          `Offloaded by ${await actorName(req)} at ${updatedParcel.destination?.name || "Station"}` +
          (receivingClerk ? `, handed to ${receivingClerk.name ?? "clerk"}` : ""),
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
      details: {
        parcelId,
        trackingNumber: parcel.trackingNumber,
        receivingClerkId: receivingClerk?.id ?? null,
      },
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
        description: `Delivered by ${await actorName(req)}`,
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
        description: `Canceled by ${await actorName(req)}. Reason: ${cancellationReason}`,
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

// ── Lost parcels ────────────────────────────────────────────────────────────────

const LOST_BLOCKED = ["DELIVERED", "CANCELED", "REJECTED", "LOST"];
const STAFF_LOST_ROLES = ["SUPER_ADMIN", "ADMIN", "STATION_MASTER", "CLERK", "TRAIN_GUARD"];
const phoneTail = (p?: string | null) => String(p ?? "").replace(/\D/g, "").slice(-9);

/**
 * POST /parcel/track/:trackingNumber/report-lost  (public)
 * Sender or receiver reports a missing parcel. Verified by their phone number.
 * Flags the parcel for staff review; the status is not changed.
 */
router.post(
  "/track/:trackingNumber/report-lost",
  publicTrackingLimit,
  async (req: Request, res: Response) => {
    try {
      const { trackingNumber } = req.params;
      const { phone, details } = req.body ?? {};
      const tail = phoneTail(phone);
      if (tail.length < 9) {
        return sendError(res, "VALIDATION_ERROR", "Enter the sender's or receiver's phone number", 400);
      }

      const parcel = await (prisma as any).parcel.findFirst({ where: { trackingNumber } });
      if (!parcel) return sendError(res, "NOT_FOUND", "Parcel not found", 404);

      const meta = readParcelMeta(parcel.additionalServices);
      const reportedBy =
        tail === phoneTail(parcel.receiverPhone) ? "RECEIVER" : tail === phoneTail(meta.senderPhone) ? "SENDER" : null;
      if (!reportedBy) {
        return sendError(res, "FORBIDDEN", "That phone number doesn't match this parcel's sender or receiver", 403);
      }
      if (LOST_BLOCKED.includes(parcel.status)) {
        return sendError(res, "VALIDATION_ERROR", "This parcel can no longer be reported as lost", 400);
      }
      if (meta.lostReport && !meta.lostReport.resolved) {
        return sendSuccess(res, { alreadyReported: true, reportedAt: meta.lostReport.reportedAt });
      }

      const note = String(details ?? "").trim().slice(0, 500);
      const reportedAt = new Date().toISOString();
      await (prisma as any).parcel.update({
        where: { id: parcel.id },
        data: {
          additionalServices: {
            ...meta,
            lostReport: { reportedAt, reportedBy, ...(note ? { details: note } : {}), resolved: false },
          },
        },
      });
      await (prisma as any).parcelTracking.create({
        data: {
          parcelId: parcel.id,
          status: parcel.status,
          description: `Reported missing by the ${reportedBy === "RECEIVER" ? "receiver" : "sender"}. Staff are looking into it.`,
        },
      });

      return sendSuccess(res, { alreadyReported: false, reportedAt });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

const loadStaffParcel = async (req: Request, res: Response) => {
  if (!STAFF_LOST_ROLES.includes(String(req.user?.role))) {
    sendError(res, "FORBIDDEN", "You don't have permission to do this", 403);
    return null;
  }
  const parcel = await (prisma as any).parcel.findUnique({ where: { id: req.params.id } });
  if (
    !parcel ||
    (req.user?.role !== "SUPER_ADMIN" && parcel.organizationId && parcel.organizationId !== req.user?.organizationId)
  ) {
    sendError(res, "NOT_FOUND", "Parcel not found", 404);
    return null;
  }
  return parcel;
};

/**
 * POST /parcel/:id/mark-lost  (staff)
 * Sets the parcel to LOST and closes any open customer report.
 */
router.post("/:id/mark-lost", ...secure, async (req: Request, res: Response) => {
  try {
    const parcel = await loadStaffParcel(req, res);
    if (!parcel) return;
    if (LOST_BLOCKED.includes(parcel.status)) {
      return sendError(res, "VALIDATION_ERROR", "This parcel can't be marked as lost", 400);
    }
    const reason = String(req.body?.reason ?? "").trim().slice(0, 500);
    const meta = readParcelMeta(parcel.additionalServices);
    const now = new Date().toISOString();
    const updated = await (prisma as any).parcel.update({
      where: { id: parcel.id },
      data: {
        status: "LOST",
        additionalServices: meta.lostReport
          ? { ...meta, lostReport: { ...meta.lostReport, resolved: true, resolvedAt: now, resolution: "MARKED_LOST" } }
          : meta,
      },
    });
    await (prisma as any).parcelTracking.create({
      data: {
        parcelId: parcel.id,
        status: "LOST",
        description: `Marked as lost by ${await actorName(req)}${reason ? `. Reason: ${reason}` : ""}`,
      },
    });
    await logAudit({
      userId: req.user!.id,
      action: "PARCEL_MARKED_LOST",
      resource: `Parcel:${parcel.id}`,
      details: { reason },
    }).catch(() => {});
    return sendSuccess(res, { id: updated.id, status: updated.status });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

/**
 * POST /parcel/:id/resolve-lost-report  (staff)
 * Closes a customer's lost report when the parcel has been found.
 */
router.post("/:id/resolve-lost-report", ...secure, async (req: Request, res: Response) => {
  try {
    const parcel = await loadStaffParcel(req, res);
    if (!parcel) return;
    const meta = readParcelMeta(parcel.additionalServices);
    if (!meta.lostReport || meta.lostReport.resolved) {
      return sendError(res, "VALIDATION_ERROR", "There's no open lost report on this parcel", 400);
    }
    const note = String(req.body?.note ?? "").trim().slice(0, 500);
    await (prisma as any).parcel.update({
      where: { id: parcel.id },
      data: {
        additionalServices: {
          ...meta,
          lostReport: { ...meta.lostReport, resolved: true, resolvedAt: new Date().toISOString(), resolution: "FOUND" },
        },
      },
    });
    await (prisma as any).parcelTracking.create({
      data: {
        parcelId: parcel.id,
        status: parcel.status,
        description: `Located by ${await actorName(req)}${note ? `. ${note}` : ""}`,
      },
    });
    return sendSuccess(res, { resolved: true });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});


router.get("/:id", ...secure, async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const parcel = await (prisma as any).parcel.findUnique({
      where: { id },
      include: {
        user: { select: { id: true, name: true, email: true, phone: true } },
        payment: true,
        approvedBy: { select: { id: true, name: true, email: true, phone: true } },
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
    // Summary fields plus everything the staff detail views need. Additive,
    // so existing clients (mobile) keep working.
    const meta = readParcelMeta(parcel.additionalServices) as any;
    return sendSuccess(res, {
      ...formatParcelResponse(parcel),
      amount: parcel.amount,
      weight: parcel.weight,
      length: parcel.length ?? null,
      width: parcel.width ?? null,
      height: parcel.height ?? null,
      isFragile: parcel.isFragile,
      receiverPays: parcel.receiverPays,
      specialInstructions: parcel.specialInstructions ?? null,
      rejectionReason: parcel.rejectionReason ?? null,
      services: Array.isArray(meta.services) ? meta.services : [],
      additionalServices: parcel.additionalServices ?? null,
      payment: parcel.payment ?? null,
      tracking: parcel.tracking ?? [],
      user: parcel.user ?? null,
      approvedBy: parcel.approvedBy ?? null,
      dispatcher: parcel.dispatcher ?? null,
      offloader: parcel.offloader ?? null,
      deliverer: parcel.deliverer ?? null,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
