"use client"

import { usePathname } from "next/navigation"
import Link from "next/link"
import { useSession } from "next-auth/react"
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
    Truck,
    CircleDot,
    Target,
    Building
} from "lucide-react"
import { useState, useEffect } from "react"
import Image from "next/image"

import { cn } from "@repo/ui/utils"
// Ensure these dropdown internal parts work, or use custom if needed
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@repo/ui/dropdown-menu"
import { logout } from "@/app/lib/actions"

interface SidebarItem {
    title: string;
    href?: string;
    icon: any;
    roles: string[];
    children?: { title: string; href: string; roles?: string[] }[];
}

const sidebarItems: SidebarItem[] = [
    {
        title: "Dashboard",
        icon: LayoutDashboard,
        href: "/dashboard",
        roles: ['SUPER_ADMIN', 'ADMIN', 'OPERATOR', 'AGENT'],
        children: [
            { title: "Overview", href: "/dashboard", roles: ['SUPER_ADMIN', 'ADMIN', 'OPERATOR', 'AGENT'] },
            { title: "Revenue Summary", href: "/dashboard/revenue", roles: ['SUPER_ADMIN'] },
            { title: "Activity Feed", href: "/dashboard/activity", roles: ['SUPER_ADMIN'] },
        ]
    },
    {
        title: "Lastmile",
        icon: Truck,
        roles: ['SUPER_ADMIN'],
        children: [
            { title: "Completed", href: "/lastmile/completed", roles: ['SUPER_ADMIN', 'ADMIN'] },
            { title: "Ongoing", href: "/lastmile/ongoing", roles: ['SUPER_ADMIN', 'ADMIN'] },
        ]
    },
    {
        title: "Organizations",
        icon: Building,
        href: "/organizations",
        roles: ['SUPER_ADMIN'],
    },
    {
        title: "Receive Cargo",
        icon: PackagePlus,
        href: "/cargo/receive",
        roles: ['OPERATOR', 'AGENT'],
    },
    {
        title: "Cargo",
        icon: Package,
        href: "/cargo",
        roles: ['SUPER_ADMIN', 'ADMIN', 'OPERATOR', 'AGENT'],
        children: [
            { title: "All", href: "/cargo", roles: ['SUPER_ADMIN', 'ADMIN', 'OPERATOR', 'AGENT'] },
            { title: "Pending", href: "/cargo/pending", roles: ['SUPER_ADMIN', 'ADMIN', 'OPERATOR', 'AGENT'] },
            { title: "Approved", href: "/cargo/approved", roles: ['SUPER_ADMIN', 'ADMIN', 'OPERATOR', 'AGENT'] },
            { title: "Rejected", href: "/cargo/rejected", roles: ['SUPER_ADMIN', 'ADMIN', 'OPERATOR', 'AGENT'] },
            { title: "Delayed", href: "/cargo/delayed", roles: ['SUPER_ADMIN', 'ADMIN', 'OPERATOR', 'AGENT'] },
        ]
    },
    // {
    //     title: "My Payments",
    //     icon: CreditCard,
    //     href: "/my-payments",
    //     roles: ['SUPER_ADMIN', 'ADMIN'],
    //     children: [
    //         { title: "To Pay (Awaiting Payments)", href: "/my-payments/pending", roles: ['SUPER_ADMIN', 'ADMIN'] },
    //         { title: "Pay as you Go", href: "/my-payments/pay-as-you-go", roles: ['SUPER_ADMIN', 'ADMIN'] },
    //         { title: "All", href: "/my-payments/all", roles: ['SUPER_ADMIN', 'ADMIN'] },
    //     ]
    // },
    {
        title: "Wagon Types",
        icon: CircleDot,
        roles: ['SUPER_ADMIN', 'ADMIN'],
        children: [
            { title: "Standard", href: "/wagon-types/standard", roles: ['SUPER_ADMIN', 'ADMIN'] },
            { title: "Economy", href: "/wagon-types/economy", roles: ['SUPER_ADMIN', 'ADMIN'] },
            { title: "Express", href: "/wagon-types/express", roles: ['SUPER_ADMIN', 'ADMIN'] },
        ]
    },
    // {
    //     title: "Agents",
    //     icon: Users,
    //     href: "/agents",
    //     roles: ['SUPER_ADMIN', 'ADMIN'],
    // },
    {
        title: "User Management",
        icon: Users,
        href: "/users",
        roles: ['SUPER_ADMIN', 'ADMIN'],
    },
    {
        title: "Payments",
        icon: CreditCard,
        href: "/payments",
        roles: ['SUPER_ADMIN', 'ADMIN'],
        children: [
            { title: "All Transactions", href: "/payments", roles: ['SUPER_ADMIN', 'ADMIN'] },
            { title: "Pending Payments", href: "/payments/pending", roles: ['SUPER_ADMIN', 'ADMIN'] },
            { title: "Successful", href: "/payments/success", roles: ['SUPER_ADMIN', 'ADMIN'] },
            { title: "Failed", href: "/payments/failed", roles: ['SUPER_ADMIN', 'ADMIN'] },
            { title: "Refunds", href: "/payments/refunds", roles: ['SUPER_ADMIN'] },
        ]
    },
    {
        title: "Admin Management",
        icon: ShieldCheck,
        href: "/admins",
        roles: ['SUPER_ADMIN'],
        children: [
            { title: "All Admins", href: "/admins", roles: ['SUPER_ADMIN'] },
            { title: "Admin Logs", href: "/admins/logs", roles: ['SUPER_ADMIN'] },
            { title: "Admin Performance", href: "/admins/performance", roles: ['SUPER_ADMIN'] },
        ]
    },
    {
        title: "Reports & Analytics",
        icon: BarChart3,
        href: "/reports",
        roles: ['SUPER_ADMIN', 'ADMIN'],
        children: [
            { title: "Revenue Report", href: "/reports/revenue", roles: ['SUPER_ADMIN'] },
            { title: "Cargo Volume", href: "/reports/volume", roles: ['SUPER_ADMIN', 'ADMIN'] },
            { title: "Approval Speeds", href: "/reports/turnaround", roles: ['SUPER_ADMIN', 'ADMIN'] },
        ]
    },
    {
        title: "Workforce",
        icon: Target,
        roles: ['ADMIN', 'SUPER_ADMIN'],
        children: [
            { title: "Organisation Performance", href: "/performance/org", roles: ['ADMIN', 'SUPER_ADMIN'] },
            { title: "My Performance", href: "/performance", roles: ['OPERATOR', 'AGENT'] },
        ]
    },
    {
        title: "System Config",
        icon: Settings,
        href: "/settings",
        roles: ['SUPER_ADMIN'],
        children: [
            { title: "Service Types", href: "/settings/services", roles: ['SUPER_ADMIN'] },
            { title: "Pricing Rules", href: "/settings/pricing", roles: ['SUPER_ADMIN'] },
            { title: "Locations (SGR)", href: "/settings/locations", roles: ['SUPER_ADMIN'] },
        ]
    },
    {
        title: "Notifications",
        icon: Bell,
        href: "/notifications",
        roles: ['SUPER_ADMIN',],
    },
    {
        title: "Audit Logs",
        icon: ClipboardList,
        href: "/audit",
        roles: ['SUPER_ADMIN'],
    },
]

