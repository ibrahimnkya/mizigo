import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";

const router: Router = Router();

router.use(authenticate, requireTenantContext);

router.post("/", requirePermission("integrations:create"), async (req: Request, res: Response) => {
  const { type, name, config = {}, isActive = true, organizationId } = req.body;
  if (!type || !name) {
    return sendError(res, "VALIDATION_ERROR", "type and name are required", 400);
  }

  const targetOrgId =
    req.user?.role === "SUPER_ADMIN" ? (organizationId || null) : (req.user?.organizationId || null);

  const item = await prisma.integration.create({
    data: {
      type,
      name,
      organizationId: targetOrgId,
      config,
      isActive: Boolean(isActive),
    },
  });
  return sendSuccess(res, item, 201);
});

router.get("/", async (_req: Request, res: Response) => {
  const list =
    _req.user?.role === "SUPER_ADMIN"
      ? await prisma.integration.findMany({ orderBy: { createdAt: "desc" } })
      : await prisma.integration.findMany({
          where: { organizationId: _req.user?.organizationId || "" },
          orderBy: { createdAt: "desc" },
        });
  return sendSuccess(res, list);
});

router.put("/:id", requirePermission("integrations:update"), async (req: Request, res: Response) => {
  const item = await prisma.integration.findUnique({ where: { id: req.params.id } });
  if (!item) return sendError(res, "NOT_FOUND", "Integration not found", 404);
  if (_reqNotAllowed(item, req)) return sendError(res, "FORBIDDEN", "Cannot update integration", 403);

  const updated = await prisma.integration.update({
    where: { id: item.id },
    data: {
      name: req.body.name,
      type: req.body.type,
      config: req.body.config,
      isActive: req.body.isActive,
    },
  });
  return sendSuccess(res, updated);
});

const _reqNotAllowed = (item: { organizationId: string | null }, req: Request) =>
  req.user?.role !== "SUPER_ADMIN" && item.organizationId !== req.user?.organizationId;

export default router;
