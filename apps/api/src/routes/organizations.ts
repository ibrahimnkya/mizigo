import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";
import { sendError, sendSuccess } from "../lib/api-response";
import { authenticate, requirePermission } from "../middleware/auth";
import { requireTenantContext } from "../middleware/tenant-scope";
import { logAudit } from "../lib/audit";
import { publicBrandingLimit } from "../middleware/rate-limit";

const router: Router = Router();

const secure = [authenticate, requireTenantContext];

/// Read-only org lookups for station staff (clerks, guards…). Their token may
/// carry no organizationId, so fall back to the user's record, then their station's.
const resolveOrgId = async (req: Request): Promise<string | null> => {
  if (req.user?.organizationId) return req.user.organizationId;
  if (!req.user?.id) return null;
  const user = await prisma.user.findUnique({
    where: { id: req.user.id },
    select: { organizationId: true, station: { select: { organizationId: true } } },
  });
  return user?.organizationId ?? user?.station?.organizationId ?? null;
};

const HEX_COLOR_RE = /^#([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$/;
const SLUG_RE = /^[a-z0-9-]+$/;

const validateBrandingInput = (body: Record<string, unknown>) => {
  const { slug, primaryColor, secondaryColor } = body;
  if (
    primaryColor !== undefined &&
    primaryColor !== null &&
    primaryColor !== "" &&
    !HEX_COLOR_RE.test(String(primaryColor))
  ) {
    return "primaryColor must be a hex color (e.g. #1d4ed8)";
  }
  if (
    secondaryColor !== undefined &&
    secondaryColor !== null &&
    secondaryColor !== "" &&
    !HEX_COLOR_RE.test(String(secondaryColor))
  ) {
    return "secondaryColor must be a hex color (e.g. #1d4ed8)";
  }
  if (
    slug !== undefined &&
    slug !== null &&
    slug !== "" &&
    !SLUG_RE.test(String(slug))
  ) {
    return "slug may only contain lowercase letters, numbers, and hyphens";
  }
  return null;
};

