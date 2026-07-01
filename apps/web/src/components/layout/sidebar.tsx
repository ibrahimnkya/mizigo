"use client";

import { usePathname } from "next/navigation";
import Link from "next/link";
import { useSession } from "next-auth/react";
import {
  LayoutDashboard,
  Package,
  PackagePlus,
  Users,
  Settings,
  LogOut,
  ChevronRight,
  CreditCard,
  Activity,
  BarChart3,
  ShieldCheck,
  Bell,
  ClipboardList,
  ChevronDown,
  TrainFront,
  CircleDot,
  Target,
  Building,
  Search,
  Sparkles,
  MapPin,
} from "lucide-react";
import { useState, useEffect } from "react";
import Image from "next/image";
import { HugeiconsIcon } from "@hugeicons/react";
import { ApiIcon, MessageSecure01Icon } from "@hugeicons/core-free-icons";

import { cn } from "@repo/ui/utils";
import { useUIStore } from "@/store/ui-store";
// Ensure these dropdown internal parts work, or use custom if needed
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@repo/ui/dropdown-menu";
import { logout } from "@/app/lib/actions";

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
    roles: ["OPERATOR"],
    section: "My Station",
  },
  {
    title: "Parcel Management",
    subtitle: "View and manage parcels",
    icon: Package,
    href: "/parcel",
    roles: ["OPERATOR"],
    section: "My Station",
  },
  {
    title: "Reports",
    subtitle: "View station performance",
    icon: BarChart3,
    href: "/operator/reports",
    roles: ["OPERATOR"],
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
    subtitle: "Agents & businesses — KYC, commissions",
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
    title: "Settings",
    subtitle: "General system settings",
    icon: Settings,
    href: "/super-admin/settings",
    roles: ["SUPER_ADMIN"],
    section: "Settings",
  },
];

