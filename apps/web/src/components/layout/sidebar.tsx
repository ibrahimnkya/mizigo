"use client";

import { usePathname } from "next/navigation";
import Link from "next/link";
import { useSession } from "next-auth/react";
import {
  LayoutDashboard,
  Package,
  Users,
  Settings,
  LogOut,
  CreditCard,
  Activity,
  BarChart3,
  ShieldCheck,
  ClipboardList,
  ChevronDown,
  TrainFront,
  Target,
  Building,
  Sparkles,
  MapPin,
  Layout,
  Printer,
  FileBarChart,
  ChevronRight,
} from "lucide-react";
import { useState, useEffect } from "react";
import Image from "next/image";
import { HugeiconsIcon } from "@hugeicons/react";
import { ApiIcon, MessageSecure01Icon } from "@hugeicons/core-free-icons";

import { cn } from "@repo/ui/utils";
import { useUIStore } from "@/store/ui-store";
import { useBranding } from "@/providers/branding-provider";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@repo/ui/dropdown-menu";
import { signOut } from "next-auth/react";

export interface SidebarItem {
  title: string;
  subtitle?: string;
  href?: string;
  icon: any;
  roles: string[];
  section?: string;
  children?: { title: string; href: string; roles?: string[] }[];
}

export const sidebarItems: SidebarItem[] = [
  // --- STATION DESK ---
  {
    title: "Home",
    subtitle: "Overview and quick access",
    icon: LayoutDashboard,
    href: "/operator",
    roles: ["CLERK", "STATION_MASTER", "TRAIN_GUARD", "AGENT"],
    section: "My Station",
  },
  {
    title: "Parcel Management",
    subtitle: "View and manage parcels",
    icon: Package,
    href: "/parcel",
    roles: ["CLERK", "STATION_MASTER", "TRAIN_GUARD", "AGENT"],
    section: "My Station",
  },
  {
    title: "Reports",
    subtitle: "View station performance",
    icon: BarChart3,
    href: "/operator/reports",
    roles: ["CLERK", "STATION_MASTER", "TRAIN_GUARD", "AGENT"],
    section: "My Station",
  },

  // --- REPORTS SUITE ---
  {
    title: "Overview",
    subtitle: "Summary of all activities",
    icon: LayoutDashboard,
    href: "/reports/admin/overview",
    roles: ["SUPER_ADMIN", "ADMIN"],
    section: "Reports",
  },
  {
    title: "Reports",
    subtitle: "View detailed business reports",
    icon: BarChart3,
    href: "/reports",
    roles: ["SUPER_ADMIN", "ADMIN"],
    section: "Reports",
  },

  // --- PARCEL MANAGEMENT ---
  {
    title: "All Parcels",
    subtitle: "View all parcels across stations",
    icon: Package,
    href: "/parcel",
    roles: ["SUPER_ADMIN", "ADMIN"],
    section: "Parcels",
  },

  // --- FINANCE & PRICING ---
  {
    title: "Overview",
    subtitle: "View revenue and earnings",
    icon: CreditCard,
    href: "/admin/finance",
    roles: ["SUPER_ADMIN", "ADMIN"],
    section: "Finance & Pricing",
  },
  {
    title: "Payments",
    subtitle: "View all payment transactions",
    icon: Activity,
    href: "/admin/payments",
    roles: ["SUPER_ADMIN", "ADMIN"],
    section: "Finance & Pricing",
  },
  {
    title: "Pricing",
    subtitle: "Manage pricing rules and tariffs",
    icon: Target,
    href: "/admin/pricing",
    roles: ["SUPER_ADMIN", "ADMIN"],
    section: "Finance & Pricing",
  },

  // --- RAIL & FACILITIES ---
  {
    title: "Rail Network",
    subtitle: "Manage trains and rolling stock",
    icon: TrainFront,
    href: "/super-admin/fleet",
    roles: ["SUPER_ADMIN"],
    section: "Rail & Facilities",
  },
  {
    title: "Fleet Management",
    subtitle: "Manage locomotives and wagons",
    icon: TrainFront,
    href: "/admin/fleet",
    roles: ["ADMIN"],
    section: "Rail & Facilities",
  },
  {
    title: "Organizations",
    subtitle: "Manage partners and operators",
    icon: Building,
    href: "/super-admin/organizations",
    roles: ["SUPER_ADMIN"],
    section: "Rail & Facilities",
  },
  {
    title: "Station Network",
    subtitle: "Manage stations and service points",
    icon: Target,
    href: "/super-admin/stations",
    roles: ["SUPER_ADMIN"],
    section: "Rail & Facilities",
  },
  {
    title: "Station Network",
    subtitle: "Manage your stations",
    icon: Target,
    href: "/admin/stations",
    roles: ["ADMIN"],
    section: "Rail & Facilities",
  },

  // --- USER MANAGEMENT ---
  {
    title: "Platform Users",
    subtitle: "Manage system administrators",
    icon: Users,
    href: "/super-admin/users",
    roles: ["SUPER_ADMIN"],
    section: "Users",
  },
  {
    title: "Platform Agents",
    subtitle: "Agents & businesses - KYC, commissions",
    icon: Building,
    href: "/super-admin/platform-agents",
    roles: ["SUPER_ADMIN"],
    section: "Users",
  },
  {
    title: "Agent Network",
    subtitle: "View agent offices & locations",
    icon: MapPin,
    href: "/admin/agent-network",
    roles: ["SUPER_ADMIN", "ADMIN"],
    section: "Users",
  },
  {
    title: "Staff",
    subtitle: "Manage staff members",
    icon: Users,
    href: "/admin/users",
    roles: ["SUPER_ADMIN", "ADMIN"],
    section: "Users",
  },
  {
    title: "Roles",
    icon: ShieldCheck,
    subtitle: "Manage access and permissions",
    href: "/super-admin/roles",
    roles: ["SUPER_ADMIN"],
    section: "Users",
  },
  {
    title: "Audit Logs",
    subtitle: "View activity history",
    icon: ClipboardList,
    href: "/super-admin/audit",
    roles: ["SUPER_ADMIN"],
    section: "Users",
  },
  {
    title: "SMS Logs",
    subtitle: "View outgoing notification logs",
    icon: (props: any) => <HugeiconsIcon icon={MessageSecure01Icon} {...props} />,
    href: "/admin/sms-logs",
    roles: ["SUPER_ADMIN", "ADMIN"],
    section: "Users",
  },

  // --- PLATFORM CONFIGURATION ---
  {
    title: "Integrations",
    subtitle: "Connect external services",
    icon: (props: any) => <HugeiconsIcon icon={ApiIcon} {...props} />,
    href: "/super-admin/integrations",
    roles: ["SUPER_ADMIN"],
    section: "Settings",
  },
  {
    title: "SMS Settings",
    subtitle: "Configure SMS notifications",
    icon: (props: any) => <HugeiconsIcon icon={MessageSecure01Icon} {...props} />,
    href: "/super-admin/sms",
    roles: ["SUPER_ADMIN"],
    section: "Settings",
  },
  {
    title: "Payment Settings",
    subtitle: "Configure payment gateways",
    icon: CreditCard,
    href: "/super-admin/payment",
    roles: ["SUPER_ADMIN"],
    section: "Settings",
  },
  {
    title: "App Updates",
    subtitle: "Manage mobile app versions",
    icon: Package,
    href: "/super-admin/versions",
    roles: ["SUPER_ADMIN"],
    section: "Settings",
  },
  {
    title: "Parcel Parameters",
    subtitle: "Configure type, conditions, sizes",
    icon: ClipboardList,
    href: "/super-admin/parcel-parameters",
    roles: ["SUPER_ADMIN"],
    section: "Settings",
  },
  {
    title: "Additional Services",
    subtitle: "Manage service offerings & prices",
    icon: Sparkles,
    href: "/super-admin/additional-services",
    roles: ["SUPER_ADMIN"],
    section: "Settings",
  },
  {
    title: "Legal Policies",
    subtitle: "Terms and Privacy Policy settings",
    icon: ShieldCheck,
    href: "/super-admin/legal",
    roles: ["SUPER_ADMIN"],
    section: "Settings",
  },
  {
    title: "Module Config",
    subtitle: "Enable or disable features per organisation",
    icon: Layout,
    href: "/super-admin/modules",
    roles: ["SUPER_ADMIN"],
    section: "Settings",
  },
  {
    title: "Printout Config",
    subtitle: "Configure receipts, stickers & manifests",
    icon: Printer,
    href: "/super-admin/printout",
    roles: ["SUPER_ADMIN"],
    section: "Settings",
  },
  {
    title: "Reports Config",
    subtitle: "Customise report look & feel",
    icon: FileBarChart,
    href: "/super-admin/reports-config",
    roles: ["SUPER_ADMIN"],
    section: "Settings",
  },
  {
    title: "Settings",
    subtitle: "General system settings",
    icon: Settings,
    href: "/super-admin/settings",
    roles: ["SUPER_ADMIN"],
    section: "Settings",
  },
];

