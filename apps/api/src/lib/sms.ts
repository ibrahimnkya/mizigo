import { prisma } from "@repo/database";
import { createServiceLogger } from "./logger";
import { normalizePhoneNumber } from "./phone";

type SmsProviderConfig = {
  apiId: string;
  apiPassword: string;
  defaultSenderId: string;
  baseUrl?: string;
};

const delay = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms));
const logger = createServiceLogger("sms");

export const resolveSupportUrl = async (
  organizationId?: string | null,
): Promise<string> => {
  if (organizationId) {
    const organization = await prisma.organization.findUnique({
      where: { id: organizationId },
      select: { supportUrl: true },
    });
    if (organization?.supportUrl) return organization.supportUrl;
  }

  const systemConfig = await (prisma as any).systemConfig.findUnique({
    where: { key: "PLATFORM_SUPPORT_URL" },
  });
  if (systemConfig?.value) return systemConfig.value;

  return process.env.PLATFORM_SUPPORT_URL || "mizigo.co.tz/support";
};

export const buildWelcomeOtpMessage = async (input: {
  name: string;
  otp: string;
  organizationId?: string | null;
}) => {
  const supportUrl = await resolveSupportUrl(input.organizationId);
  return `Hi ${input.name},Welcome to MiziGo!Your OTP: ${input.otp}(Valid for 5 mins)For security, please change it on your first login.Help: ${supportUrl}`;
};

const loadSmsProviderConfig = async (
  organizationId?: string | null,
): Promise<SmsProviderConfig> => {
  const activeFilter = {
    isActive: true,
    deletedAt: null,
  };

  let configFound: any = null;

  // 1. Try to find organization-specific config
  if (organizationId) {
    const orgIntegration = await prisma.integration.findFirst({
      where: {
        type: "SMS_GATEWAY",
        organizationId,
        ...activeFilter,
      },
      orderBy: { updatedAt: "desc" },
    });
    if (orgIntegration?.config) {
      configFound = orgIntegration.config;
    }
  }

  // 2. Fallback to global config if no organization config found
  if (!configFound) {
    const globalIntegration = await prisma.integration.findFirst({
      where: {
        type: "SMS_GATEWAY",
        organizationId: null,
        ...activeFilter,
      },
      orderBy: { updatedAt: "desc" },
    });
    if (globalIntegration?.config) {
      configFound = globalIntegration.config;
    }
  }

  // 3. Ultimate Fallback: Just grab ANY active SMS gateway
  if (!configFound) {
    const anyIntegration = await prisma.integration.findFirst({
      where: {
        type: "SMS_GATEWAY",
        ...activeFilter,
      },
      orderBy: { updatedAt: "desc" },
    });
    if (anyIntegration?.config) {
      configFound = anyIntegration.config;
    }
  }

  const config = (configFound || {}) as Record<string, unknown>;
  const apiId = String(config.apiId || process.env.API_ID || "");
  const apiPassword = String(
    config.apiPassword || process.env.API_PASSWORD || "",
  );
  const defaultSenderId = String(
    config.defaultSenderId || process.env.SENDER_ID || "MySAFARI",
  );
  const baseUrlRaw = String(
    config.baseUrl || process.env.API_URL || "https://api.sprintsmsservice.com/api/SendSMS",
  );
  let baseUrl = baseUrlRaw;
  if (baseUrlRaw && !baseUrlRaw.includes("/api/SendSMS") && !baseUrlRaw.includes("MOCK_URL")) {
    baseUrl = baseUrlRaw.replace(/\/$/, "") + "/api/SendSMS";
  }

  if (!apiId || !apiPassword) {
    const source = organizationId
      ? `for organization ${organizationId}`
      : "globally";
    throw new Error(`SMS gateway credentials are not configured ${source}`);
  }

  return { apiId, apiPassword, defaultSenderId, baseUrl };
};

const attemptSendSMS = async (url: URL, timeoutMs: number) => {
  const controller = new AbortController();
  const id = setTimeout(() => controller.abort(), timeoutMs);
  try {
    const response = await fetch(url.toString(), {
      method: "GET",
      headers: { "Content-Type": "application/json" },
      signal: controller.signal,
    });

    if (!response.ok) throw new Error(`HTTP error status: ${response.status}`);
    const data = (await response.json()) as Record<string, unknown>;
    const status = String(data.status || "");
    const responseCode = String(data.response_code || "");

    if (status !== "S" && responseCode !== "1") {
      throw new Error(
        String(
          data.remarks || data.response_message || "Unknown SMS provider error",
        ),
      );
    }
    return data;
  } finally {
    clearTimeout(id);
  }
};

