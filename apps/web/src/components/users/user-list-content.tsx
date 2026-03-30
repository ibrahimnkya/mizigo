"use client";

import { useState, useMemo } from "react";
import { 
    Search, 
    Filter, 
    Download, 
    Users, 
    ChevronLeft, 
    ChevronRight, 
    Calendar,
    LayoutGrid,
    Table as TableIcon,
    List as ListIcon,
    Building2,
    Shield,
    X,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { CreateUserModal } from "./create-user-modal";
import { UserActionMenu } from "./user-action-menu";

function Avatar({ name }: { name: string }) {
    const initials = name
        .split(" ")
        .map((n) => n[0])
        .join("")
        .slice(0, 2)
        .toUpperCase();
    return (
        <div className="w-10 h-10 rounded-lg bg-gradient-to-br from-blue-500 to-blue-600 flex items-center justify-center text-white text-[13px] font-bold shadow-sm ring-2 ring-white transition-transform group-hover:scale-110">
            {initials}
        </div>
    );
}

const ROLE_BADGE: Record<string, string> = {
    SUPER_ADMIN: "bg-blue-600 text-white border-blue-600 shadow-sm shadow-blue-100",
    ADMIN:       "bg-blue-50 text-blue-700 border-blue-100",
    OPERATOR:    "bg-emerald-50 text-emerald-700 border-emerald-100",
    AGENT:       "bg-slate-50 text-slate-600 border-slate-100",
}

interface UserListContentProps { 
    users: any[] 
    currentUserRole?: string
}

export function UserListContent({ users, currentUserRole }: UserListContentProps) {
    const [view, setView] = useState<"table" | "grid" | "list">("table");
    const [search, setSearch] = useState("");
    const [roleFilter, setRoleFilter] = useState<string>("all");
    const [stationFilter, setStationFilter] = useState<string>("all");
    const [dateFrom, setDateFrom] = useState<string>("");
    const [dateTo, setDateTo] = useState<string>("");
    const [currentPage, setCurrentPage] = useState(1);
    const [rowsPerPage, setRowsPerPage] = useState(10);

    const stations = useMemo(() => {
        const uniqueStations = new Set(users.map(u => u.station?.name).filter(Boolean));
        return Array.from(uniqueStations).sort();
    }, [users]);

    const filteredUsers = useMemo(() => {
        return users.filter(user => {
            if (!user.isActive && user.role?.name === "AGENT") return false;
            const matchesSearch = 
                user.name.toLowerCase().includes(search.toLowerCase()) || 
                user.email.toLowerCase().includes(search.toLowerCase());
            const matchesRole = roleFilter === "all" || user.role?.name === roleFilter;
            const matchesStation = stationFilter === "all" || user.station?.name === stationFilter;
            const userDate = new Date(user.createdAt);
            const matchesDateFrom = !dateFrom || userDate >= new Date(dateFrom);
            const matchesDateTo = !dateTo || userDate <= new Date(dateTo + "T23:59:59");
            return matchesSearch && matchesRole && matchesStation && matchesDateFrom && matchesDateTo;
        });
    }, [users, search, roleFilter, stationFilter, dateFrom, dateTo]);

    const totalPages = Math.ceil(filteredUsers.length / rowsPerPage);
    const startIndex = (currentPage - 1) * rowsPerPage;
    const paginatedUsers = filteredUsers.slice(startIndex, startIndex + rowsPerPage);

    const clearFilters = () => {
        setSearch(""); setRoleFilter("all"); setStationFilter("all");
        setDateFrom(""); setDateTo(""); setCurrentPage(1);
    };

    return (
        <div className="flex flex-col gap-6 p-6 md:p-10 bg-white max-w-[1440px] mx-auto min-h-[85vh] shadow-[0_0_80px_-20px_rgba(0,0,0,0.08)] rounded-[2.5rem] my-8 border border-slate-100/50 relative overflow-hidden">
            {/* Background decoration */}
            <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-blue-50/20 rounded-full blur-3xl -mr-64 -mt-64 pointer-events-none" />
            <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-slate-50/30 rounded-full blur-3xl -ml-48 -mb-48 pointer-events-none" />

            {/* ── Header ── */}
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-6 pb-6 border-b border-slate-100 relative z-10">
                <div>
                    <h1 className="text-2xl font-black text-slate-900 tracking-tight flex items-center gap-3">
                        User Management
                        <span className="px-3 py-1 bg-blue-50 text-blue-600 text-[12px] font-bold rounded-lg border border-blue-100 uppercase tracking-widest">
                            {filteredUsers.length} Users
                        </span>
                    </h1>
                    <p className="text-slate-500 font-medium text-[14px] mt-1">Manage organization members, roles and platform permissions</p>
                </div>

                <div className="flex items-center gap-3">
                    {/* View Switcher */}
                    <div className="flex items-center bg-slate-50 p-1 rounded-lg border border-slate-200 shadow-sm">
                        {([
                            { key: "table", Icon: TableIcon, label: "Table" },
                            { key: "grid",  Icon: LayoutGrid, label: "Grid" },
                            { key: "list",  Icon: ListIcon,   label: "List" },
                        ] as const).map(({ key, Icon, label }) => (
                            <button
                                key={key}
                                onClick={() => setView(key)}
                                className={cn(
                                    "flex items-center gap-2 px-4 py-2 rounded-lg text-[13px] font-bold transition-all",
                                    view === key
                                        ? "bg-white text-blue-600 shadow-sm border border-slate-100"
                                        : "text-slate-400 hover:text-slate-600"
                                )}
                            >
                                <Icon size={15} strokeWidth={2.5} />{label}
                            </button>
                        ))}
                    </div>
                    <CreateUserModal currentUserRole={currentUserRole} />
                </div>
            </div>

            {/* ── Toolbar ── */}
            <div className="flex flex-col gap-4 bg-slate-50/60 p-5 rounded-xl border border-slate-100 shadow-sm relative z-10">
                <div className="flex flex-wrap items-center gap-3">
                    {/* Search */}
                    <div className="relative group min-w-[280px] flex-1">
                        <Search size={16} className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-blue-600 transition-colors" />
                        <input 
                            type="text"
                            placeholder="Search by name or email..."
                            value={search}
                            onChange={(e) => setSearch(e.target.value)}
                            className="w-full pl-11 pr-4 py-2.5 bg-white border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500/15 focus:border-blue-500/50 transition-all text-slate-700 font-bold text-[13px] shadow-sm placeholder:text-slate-300"
                        />
                    </div>

                    <div className="h-7 w-px bg-slate-200/60 hidden md:block" />

                    <div className="flex flex-wrap items-center gap-2.5">
                        {/* Role filter */}
                        <div className="flex items-center gap-2 bg-white px-3 py-2 rounded-lg border border-slate-200 shadow-sm hover:border-blue-200 transition-colors">
                            <Shield size={13} className="text-slate-400" />
                            <select 
                                value={roleFilter}
                                onChange={(e) => setRoleFilter(e.target.value)}
                                className="bg-transparent text-[13px] font-bold text-slate-700 focus:outline-none cursor-pointer pr-1"
                            >
                                <option value="all">Any Role</option>
                                <option value="SUPER_ADMIN">Super Admin</option>
                                <option value="ADMIN">Admin</option>
                                <option value="OPERATOR">Operator</option>
                            </select>
                        </div>

                        {/* Station filter */}
                        <div className="flex items-center gap-2 bg-white px-3 py-2 rounded-lg border border-slate-200 shadow-sm hover:border-blue-200 transition-colors">
                            <Building2 size={13} className="text-slate-400" />
                            <select 
                                value={stationFilter}
                                onChange={(e) => setStationFilter(e.target.value)}
                                className="bg-transparent text-[13px] font-bold text-slate-700 focus:outline-none cursor-pointer pr-1"
                            >
                                <option value="all">Any Station</option>
                                {stations.map(s => <option key={s} value={s}>{s}</option>)}
                            </select>
                        </div>

                        {/* Date range */}
                        <div className="flex items-center gap-2 bg-white px-3 py-2 rounded-lg border border-slate-200 shadow-sm hover:border-blue-200 transition-colors">
                            <Calendar size={13} className="text-slate-400" />
                            <input 
                                type="date" value={dateFrom}
                                onChange={(e) => setDateFrom(e.target.value)}
                                className="bg-transparent text-[12px] font-bold text-slate-700 focus:outline-none cursor-pointer"
                            />
                            <span className="text-slate-300 font-bold text-[10px] uppercase">to</span>
                            <input 
                                type="date" value={dateTo}
                                onChange={(e) => setDateTo(e.target.value)}
                                className="bg-transparent text-[12px] font-bold text-slate-700 focus:outline-none cursor-pointer"
                            />
                        </div>

                        {/* Clear */}
                        <button 
                            onClick={clearFilters}
                            className="w-9 h-9 flex items-center justify-center bg-white border border-slate-200 rounded-lg text-slate-400 hover:text-rose-500 hover:border-rose-200 transition-all shadow-sm active:scale-95 group"
                            title="Clear filters"
                        >
                            <X size={16} strokeWidth={2.5} className="group-hover:rotate-90 transition-transform" />
                        </button>

                        <div className="h-7 w-px bg-slate-200/60" />

                        {/* Export */}
                        <button className="flex items-center gap-2 px-5 h-9 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-all shadow-md shadow-blue-100 active:scale-95 text-[12px] font-bold uppercase tracking-widest">
                            <Download size={14} strokeWidth={2.5} />
                            Export
                        </button>
                    </div>
                </div>
            </div>

            {/* ── Content ── */}
            {filteredUsers.length === 0 ? (
                <div className="flex flex-col items-center justify-center py-32 gap-6 bg-slate-50/30 rounded-2xl border border-slate-100 border-dashed">
                    <div className="w-16 h-16 bg-white rounded-2xl flex items-center justify-center shadow-lg shadow-slate-100 border border-slate-100">
                        <Users size={28} className="text-slate-200" />
                    </div>
                    <div className="text-center">
                        <h3 className="text-xl font-black text-slate-900 mb-1">No users matched</h3>
                        <p className="text-slate-400 font-medium text-[14px]">Try refining your search or filter settings</p>
                    </div>
                    <button onClick={clearFilters} className="px-6 py-2.5 bg-blue-600 text-white rounded-lg font-bold text-[13px] shadow-md shadow-blue-100 active:scale-95 transition-all">
                        Clear All Filters
                    </button>
                </div>

            ) : view === "table" ? (
                /* ── Table View ── */
                <div className="overflow-hidden bg-white rounded-xl border border-slate-100 shadow-sm">
                    <div className="overflow-x-auto">
                        <table className="w-full text-left border-collapse">
                            <thead>
                                <tr className="bg-slate-50 border-b border-slate-100">
                                    <th className="py-4 px-5 text-[11px] font-black text-slate-400 uppercase tracking-[0.18em] w-[280px]">Member</th>
                                    <th className="py-4 px-5 text-[11px] font-black text-slate-400 uppercase tracking-[0.18em]">Role</th>
                                    <th className="py-4 px-5 text-[11px] font-black text-slate-400 uppercase tracking-[0.18em]">Station / Contact</th>
                                    <th className="py-4 px-5 text-[11px] font-black text-slate-400 uppercase tracking-[0.18em]">Status</th>
                                    <th className="py-4 px-5 text-[11px] font-black text-slate-400 uppercase tracking-[0.18em] text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody className="divide-y divide-slate-50">
                                {paginatedUsers.map((user: any) => (
                                    <tr key={user.id} className="group hover:bg-blue-50/20 transition-all duration-200">
                                        <td className="py-4 px-5">
                                            <div className="flex items-center gap-3.5">
                                                <Avatar name={user.name} />
                                                <div className="flex flex-col min-w-0">
                                                    <span className="text-[14px] font-bold text-slate-900 truncate group-hover:text-blue-600 transition-colors">{user.name}</span>
                                                    <span className="text-[12px] font-medium text-slate-400 truncate">{user.email}</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td className="py-4 px-5">
                                            <span className={cn(
                                                "inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg text-[11px] font-black border uppercase tracking-wider",
                                                ROLE_BADGE[user.role?.name] ?? "bg-slate-50 text-slate-600 border-slate-100"
                                            )}>
                                                <Shield size={10} strokeWidth={2.5} />
                                                {user.role?.name?.replace("_", " ") || "USER"}
                                            </span>
                                        </td>
                                        <td className="py-4 px-5">
                                            <div className="flex flex-col gap-0.5">
                                                <div className="flex items-center gap-1.5 text-[13px] font-bold text-slate-600">
                                                    <Building2 size={13} className="text-slate-300" />
                                                    {user.station?.name || user.organization?.name || "Main HQ"}
                                                </div>
                                                <div className="text-[12px] font-medium text-slate-400">
                                                    {user.phone || "No phone"}
                                                </div>
                                            </div>
                                        </td>
                                        <td className="py-4 px-5">
                                            <span className="inline-flex items-center gap-1.5 px-2.5 py-1 bg-emerald-50 text-emerald-600 text-[11px] font-black rounded-lg border border-emerald-100 uppercase tracking-wider">
                                                <span className="w-1.5 h-1.5 rounded-full bg-emerald-500" />
                                                Active
                                            </span>
                                        </td>
                                        <td className="py-4 px-5">
                                            <div className="flex items-center justify-end gap-1 opacity-0 group-hover:opacity-100 transition-all -translate-x-1 group-hover:translate-x-0">
                                                <UserActionMenu user={user} currentUserRole={currentUserRole} />
                                            </div>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>

            ) : view === "grid" ? (
                /* ── Grid View ── */
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-5">
                    {paginatedUsers.map((user: any) => (
                        <div key={user.id} className="group bg-white rounded-xl border border-slate-100 p-6 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 relative overflow-hidden">
                            <div className="absolute top-0 right-0 w-28 h-28 bg-blue-50/40 rounded-bl-[3rem] -mr-10 -mt-10 transition-all group-hover:scale-110 pointer-events-none" />
                            <div className="flex flex-col items-center text-center gap-4 relative z-10">
                                <div className="relative">
                                    <Avatar name={user.name} />
                                    <div className="absolute -bottom-1 -right-1 w-4 h-4 border-2 border-white rounded-full bg-emerald-500" />
                                </div>
                                <div>
                                    <h3 className="text-[15px] font-black text-slate-900 group-hover:text-blue-600 transition-colors line-clamp-1">{user.name}</h3>
                                    <p className="text-[12px] font-bold text-slate-400 line-clamp-1">{user.email}</p>
                                </div>
                                <div className="flex flex-wrap justify-center gap-2">
                                    <span className={cn(
                                        "px-2.5 py-1 text-[10px] font-black rounded-lg border uppercase tracking-widest",
                                        ROLE_BADGE[user.role?.name] ?? "bg-slate-50 text-slate-500 border-slate-100"
                                    )}>
                                        {user.role?.name?.replace("_", " ") || "USER"}
                                    </span>
                                    <span className="px-2.5 py-1 bg-slate-50 text-slate-500 text-[10px] font-black rounded-lg border border-slate-100 uppercase tracking-widest">
                                        {user.station?.name || "Main HQ"}
                                    </span>
                                </div>
                                <div className="w-full h-px bg-slate-50" />
                                <div className="flex items-center justify-between w-full">
                                    <div className="text-left">
                                        <span className="text-[9px] uppercase font-black text-slate-300 tracking-widest block mb-0.5">Emp ID</span>
                                        <span className="text-[12px] font-black text-slate-800">#MZ-{user.id.slice(-4).toUpperCase()}</span>
                                    </div>
                                    <UserActionMenu user={user} currentUserRole={currentUserRole} />
                                </div>
                            </div>
                        </div>
                    ))}
                </div>

            ) : (
                /* ── List View ── */
                <div className="flex flex-col gap-3">
                    {paginatedUsers.map((user: any) => (
                        <div key={user.id} className="group flex items-center justify-between p-4 bg-white rounded-xl border border-slate-100 hover:border-blue-200 hover:shadow-lg hover:shadow-blue-500/5 transition-all duration-200">
                            <div className="flex items-center gap-5">
                                <Avatar name={user.name} />
                                <div className="flex flex-col min-w-[180px]">
                                    <span className="text-[14px] font-black text-slate-900 group-hover:text-blue-600 transition-all">{user.name}</span>
                                    <span className="text-[12px] font-bold text-slate-400">{user.email}</span>
                                </div>
                                <div className="hidden lg:flex items-center gap-10 ml-4">
                                    <div className="flex flex-col">
                                        <span className="text-[9px] uppercase font-black text-slate-300 tracking-widest mb-0.5">Role</span>
                                        <span className="text-[13px] font-black text-slate-700 uppercase">{user.role?.name?.replace("_", " ") || "USER"}</span>
                                    </div>
                                    <div className="flex flex-col">
                                        <span className="text-[9px] uppercase font-black text-slate-300 tracking-widest mb-0.5">Station</span>
                                        <span className="text-[13px] font-black text-slate-700">{user.station?.name || "Main HQ"}</span>
                                    </div>
                                    <div className="flex flex-col">
                                        <span className="text-[9px] uppercase font-black text-slate-300 tracking-widest mb-0.5">Joined</span>
                                        <span className="text-[13px] font-black text-slate-600">
                                            {new Intl.DateTimeFormat('en-GB', { day: '2-digit', month: 'short', year: 'numeric' }).format(new Date(user.createdAt))}
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div className="flex items-center gap-3">
                                <span className="px-2.5 py-1 bg-emerald-50 text-emerald-600 text-[10px] font-black rounded-lg border border-emerald-100 uppercase tracking-widest">
                                    Active
                                </span>
                                <div className="w-px h-7 bg-slate-100" />
                                <UserActionMenu user={user} currentUserRole={currentUserRole} />
                            </div>
                        </div>
                    ))}
                </div>
            )}

            {/* ── Pagination ── */}
            <div className="flex flex-col md:flex-row items-center justify-between gap-4 pt-6 border-t border-slate-100">
                <div className="flex items-center gap-3 text-slate-400 font-bold text-[13px]">
                    Show
                    <select 
                        value={rowsPerPage} 
                        onChange={(e) => { setRowsPerPage(Number(e.target.value)); setCurrentPage(1); }}
                        className="bg-slate-50 border border-slate-200 rounded-lg px-3 py-1.5 focus:outline-none focus:ring-2 focus:ring-blue-500/10 focus:border-blue-500/30 transition-all text-[13px] font-bold text-slate-700"
                    >
                        {[10, 20, 50, 100].map(val => <option key={val} value={val}>{val}</option>)}
                    </select>
                    <span>{startIndex + 1}–{Math.min(startIndex + rowsPerPage, filteredUsers.length)} of {filteredUsers.length} users</span>
                </div>

                <div className="flex items-center gap-1.5">
                    <button 
                        onClick={() => setCurrentPage(p => Math.max(1, p - 1))}
                        disabled={currentPage === 1}
                        className="p-2 rounded-lg border border-slate-200 text-slate-500 hover:bg-slate-50 disabled:opacity-30 disabled:cursor-not-allowed transition-all"
                    >
                        <ChevronLeft size={16} strokeWidth={2.5} />
                    </button>
                    
                    <div className="flex items-center gap-1">
                        {Array.from({ length: Math.min(5, totalPages) }, (_, i) => {
                            let pageNum = i + 1;
                            if (totalPages > 5 && currentPage > 3) pageNum = currentPage - 2 + i;
                            if (pageNum > totalPages) return null;
                            return (
                                <button 
                                    key={pageNum}
                                    onClick={() => setCurrentPage(pageNum)}
                                    className={cn(
                                        "w-9 h-9 rounded-lg text-[13px] font-black transition-all",
                                        currentPage === pageNum
                                            ? "bg-blue-600 text-white shadow-md shadow-blue-200"
                                            : "text-slate-400 hover:bg-slate-50 hover:text-slate-900 border border-transparent hover:border-slate-200"
                                    )}
                                >
                                    {pageNum}
                                </button>
                            );
                        })}
                    </div>

                    <button 
                        onClick={() => setCurrentPage(p => Math.min(totalPages, p + 1))}
                        disabled={currentPage === totalPages}
                        className="p-2 rounded-lg border border-slate-200 text-slate-500 hover:bg-slate-50 disabled:opacity-30 disabled:cursor-not-allowed transition-all"
                    >
                        <ChevronRight size={16} strokeWidth={2.5} />
                    </button>
                </div>
            </div>
        </div>
    );
}
