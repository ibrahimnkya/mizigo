import crypto from "crypto";
import { prisma } from "@repo/database";
import { createServiceLogger } from "./logger";

const logger = createServiceLogger("sgr-client");

export interface SgrStationExternal {
  id: string;
  name: string;
  code: string;
  isActive?: boolean;
}

export interface SgrTariffExternal {
  id: string;
  name: string;
  description: string;
  minimumCharge: number;
  distanceRate: number;
  weightRate: number;
  parcelCategory: {
    id: string;
    name: string;
    code: string;
    description: string;
    chargingMode: string;
    maxWeightInKg: number | null;
    maxLengthInCm: number | null;
    maxWidthInCm: number | null;
    maxHeightInCm: number | null;
    cubicVolumeLimit: number | null;
  };
}

/**
 * Loads SGR Portal Integration Configuration from Database or Env
 */
export const loadSgrConfig = async () => {
  const integration = await prisma.integration.findFirst({
    where: { type: "SGR_PORTAL", isActive: true, deletedAt: null },
    orderBy: { updatedAt: "desc" },
  });

  const config = (integration?.config || {}) as Record<string, any>;
  return {
    // Non-secret structural config: DB override takes precedence, since it's
    // meant to be admin-editable via the Integrations UI without a redeploy.
    baseUrl:
      config.baseUrl ||
      process.env.SGR_BASE_URL ||
      "https://dev.trc.co.tz/ecargo_sgr",
    serviceName:
      config.serviceName || process.env.SGR_SERVICE_NAME || "SETL_SERVICE",
    headerService:
      config.headerService ||
      process.env.SGR_HEADER_SERVICE ||
      "ANONYMOUS_SERVICE",
    // Credentials: env vars take precedence over the DB row. The DB's
    // sgr-portal-default-integration row currently holds an unregistered
    // clientRef/publicKey with no privateKey at all — env is the intended
    // source of truth for real TRC-issued credentials so they can be
    // rotated by redeploy without editing DB rows.
    clientRef: process.env.SGR_CLIENT_REF || config.clientRef || "",
    privateKey: process.env.SGR_PRIVATE_KEY || config.privateKey || "",
    publicKey: process.env.SGR_PUBLIC_KEY || config.publicKey || "",
  };
};

/**
 * Signs payload using RSA-SHA256 (Base64 signature)
 */
export const signPayload = (payload: string, privateKeyPem: string): string => {
  if (!privateKeyPem) {
    logger.warn("signing_skipped_missing_private_key");
    return "MOCK_SIGNATURE_PLACEHOLDER";
  }

  try {
    const sign = crypto.createSign("RSA-SHA256");
    sign.update(payload);
    
    let formattedKey = privateKeyPem.trim();
    if (
      !formattedKey.includes("-----BEGIN RSA PRIVATE KEY-----") &&
      !formattedKey.includes("-----BEGIN PRIVATE KEY-----")
    ) {
      // Wrap it dynamically if header/footer are missing
      formattedKey = `-----BEGIN PRIVATE KEY-----\n${formattedKey}\n-----END PRIVATE KEY-----`;
    }
    
    return sign.sign(formattedKey, "base64");
  } catch (error: any) {
    logger.error("signing_failed", { error: error.message });
    return "SIGNING_FAILED";
  }
};

/**
 * Builds signed headers for an SGR GET request.
 * Payload format: timestamp + ".{}"  (from Postman pre-request script)
 */
const buildSgrHeaders = async (
  config: Awaited<ReturnType<typeof loadSgrConfig>>,
): Promise<Record<string, string>> => {
  const timestamp = Date.now().toString();
  const signature = signPayload(`${timestamp}.{}`, config.privateKey);
  return {
    Accept: "application/json",
    "Content-Type": "application/json",
    "X-Service-Name": config.serviceName,
    "X-Header-Service": config.headerService,
    "X-Timestamp": timestamp,
    "X-Signature": signature,
    clientRef: config.clientRef,
  };
};

/**
 * Fetch stations list from SGR Portal API
 */
export const fetchSgrStations = async (): Promise<SgrStationExternal[]> => {
  try {
    const config = await loadSgrConfig();
    const headers = await buildSgrHeaders(config);
    let baseUrl = config.baseUrl.trim();
    if (baseUrl.endsWith("/")) baseUrl = baseUrl.slice(0, -1);
    const url = `${baseUrl}/sec/trc/sgr-parcel/v1/fetch/sgr-stations`;
    logger.info("fetching_sgr_stations", { url });

    const response = await fetch(url, {
      method: "GET",
      headers,
    });

    if (!response.ok) {
      let errorBody = "";
      try {
        errorBody = await response.text();
      } catch (_) {}
      throw new Error(`SGR API error: ${response.status} ${response.statusText}${errorBody ? ` - ${errorBody}` : ""}`);
    }

    const result = (await response.json()) as {
      code: string;
      message: string;
      data: SgrStationExternal[];
      timestamp: string;
    };

    const isSuccess = result.code === "SUCCESS" || (result as any).success === true;
    if (!isSuccess || !Array.isArray(result.data)) {
      throw new Error(result.message || (result as any).error?.message || "Failed to fetch SGR stations data");
    }

    return result.data;
  } catch (error: any) {
    logger.error("failed_to_fetch_sgr_stations", { error: error.message });
    throw error;
  }
};

/**
 * Fetch parcel tariffs from SGR Portal API
 */
