import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";

const router: Router = Router();

// GET /
router.get(
  "/",
  authenticate,
  async (_req: Request, res: Response) => {
    try {
      const services = await prisma.serviceType.findMany({
        orderBy: { name: "asc" },
      });
      return sendSuccess(res, services);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  }
);

// POST /
router.post(
  "/",
  authenticate,
  requirePermission("admin:write"),
  async (req: Request, res: Response) => {
    try {
      const { name, description, basePrice, isActive } = req.body;
      if (!name || basePrice === undefined) {
        return sendError(res, "VALIDATION_ERROR", "name and basePrice are required", 400);
      }

      // check unique name
      const existing = await prisma.serviceType.findUnique({
        where: { name },
      });
      if (existing) {
        return sendError(res, "VALIDATION_ERROR", "Service type with this name already exists", 400);
      }

      const service = await prisma.serviceType.create({
        data: {
          name,
          description: description || null,
          basePrice: parseFloat(basePrice),
          isActive: isActive !== undefined ? Boolean(isActive) : true,
        },
      });

      return sendSuccess(res, service, 201);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  }
);

// PUT /:id
router.put(
  "/:id",
  authenticate,
  requirePermission("admin:write"),
  async (req: Request, res: Response) => {
    try {
      const { name, description, basePrice, isActive } = req.body;
      const { id } = req.params;

      const existing = await prisma.serviceType.findUnique({
        where: { id },
      });
      if (!existing) {
        return sendError(res, "NOT_FOUND", "Service type not found", 404);
      }

      // Check unique name if changing name
      if (name && name !== existing.name) {
        const dup = await prisma.serviceType.findUnique({
          where: { name },
        });
        if (dup) {
          return sendError(res, "VALIDATION_ERROR", "Service type with this name already exists", 400);
        }
      }

      const service = await prisma.serviceType.update({
        where: { id },
        data: {
          name: name !== undefined ? name : existing.name,
          description: description !== undefined ? description : existing.description,
          basePrice: basePrice !== undefined ? parseFloat(basePrice) : existing.basePrice,
          isActive: isActive !== undefined ? Boolean(isActive) : existing.isActive,
        },
      });

      return sendSuccess(res, service);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  }
);

// DELETE /:id
router.delete(
  "/:id",
  authenticate,
  requirePermission("admin:write"),
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;

      const existing = await prisma.serviceType.findUnique({
        where: { id },
      });
      if (!existing) {
        return sendError(res, "NOT_FOUND", "Service type not found", 404);
      }

      await prisma.serviceType.delete({
        where: { id },
      });

      return sendSuccess(res, { message: "Service type deleted successfully" });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  }
);

export default router;
