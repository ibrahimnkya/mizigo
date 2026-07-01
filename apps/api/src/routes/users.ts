import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { normalizePhoneNumber } from "../lib/phone";

const router: Router = Router();

// GET /api/v1/users - List users with optional role filtering (Org scoped for non-Super Admin)
router.get("/", authenticate, async (req: Request, res: Response) => {
  try {
    const { role: roleFilter } = req.query;
    const currentUserRole = req.user?.role;

    let whereClause: any = {
      isActive: true,
      deletedAt: null,
    };

    if (currentUserRole !== "SUPER_ADMIN") {
      whereClause.organizationId = req.user?.organizationId ?? undefined;
    }

    if (roleFilter === "ADMIN") {
      const adminRoles = await prisma.role.findMany({
        where: { name: { in: ["ADMIN", "ORG_ADMIN"] } },
      });
      whereClause.roleId = { in: adminRoles.map((r) => r.id) };
    } else if (roleFilter === "OPERATOR") {
      const operatorRoles = await prisma.role.findMany({
        where: { name: { in: ["OPERATOR", "STATION_OPERATOR"] } },
      });
      whereClause.roleId = { in: operatorRoles.map((r) => r.id) };
    } else if (roleFilter) {
      const specificRole = await prisma.role.findFirst({
        where: { name: String(roleFilter) },
      });
      if (specificRole) {
        whereClause.roleId = specificRole.id;
      } else {
        whereClause.roleId = "non-existent";
      }
    }

    const users = await prisma.user.findMany({
      where: whereClause,
      include: {
        role: { select: { name: true } },
        organization: { select: { name: true } },
        station: { select: { name: true, code: true } },
      },
      orderBy: { createdAt: "desc" },
    });

    return sendSuccess(res, users);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// GET /api/v1/users/global - List all users in the system (Super Admin only)
router.get("/global", authenticate, async (req: Request, res: Response) => {
  try {
    if (req.user?.role !== "SUPER_ADMIN") {
      return sendError(
        res,
        "FORBIDDEN",
        "Only super admin can access global directory",
        403,
      );
    }

    const users = await prisma.user.findMany({
      where: { deletedAt: null },
      include: {
        role: true,
        organization: true,
        station: {
          select: { name: true, code: true },
        },
      },
      orderBy: { createdAt: "desc" },
    });

    return sendSuccess(res, users);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// GET /api/v1/users/roles - List available roles
router.get("/roles", authenticate, async (req: Request, res: Response) => {
  try {
    const roles = await prisma.role.findMany({
      where: { deletedAt: null },
      select: { id: true, name: true, description: true },
    });
    return sendSuccess(res, roles);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// GET /api/v1/users/check-availability?email=xxx&phone=yyy
// Returns {emailExists, phoneExists} — used by create-user modal before posting
router.get("/check-availability", authenticate, async (req: Request, res: Response) => {
  try {
    const { email, phone } = req.query as { email?: string; phone?: string };
    const [emailUser, phoneUser] = await Promise.all([
      email
        ? prisma.user.findFirst({ where: { email: String(email) } })
        : null,
      phone
        ? prisma.user.findFirst({ where: { phone: String(phone) } })
        : null,
    ]);
    return sendSuccess(res, {
      emailExists: !!emailUser,
      phoneExists: !!phoneUser,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// GET /api/v1/users/:id/parcels - Retrieve parcels handled by a user
router.get(
  "/:id/parcels",
  authenticate,
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      const user = await prisma.user.findUnique({
        where: { id },
        include: { role: true },
      });

      if (!user || user.deletedAt) {
        return sendError(res, "NOT_FOUND", "User not found", 404);
      }

      const roleName = user.role?.name;
      const isTrainGuard = roleName === "TRAIN_GUARD";
      const isClerk = roleName === "CLERK";

      let whereClause: any;
      if (isTrainGuard) {
        whereClause = {
          OR: [{ dispatcherId: id }, { offloaderId: id }],
        };
      } else if (isClerk) {
        whereClause = {
          OR: [{ userId: id }, { dispatcherId: id }, { delivererId: id }],
        };
      } else {
        whereClause = {
          OR: [
            { userId: id },
            { dispatcherId: id },
            { offloaderId: id },
            { delivererId: id },
          ],
        };
      }

      const parcels = await prisma.parcel.findMany({
        where: whereClause,
        include: {
          origin: { select: { name: true, code: true } },
          destination: { select: { name: true, code: true } },
        },
        orderBy: { createdAt: "desc" },
        take: 100,
      });

      return sendSuccess(res, parcels);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

// GET /api/v1/users/:id - Get detailed user profile with performance stats
router.get("/:id", authenticate, async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const user = await prisma.user.findUnique({
      where: { id },
      include: { role: true, organization: true, station: true },
    });

    if (!user || user.deletedAt) {
      return sendError(res, "NOT_FOUND", "User not found", 404);
    }

    const dispatched = await prisma.parcel.count({
      where: { dispatcherId: id },
    });
    const offloaded = await prisma.parcel.count({ where: { offloaderId: id } });
    const delivered = await prisma.parcel.count({ where: { delivererId: id } });
    const created = await prisma.parcel.count({ where: { userId: id } });

    let stats;
    if (user.role?.name === "TRAIN_GUARD") {
      stats = {
        dispatched,
        offloaded,
        totalHandled: dispatched + offloaded,
      };
    } else if (user.role?.name === "CLERK") {
      stats = {
        created,
        dispatched,
        delivered,
        totalHandled: created + dispatched + delivered,
      };
    } else {
      stats = {
        created,
        dispatched,
        offloaded,
        delivered,
        totalHandled: created + dispatched + offloaded + delivered,
      };
    }

    return sendSuccess(res, {
      ...user,
      stats,
    });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// DELETE /api/v1/users/:id — soft-delete a staff member if they have NO activity
router.delete("/:id", authenticate, async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const user = await prisma.user.findUnique({
      where: { id },
      include: { role: true },
    });

    if (!user || user.deletedAt) {
      return sendError(res, "NOT_FOUND", "User not found", 404);
    }

    // Check for any parcel activity
    const activityCount = await prisma.parcel.count({
      where: {
        OR: [
          { userId: id },
          { dispatcherId: id },
          { offloaderId: id },
          { delivererId: id },
        ],
      },
    });

    if (activityCount > 0) {
      return sendError(
        res,
        "CONFLICT",
        `Cannot delete staff member — they have ${activityCount} parcel operation(s) on record. Suspend the account instead.`,
        409,
      );
    }

    // Safe to delete — soft-delete
    const timestamp = Date.now();
    await prisma.user.update({
      where: { id },
      data: {
        deletedAt: new Date(),
        isActive: false,
        stationId: null,
        email: `deleted_${timestamp}_${user.email}`,
        phone: user.phone ? `deleted_${timestamp}_${user.phone}` : null,
      },
    });

    return sendSuccess(res, { deleted: true, id });
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

// PUT /api/v1/users/profile - Update current authenticated user's profile
router.put("/profile", authenticate, async (req: Request, res: Response) => {
  try {
    if (!req.user) {
      return sendError(res, "UNAUTHORIZED", "Unauthorized", 401);
    }
    const { name, phone } = req.body;

    const dataToUpdate: any = {};
    if (name !== undefined) {
      if (!name || String(name).trim().length === 0) {
        return sendError(res, "VALIDATION_ERROR", "Name cannot be empty", 400);
      }
      dataToUpdate.name = String(name).trim();
    }
    if (phone !== undefined) {
      const normalized = normalizePhoneNumber(phone);
      if (!normalized) {
        return sendError(res, "VALIDATION_ERROR", "Invalid phone number format", 400);
      }
      dataToUpdate.phone = normalized;
    }

    // If updating phone, check availability
    if (dataToUpdate.phone) {
      const existing = await prisma.user.findFirst({
        where: {
          phone: dataToUpdate.phone,
          id: { not: req.user.id },
          deletedAt: null,
        },
      });
      if (existing) {
        return sendError(res, "CONFLICT", "Phone number already in use", 409);
      }
    }

    const updated = await prisma.user.update({
      where: { id: req.user.id },
      data: dataToUpdate,
      include: { role: true, organization: true, station: true },
    });

    return sendSuccess(res, updated);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

export default router;
