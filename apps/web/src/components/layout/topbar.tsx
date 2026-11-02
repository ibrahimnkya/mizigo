"use client";

import { useSession } from "next-auth/react";
import { useUIStore } from "@/store/ui-store";
import {
  Bell,
  Menu,
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
import { usePathname } from "next/navigation";
import { sidebarItems } from "./sidebar";
import { Breadcrumbs } from "./breadcrumbs";

export function Topbar() {
  const { data: session } = useSession();
  const { toggleSidebar } = useUIStore();
  const pathname = usePathname();

  const user = session?.user as any;

  const activeItem = sidebarItems.find((item) => {
    if (item.href === pathname) return true;
    if (item.href !== "/" && pathname.startsWith(item.href + "/")) return true;
    if (item.children?.some((child) => child.href === pathname)) return true;
    return false;
  });

  return (
    <header className="h-16 border-b border-[#E2E2E2] bg-white/85 backdrop-blur-xl sticky top-0 z-30 flex items-center justify-between px-5">
      {/* Left */}
      <div className="flex items-center gap-3">
        <button
          onClick={toggleSidebar}
          className="lg:hidden p-1.5 hover:bg-slate-100 rounded-xl transition-colors"
        >
          <Menu className="h-5 w-5 text-slate-600" />
        </button>

        <div className="hidden lg:flex items-center gap-3">
          <div className="h-10 w-10 rounded-2xl bg-orange-50 flex items-center justify-center shrink-0">
            {activeItem?.icon ? (
              <activeItem.icon className="h-5 w-5 text-orange-500" />
            ) : (
              <LayoutGrid className="h-5 w-5 text-orange-500" />
            )}
          </div>
          <div className="flex flex-col justify-center">
            <div className="flex items-center gap-2">
              <span className="text-[17px] font-semibold text-[#1C1C1E] leading-none">
                {activeItem?.title || user?.organization?.name || "Mizigo Platform"}
              </span>
              {user?.station?.name && (
                <span className="text-[10px] font-semibold text-white bg-orange-500 px-2 py-0.5 rounded-full leading-none">
                  {user.station.name}
                </span>
              )}
            </div>
            <Breadcrumbs className="mt-0.5" />
          </div>
        </div>
      </div>

      {/* Right */}
      <div className="flex items-center gap-1">
        <button
          onClick={() => useUIStore.getState().setLocked(true)}
          className="hidden lg:flex h-9 w-9 flex items-center justify-center bg-slate-100 hover:bg-orange-50 hover:text-orange-500 rounded-full transition-colors text-slate-500"
          title="Lock Session"
        >
          <Lock className="h-4 w-4" />
        </button>

        <button className="relative h-9 w-9 flex items-center justify-center bg-slate-100 hover:bg-orange-50 hover:text-orange-500 rounded-full transition-colors text-slate-500">
          <Bell className="h-4 w-4" />
          <span className="absolute top-1.5 right-1.5 h-1.5 w-1.5 bg-red-500 border border-white rounded-full" />
        </button>

        <div className="h-4 w-px bg-slate-200 mx-1 hidden sm:block" />

        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <button className="flex items-center gap-2 pl-1 pr-2 py-1 rounded-xl hover:bg-slate-100 transition-colors outline-none">
              <div className="h-8 w-8 rounded-full bg-[#5C0B19] flex items-center justify-center text-white font-bold text-[11px] shrink-0">
                {user?.name?.charAt(0) || "U"}
              </div>
              <div className="hidden sm:flex flex-col items-start leading-none">
                <span className="text-[13px] font-semibold text-slate-700">
                  {user?.name || "User"}
                </span>
              </div>
              <ChevronDown className="h-3.5 w-3.5 text-slate-400" />
            </button>
          </DropdownMenuTrigger>
          <DropdownMenuContent
            className="w-56 bg-white border border-[#E2E2E2] text-slate-600 shadow-premium rounded-2xl p-1.5 z-50"
            align="end"
            sideOffset={8}
          >
            <DropdownMenuLabel className="px-3 py-2 flex flex-col gap-0.5">
              <span className="text-[13px] font-semibold text-slate-800">
                {user?.name || "User"}
              </span>
              <span className="text-[11px] text-slate-400">{user?.email || ""}</span>
            </DropdownMenuLabel>
            <DropdownMenuSeparator className="bg-slate-100 mx-1" />
            <DropdownMenuItem
              className="hover:bg-slate-50 focus:bg-slate-50 cursor-pointer rounded-xl px-3 py-2 text-[13px] font-medium flex items-center gap-2 m-0.5"
              onClick={() => useUIStore.getState().setLocked(true)}
            >
              <Lock className="h-4 w-4 text-slate-400" />
              Lock Screen
            </DropdownMenuItem>
            <DropdownMenuSeparator className="bg-slate-100 mx-1" />
            <DropdownMenuItem
              className="hover:bg-red-50 hover:text-red-600 focus:bg-red-50 focus:text-red-600 cursor-pointer rounded-xl px-3 py-2 text-[13px] font-medium flex items-center gap-2 m-0.5 text-red-500"
              onClick={() => signOut({ callbackUrl: "/login" })}
            >
              <LogOut className="h-4 w-4" />
              Sign out
            </DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>
      </div>
    </header>
  );
}
