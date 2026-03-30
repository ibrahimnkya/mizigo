import { prisma } from "@repo/database";
import { createServiceLogger } from "./logger";

type SmsProviderConfig = {
  apiId: string;
  apiPassword: string;
  defaultSenderId: string;
  baseUrl?: string;
};

const delay = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms));
const logger = createServiceLogger("sms");

const normalizePhone = (phone: string) =>
  phone.startsWith("255") ? phone : `255${phone.replace(/^0+/, "")}`;

const loadSmsProviderConfig = async (organizationId?: string | null): Promise<SmsProviderConfig> => {
  const where = organizationId
    ? { type: "SMS_GATEWAY", organizationId }
    : { type: "SMS_GATEWAY", organizationId: null };

  const orgConfig = await prisma.integration.findFirst({
    where,
    orderBy: { updatedAt: "desc" },
  });

  const globalConfig = organizationId
    ? await prisma.integration.findFirst({
        where: { type: "SMS_GATEWAY", organizationId: null },
        orderBy: { updatedAt: "desc" },
      })
    : null;

  const config = (orgConfig?.config || globalConfig?.config || {}) as Record<string, unknown>;
  const apiId = String(config.apiId || process.env.API_ID || "");
  const apiPassword = String(config.apiPassword || process.env.API_PASSWORD || "");
  const defaultSenderId = String(config.defaultSenderId || process.env.SENDER_ID || "MySAFARI");
  const baseUrl = String(config.baseUrl || "https://api.sprintsmsservice.com/api/SendSMS");

  if (!apiId || !apiPassword) {
    throw new Error("SMS gateway credentials are not configured");
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
    const data = await response.json() as Record<string, unknown>;
    const status = String(data.status || "");
    const responseCode = String(data.response_code || "");

    if (status !== "S" && responseCode !== "1") {
      throw new Error(String(data.remarks || data.response_message || "Unknown SMS provider error"));
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
  const formattedPhone = normalizePhone(input.phoneNumber);

  const url = new URL(config.baseUrl || "https://api.sprintsmsservice.com/api/SendSMS");
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
      await logSmsStatus({ phoneNumber: formattedPhone, message: input.message, status: "SENT" });
      logger.info("sms_sent", { formattedPhone });
      return payload;
    } catch (error) {
      lastError = error as Error;
      logger.warn("sms_send_failed_attempt", { attempt, error: lastError.message });
      if (attempt < MAX_RETRIES) await delay(RETRY_DELAY);
    }
  }

  await logSmsStatus({ phoneNumber: formattedPhone, message: input.message, status: "FAILED", error: lastError?.message || null });
  logger.error("sms_send_failed", { formattedPhone, error: lastError?.message || "Unknown error" });
  throw new Error(`Failed to send SMS after ${MAX_RETRIES} attempts: ${lastError?.message || "Unknown error"}`);
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

export const sendCargoNotificationSms = async (input: {
  event: "RECEIVED" | "IN_TRANSIT" | "DELIVERED";
  trackingNumber: string;
  receiverPhone?: string | null;
  senderPhone?: string | null;
  organizationId?: string | null;
  recipients?: Array<"SENDER" | "RECEIVER">;
  helpdeskNumber?: string;
  trackUrl?: string;
}) => {
  const recipients = input.recipients && input.recipients.length > 0 ? input.recipients : ["RECEIVER"];
  const helpdesk = input.helpdeskNumber || process.env.DEFAULT_HELPDESK_NUMBER || "+255000000000";
  const trackUrl = input.trackUrl || process.env.DEFAULT_TRACK_URL || "https://mizigo.example/track";

  const message = `Cargo ${input.trackingNumber} is ${input.event}. Helpdesk: ${helpdesk}. Track: ${trackUrl}/${input.trackingNumber}`;

  if (recipients.includes("RECEIVER") && input.receiverPhone) {
    await sendSms({ phoneNumber: input.receiverPhone, message, organizationId: input.organizationId });
  }

  if (recipients.includes("SENDER") && input.senderPhone) {
    await sendSms({ phoneNumber: input.senderPhone, message, organizationId: input.organizationId });
  }
};
