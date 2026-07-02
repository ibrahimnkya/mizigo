"use client";

import { useSession } from "next-auth/react";
import { useUIStore } from "@/store/ui-store";
import {
  Bell,
  Menu,
  Search,
  History,
  Clock,
  LayoutGrid,
  ChevronDown,
  Lock,
  LogOut,
} from "lucide-react";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@repo/ui/dropdown-menu";
import { signOut } from "next-auth/react";
import { useEffect, useState } from "react";
import { format } from "date-fns";
import { usePathname } from "next/navigation";
import { sidebarItems, SidebarItem } from "./sidebar";

export function Topbar() {
  const { data: session } = useSession();
  const { toggleSidebar } = useUIStore();
  const pathname = usePathname();
  const [mounted, setMounted] = useState(false);
  const [time, setTime] = useState(new Date());

  useEffect(() => {
    setMounted(true);
    const timer = setInterval(() => setTime(new Date()), 1000);
    return () => clearInterval(timer);
  }, []);

  const user = session?.user as any;

  // Find the active item for context
  const activeItem = sidebarItems.find((item) => {
    if (item.href === pathname) return true;
    // Check if the current pathname starts with the item's href (for nested detail pages)
    if (item.href !== "/" && pathname.startsWith(item.href + "/")) return true;
    // Check children
    if (item.children?.some((child) => child.href === pathname)) return true;
    return false;
  });

  return (
    <header className="h-20 border-b border-slate-200 bg-white/80 backdrop-blur-md sticky top-0 z-30 flex items-center justify-between px-8 shadow-sm">
      <div className="flex items-center gap-6">
        <button
          onClick={toggleSidebar}
          className="lg:hidden p-2 hover:bg-slate-100 rounded-[10px] transition-colors"
        >
          <Menu className="h-5 w-5 text-slate-600" />
        </button>

        <div className="hidden lg:flex items-center gap-4">
          <div className="h-10 w-10 rounded-[10px] bg-slate-900 flex items-center justify-center border border-white/10 shadow-lg shrink-0">
            {activeItem?.icon ? (
              <activeItem.icon className="h-5 w-5 text-blue-400" />
            ) : (
              <LayoutGrid className="h-5 w-5 text-slate-400" />
            )}
          </div>
          <div className="flex flex-col">
            <div className="flex items-center gap-2">
              <span className="font-bold text-slate-900 text-lg tracking-tight">
                {activeItem?.title ||
                  user?.organization?.name ||
                  "Mizigo Platform"}
              </span>
              {user?.station?.name && (
                <>
                  <span className="h-4 w-[1px] bg-slate-300 mx-1" />
                  <span className="text-blue-600 font-bold text-[10px] uppercase tracking-wider bg-blue-50 px-2 py-0.5 rounded-[10px] border border-blue-100">
                    {user.station.name}
                  </span>
                </>
              )}
            </div>
            <span className="text-[11px] text-slate-500 font-medium leading-none mt-0.5">
              {activeItem?.subtitle || `Mizigo`}
            </span>
          </div>
        </div>
      </div>

      <div className="flex items-center gap-4">
        {/* Activity Watchdog Display */}
        <div className="hidden lg:flex items-center gap-3 bg-slate-50 border border-slate-100 rounded-full px-4 py-1.5 mr-2">
          <Clock className="h-3.5 w-3.5 text-slate-400" />
          <span className="text-xs font-mono text-slate-500 tabular-nums">
            {mounted ? format(time, "HH:mm:ss") : "--:--:--"}
          </span>
        </div>

        <div className="flex items-center gap-1 lg:border-l lg:border-slate-200 lg:pl-4">
          <div className="hidden lg:flex items-center gap-1">
            <button
              onClick={() => useUIStore.getState().setLocked(true)}
              className="p-2.5 hover:bg-slate-100 rounded-full transition-all text-slate-500 relative group"
              title="Lock Session"
            >
              <Lock className="h-5 w-5 group-hover:scale-110 transition-transform" />
            </button>

            <button className="p-2.5 hover:bg-slate-100 rounded-full transition-all text-slate-500 relative">
              <Bell className="h-5 w-5" />
              <span className="absolute top-2 right-2 h-2 w-2 bg-red-500 border-2 border-white rounded-full" />
            </button>
          </div>

          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <div className="flex items-center gap-3 ml-2 hover:bg-slate-50 p-1.5 pr-3 rounded-[10px] cursor-pointer transition-all border border-transparent hover:border-slate-100 outline-none">
                <div className="h-9 w-9 rounded-[10px] bg-gradient-to-br from-blue-500 to-indigo-600 flex items-center justify-center text-white font-bold text-sm shadow-lg shadow-blue-200">
                  {user?.name?.charAt(0) || "U"}
                </div>
                <div className="hidden sm:flex flex-col items-start leading-none">
                  <span className="text-sm font-bold text-slate-700">
                    {user?.name || "User"}
                  </span>
                  <span className="text-[10px] text-slate-400 font-medium">
                    {user?.email || ""}
                  </span>
                </div>
                <ChevronDown className="h-4 w-4 text-slate-400" />
              </div>
            </DropdownMenuTrigger>
            <DropdownMenuContent
              className="w-64 bg-white border border-slate-100 text-slate-700 shadow-[0_20px_50px_rgba(0,0,0,0.15)] rounded-2xl p-2 z-50 animate-in fade-in-50 duration-200"
              align="end"
              sideOffset={10}
            >
              <DropdownMenuLabel className="text-slate-900 flex items-center gap-3 p-3">
                <div className="h-2 w-2 rounded-full bg-emerald-500 animate-pulse" />
                <span className="font-bold text-[10px] uppercase tracking-[0.2em] text-slate-400">
                  Signed In
                </span>
              </DropdownMenuLabel>
              <DropdownMenuSeparator className="bg-slate-100 mx-2" />

              <DropdownMenuItem
                className="hover:bg-slate-50 focus:bg-slate-50 cursor-pointer rounded-xl transition-all py-3 px-4 m-1 flex items-center gap-3 text-slate-700 hover:text-blue-600"
                onClick={() => useUIStore.getState().setLocked(true)}
              >
                <div className="h-8 w-8 rounded-[10px] bg-slate-50 flex items-center justify-center border border-slate-100">
                  <Lock className="h-4 w-4 text-slate-400" />
                </div>
                <span className="font-semibold text-xs uppercase tracking-wider">
                  Lock Screen
                </span>
              </DropdownMenuItem>

              <DropdownMenuSeparator className="bg-slate-100 mx-2" />
              <DropdownMenuItem
                className="hover:bg-rose-50 hover:text-rose-600 focus:bg-rose-50 focus:text-rose-600 cursor-pointer rounded-xl transition-all py-3 px-4 m-1 flex items-center gap-3 text-rose-500"
                onClick={() => signOut({ callbackUrl: "/login" })}
              >
                <div className="h-8 w-8 rounded-[10px] bg-rose-50 flex items-center justify-center border border-rose-100">
                  <LogOut className="h-4 w-4" />
                </div>
                <span className="font-bold text-xs uppercase tracking-wider">
                  Sign out
                </span>
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        </div>
      </div>
    </header>
  );
}
