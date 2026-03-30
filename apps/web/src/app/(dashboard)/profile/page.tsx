import { auth } from "@/auth"
import { User, Mail, Shield, Calendar, Building2, Phone, Edit3, Key, LogOut, ChevronRight } from "lucide-react"
import { cn } from "@/lib/utils"

function avatarColor(name: string) {
    const palette = [
        { bg: "bg-indigo-100", text: "text-indigo-600", ring: "ring-indigo-200" },
        { bg: "bg-violet-100", text: "text-violet-600", ring: "ring-violet-200" },
        { bg: "bg-sky-100", text: "text-sky-600", ring: "ring-sky-200" },
        { bg: "bg-emerald-100", text: "text-emerald-600", ring: "ring-emerald-200" },
        { bg: "bg-amber-100", text: "text-amber-600", ring: "ring-amber-200" },
        { bg: "bg-rose-100", text: "text-rose-600", ring: "ring-rose-200" },
    ]
    return palette[(name?.charCodeAt(0) ?? 0) % palette.length]!
}

const ROLE_META: Record<string, { label: string; className: string; dot: string }> = {
    SUPER_ADMIN: { label: "Super Admin", className: "bg-violet-50 text-violet-700 border-violet-200/60", dot: "bg-violet-500" },
    ADMIN: { label: "Admin", className: "bg-indigo-50 text-indigo-700 border-indigo-200/60", dot: "bg-indigo-500" },
    USER: { label: "Member", className: "bg-slate-50 text-slate-600 border-slate-200/60", dot: "bg-slate-400" },
}

function Field({ label, value, icon: Icon }: { label: string; value?: string | null; icon: React.ElementType }) {
    return (
        <div className="flex items-start gap-4 py-4 border-b border-slate-50 last:border-0">
            <div className="w-8 h-8 bg-slate-50 rounded-lg flex items-center justify-center shrink-0 mt-0.5">
                <Icon size={13} className="text-slate-400" strokeWidth={2.5} />
            </div>
            <div className="flex-1 min-w-0">
                <p className="text-[10px] font-extrabold uppercase tracking-[0.12em] text-slate-400 mb-0.5">{label}</p>
                <p className="text-[13px] font-semibold text-slate-800 truncate">
                    {value || <span className="text-slate-300 font-normal italic">Not set</span>}
                </p>
            </div>
        </div>
    )
}

function ActionRow({ icon: Icon, label, desc, accent = "text-slate-600", danger = false }: {
    icon: React.ElementType; label: string; desc: string; accent?: string; danger?: boolean
}) {
    return (
        <button className={cn(
            "w-full flex items-center gap-4 px-5 py-4 text-left hover:bg-slate-50/80 transition-colors group",
            danger && "hover:bg-rose-50/60"
        )}>
            <div className={cn(
                "w-8 h-8 rounded-lg flex items-center justify-center shrink-0",
                danger ? "bg-rose-50" : "bg-slate-50"
            )}>
                <Icon size={13} className={danger ? "text-rose-500" : "text-slate-400"} strokeWidth={2.5} />
            </div>
            <div className="flex-1 min-w-0">
                <p className={cn("text-[13px] font-bold", danger ? "text-rose-600" : "text-slate-800")}>{label}</p>
                <p className="text-[11px] text-slate-400 font-medium mt-0.5">{desc}</p>
            </div>
            <ChevronRight size={14} className={cn(
                "shrink-0 transition-transform group-hover:translate-x-0.5",
                danger ? "text-rose-300" : "text-slate-200"
            )} />
        </button>
    )
}

