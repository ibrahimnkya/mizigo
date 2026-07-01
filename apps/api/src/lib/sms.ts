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

  const systemConfig = await (prisma as any).systemConfig.findFirst({
    where: { key: "PLATFORM_SUPPORT_URL", organizationId: null },
  });
  if (systemConfig?.value) return systemConfig.value;

  return process.env.PLATFORM_SUPPORT_URL || "mizigo.akiliapp.co.tz/support";
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
    config.defaultSenderId || process.env.SENDER_ID || "MIZIGO",
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

  // Bypasses actual network requests only if it is using the seeded mock API ID
  const isMock = config.apiId === "API45908501712";
  if (isMock) {
    logger.info("simulating_sms_send_in_dev", {
      formattedPhone,
      message: input.message,
    });
    await logSmsStatus({
      phoneNumber: formattedPhone,
      message: input.message,
      status: "SENT",
      organizationId: input.organizationId,
    });
    return {
      status: "S",
      response_code: "1",
      remarks: "SMS Sent Successfully (sandbox mock)",
    };
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
        organizationId: input.organizationId,
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
    organizationId: input.organizationId,
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
  organizationId?: string | null;
}) => {
  // Log to stdout for server capturing
  console.log(`[SMS SEND LOG] [${new Date().toISOString()}] To: ${input.phoneNumber} | Status: ${input.status} | Message: "${input.message}"${input.error ? ` | Error: ${input.error}` : ""}`);

  await prisma.auditLog.create({
    data: {
      action: "SMS_STATUS",
      resource: "sms",
      organizationId: input.organizationId || null,
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
    input.trackUrl || process.env.PUBLIC_URL || "https://mizigo.akiliapp.co.tz";
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

const resolveSmsTemplate = async (key: string, defaultTemplate: string): Promise<string> => {
  try {
    const config = await prisma.systemConfig.findUnique({
      where: { key_organizationId: { key, organizationId: null as any } },
    });
    return config?.value || defaultTemplate;
  } catch {
    return defaultTemplate;
  }
};

const interpolateTemplate = (template: string, variables: Record<string, string>): string => {
  let result = template;
  for (const [key, val] of Object.entries(variables)) {
    result = result.replace(new RegExp(`{${key}}`, "g"), val || "");
  }
  return result;
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
  const defaultTemplate = `🔐 Mizigo Secure: Your pickup OTP for #{trackingNumber} is {otp}. Do not share this code. Present it at the station to collect your parcel.`;
  const template = await resolveSmsTemplate("SMS_TEMPLATE_DELIVERY_OTP", defaultTemplate);

  const message = interpolateTemplate(template, {
    trackingNumber: input.trackingNumber,
    otp: input.otp,
  });

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
  const website = input.website || "https://mizigo.akiliapp.co.tz";
  const trackingUrl = `${website.replace(/\/$/, "")}/track/${input.trackingNumber}`;

  const defaultSenderTemplate = `Mzigo wako umepokelewa\n\n` +
    `Namba ya Mzigo: {trackingNumber}\n\nAina ya Mzigo: {packageName}\n\n` +
    `Jina la Mpokeaji: {receiverName}\n\nNamba ya Siri: {otp}\n\n` +
    `Jina la Karani: {agentName}\n\n\nKufatilia Safari ya  Mzigo wako. \n\n{trackingUrl}`;

  const defaultReceiverTemplate = `Habari {receiverName}!\n\nUmetumiwa mzigo wa {packageName}.\n\nNamba ya Mzigo: {trackingNumber}\nMtumaji: {senderName}\nSafari: {originName} - {destinationName}\nOfisi ya Kupokea: {destinationName}\n\nTafadhali fika na Namba ya Siri (OTP) kupokea mzigo wako.\n\nJina la Wakala: {agentName}\nSimu ya Wakala: {agentPhone}\n\nAsante kwa kutumia {orgName}! Kwa msaada zaidi, tupigie: {helpdesk}\n\nKufatilia Safari ya Mzigo wako: {trackingUrl}`;

  const senderTemplate = await resolveSmsTemplate("SMS_TEMPLATE_RECEIPT_SENDER", defaultSenderTemplate);
  const receiverTemplate = await resolveSmsTemplate("SMS_TEMPLATE_RECEIPT_RECEIVER", defaultReceiverTemplate);

  const variables = {
    trackingNumber: input.trackingNumber,
    packageName: input.packageName,
    receiverName: input.receiverName,
    otp: input.otp,
    agentName: input.agentName,
    agentPhone: input.agentPhone,
    senderName: input.senderName,
    originName: input.originName,
    destinationName: input.destinationName,
    orgName,
    helpdesk,
    website,
    trackingUrl,
  };

  const senderMsg = interpolateTemplate(senderTemplate, variables);
  const receiverMsg = interpolateTemplate(receiverTemplate, variables);

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
  const trackingUrl = `https://mizigo.akiliapp.co.tz/track/${input.trackingNumber}`;

  const defaultTemplate = `Mzigo Umetumwa\n\nMpendwa {receiverName}, mzigo namba {trackingNumber} umetoka {originName} kwenda {destinationName} na gari la {carrierName}.\nMsafirishaji: {dispatcherName} Simu ya Msafirishaji {dispatcherPhone}\nNamba ya Siri (OTP): {otp}\n\nAsante kwa kutumia {orgName}! Kufatilia Safari ya Mzigo: {trackingUrl}\nKwa msaada zaidi, tupigie: {support}`;
  const template = await resolveSmsTemplate("SMS_TEMPLATE_DISPATCH", defaultTemplate);

  const msg = interpolateTemplate(template, {
    receiverName: input.receiverName,
    trackingNumber: input.trackingNumber,
    originName: input.originName,
    destinationName: input.destinationName,
    carrierName: input.carrierName,
    dispatcherName: input.dispatcherName,
    dispatcherPhone: input.dispatcherPhone,
    otp: input.otp,
    orgName,
    support,
    trackingUrl,
  });

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
  senderName?: string;
  packageName?: string;
  supportPhone?: string;
  organizationId?: string | null;
}) => {
  const sender = input.senderName || "Mtumaji";
  const type = input.packageName || "Parcel";
  const support = input.supportPhone || "0736699593";
  const trackingUrl = `https://mizigo.akiliapp.co.tz/track/${input.trackingNumber}`;

  const defaultTemplate = `Mzigo wako umewasili.\nNamba ya Mzigo: {trackingNumber}\nJina la Mtumaji: {senderName}\nAina ya Mzigo: {packageName}\nKwajili ya usalama,OTP ya kupokea mzigo imehifadhiwa kwa mtumaji, tafadhali wasiliana na mtumaji kabla ya kuchukua mzigo wako.\nKufatilia Safari ya Mzigo: {trackingUrl}\n\nAsante kwa kutuma Mzigo kupitia TRC.`;
  const template = await resolveSmsTemplate("SMS_TEMPLATE_ARRIVED", defaultTemplate);

  const msg = interpolateTemplate(template, {
    trackingNumber: input.trackingNumber,
    senderName: sender,
    packageName: type,
    receiverName: input.receiverName,
    destinationName: input.destinationName,
    support,
    trackingUrl,
  });

  await sendSms({
    phoneNumber: input.receiverPhone,
    message: msg,
    organizationId: input.organizationId,
  });
};