export const fetchSgrTariffs = async (): Promise<SgrTariffExternal[]> => {
  try {
    const config = await loadSgrConfig();
    const headers = await buildSgrHeaders(config);
    let baseUrl = config.baseUrl.trim();
    if (baseUrl.endsWith("/")) baseUrl = baseUrl.slice(0, -1);
    const url = `${baseUrl}/sec/trc/sgr-parcel/v1/fetch/parcel-tariffs`;
    logger.info("fetching_sgr_tariffs", { url });

    const response = await fetch(url, { method: "GET", headers });

    if (!response.ok) {
      let errorBody = "";
      try {
        errorBody = await response.text();
      } catch (_) {}
      throw new Error(`SGR API error: ${response.status} ${response.statusText}${errorBody ? ` - ${errorBody}` : ""}`);
    }

    const result = (await response.json()) as {
      code: string;
      message: string;
      data: SgrTariffExternal[];
    };

    const isSuccess = result.code === "SUCCESS" || (result as any).success === true;
    if (!isSuccess || !Array.isArray(result.data)) {
      throw new Error(result.message || "Failed to fetch SGR tariff data");
    }

    return result.data;
  } catch (error: any) {
    logger.error("failed_to_fetch_sgr_tariffs", { error: error.message });
    throw error;
  }
};

export interface SgrBookingInput {
  sourceRef: string;
  senderName: string;
  senderAddress: string;
  senderPhoneNumber: string;
  senderEmail?: string | null;
  sameAsSender: boolean;
  receiverName: string;
  receiverAddress: string;
  receiverPhoneNumber: string;
  receiverEmail?: string | null;
  parcelName: string;
  parcelDescription: string;
  totalItems: number;
  declaredWeightInKg: number;
  declaredLengthInCm: number;
  declaredWidthInCm: number;
  declaredHeightInCm: number;
  declaredCubicVolume: number;
  originStation: {
    id: string;
    name: string;
  };
  destinationStation: {
    id: string;
    name: string;
  };
  tariff: {
    id: string;
    name: string;
  };
  declaration: {
    itemName: string;
    currency: string;
    declaredPrice: number;
  };
}

/**
 * Initiate SGR Parcel Booking on TRC SGR Portal
 */
export const bookSgrParcel = async (data: SgrBookingInput) => {
  try {
    const config = await loadSgrConfig();
    const timestamp = Date.now().toString();
    const body = { clientRef: config.clientRef, data };
    const payload = `${timestamp}.${JSON.stringify(body)}`;
    const signature = signPayload(payload, config.privateKey);

    const headers = {
      Accept: "application/json",
      "Content-Type": "application/json",
      "X-Service-Name": config.serviceName,
      "X-Header-Service": config.headerService,
      "X-Timestamp": timestamp,
      "X-Signature": signature,
      clientRef: config.clientRef,
    };

    let baseUrl = config.baseUrl.trim();
    if (baseUrl.endsWith("/")) baseUrl = baseUrl.slice(0, -1);
    const url = `${baseUrl}/sec/trc/sgr-parcel/manage/parcel-booking`;
    logger.info("booking_sgr_parcel", { url, sourceRef: data.sourceRef });

    const response = await fetch(url, {
      method: "POST",
      headers,
      body: JSON.stringify(body),
    });

    if (!response.ok) {
      let errorBody = "";
      try {
        errorBody = await response.text();
      } catch (_) {}
      throw new Error(`SGR Booking API error: ${response.status} ${response.statusText}${errorBody ? ` - ${errorBody}` : ""}`);
    }

    const result = (await response.json()) as {
      code: string;
      message: string;
      data: {
        parcelRef: string;
        status: string;
      };
    };

    const isSuccess = result.code === "SUCCESS" || (result as any).success === true;
    if (!isSuccess || !result.data) {
      throw new Error(result.message || "Failed to book SGR parcel");
    }

    return result.data;
  } catch (error: any) {
    logger.error("failed_to_book_sgr_parcel", { error: error.message });
    throw error;
  }
};

/**
 * Calculate SGR Parcel cost dynamically from TRC SGR Portal
 */
export const calculateSgrCost = async (input: {
  originStation: { id: string; name: string };
  destinationStation: { id: string; name: string };
  weightInKg: number;
  tariffId: { id: string; name: string };
  declaration: { itemName: string; currency: string; declaredPrice: number };
}) => {
  try {
    const config = await loadSgrConfig();
    const timestamp = Date.now().toString();
    const body = { clientRef: config.clientRef, data: input };
    const payload = `${timestamp}.${JSON.stringify(body)}`;
    const signature = signPayload(payload, config.privateKey);

    const headers = {
      Accept: "application/json",
      "Content-Type": "application/json",
      "X-Service-Name": config.serviceName,
      "X-Header-Service": config.headerService,
      "X-Timestamp": timestamp,
      "X-Signature": signature,
      clientRef: config.clientRef,
    };

    let baseUrl = config.baseUrl.trim();
    if (baseUrl.endsWith("/")) baseUrl = baseUrl.slice(0, -1);
    const url = `${baseUrl}/sec/trc/sgr-parcel/get/parcel-cost`;
    logger.info("calculating_sgr_cost", { url });

    const response = await fetch(url, {
      method: "POST",
      headers,
      body: JSON.stringify(body),
    });

    if (!response.ok) {
      let errorBody = "";
      try {
        errorBody = await response.text();
      } catch (_) {}
      throw new Error(`SGR Cost API error: ${response.status} ${response.statusText}${errorBody ? ` - ${errorBody}` : ""}`);
    }

    const result = (await response.json()) as {
      code: string;
      message: string;
      data: {
        parcelCharge: number;
        taxedAmount: number;
        totalCharge: number;
        distanceInKm: number;
        currency: string;
      };
    };

    const isSuccess = result.code === "SUCCESS" || (result as any).success === true;
    if (!isSuccess || !result.data) {
      throw new Error(result.message || "Failed to calculate SGR cost");
    }

    return result.data;
  } catch (error: any) {
    logger.error("failed_to_calculate_sgr_cost", { error: error.message });
    throw error;
  }
};