export default async function ProfilePage() {
    const session = await auth()
    const user = session?.user
    const name = user?.name || "Unknown User"
    const email = user?.email || ""
    const role = (user as any)?.role || "USER"
    const avatar = avatarColor(name)
    const roleMeta = (ROLE_META[role] ?? ROLE_META["USER"])!
    const initials = name.split(" ").map((w: string) => w[0]).join("").slice(0, 2).toUpperCase()
    const rawJoinedDate = (user as any)?.createdAt
    const joinedDate = rawJoinedDate
        ? new Date(rawJoinedDate).toLocaleDateString("en-GB", { day: "2-digit", month: "long", year: "numeric" })
        : new Date().toLocaleDateString("en-GB", { day: "2-digit", month: "long", year: "numeric" })

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                {/* Header */}
                <div>
                    <div className="flex items-center gap-2 mb-2">
                        <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-slate-600 bg-slate-100 px-2.5 py-1 rounded-full">
                            Account
                        </span>
                    </div>
                    <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Profile</h1>
                    <p className="text-sm text-slate-400 font-medium mt-0.5">View and manage your personal account information.</p>
                </div>

                <div className="grid gap-5 lg:grid-cols-12 max-w-5xl">

                    {/* ── Left: Identity card ── */}
                    <div className="lg:col-span-4 flex flex-col gap-5">

                        {/* Avatar card */}
                        <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] p-6 flex flex-col items-center gap-4 text-center">
                            {/* Avatar */}
                            <div className={cn(
                                "w-20 h-20 rounded-2xl flex items-center justify-center text-2xl font-extrabold ring-4",
                                avatar.bg, avatar.text, avatar.ring
                            )}>
                                {initials}
                            </div>

                            <div>
                                <h2 className="text-[16px] font-extrabold text-slate-900 tracking-tight">{name}</h2>
                                <p className="text-[12px] text-slate-400 font-medium mt-0.5">{email}</p>
                            </div>

                            {/* Role badge */}
                            <span className={cn(
                                "inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-[11px] font-bold border tracking-wide",
                                roleMeta.className
                            )}>
                                <Shield size={10} strokeWidth={2.5} />
                                {roleMeta.label}
                            </span>

                            {/* Stats row */}
                            <div className="w-full pt-4 border-t border-slate-50 grid grid-cols-2 divide-x divide-slate-100">
                                <div className="flex flex-col items-center gap-0.5 pr-4">
                                    <p className="text-[18px] font-extrabold text-slate-900 tabular-nums">—</p>
                                    <p className="text-[9px] font-extrabold uppercase tracking-widest text-slate-400">Approvals</p>
                                </div>
                                <div className="flex flex-col items-center gap-0.5 pl-4">
                                    <p className="text-[18px] font-extrabold text-slate-900 tabular-nums">—</p>
                                    <p className="text-[9px] font-extrabold uppercase tracking-widest text-slate-400">Requests</p>
                                </div>
                            </div>
                        </div>

                        {/* Joined date */}
                        <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] px-5 py-4 flex items-center gap-3">
                            <div className="w-8 h-8 bg-slate-50 rounded-lg flex items-center justify-center shrink-0">
                                <Calendar size={13} className="text-slate-400" strokeWidth={2.5} />
                            </div>
                            <div>
                                <p className="text-[9px] font-extrabold uppercase tracking-widest text-slate-400">Member Since</p>
                                <p className="text-[12px] font-bold text-slate-700 mt-0.5">{joinedDate}</p>
                            </div>
                        </div>
                    </div>

                    {/* ── Right: Details + actions ── */}
                    <div className="lg:col-span-8 flex flex-col gap-5">

                        {/* Account details */}
                        <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden">
                            <div className="flex items-center justify-between px-5 py-4 border-b border-slate-50">
                                <div className="flex items-center gap-2.5">
                                    <div className="w-7 h-7 bg-indigo-50 rounded-lg flex items-center justify-center">
                                        <User size={12} className="text-indigo-500" strokeWidth={2.5} />
                                    </div>
                                    <span className="text-[14px] font-extrabold text-slate-800">Account Details</span>
                                </div>
                                <button className="inline-flex items-center gap-1.5 text-[11px] font-extrabold text-indigo-500 hover:text-indigo-700 transition-colors">
                                    <Edit3 size={11} /> Edit
                                </button>
                            </div>
                            <div className="px-5">
                                <Field label="Full Name" value={name} icon={User} />
                                <Field label="Email Address" value={email} icon={Mail} />
                                <Field label="Role" value={roleMeta.label} icon={Shield} />
                                <Field label="Terminal" value="Terminal A-104" icon={Building2} />
                                <Field label="Phone" value={null} icon={Phone} />
                            </div>
                        </div>

                        {/* Account actions */}
                        <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden">
                            <div className="flex items-center gap-2.5 px-5 py-4 border-b border-slate-50">
                                <div className="w-7 h-7 bg-slate-100 rounded-lg flex items-center justify-center">
                                    <Key size={12} className="text-slate-500" strokeWidth={2.5} />
                                </div>
                                <span className="text-[14px] font-extrabold text-slate-800">Account Actions</span>
                            </div>
                            <div className="divide-y divide-slate-50">
                                <ActionRow
                                    icon={Edit3}
                                    label="Edit Profile"
                                    desc="Update your name, phone number, and contact details"
                                />
                                <ActionRow
                                    icon={Key}
                                    label="Change Password"
                                    desc="Update your login credentials and security settings"
                                />
                                <ActionRow
                                    icon={LogOut}
                                    label="Sign Out"
                                    desc="End your current session on this device"
                                    danger
                                />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    )
}