router.post(
  "/",
  ...secure,
  requirePermission("organizations:create"),
  async (req: Request, res: Response) => {
    try {
      const {
        name,
        description,
        supportUrl,
        commissionRate,
        commissionNotes,
        slug,
        logoUrl,
        faviconUrl,
        primaryColor,
        secondaryColor,
      } = req.body;
      if (!name) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "Organization name is required",
          400,
        );
      }
      if (
        commissionRate !== undefined &&
        (Number(commissionRate) < 0 || Number(commissionRate) > 1)
      ) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "commissionRate must be between 0 and 1",
          400,
        );
      }
      const brandingError = validateBrandingInput(req.body);
      if (brandingError) {
        return sendError(res, "VALIDATION_ERROR", brandingError, 400);
      }

      const organization = await prisma.organization.create({
        data: {
          name,
          description: description || null,
          supportUrl: supportUrl || null,
          commissionRate:
            commissionRate === undefined ? null : Number(commissionRate),
          commissionNotes: commissionNotes || null,
          slug: slug || null,
          logoUrl: logoUrl || null,
          faviconUrl: faviconUrl || null,
          primaryColor: primaryColor || null,
          secondaryColor: secondaryColor || null,
        },
      });

      await logAudit({
        userId: req.user?.id,
        action: "CREATE",
        resource: "organization",
        details: { organizationId: organization.id },
      });

      return sendSuccess(res, organization, 201);
    } catch (error: any) {
      if (error.code === "P2002") {
        const target = String(error.meta?.target ?? "");
        const message = target.includes("slug")
          ? "That login slug is already taken"
          : "Organization name already exists";
        return sendError(res, "CONFLICT", message, 409);
      }
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.get("/", ...secure, async (req: Request, res: Response) => {
  try {
    const includeInactive = req.query.includeInactive === "true";
    const all = req.query.all === "true" || req.user?.role === "SUPER_ADMIN";

    const where = all
      ? { ...(includeInactive ? {} : { isActive: true }), deletedAt: null }
      : {
          id: req.user?.organizationId ?? "",
          ...(includeInactive ? {} : { isActive: true }),
          deletedAt: null,
        };

    const organizations = await prisma.organization.findMany({
      where,
      orderBy: { name: "asc" },
    });

    return sendSuccess(res, organizations);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

/**
 * GET /api/v1/organizations/branding
 * Self-service: returns the branding of the authenticated user's own organization.
 */
router.get("/branding", authenticate, async (req: Request, res: Response) => {
  try {
    const orgId = await resolveOrgId(req);
    // No organization → default MiziGO branding on the client.
    if (!orgId) return sendSuccess(res, null);
    const organization = await prisma.organization.findUnique({
      where: { id: orgId },
      select: {
        id: true,
        name: true,
        slug: true,
        logoUrl: true,
        faviconUrl: true,
        primaryColor: true,
        secondaryColor: true,
      },
    });
    if (!organization) {
      return sendError(res, "NOT_FOUND", "Organization not found", 404);
    }
    return sendSuccess(res, organization);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

/**
 * PUT /api/v1/organizations/branding
 * Self-service: lets an org admin update their own organization's whitelabel branding.
 */
router.put(
  "/branding",
  ...secure,
  requirePermission("organizations:branding:update"),
  async (req: Request, res: Response) => {
    try {
      const orgId = req.user?.organizationId;
      if (!orgId) {
        return sendError(res, "FORBIDDEN", "No organization context", 403);
      }

      const brandingError = validateBrandingInput(req.body);
      if (brandingError) {
        return sendError(res, "VALIDATION_ERROR", brandingError, 400);
      }

      const { slug, logoUrl, faviconUrl, primaryColor, secondaryColor } =
        req.body;

      const organization = await prisma.organization.update({
        where: { id: orgId },
        data: {
          slug: slug === undefined ? undefined : slug || null,
          logoUrl: logoUrl === undefined ? undefined : logoUrl || null,
          faviconUrl:
            faviconUrl === undefined ? undefined : faviconUrl || null,
          primaryColor:
            primaryColor === undefined ? undefined : primaryColor || null,
          secondaryColor:
            secondaryColor === undefined ? undefined : secondaryColor || null,
        },
        select: {
          id: true,
          name: true,
          slug: true,
          logoUrl: true,
          faviconUrl: true,
          primaryColor: true,
          secondaryColor: true,
        },
      });

      await logAudit({
        userId: req.user?.id,
        action: "UPDATE",
        resource: "organization",
        details: {
          organizationId: orgId,
          changedFields: Object.keys(req.body),
        },
      });

      return sendSuccess(res, organization);
    } catch (error: any) {
      if (error.code === "P2002") {
        return sendError(res, "CONFLICT", "Slug already in use", 409);
      }
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

/**
 * GET /api/v1/organizations/branding/public/:slug
 * Unauthenticated: powers a branded login link (e.g. /login?org=<slug>).
 * Only ever returns cosmetic fields — never financial/operational org data.
 */
router.get(
  "/branding/public/:slug",
  publicBrandingLimit,
  async (req: Request, res: Response) => {
    try {
      const { slug } = req.params;
      const organization = await prisma.organization.findFirst({
        where: { slug, isActive: true, deletedAt: null },
        select: {
          name: true,
          logoUrl: true,
          faviconUrl: true,
          primaryColor: true,
          secondaryColor: true,
        },
      });
      if (!organization) {
        return sendError(res, "NOT_FOUND", "Branding not found", 404);
      }
      return sendSuccess(res, organization);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

/**
 * GET /api/v1/organizations/print-config
 * Returns the print configuration for the authenticated user's organization.
 */
router.get("/print-config", authenticate, async (req: Request, res: Response) => {
  try {
    const orgId = await resolveOrgId(req);
    if (!orgId) {
      return sendSuccess(res, {});
    }
    const config = await prisma.systemConfig.findUnique({
      where: { key_organizationId: { key: "PRINT_CONFIG", organizationId: orgId } },
    });
    if (!config) return sendSuccess(res, {});
    try {
      return sendSuccess(res, JSON.parse(config.value));
    } catch {
      return sendSuccess(res, {});
    }
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

/**
 * PUT /api/v1/organizations/print-config
 * Saves the print configuration for the authenticated user's organization.
 */
router.put(
  "/print-config",
  ...secure,
  requirePermission("organizations:update"),
  async (req: Request, res: Response) => {
    try {
      const orgId = req.user?.organizationId;
      if (!orgId) {
        return sendError(res, "FORBIDDEN", "No organization context", 403);
      }
      await prisma.systemConfig.upsert({
        where: { key_organizationId: { key: "PRINT_CONFIG", organizationId: orgId } },
        update: { value: JSON.stringify(req.body) },
        create: { key: "PRINT_CONFIG", value: JSON.stringify(req.body), organizationId: orgId },
      });
      return sendSuccess(res, { saved: true });
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.get("/:id", ...secure, async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    if (req.user?.role !== "SUPER_ADMIN" && req.user?.organizationId !== id) {
      return sendError(
        res,
        "FORBIDDEN",
        "Cannot access this organization",
        403,
      );
    }

    const organization = await prisma.organization.findUnique({
      where: { id },
    });
    if (!organization) {
      return sendError(res, "NOT_FOUND", "Organization not found", 404);
    }

    return sendSuccess(res, organization);
  } catch (error: any) {
    return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
  }
});

router.put(
  "/:id",
  ...secure,
  requirePermission("organizations:update"),
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      if (req.user?.role !== "SUPER_ADMIN" && req.user?.organizationId !== id) {
        return sendError(
          res,
          "FORBIDDEN",
          "Cannot update this organization",
          403,
        );
      }

      if (
        req.body.commissionRate !== undefined &&
        (Number(req.body.commissionRate) < 0 ||
          Number(req.body.commissionRate) > 1)
      ) {
        return sendError(
          res,
          "VALIDATION_ERROR",
          "commissionRate must be between 0 and 1",
          400,
        );
      }
      const brandingError = validateBrandingInput(req.body);
      if (brandingError) {
        return sendError(res, "VALIDATION_ERROR", brandingError, 400);
      }

      const organization = await prisma.organization.update({
        where: { id },
        data: {
          name: req.body.name,
          description: req.body.description,
          supportUrl: req.body.supportUrl,
          commissionRate:
            req.body.commissionRate === undefined
              ? undefined
              : Number(req.body.commissionRate),
          commissionNotes: req.body.commissionNotes,
          isActive: req.body.isActive,
          slug: req.body.slug === undefined ? undefined : req.body.slug || null,
          logoUrl:
            req.body.logoUrl === undefined ? undefined : req.body.logoUrl || null,
          faviconUrl:
            req.body.faviconUrl === undefined
              ? undefined
              : req.body.faviconUrl || null,
          primaryColor:
            req.body.primaryColor === undefined
              ? undefined
              : req.body.primaryColor || null,
          secondaryColor:
            req.body.secondaryColor === undefined
              ? undefined
              : req.body.secondaryColor || null,
        },
      });

      await logAudit({
        userId: req.user?.id,
        action: "UPDATE",
        resource: "organization",
        details: { organizationId: id },
      });

      return sendSuccess(res, organization);
    } catch (error: any) {
      if (error.code === "P2002") {
        const target = String(error.meta?.target ?? "");
        const message = target.includes("slug")
          ? "That login slug is already taken"
          : "Organization name already exists";
        return sendError(res, "CONFLICT", message, 409);
      }
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

router.delete(
  "/:id",
  ...secure,
  requirePermission("organizations:delete"),
  async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      if (req.user?.role !== "SUPER_ADMIN" && req.user?.organizationId !== id) {
        return sendError(
          res,
          "FORBIDDEN",
          "Cannot delete this organization",
          403,
        );
      }

      const organization = await prisma.organization.update({
        where: { id },
        data: { isActive: false },
      });

      await logAudit({
        userId: req.user?.id,
        action: "SOFT_DELETE",
        resource: "organization",
        details: { organizationId: id },
      });

      return sendSuccess(res, organization);
    } catch (error: any) {
      return sendError(res, "INTERNAL_SERVER_ERROR", error.message, 500);
    }
  },
);

export default router;
