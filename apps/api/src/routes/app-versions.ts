import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";

const router: Router = Router();

const compareVersions = (a: string, b: string) => {
  const pa = a.split(".").map(Number);
  const pb = b.split(".").map(Number);
  for (let i = 0; i < Math.max(pa.length, pb.length); i += 1) {
    const diff = (pa[i] || 0) - (pb[i] || 0);
    if (diff !== 0) return diff;
  }
  return 0;
};

router.post("/", authenticate, requireTenantContext, requirePermission("app_versions:create"), async (req: Request, res: Response) => {
  const { version, minSupportedVersion, forceUpdate = false, downloadUrl = "" } = req.body;
  if (!version || !minSupportedVersion) {
    return sendError(res, "VALIDATION_ERROR", "version and minSupportedVersion are required", 400);
  }

  const item = await prisma.appVersion.create({
    data: {
      version: String(version),
      minSupportedVersion: String(minSupportedVersion),
      forceUpdate: Boolean(forceUpdate),
      downloadUrl: String(downloadUrl),
    },
  });
  return sendSuccess(res, item, 201);
});

router.get("/", authenticate, requireTenantContext, async (_req: Request, res: Response) => {
  const versions = await prisma.appVersion.findMany({
    where: { deletedAt: null },
    orderBy: { createdAt: "desc" },
  });
  return sendSuccess(res, versions);
});

router.get("/latest", authenticate, requireTenantContext, async (_req: Request, res: Response) => {
  const versions = await prisma.appVersion.findMany({ where: { deletedAt: null } });
  if (!versions.length) {
    return sendError(res, "NOT_FOUND", "No app versions found", 404);
  }
  const latest = [...versions].sort((a, b) => compareVersions(b.version, a.version))[0];
  return sendSuccess(res, latest);
});

router.get("/check-update", authenticate, requireTenantContext, async (req: Request, res: Response) => {
  const currentVersion = String(req.query.currentVersion || "");
  if (!currentVersion) {
    return sendError(res, "VALIDATION_ERROR", "currentVersion query param is required", 400);
  }
  const versions = await prisma.appVersion.findMany({ where: { deletedAt: null } });
  if (!versions.length) {
    return sendError(res, "NOT_FOUND", "No app versions found", 404);
  }
  const latest = [...versions].sort((a, b) => compareVersions(b.version, a.version))[0];
  const forceUpdate = latest.forceUpdate || compareVersions(currentVersion, latest.minSupportedVersion) < 0;
  return sendSuccess(res, {
    latestVersion: latest.version,
    forceUpdate,
    downloadUrl: latest.downloadUrl,
  });
});

router.get("/:id", authenticate, requireTenantContext, async (req: Request, res: Response) => {
  const item = await prisma.appVersion.findUnique({ where: { id: req.params.id } });
  if (!item) return sendError(res, "NOT_FOUND", "App version not found", 404);
  return sendSuccess(res, item);
});

export default router;
