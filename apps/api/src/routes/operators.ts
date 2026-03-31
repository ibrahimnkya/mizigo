import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { hashPassword } from "../lib/security";
import { logAudit } from "../lib/audit";
import { buildWelcomeOtpMessage, sendSms } from "../lib/sms";
import { normalizePhoneNumber } from "../lib/phone";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

const getOperatorRoleId = async () => {
  const role = await prisma.role.findFirst({
    where: {
      OR: [{ name: "OPERATOR" }, { name: "STATION_OPERATOR" }],
    },
  });
  return role?.id;
};

router.post("/", requirePermission("operators:create"), async (req: Request, res: Response) => {
  try {
    const { name, email, phone, stationId, organizationId } = req.body;
    if (!name || !email || !phone || !stationId) {
      return sendError(res, "VALIDATION_ERROR", "name, email, phone, and stationId are required", 400);
    }

    const roleId = await getOperatorRoleId();
    if (!roleId) {
      return sendError(res, "NOT_FOUND", "OPERATOR role not found", 404);
    }

    const station = await prisma.station.findUnique({ where: { id: stationId } });
    if (!station) {
      return sendError(res, "NOT_FOUND", "Station not found", 404);
    }

    const targetOrganizationId =
      req.user?.role === "SUPER_ADMIN" ? (organizationId || station.organizationId) : req.user?.organizationId;

    if (req.user?.role !== "SUPER_ADMIN" && station.organizationId !== req.user?.organizationId) {
      return sendError(res, "FORBIDDEN", "Cannot create operator outside your organization", 403);
    }

    const normalizedPhone = normalizePhoneNumber(phone);
    if (!normalizedPhone || !normalizedPhone.startsWith("255")) {
      return sendError(res, "VALIDATION_ERROR", "phone must be valid and start with 255", 400);
    }
    const generatedOtp = Math.floor(100000 + Math.random() * 900000).toString();

    const user = await prisma.user.create({
      data: {
        name,
        email,
        phone: normalizedPhone,
        loginCode: hashPassword(generatedOtp),
        isFirstLogin: true,
        roleId,
        organizationId: targetOrganizationId || null,
        stationId,
      },
      include: { role: true, organization: true, station: true },
    });

    await logAudit({
      userId: req.user?.id,
      action: "CREATE",
      resource: "operator",
      details: { targetUserId: user.id, stationId, organizationId: targetOrganizationId },
    });

    let smsDispatched = true;
    let smsError: string | null = null;
    try {
      const message = await buildWelcomeOtpMessage({
        name,
        otp: generatedOtp,
        organizationId: user.organizationId,
      });
      await sendSms({
        phoneNumber: normalizedPhone,
        message,
        organizationId: user.organizationId,
      });
    } catch (error: any) {
      smsDispatched = false;
      smsError = error?.message || "Failed to send OTP SMS";
    }

    return sendSuccess(
      res,
      {
        ...user,
        otpDelivery: { smsDispatched, smsError },
      },
      201,
    );
  } catch (error: any) {
    if (error.code === "P2002") {
      return sendError(res, "CONFLICT", "Email or phone already exists", 409);
    }
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.post("/:id/resend-otp", requirePermission("operators:update"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const existing = await prisma.user.findUnique({
      where: { id },
      include: { role: true, organization: true },
    });
    if (!existing || existing.deletedAt) {
      return sendError(res, "NOT_FOUND", "User not found", 404);
    }

    if (!existing.phone) {
      return sendError(res, "VALIDATION_ERROR", "User has no phone number to send OTP", 400);
    }

    const isRequesterSuperAdmin = req.user?.role === "SUPER_ADMIN";
    if (!isRequesterSuperAdmin && existing.organizationId !== req.user?.organizationId) {
      return sendError(res, "FORBIDDEN", "Cannot resend OTP for operators outside your organization", 403);
    }

    const generatedOtp = Math.floor(100000 + Math.random() * 900000).toString();
    await prisma.user.update({
      where: { id: existing.id },
      data: { loginCode: hashPassword(generatedOtp) },
    });

    await logAudit({
      userId: req.user?.id,
      action: "RESEND_OTP",
      resource: "user",
      details: { targetUserId: existing.id, role: existing.role?.name || existing.roleId || null },
    });

    await sendSms({
      phoneNumber: existing.phone,
      message: `Your Mizigo OTP is ${generatedOtp}. Use it to login.`,
      organizationId: existing.organizationId,
    });

    return sendSuccess(res, { message: "OTP resent successfully" });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.get("/", async (req: Request, res: Response) => {
  try {
    const operatorRoleId = await getOperatorRoleId();
    if (!operatorRoleId) {
      return sendSuccess(res, []);
    }

    const where = req.user?.role === "SUPER_ADMIN"
      ? { roleId: operatorRoleId }
      : { roleId: operatorRoleId, organizationId: req.user?.organizationId ?? "" };

    const operators = await prisma.user.findMany({
      where,
      include: { role: true, organization: true, station: true },
      orderBy: { createdAt: "desc" },
    });

    return sendSuccess(res, operators);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.put("/:id", requirePermission("operators:update"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const existing = await prisma.user.findUnique({ where: { id } });
    if (!existing) {
      return sendError(res, "NOT_FOUND", "Operator not found", 404);
    }
    if (req.user?.role !== "SUPER_ADMIN" && existing.organizationId !== req.user?.organizationId) {
      return sendError(res, "FORBIDDEN", "Cannot update operator from another organization", 403);
    }

    const updated = await prisma.user.update({
      where: { id },
      data: {
        name: req.body.name,
        phone: req.body.phone === undefined ? undefined : normalizePhoneNumber(req.body.phone),
        stationId: req.body.stationId,
        isActive: req.body.isActive,
      },
      include: { role: true, organization: true, station: true },
    });

    await logAudit({
      userId: req.user?.id,
      action: "UPDATE",
      resource: "operator",
      details: { targetUserId: id },
    });

    return sendSuccess(res, updated);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.delete("/:id", requirePermission("operators:delete"), async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const existing = await prisma.user.findUnique({ where: { id } });
    if (!existing) {
      return sendError(res, "NOT_FOUND", "Operator not found", 404);
    }
    if (req.user?.role !== "SUPER_ADMIN" && existing.organizationId !== req.user?.organizationId) {
      return sendError(res, "FORBIDDEN", "Cannot deactivate operator from another organization", 403);
    }

    const updated = await prisma.user.update({
      where: { id },
      data: { isActive: false },
      include: { role: true, organization: true, station: true },
    });

    await logAudit({
      userId: req.user?.id,
      action: "DEACTIVATE",
      resource: "operator",
      details: { targetUserId: id },
    });

    return sendSuccess(res, updated);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