// ─── Nav item ───────────────────────────────────────────────────────────────

function NavItem({
  item,
  isActive,
  openMenu,
  toggleMenu,
  pathname,
  activeSidebarHref,
}: {
  item: SidebarItem;
  isActive: boolean;
  openMenu: string | null;
  toggleMenu: (title: string) => void;
  pathname: string;
  activeSidebarHref: string | null;
}) {
  const isOpen = openMenu === item.title;
  const hasChildren = item.children && item.children.length > 0;

  if (hasChildren) {
    return (
      <div>
        <button
          onClick={() => toggleMenu(item.title)}
          className={cn(
            "w-full flex items-center justify-between gap-2 px-3 py-2 rounded-xl text-[13.5px] font-medium transition-colors",
            isActive
              ? "bg-white/10 text-white"
              : "text-white/65 hover:bg-white/[0.06] hover:text-white",
          )}
        >
          <div className="flex items-center gap-2.5">
            <item.icon className="h-4 w-4 shrink-0 opacity-80" />
            <span>{item.title}</span>
          </div>
          <ChevronDown
            className={cn(
              "h-3.5 w-3.5 opacity-40 transition-transform duration-200",
              isOpen && "rotate-180 opacity-60",
            )}
          />
        </button>
        {isOpen && (
          <div className="mt-1 ml-5 pl-3 border-l border-white/15 py-1 flex flex-col gap-0.5">
            {item.children?.map((child, i) => {
              const childActive = child.href === activeSidebarHref;
              return (
                <Link
                  key={i}
                  href={child.href}
                  className={cn(
                    "block py-1.5 text-[13px] font-medium transition-colors rounded-lg px-2.5",
                    childActive
                      ? "text-white bg-orange-500"
                      : "text-white/55 hover:text-white hover:bg-white/[0.06]",
                  )}
                >
                  {child.title}
                </Link>
              );
            })}
          </div>
        )}
      </div>
    );
  }

  return (
    <Link
      href={item.href || "#"}
      className={cn(
        "flex items-center gap-2.5 px-3 py-2 rounded-xl text-[13.5px] font-medium transition-colors",
        isActive
          ? "bg-orange-500 text-white shadow-[0_8px_20px_-10px_rgba(247,138,31,0.8)]"
          : "text-white/65 hover:bg-white/[0.06] hover:text-white",
      )}
    >
      <item.icon
        className={cn(
          "h-4 w-4 shrink-0",
          isActive ? "text-white opacity-100" : "opacity-70",
        )}
      />
      <span>{item.title}</span>
    </Link>
  );
}

