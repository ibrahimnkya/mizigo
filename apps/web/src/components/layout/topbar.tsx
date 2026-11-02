"use client";

import { useState } from "react";
import Link from "next/link";
import { usePathname, useRouter } from "next/navigation";
import { signOut, useSession } from "next-auth/react";
import { useQuery } from "@tanstack/react-query";
import { Bell, ChevronDown, Loader2, Lock, LogOut, Menu, Search, UserRound } from "lucide-react";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@repo/ui/dropdown-menu";
import { useUIStore } from "@/store/ui-store";
import { sidebarItems } from "./sidebar";
import { ThemeSwitcher } from "./theme-switcher";
import { useTrackParcel } from "@/components/parcel/use-track-parcel";

const ROLE_LABELS: Record<string, string> = {
  SUPER_ADMIN: "Super admin",
  ADMIN: "Admin",
  STATION_MASTER: "Station master",
  CLERK: "Clerk",
  TRAIN_GUARD: "Train guard",
  AGENT: "Agent",
};

export function Topbar() {
  const { data: session } = useSession();
  const { toggleSidebar } = useUIStore();
  const pathname = usePathname();
  const router = useRouter();
  const [query, setQuery] = useState("");

  const user = session?.user as any;
  const role: string | undefined = user?.role;

  // Most specific sidebar entry for this page (and visible to this role).
  const activeItem = sidebarItems
    .filter((item) => !role || item.roles.includes(role))
    .filter((item) => item.href && (pathname === item.href || pathname.startsWith(item.href + "/")))
    .sort((a, b) => (b.href?.length ?? 0) - (a.href?.length ?? 0))[0];

  const { data: unread = 0 } = useQuery({
    queryKey: ["notifications-unread"],
    queryFn: async () => {
      const res = await fetch("/api/notifications");
      if (!res.ok) return 0;
      const list = await res.json();
      return Array.isArray(list) ? list.filter((n: { read?: boolean }) => !n.read).length : 0;
    },
    enabled: !!user,
    refetchInterval: 60_000,
  });

  const lookup = useTrackParcel();
  const track = async (e: React.FormEvent) => {
    e.preventDefault();
    if (await lookup.track(query)) setQuery("");
  };

  const iconBtn =
    "relative flex h-10 w-10 items-center justify-center rounded-full border border-[#E2E2E2] bg-white text-slate-500 transition hover:border-orange-200 hover:bg-orange-50 hover:text-orange-600";

  return (
    <header className="sticky top-0 z-30 flex h-[72px] shrink-0 items-center gap-4 border-b border-[#E2E2E2] bg-[#F3F3F3]/85 px-4 backdrop-blur-xl sm:px-6 lg:px-8">
      {/* Left: menu + where am I */}
      <button onClick={toggleSidebar} aria-label="Open menu" className={`${iconBtn} lg:hidden`}>
        <Menu size={18} />
      </button>

      <div className="min-w-0 flex-1">
        {activeItem?.section && (
          <p className="truncate text-[12px] font-medium uppercase tracking-[0.08em] text-slate-400">
            {activeItem.section}
          </p>
        )}
        <h1 className="truncate text-[19px] font-semibold leading-tight text-[#1C1C1E]">
          {activeItem?.title ?? "MiziGO"}
        </h1>
      </div>

      {/* Search */}
      <form onSubmit={track} className="relative hidden w-full max-w-xs md:block">
        {lookup.loading ? (
          <Loader2 size={16} className="pointer-events-none absolute left-4 top-1/2 -translate-y-1/2 animate-spin text-orange-500" />
        ) : (
          <Search size={16} className="pointer-events-none absolute left-4 top-1/2 -translate-y-1/2 text-slate-400" />
        )}
        <input
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Track a parcel number"
          aria-label="Track a parcel number"
          className="h-10 w-full rounded-full border border-[#E2E2E2] bg-white pl-11 pr-4 text-[14px] uppercase tracking-wide text-slate-700 outline-none transition placeholder:normal-case placeholder:tracking-normal placeholder:text-slate-400 focus:border-orange-500 focus:ring-4 focus:ring-orange-500/10"
        />
      </form>

      {/* Right */}
      <div className="flex items-center gap-2">
        <ThemeSwitcher />

        <Link href="/notifications" aria-label={unread ? `${unread} unread notifications` : "Notifications"} className={iconBtn}>
          <Bell size={17} />
          {unread > 0 && (
            <span className="absolute -right-0.5 -top-0.5 flex h-5 min-w-5 items-center justify-center rounded-full bg-orange-500 px-1 text-[11px] font-semibold text-white ring-2 ring-[#F3F3F3]">
              {unread > 9 ? "9+" : unread}
            </span>
          )}
        </Link>

        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <button className="flex h-10 items-center gap-2.5 rounded-full border border-[#E2E2E2] bg-white pl-1 pr-3 outline-none transition hover:border-orange-200">
              <span className="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-[#5C0B19] text-[13px] font-semibold text-white">
                {(user?.name || "U").charAt(0).toUpperCase()}
              </span>
              <span className="hidden flex-col items-start leading-tight sm:flex">
                <span className="max-w-[9rem] truncate text-[13px] font-semibold text-[#1C1C1E]">
                  {user?.name || "Account"}
                </span>
                {role && <span className="text-[11px] text-slate-500">{ROLE_LABELS[role] ?? role}</span>}
              </span>
              <ChevronDown size={15} className="text-slate-400" />
            </button>
          </DropdownMenuTrigger>
          <DropdownMenuContent
            align="end"
            sideOffset={8}
            className="z-50 w-60 rounded-2xl border border-[#E2E2E2] bg-white p-1.5 text-slate-600 shadow-premium"
          >
            <DropdownMenuLabel className="flex flex-col gap-0.5 px-3 py-2">
              <span className="text-[14px] font-semibold text-[#1C1C1E]">{user?.name || "Account"}</span>
              <span className="truncate text-[12px] font-normal text-slate-400">{user?.email || ""}</span>
            </DropdownMenuLabel>
            <DropdownMenuSeparator className="mx-1 bg-slate-100" />
            <DropdownMenuItem asChild className="cursor-pointer rounded-xl px-3 py-2.5 text-[14px]">
              <Link href="/profile" className="flex items-center gap-2.5">
                <UserRound size={16} className="text-slate-400" /> My profile
              </Link>
            </DropdownMenuItem>
            <DropdownMenuItem
              onClick={() => useUIStore.getState().setLocked(true)}
              className="flex cursor-pointer items-center gap-2.5 rounded-xl px-3 py-2.5 text-[14px]"
            >
              <Lock size={16} className="text-slate-400" /> Lock screen
            </DropdownMenuItem>
            <DropdownMenuSeparator className="mx-1 bg-slate-100" />
            <DropdownMenuItem
              onClick={() => signOut({ callbackUrl: "/login" })}
              className="flex cursor-pointer items-center gap-2.5 rounded-xl px-3 py-2.5 text-[14px] text-rose-600 focus:bg-rose-50 focus:text-rose-600"
            >
              <LogOut size={16} /> Sign out
            </DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>
      </div>
      {lookup.sheet}
    </header>
  );
}
