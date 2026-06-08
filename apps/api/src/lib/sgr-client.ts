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
    clientRef:
      config.clientRef || process.env.SGR_CLIENT_REF || "XCNT202606830874",
    privateKey: config.privateKey || process.env.SGR_PRIVATE_KEY || "",
    publicKey:
      config.publicKey ||
      process.env.SGR_PUBLIC_KEY ||
      "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCpNs5Vm1uwxrA0EEwbCACylnqzwf4kJaENxn/vbklopzyTxZjnv0eSumA7oytlwzHwQuadMS44zx0dc2xno+jNrGDYRf8Cd5iN0V1xPRhwOJeyhQhuiziw57YuUhu70gEGklb2SAFxM3DWtzecJnR17lrsCYwZ8q/0cXjbTCQUYQIDAQAB",
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
 * Fetch stations list from SGR Portal API
 */
export const fetchSgrStations = async (): Promise<SgrStationExternal[]> => {
  try {
    const config = await loadSgrConfig();
    const timestamp = Date.now().toString();
    
    // SGR GET request signature payload is typically empty body or URL + timestamp
    const signature = signPayload("", config.privateKey);

    const headers: Record<string, string> = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "X-Service-Name": config.serviceName,
      "X-Header-Service": config.headerService,
      "X-Timestamp": timestamp,
      "X-Signature": signature,
      "clientRef": config.clientRef,
    };

    let baseUrl = config.baseUrl.trim();
    if (baseUrl.endsWith("/")) {
      baseUrl = baseUrl.substring(0, baseUrl.length - 1);
    }
    const url = `${baseUrl}/sec/trc/sgrparcel/v1/fetch/sgr-stations`;
    logger.info("fetching_sgr_stations", { url });

    const response = await fetch(url, {
      method: "GET",
      headers,
    });

    if (!response.ok) {
      throw new Error(`SGR API error: ${response.status} ${response.statusText}`);
    }

    const result = (await response.json()) as {
      code: string;
      message: string;
      data: SgrStationExternal[];
      timestamp: string;
    };

    if (result.code !== "SUCCESS" || !Array.isArray(result.data)) {
      throw new Error(result.message || "Failed to fetch SGR stations data");
    }

    return result.data;
  } catch (error: any) {
    logger.error("failed_to_fetch_sgr_stations", { error: error.message });
    throw error;
  }
};