export function Sidebar() {
  const pathname = usePathname();
  const { data: session, status } = useSession();
  const { sidebarOpen, setSidebarOpen } = useUIStore();
  const [openMenu, setOpenMenu] = useState<string | null>(null);

  const userRole = session?.user?.role as string;
  const isLoading = status === "loading";

  useEffect(() => {
    // Close sidebar on mobile when navigating
    if (window.innerWidth < 1024) {
      setSidebarOpen(false);
    }
  }, [pathname, setSidebarOpen]);

  useEffect(() => {
    const activeMenu = sidebarItems.find((item) =>
      item.children?.some((child) => pathname === child.href),
    );
    if (activeMenu) {
      setOpenMenu(activeMenu.title);
    }
  }, [pathname]);

  const toggleMenu = (title: string) => {
    setOpenMenu((prev) => (prev === title ? null : title));
  };

  const filteredItems = sidebarItems
    .filter((item) => {
      if (isLoading) return false;
      if (!userRole) return false;
      return item.roles?.includes(userRole);
    })
    .map((item) => ({
      ...item,
      children: item.children?.filter(
        (child) => !child.roles || child.roles.includes(userRole),
      ),
    }));

  const [collapsedSections, setCollapsedSections] = useState<
    Record<string, boolean>
  >({});

  // Sync collapsed state with active route (default to expanded)
  useEffect(() => {
    setCollapsedSections((prev) => {
      const sections = { ...prev };
      const allSections = Array.from(
        new Set(filteredItems.map((i) => i.section).filter(Boolean)),
      );
      allSections.forEach((section) => {
        // Initialize as expanded (false) if it hasn't been set yet
        if (sections[section!] === undefined) {
          sections[section!] = false;
        }
      });
      return sections;
    });
  }, [filteredItems.length]);

  const toggleSection = (section: string) => {
    setCollapsedSections((prev) => ({
      ...prev,
      [section]: !prev[section],
    }));
  };

  const renderItem = (item: SidebarItem, index: number) => {
    const isOpen = openMenu === item.title;
    const hasChildren = item.children && item.children.length > 0;
    const isActive =
      pathname === item.href ||
      (hasChildren && item.children?.some((c) => pathname === c.href));

    return (
      <div key={index} className="flex flex-col gap-1">
        {hasChildren ? (
          <button
            onClick={() => toggleMenu(item.title)}
            className={cn(
              "flex items-center justify-between gap-3 rounded-[10px] px-5 py-3 transition-all text-slate-400 hover:text-white hover:bg-white/5 group",
              isActive && "text-white bg-white/5 ring-1 ring-white/10",
            )}
          >
            <div className="flex items-center gap-4">
              <item.icon
                className={cn(
                  "h-4.5 w-4.5 transition-colors",
                  isActive ? "text-blue-500" : "group-hover:text-blue-400",
                )}
              />
              <span className="text-[13.5px] font-bold tracking-tight">
                {item.title}
              </span>
            </div>
            <ChevronDown
              className={cn(
                "h-4 w-4 transition-transform duration-300 opacity-50",
                isOpen && "rotate-180 opacity-100",
              )}
            />
          </button>
        ) : (
          <Link
            href={item.href || "#"}
            className={cn(
              "relative flex items-center gap-4 rounded-[10px] px-5 py-3 transition-all text-slate-400 hover:text-white hover:bg-white/5 group",
              pathname === item.href &&
              "bg-blue-600/10 text-white ring-1 ring-blue-500/50 shadow-[0_0_20px_rgba(37,99,235,0.1)]",
            )}
          >
            {pathname === item.href && (
              <div className="absolute left-0 w-1 h-6 bg-blue-500 rounded-r-full shadow-[4px_0_12px_rgba(37,99,235,0.5)]" />
            )}
            <item.icon
              className={cn(
                "h-4.5 w-4.5 transition-colors",
                pathname === item.href
                  ? "text-blue-400"
                  : "group-hover:text-blue-400",
              )}
            />
            <span className="text-[13.5px] font-bold tracking-tight">
              {item.title}
            </span>
          </Link>
        )}

        {hasChildren && isOpen && (
          <div className="flex flex-col gap-1 ml-10 border-l border-white/5 pl-5 py-2">
            {item.children?.map((child, cIdx) => (
              <Link
                key={cIdx}
                href={child.href}
                className={cn(
                  "flex items-center py-2 text-sm text-slate-500 hover:text-white transition-colors relative",
                  pathname === child.href && "text-blue-400 font-bold",
                )}
              >
                {pathname === child.href && (
                  <div className="absolute -left-[23px] h-2 w-2 rounded-full bg-blue-500 shadow-lg shadow-blue-500/50" />
                )}
                {child.title}
              </Link>
            ))}
          </div>
        )}
      </div>
    );
  };

  if (isLoading) {
    return (
      <div
        className={cn(
          "fixed left-4 top-4 bottom-4 w-72 z-50 transition-transform duration-300 ease-in-out lg:translate-x-0 lg:block",
          sidebarOpen ? "translate-x-0" : "-translate-x-[calc(100%+24px)]",
        )}
      >
        <div className="flex h-full flex-col gap-2 rounded-[10px] bg-slate-950 shadow-2xl overflow-hidden border border-white/5 premium-gradient">
          <div className="flex h-[80px] items-center px-8">
            <div className="flex items-center gap-3 animate-pulse">
              <div className="bg-slate-800 p-2.5 rounded-[10px] h-12 w-12" />
              <div className="h-6 w-24 bg-slate-800 rounded-[10px]" />
            </div>
          </div>
          <div className="flex-1 px-4 py-6 space-y-4">
            {[1, 2, 3, 4, 5, 6].map((i) => (
              <div
                key={i}
                className="h-12 w-full bg-slate-900/50 rounded-[10px] animate-pulse"
              />
            ))}
          </div>
          <div className="mt-auto p-6 border-t border-white/5 bg-white/5">
            <div className="flex items-center gap-4 animate-pulse">
              <div className="h-11 w-11 rounded-[10px] bg-slate-800" />
              <div className="flex-1 space-y-2">
                <div className="h-3 w-20 bg-slate-800 rounded-[10px]" />
                <div className="h-2 w-16 bg-slate-800 rounded-[10px]" />
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  let lastSection = "";

  return (
    <>
      {/* Mobile Sidebar Overlay/Backdrop */}
      {sidebarOpen && (
        <div
          className="lg:hidden fixed inset-0 z-40 bg-slate-950/40 backdrop-blur-sm animate-in fade-in duration-300"
          onClick={() => setSidebarOpen(false)}
        />
      )}

      <div
        className={cn(
          "fixed left-4 top-4 bottom-4 w-72 z-50 transition-transform duration-300 ease-in-out lg:translate-x-0 lg:block",
          sidebarOpen ? "translate-x-0" : "-translate-x-[calc(100%+24px)]",
        )}
      >
        <div className="flex h-full flex-col gap-2 rounded-[10px] bg-slate-950 shadow-2xl overflow-hidden border border-white/5 premium-gradient">
          <div className="flex h-[80px] items-center px-8">
            <Link
              className="flex items-center gap-4 font-black text-white text-2xl tracking-tighter hover:opacity-90 transition-opacity"
              href="/"
              suppressHydrationWarning
            >
              <Image
                src="/mono.png"
                alt="Mizigo Icon"
                width={32}
                height={32}
                className="h-10 w-auto"
                priority
              />
              <Image
                src="/word.png"
                alt="Mizigo Wordmark"
                width={120}
                height={32}
                className="h-10 w-auto"
                priority
              />
            </Link>
          </div>

          <div className="flex-1 overflow-auto pb-6 px-4 custom-scrollbar">
            <nav className="grid items-start gap-1">
              {filteredItems.map((item, index) => {
                const showSection =
                  item.section && item.section !== lastSection;
                if (showSection) lastSection = item.section!;
                const isCollapsed = item.section
                  ? collapsedSections[item.section]
                  : false;

                return (
                  <div key={index}>
                    {showSection && (
                      <button
                        onClick={() => toggleSection(item.section!)}
                        className="w-full flex items-center justify-between px-5 pt-8 pb-3 group cursor-pointer"
                      >
                        <div className="flex flex-col items-start text-left">
                          <span className="text-[10px] font-black uppercase tracking-[0.2em] text-slate-500/80 group-hover:text-slate-300 transition-colors">
                            {item.section}
                          </span>
                          {item.section === "Reports Suite" && (
                            <span className="text-[8px] font-bold text-slate-600 uppercase tracking-widest leading-none mt-1 group-hover:text-slate-50 transition-colors">
                              Your Go-To Place For All Data & Analytics
                            </span>
                          )}
                        </div>
                        <ChevronDown
                          className={cn(
                            "h-3 w-3 text-slate-600 transition-transform duration-300",
                            isCollapsed ? "-rotate-90" : "rotate-0",
                          )}
                        />
                      </button>
                    )}
                    {!isCollapsed && renderItem(item, index)}
                  </div>
                );
              })}
            </nav>
          </div>

          <div className="mt-auto p-6 border-t border-white/5 bg-white/5 backdrop-blur-3xl">
            <DropdownMenu>
              <DropdownMenuTrigger asChild>
                <button className="flex items-center gap-4 text-slate-400 p-2 w-full hover:bg-white/5 rounded-[10px] transition-all outline-none text-left active:scale-95">
                  <div className="h-11 w-11 rounded-[10px] bg-gradient-to-br from-slate-800 to-slate-900 flex items-center justify-center border border-white/10 shadow-xl">
                    <Users className="h-6 w-6 text-slate-300" />
                  </div>
                  <div className="flex flex-col flex-1 overflow-hidden">
                    <span className="text-sm font-bold text-white truncate">
                      {session?.user?.name || "User"}
                    </span>
                    <span className="text-[11px] text-slate-500 font-bold uppercase tracking-wider truncate">
                      {session?.user?.role?.replace("_", " ")}
                    </span>
                  </div>
                  <ChevronRight className="h-4 w-4 opacity-30" />
                </button>
              </DropdownMenuTrigger>
              <DropdownMenuContent
                className="w-64 bg-slate-950 border-white/10 text-slate-400 shadow-[0_20px_50px_rgba(0,0,0,0.5)] rounded-[10px] p-2"
                align="end"
                sideOffset={12}
              >
                <DropdownMenuLabel className="text-white flex items-center gap-3 p-3">
                  <div className="h-2 w-2 rounded-full bg-emerald-500 animate-pulse" />
                  <span className="font-bold">Active Account</span>
                </DropdownMenuLabel>
                <DropdownMenuSeparator className="bg-white/5 mx-2" />
                <DropdownMenuItem
                  className="hover:bg-white/5 hover:text-white focus:bg-white/5 focus:text-white cursor-pointer rounded-[10px] transition-all py-3 px-4 m-1 flex items-center gap-3"
                  onClick={() => (window.location.href = "/profile")}
                >
                  <div className="h-8 w-8 rounded-[10px] bg-slate-900 flex items-center justify-center border border-white/5">
                    <Users className="h-4 w-4" />
                  </div>
                  <span className="font-semibold">Profile Settings</span>
                </DropdownMenuItem>
                <DropdownMenuItem
                  className="hover:bg-white/5 hover:text-white focus:bg-white/5 focus:text-white cursor-pointer rounded-[10px] transition-all py-3 px-4 m-1 flex items-center gap-3"
                  onClick={() => (window.location.href = "/settings")}
                >
                  <div className="h-8 w-8 rounded-[10px] bg-slate-900 flex items-center justify-center border border-white/5">
                    <Settings className="h-4 w-4" />
                  </div>
                  <span className="font-semibold">Preferences</span>
                </DropdownMenuItem>
                <DropdownMenuSeparator className="bg-white/5 mx-2" />
                <DropdownMenuItem
                  className="hover:bg-red-500/10 hover:text-red-400 focus:bg-red-500/10 focus:text-red-400 cursor-pointer rounded-[10px] transition-all py-3 px-4 m-1 flex items-center gap-3"
                  onClick={() => logout()}
                >
                  <div className="h-8 w-8 rounded-[10px] bg-red-500/10 flex items-center justify-center border border-red-500/10">
                    <LogOut className="h-4 w-4" />
                  </div>
                  <span className="font-bold">Sign out</span>
                </DropdownMenuItem>
              </DropdownMenuContent>
            </DropdownMenu>
          </div>
        </div>

        <style jsx global>{`
          .custom-scrollbar::-webkit-scrollbar {
            width: 4px;
          }
          .custom-scrollbar::-webkit-scrollbar-track {
            background: transparent;
          }
          .custom-scrollbar::-webkit-scrollbar-thumb {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 20px;
          }
          .custom-scrollbar::-webkit-scrollbar-thumb:hover {
            background: rgba(255, 255, 255, 0.1);
          }
          .premium-gradient {
            background: linear-gradient(
              180deg,
              rgba(15, 23, 42, 1) 0%,
              rgba(2, 6, 23, 1) 100%
            );
          }
        `}</style>
      </div>
    </>
  );
}
