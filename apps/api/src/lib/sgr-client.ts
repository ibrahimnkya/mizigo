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
    privateKey:
      config.privateKey ||
      process.env.SGR_PRIVATE_KEY ||
      `-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDEYigO1boZbS0f
uODIf4yfz3u0Ey0OCUq+164FxduncYZFXzsT1TcWO2xgq0eJ9097Stb4g56j9zG/
Q621LS4hupriwz8j82skvnEGLkJ7dsi1egk/OOD8RbNbJm9iaTZuGipW4o/ELQZC
6LoJyYdxDXIu2Zj1QojvRqPnn3OXRzTqCXL/g6RlMl3DxY2iX40fNtGCUKbzwa5w
lYkKvK7GznG/toMES+r0FV6WLDB3e8s+5Hf1ELtIvr3oGmTHb2deJusQKXESe0FS
bHpWXYl2IZ++k8jns3IoOTLrM5Ug01/UyPT3L94BMKz4oZRYFMdfE17zb0Om3VP7
THXRBegJAgMBAAECggEADh9k9BQoqvVv/k0EVUbe7Qs1wTBz2AORDYJjMGUXM8Z1
On3ruLRnnsCtPZJztZdEbwBlzz9f5Di9qhyK3HGgVKqfwtj5rHMv7FeJt0ESZOCY
9HwPOC21+E5m5JIyBmi8klRtYQwv/JKkVaF454VHqTinUnkxh8m+IT76QIj1/hXv
lTUmRtvsB4YvEfIqiQ6HS6zYWHXuN99IAIFF+vazEzGWnJUBcC+vL7n0n8uSF4Hi
hazkEk25NCcycMnh94YYTK6L7F1vKEWlcGJVrlB13LFMR3tKsnfCe0Y7ZvbVftIq
LYTK5I4UQwq2qQB+d3hzC4Gy0hoUwIu6qg3/uC3ltQKBgQDldS6zIMGE5r1VNkgj
qeoXjVYmb1XSNkToX8Mn8w5wCAm799EH2/8JPwcJ2XxtSqIi6sz3pSW3ztfdu/SI
jMF5VMyrMwtTD1YT+fTXvyTioALmxdiU0+1ATOPlPu2ZHCrs2vyyk2yFxTkv2Por
q0I9c9obUzlU9IIb/wpZZQqAZwKBgQDbGY+MGtKyLqcVCetTvhBM3+y5xxUxTvpP
HwnB0dhkxgLOUsDskApuQnAHnoeSxhUGfDXTBxbEJfWCXcbfI+q4mZMkRmunnYb3
Bq1MMKlaBc1pBxgvlPi2jaycGOVvycvBe3TJBlaAbEG0AAhXPbFSkkPWnumRx3W2
4jQ3yc9ODwKBgQCCwzkN1Aj0mBolyX1q9ZX2PhFubdxWo565Xnl09sqvhaUmfZ+d
/v1kY4q7Tjnefr3PcEfGiVLpYPMb5dUBTFWls3G/zqMRfpfrYnLp0IBQtidxJCa9
CdkW37qwFiCJNMgxmsqPafxab36biedno31oT/FnyRHPHFhZZAqdzzsg2QKBgQCW
odcoCtTqfdqPQ1eQJm7Me3MkMnQmh1beCMfLgjsU5XHOaeSLf2g8b97Xzi0FQrv3
znOu1wPW7QYCj/iHNwlLywH3gZbIESxWLzf71sTHyI91ctQ0+mWYFIUkeJVdKs60
Ae3Du2DDQCpX12HkoNyFmVucdXq9p/UNPC2MYWnuDwKBgHAoaoB090z9qoDaXJdo
BIW8VhqgRAIBJCKGRYZdENOnrXpSpWRsd2yufCf11i+3SOOGwULQwu9yTxYtewQ4
Y7D0YJ9J3KpXMVZNNS5VaT+k7D81FDb951dyeLHlrZKz4eeEAQJeHzv7DESe3K2k
Xxl1aX27xQqfkVYHvccMiSR1
-----END PRIVATE KEY-----`,
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
      throw new Error(`SGR API error: ${response.status} ${response.statusText}`);
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
      throw new Error(`SGR API error: ${response.status} ${response.statusText}`);
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
