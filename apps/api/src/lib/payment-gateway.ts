import crypto from "crypto";
import { prisma } from "@repo/database";
import { createServiceLogger } from "./logger";

const logger = createServiceLogger("payment-gateway");

export type PaymentProviderExternal = {
  id: string;
  name: string;
  code: string;
  description?: string;
  isActive: boolean;
};

export type PaymentSplit = {
  grossAmount: number;
  systemFee: number;
  commission: number;
  netAmount: number;
};

export type MySafariPushInput = {
  paymentChannel: string;
  phoneNumber: string;
  amount: number;
  reference: string;
  callbackUrl?: string;
  additionalData?: Record<string, any>;
};

const getSystemFee = async (): Promise<number> => {
  const config = await prisma.systemConfig.findUnique({
    where: { key_organizationId: { key: "DEFAULT_SYSTEM_FEE", organizationId: null as any } },
  });
  return Number(config?.value || process.env.DEFAULT_SYSTEM_FEE);
};

/**
 * Loads the payment gateway integration configuration.
 */
const loadPaymentGatewayConfig = async () => {
  const integration = await prisma.integration.findFirst({
    where: { type: "PAYMENT_GATEWAY", isActive: true },
    orderBy: { updatedAt: "desc" },
  });

  const config = (integration?.config || {}) as Record<string, any>;
  return {
    baseUrl:
      config.baseUrl ||
      process.env.PAYMENT_GATEWAY_URL ||
      "https://mysafari.co.tz",
    apiKey:    config.apiKey    || process.env.PAYWAY_KEY            || process.env.PAYMENT_GATEWAY_KEY  || "",
    appName:   config.appName   || process.env.PAYMENT_APP_NAME      || "",
    clientId:  config.clientId  || process.env.PAYMENT_CLIENT_ID     || "",
    clientSecret: config.clientSecret || process.env.PAYMENT_CLIENT_SECRET || "",
  };
};

/**
 * Builds the standard MySafari auth headers from the loaded config.
 */
const buildGatewayHeaders = (cfg: {
  apiKey: string;
  appName: string;
  clientId: string;
  clientSecret: string;
}): Record<string, string> => {
  const headers: Record<string, string> = {
    "Content-Type": "application/json",
  };
  if (cfg.appName)      headers["AppName"]      = cfg.appName;
  if (cfg.clientId)     headers["ClientId"]     = cfg.clientId;
  if (cfg.clientSecret) headers["ClientSecret"] = cfg.clientSecret;
  // Some endpoints also accept a legacy apiKey header
  if (cfg.apiKey)       headers["Authorization"] = `Bearer ${cfg.apiKey}`;
  return headers;
};

/**
 * Fetches the list of active payment providers from the external gateway.
 */
export const fetchExternalProviders = async (): Promise<
  PaymentProviderExternal[]
> => {
  try {
    const cfg = await loadPaymentGatewayConfig();

    const response = await fetch(
      `${cfg.baseUrl}/api/partner/get-payment-partners`,
      {
        method: "GET",
        headers: buildGatewayHeaders(cfg),
      },
    );

    if (!response.ok) {
      throw new Error(
        `MySafari error: ${response.status} ${response.statusText}`,
      );
    }

    const data = (await response.json()) as any[];

    return data.map((item: any) => ({
      id: String(item.id || item.uts_name),
      name: item.partnerName || item.mobile_channel,
      code: item.uts_name || item.correspondent,
      description: `Mobile payment via ${item.partnerName}`,
      isActive: item.active === "yes",
    }));
  } catch (error: any) {
    logger.error("failed_to_fetch_providers", { error: error.message });

    // Fallback to basic providers if external call fails
    return [
      { id: "ext_mpesa",    name: "M-Pesa",       code: "mpesa",  isActive: true },
      { id: "ext_tigopesa", name: "Tigo Pesa",    code: "tigo",   isActive: true },
      { id: "ext_airtel",   name: "Airtel Money", code: "airtel", isActive: true },
    ];
  }
};

/**
 * Initiates a push payment request to the customer's phone using MySafari.
 * Always makes a real API call — no mocking, no environment bypasses.
 */
