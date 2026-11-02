"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { ChevronRight, Home } from "lucide-react";
import { cn } from "@/lib/utils";

// Segment label overrides for cleaner display
const SEGMENT_LABELS: Record<string, string> = {
  parcel: "Parcels",
  parcels: "Parcels",
  reports: "Reports",
  admin: "Admin",
  operator: "Operator",
  users: "Users",
  payments: "Payments",
  organizations: "Organizations",
  stations: "Stations",
  audit: "Audit Logs",
  settings: "Settings",
  notifications: "Notifications",
  profile: "Profile",
  agents: "Agents",
  admins: "Admins",
  fleet: "Fleet",
  performance: "Performance",
  overview: "Overview",
  revenue: "Revenue",
  volume: "Volume",
  turnaround: "Turnaround",
  organization: "Organization",
  operations: "Operations",
  "my-payments": "My Payments",
  history: "History",
  "sms-logs": "SMS Logs",
  "super-admin": "Super Admin",
  "agent-network": "Agent Network",
  "modules": "Module Config",
  "printout": "Printout Config",
  "parcel-parameters": "Parcel Parameters",
  "wagon-types": "Wagon Types",
  finance: "Finance",
  pricing: "Pricing",
  lastmile: "Last Mile",
  received: "Received",
  dispatched: "Dispatched",
  delivered: "Delivered",
  offloaded: "Offloaded",
  cancelled: "Cancelled",
  lost: "Lost",
  station: "Station",
};

function formatSegment(segment: string): string {
  if (SEGMENT_LABELS[segment]) return SEGMENT_LABELS[segment];
  // Title-case with spaces for dashes/underscores
  return segment
    .replace(/[-_]/g, " ")
    .replace(/\b\w/g, (c) => c.toUpperCase());
}

interface BreadcrumbsProps {
  className?: string;
  /** Optional override: provide explicit crumbs instead of path-derived ones */
  crumbs?: { label: string; href?: string }[];
}

export function Breadcrumbs({ className, crumbs: customCrumbs }: BreadcrumbsProps) {
  const pathname = usePathname();

  const crumbs = customCrumbs ?? buildCrumbs(pathname);

  if (crumbs.length <= 1) return null;

  return (
    <nav
      aria-label="Breadcrumb"
      className={cn("flex items-center gap-1 flex-wrap", className)}
    >
      <Link
        href="/dashboard"
        className="flex items-center gap-1 text-[10px] font-bold text-slate-400 hover:text-slate-700 transition-colors uppercase tracking-[0.05em] group"
      >
        <Home size={11} strokeWidth={2.5} className="group-hover:text-blue-600 transition-colors" />
      </Link>

      {crumbs.map((crumb, i) => {
        const isLast = i === crumbs.length - 1;
        return (
          <span key={i} className="flex items-center gap-1">
            <ChevronRight size={10} strokeWidth={2.5} className="text-slate-200 flex-shrink-0" />
            {crumb.href && !isLast ? (
              <Link
                href={crumb.href}
                className="text-[10px] font-bold text-slate-400 hover:text-blue-600 transition-colors uppercase tracking-[0.05em] whitespace-nowrap"
              >
                {crumb.label}
              </Link>
            ) : (
              <span
                className={cn(
                  "text-[10px] font-semibold uppercase tracking-[0.05em] whitespace-nowrap",
                  isLast ? "text-slate-700" : "text-slate-400",
                )}
              >
                {crumb.label}
              </span>
            )}
          </span>
        );
      })}
    </nav>
  );
}

function buildCrumbs(pathname: string): { label: string; href?: string }[] {
  // Strip leading slash, split into segments
  const segments = pathname.replace(/^\//, "").split("/").filter(Boolean);
  if (segments.length === 0) return [{ label: "Home", href: "/dashboard" }];

  const crumbs: { label: string; href?: string }[] = [];
  let path = "";

  for (let i = 0; i < segments.length; i++) {
    const seg = segments[i] ?? "";
    path += `/${seg}`;

    // Skip route groups like (dashboard)
    if (seg.startsWith("(") && seg.endsWith(")")) continue;

    // Skip dynamic segments like [id] — show the raw value but no link
    const isDynamic = seg.startsWith("[") && seg.endsWith("]");
    const isLast = i === segments.length - 1;

    crumbs.push({
      label: isDynamic ? seg.slice(1, -1).toUpperCase() : formatSegment(seg),
      href: isLast || isDynamic ? undefined : path,
    });
  }

  return crumbs;
}