export const sendSms = async (input: {
  phoneNumber: string;
  message: string;
  organizationId?: string | null;
  senderId?: string;
}) => {
  const config = await loadSmsProviderConfig(input.organizationId);
  const senderId = input.senderId || config.defaultSenderId;
  const formattedPhone = normalizePhoneNumber(input.phoneNumber);
  if (!formattedPhone) {
    throw new Error("A valid phone number is required to send SMS");
  }


  const url = new URL(
    config.baseUrl || "https://api.sprintsmsservice.com/api/SendSMS",
  );
  url.searchParams.append("api_id", config.apiId);
  url.searchParams.append("api_password", config.apiPassword);
  url.searchParams.append("sms_type", "T");
  url.searchParams.append("encoding", "T");
  url.searchParams.append("sender_id", senderId);
  url.searchParams.append("phonenumber", formattedPhone);
  url.searchParams.append("textmessage", input.message);

  const MAX_RETRIES = 5;
  const RETRY_DELAY = 1000;
  const TIMEOUT_MS = 2000;

  let lastError: Error | null = null;
  for (let attempt = 1; attempt <= MAX_RETRIES; attempt += 1) {
    try {
      logger.info("sending_sms_attempt", { attempt, formattedPhone });
      const payload = await attemptSendSMS(url, TIMEOUT_MS);
      await logSmsStatus({
        phoneNumber: formattedPhone,
        message: input.message,
        status: "SENT",
      });
      logger.info("sms_sent", { formattedPhone });
      return payload;
    } catch (error) {
      lastError = error as Error;
      logger.warn("sms_send_failed_attempt", {
        attempt,
        error: lastError.message,
      });
      if (attempt < MAX_RETRIES) await delay(RETRY_DELAY);
    }
  }

  await logSmsStatus({
    phoneNumber: formattedPhone,
    message: input.message,
    status: "FAILED",
    error: lastError?.message || null,
  });
  logger.error("sms_send_failed", {
    formattedPhone,
    error: lastError?.message || "Unknown error",
  });
  throw new Error(
    `Failed to send SMS after ${MAX_RETRIES} attempts: ${lastError?.message || "Unknown error"}`,
  );
};

export const logSmsStatus = async (input: {
  phoneNumber: string;
  message: string;
  status: string;
  error?: string | null;
}) => {
  await prisma.auditLog.create({
    data: {
      action: "SMS_STATUS",
      resource: "sms",
      details: {
        phoneNumber: input.phoneNumber,
        message: input.message,
        status: input.status,
        error: input.error || null,
        timestamp: new Date().toISOString(),
      },
    },
  });
};

export const sendParcelNotificationSms = async (input: {
  event: "RECEIVED" | "IN_TRANSIT" | "DELIVERED";
  trackingNumber: string;
  receiverPhone?: string | null;
  senderPhone?: string | null;
  organizationId?: string | null;
  recipients?: Array<"SENDER" | "RECEIVER">;
  helpdeskNumber?: string;
  trackUrl?: string;
}) => {
  const recipients =
    input.recipients && input.recipients.length > 0
      ? input.recipients
      : ["RECEIVER"];
  const helpdesk =
    input.helpdeskNumber ||
    process.env.DEFAULT_HELPDESK_NUMBER ||
    "+255000000000";
  const trackBaseUrl =
    input.trackUrl || process.env.PUBLIC_URL || "https://mizigo.co.tz";
  const trackUrl = `${trackBaseUrl}/track/${input.trackingNumber}`;

  const message = `Parcel ${input.trackingNumber} is ${input.event}. Helpdesk: ${helpdesk}. Track: ${trackUrl}`;

  if (recipients.includes("RECEIVER") && input.receiverPhone) {
    await sendSms({
      phoneNumber: input.receiverPhone,
      message,
      organizationId: input.organizationId,
    });
  }

  if (recipients.includes("SENDER") && input.senderPhone) {
    await sendSms({
      phoneNumber: input.senderPhone,
      message,
      organizationId: input.organizationId,
    });
  }
};

/**
 * Sends a Secure Handover OTP to the recipient.
 */