// ─── Sidebar shell ───────────────────────────────────────────────────────────

export function Sidebar() {
  const pathname = usePathname();
  const { data: session, status } = useSession();
  const { sidebarOpen, setSidebarOpen } = useUIStore();
  const [openMenu, setOpenMenu] = useState<string | null>(null);
  const [collapsedSections, setCollapsedSections] = useState<Record<string, boolean>>({});
  const branding = useBranding();

  const userRole = session?.user?.role as string;
  const isLoading = status === "loading";

  useEffect(() => {
    if (window.innerWidth < 1024) setSidebarOpen(false);
  }, [pathname, setSidebarOpen]);

  useEffect(() => {
    const activeMenu = sidebarItems.find((item) =>
      item.children?.some((child) => pathname === child.href),
    );
    if (activeMenu) setOpenMenu(activeMenu.title);
  }, [pathname]);

  const toggleMenu = (title: string) =>
    setOpenMenu((prev) => (prev === title ? null : title));

  const filteredItems = sidebarItems
    .filter((item) => {
      if (isLoading || !userRole) return false;
      return item.roles?.includes(userRole);
    })
    .map((item) => ({
      ...item,
      children: item.children?.filter(
        (child) => !child.roles || child.roles.includes(userRole),
      ),
    }));

  useEffect(() => {
    setCollapsedSections((prev) => {
      const next = { ...prev };
      Array.from(new Set(filteredItems.map((i) => i.section).filter(Boolean))).forEach((s) => {
        if (next[s!] === undefined) next[s!] = false;
      });
      return next;
    });
  }, [filteredItems.length]);

  const toggleSection = (section: string) =>
    setCollapsedSections((prev) => ({ ...prev, [section]: !prev[section] }));

  const activeSidebarHref = (() => {
    const hrefs: string[] = [];
    filteredItems.forEach((item) => {
      if (item.href) hrefs.push(item.href);
      item.children?.forEach((c) => { if (c.href) hrefs.push(c.href); });
    });
    hrefs.sort((a, b) => b.length - a.length);
    return hrefs.find((h) => pathname === h || pathname.startsWith(h + "/")) ?? null;
  })();

  const sidebarClass = cn(
    "fixed inset-y-0 left-0 z-50 w-60 flex flex-col bg-[#4F0A0C] border-r border-[#651422] transition-transform duration-300 ease-in-out",
    sidebarOpen ? "translate-x-0" : "-translate-x-full lg:translate-x-0",
  );

  if (isLoading) {
    return (
      <div className={sidebarClass}>
        <div className="h-14 flex items-center px-4 border-b border-[#651422]">
          <div className="h-8 w-28 bg-white/10 rounded-xl animate-pulse" />
        </div>
        <div className="flex-1 px-3 py-4 space-y-1">
          {[1, 2, 3, 4, 5, 6].map((i) => (
            <div key={i} className="h-8 w-full bg-white/[0.06] rounded-xl animate-pulse" />
          ))}
        </div>
        <div className="border-t border-[#651422] p-3">
          <div className="h-9 w-full bg-white/[0.06] rounded-xl animate-pulse" />
        </div>
      </div>
    );
  }

  let lastSection = "";

  return (
    <>
      {sidebarOpen && (
        <div
          className="lg:hidden fixed inset-0 z-40 bg-black/40"
          onClick={() => setSidebarOpen(false)}
        />
      )}

      <div className={sidebarClass}>
        {/* Logo */}
        <div className="h-14 flex items-center px-4 border-b border-[#651422] shrink-0">
          <Link
            href="/"
            className="flex items-center gap-2.5 hover:opacity-85 transition-opacity"
            suppressHydrationWarning
          >
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src={branding.logoUrl || undefined}
              alt={`${branding.name || "Organization"} logo`}
              className="h-8 w-auto max-w-[8rem] object-contain"
              hidden={!branding.logoUrl}
            />
            <span style={{ display: branding.logoUrl ? "none" : "contents" }}>
              <Image src="/brand/logo_white.png" alt="MiziGO" width={112} height={63} className="h-9 w-auto" priority />
            </span>
          </Link>
        </div>

        {/* Nav */}
        <div className="flex-1 overflow-y-auto py-3 px-3 sidebar-scroll">
          <nav className="flex flex-col gap-0.5">
            {filteredItems.map((item, index) => {
              const showSection = item.section && item.section !== lastSection;
              if (showSection) lastSection = item.section!;
              const isCollapsed = item.section ? collapsedSections[item.section] : false;
              const isActive =
                (item.href ? item.href === activeSidebarHref : false) ||
                (item.children?.some((c) => c.href === activeSidebarHref) ?? false);

              return (
                <div key={index}>
                  {showSection && (
                    <button
                      onClick={() => toggleSection(item.section!)}
                      className="w-full flex items-center justify-between px-3 pt-5 pb-1.5 group"
                    >
                      <span className="text-[10px] font-semibold uppercase tracking-[0.06em] text-white/40 group-hover:text-white/60 transition-colors">
                        {item.section}
                      </span>
                      <ChevronDown
                        className={cn(
                          "h-3 w-3 text-white/30 transition-transform duration-200",
                          isCollapsed && "-rotate-90",
                        )}
                      />
                    </button>
                  )}
                  {!isCollapsed && (
                    <NavItem
                      item={item}
                      isActive={isActive}
                      openMenu={openMenu}
                      toggleMenu={toggleMenu}
                      pathname={pathname}
                      activeSidebarHref={activeSidebarHref}
                    />
                  )}
                </div>
              );
            })}
          </nav>
        </div>

        {/* User footer */}
        <div className="border-t border-[#651422] p-3 shrink-0">
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <button className="flex items-center gap-2.5 w-full px-2 py-2 rounded-2xl bg-[#612224] border border-[#651422] text-white/70 hover:bg-white/10 hover:text-white transition-colors outline-none text-left">
                <div className="h-8 w-8 rounded-full bg-orange-500 flex items-center justify-center text-white font-bold text-[11px] shrink-0">
                  {session?.user?.name?.charAt(0) || "U"}
                </div>
                <div className="flex flex-col flex-1 overflow-hidden min-w-0">
                  <span className="text-[12.5px] font-semibold text-white truncate leading-none">
                    {session?.user?.name || "User"}
                  </span>
                  <span className="text-[11px] text-white/50 truncate leading-none mt-0.5">
                    {(session?.user?.role as string)?.replace("_", " ")}
                  </span>
                </div>
                <ChevronRight className="h-3.5 w-3.5 opacity-25 shrink-0" />
              </button>
            </DropdownMenuTrigger>
            <DropdownMenuContent
              className="w-56 bg-[#612224] border border-[#651422] text-white/70 shadow-xl rounded-2xl p-1.5"
              align="end"
              sideOffset={8}
            >
              <DropdownMenuLabel className="text-white/80 flex items-center gap-2 px-3 py-2">
                <span className="h-1.5 w-1.5 rounded-full bg-emerald-500" />
                <span className="text-[11px] font-semibold">Active session</span>
              </DropdownMenuLabel>
              <DropdownMenuSeparator className="bg-white/10 mx-1" />
              <DropdownMenuItem
                className="hover:bg-white/10 hover:text-white focus:bg-white/10 focus:text-white cursor-pointer rounded-xl px-3 py-2 text-[13px] font-medium flex items-center gap-2.5 m-0.5"
                onClick={() => (window.location.href = "/profile")}
              >
                <Users className="h-4 w-4 opacity-60" />
                Profile Settings
              </DropdownMenuItem>
              <DropdownMenuItem
                className="hover:bg-white/10 hover:text-white focus:bg-white/10 focus:text-white cursor-pointer rounded-xl px-3 py-2 text-[13px] font-medium flex items-center gap-2.5 m-0.5"
                onClick={() => (window.location.href = "/settings")}
              >
                <Settings className="h-4 w-4 opacity-60" />
                Preferences
              </DropdownMenuItem>
              <DropdownMenuSeparator className="bg-white/10 mx-1" />
              <DropdownMenuItem
                className="hover:bg-red-500/10 hover:text-red-400 focus:bg-red-500/10 focus:text-red-400 cursor-pointer rounded-xl px-3 py-2 text-[13px] font-medium flex items-center gap-2.5 m-0.5 text-red-300"
                onClick={() => signOut({ callbackUrl: "/login" })}
              >
                <LogOut className="h-4 w-4" />
                Sign out
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        </div>
      </div>

      <style jsx global>{`
        .sidebar-scroll::-webkit-scrollbar { width: 3px; }
        .sidebar-scroll::-webkit-scrollbar-track { background: transparent; }
        .sidebar-scroll::-webkit-scrollbar-thumb { background: rgba(255,255,255,0.06); border-radius: 3px; }
        .sidebar-scroll::-webkit-scrollbar-thumb:hover { background: rgba(255,255,255,0.12); }
      `}</style>
    </>
  );
}