export const initiatePushPayment = async (input: MySafariPushInput) => {
  const cfg = await loadPaymentGatewayConfig();

  if (!cfg.baseUrl) {
    throw new Error(
      "Payment gateway base URL is not configured. Please set it in Payment Settings."
    );
  }

  // Validate that at least the minimum required credentials are present
  const hasVodacomHeaders = cfg.appName && cfg.clientId && cfg.clientSecret;
  const hasApiKey = !!cfg.apiKey;
  if (!hasVodacomHeaders && !hasApiKey) {
    throw new Error(
      "Payment gateway credentials are incomplete. Please configure AppName, ClientId and ClientSecret in Payment Settings."
    );
  }


  const body = {
    payment_channel: input.paymentChannel,
    phone_number: input.phoneNumber,
    payment_reference: input.reference,
    amount: input.amount,
    callback_url: input.callbackUrl,
    additionalData: input.additionalData || {},
  };

  logger.info("initiating_push_payment", {
    reference: input.reference,
    channel: input.paymentChannel,
    baseUrl: cfg.baseUrl,
  });

  let response: Response;
  try {
    response = await fetch(`${cfg.baseUrl}/api/paymentGw/pushPayment`, {
      method: "POST",
      headers: buildGatewayHeaders(cfg),
      body: JSON.stringify(body),
    });
  } catch (networkError: any) {
    logger.error("push_payment_network_error", {
      error: networkError.message,
      reference: input.reference,
      baseUrl: cfg.baseUrl,
    });
    throw new Error(
      `Could not reach payment gateway at ${cfg.baseUrl}: ${networkError.message}`
    );
  }

  if (!response.ok) {
    const errorText = await response.text().catch(() => response.statusText);
    logger.error("push_payment_gateway_error", {
      status: response.status,
      body: errorText,
      reference: input.reference,
    });
    throw new Error(
      `Payment gateway error (${response.status}): ${errorText}`
    );
  }

  let data: { status: boolean; message: string; transaction_id: string };
  try {
    data = await response.json();
  } catch (parseErr: any) {
    throw new Error("Payment gateway returned an invalid response format");
  }

  if (!data.status) {
    logger.error("push_payment_rejected_by_gateway", {
      message: data.message,
      reference: input.reference,
    });
    throw new Error(data.message || "Payment gateway rejected the push request");
  }

  logger.info("push_payment_initiated_successfully", {
    reference: input.reference,
    transactionId: data.transaction_id,
  });

  return data;
};

/**
 * Calculates the payment split for a given parcel request amount.
 */
export const calculatePaymentSplit = async (
  organizationId: string | null,
  grossAmount: number,
): Promise<PaymentSplit> => {
  const systemFee = await getSystemFee();
  let commissionRate = 0;

  if (organizationId) {
    const org = await prisma.organization.findUnique({
      where: { id: organizationId },
      select: { commissionRate: true },
    });
    commissionRate = org?.commissionRate || 0;
  }

  const commission = grossAmount * (commissionRate / 100);
  const netAmount = grossAmount - systemFee - commission;

  return {
    grossAmount,
    systemFee,
    commission,
    netAmount: Math.max(0, netAmount),
  };
};

/**
 * Ensures a platform-wide wallet exists.
 */
export const ensurePlatformWallet = async (tx?: any) => {
  const p = tx || prisma;
  const platformWallet = await p.wallet.findFirst({
    where: { type: "PLATFORM" },
  });

  if (!platformWallet) {
    return await p.wallet.create({
      data: { type: "PLATFORM", balance: 0 },
    });
  }
  return platformWallet;
};

/**
 * Ensures an organization has a wallet.
 */
export const ensureOrganizationWallet = async (
  organizationId: string,
  tx?: any,
) => {
  const p = tx || prisma;
  const wallet = await p.wallet.findUnique({
    where: { organizationId },
  });

  if (!wallet) {
    return await p.wallet.create({
      data: { type: "ORGANIZATION", organizationId, balance: 0 },
    });
  }
  return wallet;
};

/**
 * Verifies a payment callback signature using a shared secret.
 */
export const verifyCallbackSignature = async (
  payload: any,
  signature: string,
): Promise<boolean> => {
  try {
    const { apiKey } = await loadPaymentGatewayConfig();

    if (!signature || !apiKey) {
      logger.warn("missing_signature_or_key_for_verification", {
        hasSignature: !!signature,
        hasKey: !!apiKey,
      });
      return false;
    }

    const payloadString = JSON.stringify(payload);
    const expectedSignature = crypto
      .createHmac("sha256", apiKey)
      .update(payloadString)
      .digest("hex");

    return crypto.timingSafeEqual(
      Buffer.from(signature),
      Buffer.from(expectedSignature),
    );
  } catch (error: any) {
    logger.error("signature_verification_error", { error: error.message });
    return false;
  }
};