export const sendDeliveryOtpSms = async (input: {
  receiverPhone: string;
  trackingNumber: string;
  otp: string;
  organizationId?: string | null;
}) => {
  const message = `🔐 Mizigo Secure: Your pickup OTP for #${input.trackingNumber} is ${input.otp}. Do not share this code. Present it at the station to collect your parcel.`;

  await sendSms({
    phoneNumber: input.receiverPhone,
    message,
    organizationId: input.organizationId,
  });
};

/**
 * Sends professional receipt SMS to both sender and receiver.
 */
export const sendParcelReceiptSms = async (input: {
  trackingNumber: string;
  otp: string;
  senderName: string;
  senderPhone: string;
  receiverName: string;
  receiverPhone: string;
  originName: string;
  destinationName: string;
  packageName: string;
  stationName: string;
  agentName: string;
  agentPhone: string;
  orgName?: string;
  helpdesk?: string;
  website?: string;
  organizationId?: string | null;
}) => {
  const orgName = input.orgName || "Mizigo";
  const helpdesk = input.helpdesk || "0736699593";
  const website = input.website || "https://mizigo.co.tz";

  const senderMsg = `Taarifa za Mzigo\n\nNamba ya Mzigo: ${input.trackingNumber}\nHali: UMEPOKELEWA\nSafari: ${input.originName} - ${input.destinationName}\nOfisi Ulipopokelewa: ${input.stationName}\nMtumaji: ${input.senderName}\nMpokeaji: ${input.receiverName}\nNamba ya Siri (OTP): ${input.otp}\nJina la Wakala: ${input.agentName}\nSimu ya Wakala: ${input.agentPhone}\n\nAsante kwa kutumia ${orgName}! Kwa msaada zaidi, tupigie: ${helpdesk}\n\n${website}`;

  const receiverMsg = `Habari ${input.receiverName}!\n\nUmetumiwa mzigo wa ${input.packageName}.\n\nNamba ya Mzigo: ${input.trackingNumber}\nMtumaji: ${input.senderName}\nSafari: ${input.originName} - ${input.destinationName}\nOfisi ya Kupokea: ${input.destinationName}\n\nTafadhali fika na Namba ya Siri (OTP) kupokea mzigo wako.\n\nJina la Wakala: ${input.agentName}\nSimu ya Wakala: ${input.agentPhone}\n\nAsante kwa kutumia ${orgName}! Kwa msaada zaidi, tupigie: ${helpdesk}\n\n${website}`;

  // Send to sender
  await sendSms({
    phoneNumber: input.senderPhone,
    message: senderMsg,
    organizationId: input.organizationId,
  }).catch((e) => logger.error("Sender SMS fail", e));

  // Send to receiver
  await sendSms({
    phoneNumber: input.receiverPhone,
    message: receiverMsg,
    organizationId: input.organizationId,
  }).catch((e) => logger.error("Receiver SMS fail", e));
};

export const sendParcelDispatchSms = async (input: {
  receiverName: string;
  receiverPhone: string;
  trackingNumber: string;
  originName: string;
  destinationName: string;
  carrierName: string;
  dispatcherName: string;
  dispatcherPhone: string;
  otp: string;
  orgName?: string;
  supportPhone?: string;
  organizationId?: string | null;
}) => {
  const orgName = input.orgName || "Mizigo";
  const support = input.supportPhone || "0736699593";
  const msg = `Mzigo Umetumwa\n\nMpendwa ${input.receiverName}, mzigo namba ${input.trackingNumber} umetoka ${input.originName} kwenda ${input.destinationName} na gari la ${input.carrierName}.\nMsafirishaji: ${input.dispatcherName} Simu ya Msafirishaji ${input.dispatcherPhone}\nNamba ya Siri (OTP): ${input.otp}\n\nAsante kwa kutumia ${orgName}! Kwa msaada zaidi, tupigie: ${support}`;

  await sendSms({
    phoneNumber: input.receiverPhone,
    message: msg,
    organizationId: input.organizationId,
  });
};

export const sendParcelArrivedSms = async (input: {
  receiverName: string;
  receiverPhone: string;
  trackingNumber: string;
  destinationName: string;
  supportPhone?: string;
  organizationId?: string | null;
}) => {
  const support = input.supportPhone || "0736699593";
  const msg = `Mzigo Umefika\n\nMpendwa ${input.receiverName}, mzigo namba ${input.trackingNumber} umefika salama katika kituo cha ${input.destinationName}.\nTafadhali fika kukuchukua. Kwa msaada zaidi, tupigie: ${support}`;

  await sendSms({
    phoneNumber: input.receiverPhone,
    message: msg,
    organizationId: input.organizationId,
  });
};
