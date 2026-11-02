"use client";

import { createContext, useContext, useEffect } from "react";
import { useSession } from "next-auth/react";
import { useOrganizationBranding } from "@/modules/organizations/use-organizations";

interface BrandingContextValue {
  name?: string | null;
  logoUrl?: string | null;
  faviconUrl?: string | null;
  primaryColor?: string | null;
  secondaryColor?: string | null;
  isLoading: boolean;
}

const BrandingContext = createContext<BrandingContextValue>({
  isLoading: false,
});

export const useBranding = () => useContext(BrandingContext);

/** Converts a #rrggbb / #rgb hex color into the "H S% L%" triplet the Tailwind theme expects. */
function hexToHslTriplet(hex: string): string | null {
  const normalized = hex.trim().replace("#", "");
  const full =
    normalized.length === 3
      ? normalized.split("").map((c) => c + c).join("")
      : normalized;
  if (!/^[0-9a-fA-F]{6}$/.test(full)) return null;

  const r = parseInt(full.slice(0, 2), 16) / 255;
  const g = parseInt(full.slice(2, 4), 16) / 255;
  const b = parseInt(full.slice(4, 6), 16) / 255;

  const max = Math.max(r, g, b);
  const min = Math.min(r, g, b);
  let h = 0;
  let s = 0;
  const l = (max + min) / 2;

  if (max !== min) {
    const d = max - min;
    s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
    switch (max) {
      case r:
        h = (g - b) / d + (g < b ? 6 : 0);
        break;
      case g:
        h = (b - r) / d + 2;
        break;
      default:
        h = (r - g) / d + 4;
    }
    h /= 6;
  }

  return `${Math.round(h * 360)} ${Math.round(s * 100)}% ${Math.round(l * 100)}%`;
}

// Next.js's own root-layout metadata (icons: "/icon.png") renders a
// <link rel="icon"> into <head> via its own React tree. Removing or
// replacing *that* node with raw DOM APIs desyncs it from React's fiber
// tree and crashes later with "Cannot read properties of null (reading
// 'removeChild')". So branding only ever creates/updates/removes a single
// link element it owns (identified by this id), never touching Next's.
const BRANDING_FAVICON_ID = "org-branding-favicon";

function applyFavicon(url: string) {
  let link = document.getElementById(
    BRANDING_FAVICON_ID,
  ) as HTMLLinkElement | null;
  if (!link) {
    link = document.createElement("link");
    link.id = BRANDING_FAVICON_ID;
    link.rel = "icon";
    document.head.appendChild(link);
  }
  link.href = url;
}

function clearFavicon() {
  document.getElementById(BRANDING_FAVICON_ID)?.remove();
}

/**
 * Applies the authenticated user's organization branding (logo, favicon, colors)
 * to the dashboard shell by overriding the CSS variables consumed by tailwind.config.ts.
 */
export function BrandingProvider({ children }: { children: React.ReactNode }) {
  const { data: session } = useSession();
  const organizationId = (session?.user as any)?.organizationId as
    | string
    | undefined
    | null;

  const { data: branding, isLoading } = useOrganizationBranding(
    !!organizationId,
  );

  useEffect(() => {
    const root = document.documentElement;
    const primaryHsl = branding?.primaryColor
      ? hexToHslTriplet(branding.primaryColor)
      : null;
    const secondaryHsl = branding?.secondaryColor
      ? hexToHslTriplet(branding.secondaryColor)
      : null;

    if (primaryHsl) {
      root.style.setProperty("--primary", primaryHsl);
      root.style.setProperty("--ring", primaryHsl);
    }
    if (secondaryHsl) {
      root.style.setProperty("--secondary", secondaryHsl);
    }

    if (branding?.faviconUrl) {
      applyFavicon(branding.faviconUrl);
    } else {
      clearFavicon();
    }

    return () => {
      if (primaryHsl) {
        root.style.removeProperty("--primary");
        root.style.removeProperty("--ring");
      }
      if (secondaryHsl) {
        root.style.removeProperty("--secondary");
      }
      clearFavicon();
    };
  }, [branding?.primaryColor, branding?.secondaryColor, branding?.faviconUrl]);

  return (
    <BrandingContext.Provider
      value={{
        name: branding?.name,
        logoUrl: branding?.logoUrl,
        faviconUrl: branding?.faviconUrl,
        primaryColor: branding?.primaryColor,
        secondaryColor: branding?.secondaryColor,
        isLoading,
      }}
    >
      {children}
    </BrandingContext.Provider>
  );
}