export function Sidebar() {
    const pathname = usePathname()
    const { data: session, status } = useSession()
    const [openMenu, setOpenMenu] = useState<string | null>(null)

    const userRole = session?.user?.role as string;
    const isLoading = status === "loading";

    useEffect(() => {
        const activeMenu = sidebarItems.find(item =>
            item.children?.some(child => pathname === child.href)
        );
        if (activeMenu) {
            setOpenMenu(activeMenu.title);
        }
    }, [pathname]);

    const toggleMenu = (title: string) => {
        setOpenMenu(prev => prev === title ? null : title);
    }

    const filteredItems = sidebarItems
        .filter(item => {
            if (isLoading) return false;
            if (!userRole) return false;
            return item.roles?.includes(userRole);
        })
        .map(item => ({
            ...item,
            children: item.children?.filter(child => !child.roles || child.roles.includes(userRole))
        }));

    if (isLoading) {
        return (
            <div className="hidden lg:block fixed left-4 top-4 bottom-4 w-72 z-40">
                <div className="flex h-full flex-col gap-2 rounded-lg bg-slate-950 shadow-2xl overflow-hidden border border-white/5 premium-gradient">
                    <div className="flex h-[80px] items-center px-8">
                        <div className="flex items-center gap-3 animate-pulse">
                            <div className="bg-slate-800 p-2.5 rounded-lg h-12 w-12" />
                            <div className="h-6 w-24 bg-slate-800 rounded" />
                        </div>
                    </div>
                    <div className="flex-1 px-4 py-6 space-y-4">
                        {[1, 2, 3, 4, 5, 6].map((i) => (
                            <div key={i} className="h-12 w-full bg-slate-900/50 rounded-lg animate-pulse" />
                        ))}
                    </div>
                    <div className="mt-auto p-6 border-t border-white/5 bg-white/5">
                        <div className="flex items-center gap-4 animate-pulse">
                            <div className="h-11 w-11 rounded-lg bg-slate-800" />
                            <div className="flex-1 space-y-2">
                                <div className="h-3 w-20 bg-slate-800 rounded" />
                                <div className="h-2 w-16 bg-slate-800 rounded" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        )
    }

    return (
        <div className="hidden lg:block fixed left-4 top-4 bottom-4 w-72 z-40">
            <div className="flex h-full flex-col gap-2 rounded-lg bg-slate-950 shadow-2xl overflow-hidden border border-white/5 premium-gradient">
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

                <div className="flex-1 overflow-auto py-6 px-4 custom-scrollbar">
                    <nav className="grid items-start gap-2 text-[15px] font-semibold">
                        {filteredItems.map((item, index) => {
                            const isOpen = openMenu === item.title;
                            const hasChildren = item.children && item.children.length > 0;
                            const isActive = pathname === item.href || (hasChildren && item.children?.some(c => pathname === c.href));

                            return (
                                <div key={index} className="flex flex-col gap-1">
                                    {hasChildren ? (
                                        <button
                                            onClick={() => toggleMenu(item.title)}
                                            className={cn(
                                                "flex items-center justify-between gap-3 rounded-lg px-5 py-3.5 transition-all text-slate-400 hover:text-white hover:bg-white/5 group",
                                                isActive && "text-white bg-white/5"
                                            )}
                                        >
                                            <div className="flex items-center gap-4">
                                                <item.icon className={cn("h-5 w-5 transition-colors", isActive ? "text-blue-500" : "group-hover:text-blue-400")} />
                                                <span>{item.title}</span>
                                            </div>
                                            <ChevronDown className={cn("h-4 w-4 transition-transform duration-300 opacity-50", isOpen && "rotate-180 opacity-100")} />
                                        </button>
                                    ) : (
                                        <Link
                                            href={item.href || '#'}
                                            className={cn(
                                                "flex items-center gap-4 rounded-lg px-5 py-3.5 transition-all text-slate-400 hover:text-white hover:bg-white/5 group",
                                                pathname === item.href && "bg-blue-600 text-white shadow-lg shadow-blue-600/20"
                                            )}
                                        >
                                            <item.icon className={cn("h-5 w-5 transition-colors", pathname === item.href ? "text-white" : "group-hover:text-blue-400")} />
                                            <span>{item.title}</span>
                                        </Link>
                                    )}

                                    {hasChildren && isOpen && (
                                        <div className="flex flex-col gap-1 ml-10 border-l border-white/5 pl-5 py-2">
                                            {item.children?.map((child, cIdx) => (
                                                <Link
                                                    key={cIdx}
                                                    href={child.href}
                                                    className={cn(
                                                        "flex items-center py-2.5 text-sm text-slate-500 hover:text-white transition-colors relative",
                                                        pathname === child.href && "text-blue-400 font-bold"
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
                            )
                        })}
                    </nav>
                </div>

                <div className="mt-auto p-6 border-t border-white/5 bg-white/5 backdrop-blur-3xl">
                    <DropdownMenu>
                        <DropdownMenuTrigger asChild>
                            <button className="flex items-center gap-4 text-slate-400 p-2 w-full hover:bg-white/5 rounded-lg transition-all outline-none text-left active:scale-95">
                                <div className="h-11 w-11 rounded-lg bg-gradient-to-br from-slate-800 to-slate-900 flex items-center justify-center border border-white/10 shadow-xl">
                                    <Users className="h-6 w-6 text-slate-300" />
                                </div>
                                <div className="flex flex-col flex-1 overflow-hidden">
                                    <span className="text-sm font-bold text-white truncate">{session?.user?.name || 'User'}</span>
                                    <span className="text-[11px] text-slate-500 font-bold uppercase tracking-wider truncate">{session?.user?.role?.replace('_', ' ')}</span>
                                </div>
                                <ChevronRight className="h-4 w-4 opacity-30" />
                            </button>
                        </DropdownMenuTrigger>
                        <DropdownMenuContent className="w-64 bg-slate-950 border-white/10 text-slate-400 shadow-[0_20px_50px_rgba(0,0,0,0.5)] rounded-lg p-2" align="end" sideOffset={12}>
                            <DropdownMenuLabel className="text-white flex items-center gap-3 p-3">
                                <div className="h-2 w-2 rounded-full bg-emerald-500 animate-pulse" />
                                <span className="font-bold">Active Account</span>
                            </DropdownMenuLabel>
                            <DropdownMenuSeparator className="bg-white/5 mx-2" />
                            <DropdownMenuItem
                                className="hover:bg-white/5 hover:text-white focus:bg-white/5 focus:text-white cursor-pointer rounded-lg transition-all py-3 px-4 m-1 flex items-center gap-3"
                                onClick={() => window.location.href = '/profile'}
                            >
                                <div className="h-8 w-8 rounded-lg bg-slate-900 flex items-center justify-center border border-white/5">
                                    <Users className="h-4 w-4" />
                                </div>
                                <span className="font-semibold">Profile Settings</span>
                            </DropdownMenuItem>
                            <DropdownMenuItem
                                className="hover:bg-white/5 hover:text-white focus:bg-white/5 focus:text-white cursor-pointer rounded-lg transition-all py-3 px-4 m-1 flex items-center gap-3"
                                onClick={() => window.location.href = '/settings'}
                            >
                                <div className="h-8 w-8 rounded-lg bg-slate-900 flex items-center justify-center border border-white/5">
                                    <Settings className="h-4 w-4" />
                                </div>
                                <span className="font-semibold">Preferences</span>
                            </DropdownMenuItem>
                            <DropdownMenuSeparator className="bg-white/5 mx-2" />
                            <DropdownMenuItem
                                className="hover:bg-red-500/10 hover:text-red-400 focus:bg-red-500/10 focus:text-red-400 cursor-pointer rounded-lg transition-all py-3 px-4 m-1 flex items-center gap-3"
                                onClick={() => logout()}
                            >
                                <div className="h-8 w-8 rounded-lg bg-red-500/10 flex items-center justify-center border border-red-500/10">
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
                    background: rgba(255,255,255,0.05);
                    border-radius: 20px;
                }
                .custom-scrollbar::-webkit-scrollbar-thumb:hover {
                    background: rgba(255,255,255,0.1);
                }
                .premium-gradient {
                    background: linear-gradient(180deg, rgba(15,23,42,1) 0%, rgba(2,6,23,1) 100%);
                }
            `}</style>
        </div>
    )
}
