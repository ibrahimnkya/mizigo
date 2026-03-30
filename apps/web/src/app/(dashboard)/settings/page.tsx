import { Bell, Palette, ShieldCheck, UserCircle, LogOut } from "lucide-react"
import { Label } from "@repo/ui/label"
import { Switch } from "@repo/ui/switch"

const settingsSections = [
    {
        icon: Bell,
        title: "Notifications",
        accent: "#6366f1",
        items: [
            { id: "email-notifications", label: "Email Notifications", desc: "Receive updates via your registered email", defaultChecked: true },
            { id: "push-notifications", label: "Push Notifications", desc: "Desktop alerts for instant system events", defaultChecked: false },
        ],
    },
    {
        icon: Palette,
        title: "Appearance",
        accent: "#8b5cf6",
        items: [
            { id: "dark-mode", label: "Dark Mode", desc: "Switch to a darker, low-light theme", defaultChecked: false },
            { id: "compact-mode", label: "Compact Mode", desc: "Denser layout with reduced padding", defaultChecked: false },
        ],
    },
    {
        icon: ShieldCheck,
        title: "Privacy & Security",
        accent: "#0ea5e9",
        items: [
            { id: "public-profile", label: "Public Profile", desc: "Make your profile visible to other terminals", defaultChecked: false },
        ],
    },
]

export default function SettingsPage() {
    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                <div>
                    <div className="flex items-center gap-2 mb-2">
                        <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-slate-600 bg-slate-100 px-2.5 py-1 rounded-full">
                            Configuration
                        </span>
                    </div>
                    <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">System Settings</h1>
                    <p className="text-sm text-slate-400 font-medium mt-0.5">Manage your account preferences, security, and interface configuration.</p>
                </div>

                {/* Toggle cards */}
                <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
                    {settingsSections.map((section) => (
                        <div key={section.title} className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden">
                            <div className="flex items-center gap-2.5 px-5 py-4 border-b border-slate-50">
                                <div className="w-7 h-7 rounded-lg flex items-center justify-center" style={{ backgroundColor: `${section.accent}15` }}>
                                    <section.icon size={13} style={{ color: section.accent }} strokeWidth={2.5} />
                                </div>
                                <span className="text-[14px] font-extrabold text-slate-800">{section.title}</span>
                            </div>
                            <div className="px-5 py-4 flex flex-col divide-y divide-slate-50">
                                {section.items.map((item) => (
                                    <div key={item.id} className="flex items-center justify-between py-4 first:pt-0 last:pb-0">
                                        <div>
                                            <Label htmlFor={item.id} className="text-[13px] font-bold text-slate-800 cursor-pointer leading-none">
                                                {item.label}
                                            </Label>
                                            <p className="text-[11px] text-slate-400 font-medium mt-1">{item.desc}</p>
                                        </div>
                                        <Switch
                                            id={item.id}
                                            defaultChecked={item.defaultChecked}
                                            className="data-[state=checked]:bg-blue-600 shrink-0 ml-4"
                                        />
                                    </div>
                                ))}
                            </div>
                        </div>
                    ))}
                </div>

                {/* Session card */}
                <div className="bg-white rounded-2xl border border-slate-100 shadow-[0_1px_3px_rgba(0,0,0,0.04)] overflow-hidden">
                    <div className="flex items-center gap-2.5 px-5 py-4 border-b border-slate-50">
                        <div className="w-7 h-7 rounded-lg bg-slate-100 flex items-center justify-center">
                            <UserCircle size={13} className="text-slate-500" strokeWidth={2.5} />
                        </div>
                        <span className="text-[14px] font-extrabold text-slate-800">Active Session</span>
                    </div>
                    <div className="px-5 py-4 flex items-center justify-between">
                        <div className="flex items-center gap-4">
                            <div className="w-10 h-10 rounded-xl bg-blue-50 flex items-center justify-center text-[13px] font-extrabold text-blue-600">
                                DB
                            </div>
                            <div>
                                <p className="text-[13px] font-bold text-slate-900">Terminal A-104</p>
                                <p className="text-[11px] text-slate-400 font-medium mt-0.5">
                                    Last active: {new Date().toLocaleTimeString()}
                                </p>
                            </div>
                        </div>
                        <button className="inline-flex items-center gap-1.5 text-[11px] font-extrabold uppercase tracking-widest text-rose-500 hover:text-rose-600 transition-colors">
                            <LogOut size={12} /> Log out
                        </button>
                    </div>
                </div>

            </div>
        </div>
    )
}