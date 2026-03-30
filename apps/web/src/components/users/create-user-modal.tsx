"use client"

import { useState, useEffect, useCallback } from "react"
import { useRouter } from "next/navigation"
import { Button } from "@repo/ui/button"
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from "@repo/ui/dialog"
import { Input } from "@repo/ui/input"
import { Label } from "@repo/ui/label"
import { 
    UserPlus, 
    User, 
    Mail, 
    Phone, 
    ShieldCheck, 
    Building2, 
    X,
    BadgeCheck,
    Contact2,
    KeyRound,
    Check,
    RefreshCw,
    Copy,
    Eye,
    EyeOff,
    CheckCheck
} from "lucide-react"
import { cn } from "@/lib/utils"

interface CreateUserModalProps {
    currentUserRole?: string
}

// Permission definitions per role
const ROLE_PERMISSIONS: Record<string, { group: string; items: string[] }[]> = {
    SUPER_ADMIN: [
        { group: "Platform", items: ["Full platform access", "Manage all organizations", "System configuration", "Audit logs", "Revenue analytics"] },
        { group: "Users", items: ["Create/delete any user", "Assign any role", "Reset credentials"] },
        { group: "Cargo", items: ["View all cargo", "Override any status", "Force approve/reject"] },
    ],
    ADMIN: [
        { group: "Organization", items: ["Manage org members", "View org reports", "Manage stations"] },
        { group: "Users", items: ["Create operators", "View team members"] },
        { group: "Cargo", items: ["Approve/reject cargo", "View org cargo", "Export reports"] },
    ],
    OPERATOR: [
        { group: "Cargo", items: ["Receive cargo", "Send cargo", "Deliver cargo", "Track cargo"] },
        { group: "Reports", items: ["View personal stats", "Generate shift reports"] },
    ],
}

function generateOTP(): string {
    return Math.floor(100000 + Math.random() * 900000).toString()
}

export function CreateUserModal({ currentUserRole }: CreateUserModalProps) {
    const router = useRouter()
    const [open, setOpen] = useState(false)
    const [loading, setLoading] = useState(false)
    const [copied, setCopied] = useState(false)
    const isSuperAdmin = currentUserRole === 'SUPER_ADMIN';
    const isAdmin = currentUserRole === 'ADMIN';
    
    const [selectedRole, setSelectedRole] = useState(isAdmin ? "OPERATOR" : "ADMIN")
    const isAdminRole = selectedRole === "ADMIN" || selectedRole === "SUPER_ADMIN"
    
    const [organizations, setOrganizations] = useState<any[]>([])
    const [stations, setStations] = useState<any[]>([])
    const [selectedOrganization, setSelectedOrganization] = useState<string>("")
    const [selectedStation, setSelectedStation] = useState<string>("")
    const [phoneNumber, setPhoneNumber] = useState<string>("")
    const [generatedOTP, setGeneratedOTP] = useState<string>("")
    const [showOTP, setShowOTP] = useState(false)

    // Generate OTP on mount / when dialog opens
    useEffect(() => {
        if (open) {
            setGeneratedOTP(generateOTP())
            setShowOTP(false)
            setCopied(false)
        }
    }, [open])

    useEffect(() => {
        if (isSuperAdmin) {
            fetch('/api/organizations')
                .then(res => res.json())
                .then(data => setOrganizations(Array.isArray(data) ? data : []))
                .catch(console.error)
        }
    }, [isSuperAdmin])

    useEffect(() => {
        const params = new URLSearchParams();
        if (selectedOrganization) params.append('organizationId', selectedOrganization);
        const url = '/api/locations' + (params.toString() ? `?${params.toString()}` : '');
        fetch(url)
            .then(res => res.json())
            .then(data => setStations(Array.isArray(data) ? data : []))
            .catch(console.error)
    }, [selectedOrganization])

    const handlePhoneChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        let val = e.target.value.replace(/\D/g, '')
        if (val.startsWith("0")) val = "255" + val.substring(1)
        else if (val.length > 0 && !val.startsWith("255")) val = "255" + val
        setPhoneNumber(val)
    }

    const refreshOTP = () => {
        setGeneratedOTP(generateOTP())
        setCopied(false)
    }

    const copyOTP = async () => {
        await navigator.clipboard.writeText(generatedOTP)
        setCopied(true)
        setTimeout(() => setCopied(false), 2500)
    }

    async function onSubmit(event: React.FormEvent<HTMLFormElement>) {
        event.preventDefault()
        setLoading(true)

        const formData = new FormData(event.currentTarget)
        const data = {
            name: formData.get("name"),
            email: formData.get("email"),
            phone: phoneNumber,
            password: generatedOTP, // use generated OTP as initial password
            otp: generatedOTP,
            role: selectedRole,
            organizationId: selectedOrganization || undefined,
            stationId: selectedStation || undefined,
        }

        try {
            const response = await fetch("/api/users", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(data),
            })

            if (!response.ok) {
                const errorData = await response.json()
                throw new Error(errorData.error || "Failed to create user")
            }

            setOpen(false)
            router.refresh()
        } catch (error: any) {
            console.error(error)
            alert(error.message || "Failed to create user")
        } finally {
            setLoading(false)
        }
    }

    // AGENT removed per requirements
    const availableRoles = isSuperAdmin 
        ? ["SUPER_ADMIN", "ADMIN", "OPERATOR"]
        : isAdmin 
        ? ["OPERATOR"]
        : ["OPERATOR"]

    const roleColors: Record<string, string> = {
        SUPER_ADMIN: "from-violet-600 to-indigo-600",
        ADMIN:       "from-blue-600 to-blue-700",
        OPERATOR:    "from-emerald-600 to-teal-600",
    }

    return (
        <Dialog open={open} onOpenChange={setOpen}>
            <DialogTrigger asChild>
                <Button className="h-11 px-6 rounded-lg bg-blue-600 hover:bg-blue-700 text-white shadow-xl shadow-blue-200 transition-all font-bold flex items-center gap-2.5 active:scale-95 group">
                    <div className="bg-white/20 p-1 rounded-md group-hover:rotate-12 transition-transform">
                        <UserPlus size={16} strokeWidth={2.5} />
                    </div>
                    <span>Add Member</span>
                </Button>
            </DialogTrigger>

            {/* hideCloseButton removes the default DialogContent X so we don't get double buttons */}
            <DialogContent className="sm:max-w-[880px] p-0 overflow-hidden bg-white border-none rounded-2xl shadow-2xl [&>button]:hidden">
                <div className="flex flex-col max-h-[92vh] overflow-hidden">

                    {/* Header */}
                    <div className="px-8 py-7 bg-slate-50 border-b border-slate-100 flex items-center justify-between">
                        <div className="flex items-center gap-5">
                            <div className={cn("w-14 h-14 rounded-xl bg-gradient-to-br flex items-center justify-center text-white shadow-lg", roleColors[selectedRole] ?? "from-blue-600 to-blue-700")}>
                                <UserPlus size={26} strokeWidth={2.5} />
                            </div>
                            <div>
                                <DialogTitle className="text-xl font-black text-slate-900 tracking-tight leading-none mb-1">New Organization Member</DialogTitle>
                                <DialogDescription className="text-slate-500 font-medium text-[13px]">
                                    Establish credentials and assign workspace permissions.
                                </DialogDescription>
                            </div>
                        </div>
                        <button 
                            onClick={() => setOpen(false)}
                            className="p-2.5 text-slate-400 hover:text-slate-900 hover:bg-slate-100 rounded-lg transition-all"
                        >
                            <X size={18} strokeWidth={2.5} />
                        </button>
                    </div>

                    <form onSubmit={onSubmit} className="flex-1 overflow-y-auto bg-white custom-scrollbar">
                        <div className="p-8 flex flex-col gap-8">

                            {/* ── Section 1: Identity & Role ── */}
                            <SectionBlock icon={<Contact2 size={15} strokeWidth={2.5} />} color="bg-blue-50 text-blue-600" title="Identity" desc="Member identification and platform access role.">
                                <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
                                    {/* Full Name */}
                                    <div className="sm:col-span-2 space-y-2">
                                        <Label className="field-label">Member Full Name</Label>
                                        <FieldInput icon={<User size={16} />} placeholder="e.g. Ibrahim Bakari" name="name" required />
                                    </div>

                                    {/* Role selector */}
                                    <div className="sm:col-span-2 space-y-2">
                                        <Label className="field-label">Access Level</Label>
                                        <div className={cn("grid gap-3", availableRoles.length === 1 ? "grid-cols-1 max-w-[240px]" : availableRoles.length === 2 ? "grid-cols-2" : "grid-cols-3")}>
                                            {availableRoles.map(role => (
                                                <button
                                                    key={role}
                                                    type="button"
                                                    onClick={() => setSelectedRole(role)}
                                                    className={cn(
                                                        "px-4 py-3 rounded-lg border-2 text-[11px] font-black uppercase tracking-wider transition-all flex flex-col items-center gap-2",
                                                        selectedRole === role 
                                                            ? "bg-blue-600 border-blue-600 text-white shadow-lg shadow-blue-200" 
                                                            : "bg-white border-slate-100 text-slate-400 hover:border-blue-200 hover:text-slate-600"
                                                    )}
                                                >
                                                    <ShieldCheck size={18} strokeWidth={2.5} />
                                                    {role.replace("_", " ")}
                                                    {selectedRole === role && <Check size={11} />}
                                                </button>
                                            ))}
                                        </div>
                                    </div>
                                </div>
                            </SectionBlock>

                            <Divider />

                            {/* ── Section 2: Contact & OTP ── */}
                            <SectionBlock icon={<KeyRound size={15} strokeWidth={2.5} />} color="bg-orange-50 text-orange-500" title="Authentication" desc="Contact details and auto-generated login OTP.">
                                <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
                                    {/* Email */}
                                    <div className="sm:col-span-2 space-y-2">
                                        <Label className="field-label">Work Email Address</Label>
                                        <FieldInput icon={<Mail size={16} />} placeholder="bakari@mizigo.co.tz" name="email" type="email" required />
                                    </div>

                                    {/* Phone */}
                                    <div className="space-y-2">
                                        <Label className="field-label">Phone Number</Label>
                                        <div className="relative group">
                                            <span className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-blue-500 transition-colors">
                                                <Phone size={16} />
                                            </span>
                                            <Input
                                                name="phone"
                                                type="tel"
                                                value={phoneNumber}
                                                onChange={handlePhoneChange}
                                                placeholder="255 7XX XXX XXX"
                                                className="h-12 pl-11 rounded-lg border-slate-200 bg-slate-50 focus-visible:bg-white focus-visible:ring-2 focus-visible:ring-blue-500/20 focus-visible:border-blue-500 transition-all font-bold text-[14px]"
                                                required
                                            />
                                        </div>
                                    </div>

                                    {/* Auto-generated OTP */}
                                    <div className="space-y-2">
                                        <Label className="field-label">Login OTP <span className="text-[10px] font-bold bg-emerald-50 text-emerald-600 px-2 py-0.5 rounded-full ml-1 border border-emerald-100">Auto-generated</span></Label>
                                        <div className="flex items-center gap-2">
                                            <div className="relative flex-1 group">
                                                <span className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400">
                                                    <KeyRound size={16} />
                                                </span>
                                                <Input
                                                    readOnly
                                                    value={showOTP ? generatedOTP : "••••••"}
                                                    className="h-12 pl-11 pr-12 rounded-lg border-slate-200 bg-slate-50 font-black text-[15px] tracking-[0.3em] text-slate-900 cursor-default select-none"
                                                />
                                                <button
                                                    type="button"
                                                    onClick={() => setShowOTP(v => !v)}
                                                    className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-700 transition-colors p-1"
                                                >
                                                    {showOTP ? <EyeOff size={15} /> : <Eye size={15} />}
                                                </button>
                                            </div>
                                            {/* Copy */}
                                            <button
                                                type="button"
                                                onClick={copyOTP}
                                                title="Copy OTP"
                                                className={cn(
                                                    "w-12 h-12 flex items-center justify-center rounded-lg border transition-all shrink-0",
                                                    copied 
                                                        ? "bg-emerald-50 border-emerald-200 text-emerald-600" 
                                                        : "bg-white border-slate-200 text-slate-400 hover:text-blue-600 hover:border-blue-200"
                                                )}
                                            >
                                                {copied ? <CheckCheck size={16} /> : <Copy size={16} />}
                                            </button>
                                            {/* Refresh */}
                                            <button
                                                type="button"
                                                onClick={refreshOTP}
                                                title="Generate new OTP"
                                                className="w-12 h-12 flex items-center justify-center rounded-lg border border-slate-200 bg-white text-slate-400 hover:text-blue-600 hover:border-blue-200 transition-all shrink-0"
                                            >
                                                <RefreshCw size={15} />
                                            </button>
                                        </div>
                                        <p className="text-[11px] text-slate-400 font-medium pl-1">Share this OTP with the member — they will be prompted to change it on first login.</p>
                                    </div>
                                </div>
                            </SectionBlock>

                            <Divider />

                            {/* ── Section 3: Organization Assignment ── */}
                            {(isSuperAdmin || isAdmin) && (
                                <>
                                    <SectionBlock icon={<Building2 size={15} strokeWidth={2.5} />} color="bg-emerald-50 text-emerald-600" title="Workspace Assignment" desc="Structural placement within the organization network.">
                                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-5 p-6 bg-slate-50 rounded-xl border border-slate-100">
                                            {isSuperAdmin && (
                                                <div className="sm:col-span-2 space-y-2">
                                                    <Label className="field-label">Parent Organization</Label>
                                                    <SelectInput
                                                        value={selectedOrganization}
                                                        onChange={e => setSelectedOrganization(e.target.value)}
                                                    >
                                                        <option value="">Platform Global Management</option>
                                                        {organizations.map(org => (
                                                            <option key={org.id} value={org.id}>{org.name}</option>
                                                        ))}
                                                    </SelectInput>
                                                </div>
                                            )}
                                            <div className={cn("space-y-2", !isSuperAdmin && "sm:col-span-2")}>
                                                <Label className="field-label">Branch Station</Label>
                                                <SelectInput
                                                    value={selectedStation}
                                                    onChange={e => setSelectedStation(e.target.value)}
                                                >
                                                    <option value="">All Stations Access</option>
                                                    {stations.map(station => (
                                                        <option key={station.id} value={station.id}>{station.name}</option>
                                                    ))}
                                                </SelectInput>
                                            </div>
                                        </div>
                                    </SectionBlock>
                                    <Divider />
                                </>
                            )}

                            {/* ── Section 4: Roles & Permissions (admin roles only) ── */}
                            {isAdminRole && (
                                <SectionBlock icon={<ShieldCheck size={15} strokeWidth={2.5} />} color="bg-violet-50 text-violet-600" title="Roles & Permissions" desc={`Capabilities granted to a ${selectedRole.replace('_', ' ')} account.`}>
                                    <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                                        {(ROLE_PERMISSIONS[selectedRole] ?? []).map(group => (
                                            <div key={group.group} className="p-4 bg-slate-50 rounded-xl border border-slate-100">
                                                <p className="text-[10px] font-black uppercase tracking-widest text-slate-400 mb-3">{group.group}</p>
                                                <ul className="space-y-2">
                                                    {group.items.map(item => (
                                                        <li key={item} className="flex items-center gap-2 text-[12px] font-semibold text-slate-700">
                                                            <div className="w-4 h-4 rounded-full bg-blue-600 flex items-center justify-center shrink-0">
                                                                <Check size={9} className="text-white" strokeWidth={3} />
                                                            </div>
                                                            {item}
                                                        </li>
                                                    ))}
                                                </ul>
                                            </div>
                                        ))}
                                    </div>
                                    <p className="text-[11px] text-amber-600 font-semibold mt-3 flex items-center gap-1.5 pl-1">
                                        <ShieldCheck size={12} strokeWidth={2.5} />
                                        These permissions are system-enforced and cannot be customised individually at this time.
                                    </p>
                                </SectionBlock>
                            )}
                        </div>

                        {/* Footer */}
                        <div className="px-8 py-6 bg-slate-50 border-t border-slate-100 flex items-center justify-end gap-4">
                            <Button 
                                type="button" 
                                variant="ghost"
                                onClick={() => setOpen(false)}
                                className="h-12 px-6 rounded-lg text-slate-500 hover:text-slate-900 border border-slate-200 font-bold text-[14px] transition-all bg-white hover:bg-slate-50"
                            >
                                Cancel
                            </Button>
                            <Button 
                                type="submit" 
                                disabled={loading}
                                className="h-12 px-10 rounded-lg bg-blue-600 hover:bg-blue-700 text-white font-bold text-[14px] shadow-lg shadow-blue-200 transition-all active:scale-95 flex items-center gap-2.5 border-none group"
                            >
                                {loading ? (
                                    <div className="w-4 h-4 rounded-full border-2 border-white/20 border-t-white animate-spin" />
                                ) : (
                                    <BadgeCheck size={18} strokeWidth={2.5} />
                                )}
                                {loading ? "Creating..." : "Create Account"}
                            </Button>
                        </div>
                    </form>
                </div>
            </DialogContent>
        </Dialog>
    )
}

// ── Small helpers ──────────────────────────────────────────────────────────────

function SectionBlock({ icon, color, title, desc, children }: {
    icon: React.ReactNode
    color: string
    title: string
    desc: string
    children: React.ReactNode
}) {
    return (
        <div className="grid grid-cols-1 md:grid-cols-12 gap-8">
            <div className="md:col-span-3">
                <div className={cn("w-8 h-8 rounded-lg flex items-center justify-center mb-2", color)}>
                    {icon}
                </div>
                <h3 className="text-[12px] font-black text-slate-900 uppercase tracking-[0.15em] mb-1">{title}</h3>
                <p className="text-[12px] font-medium text-slate-400 leading-relaxed">{desc}</p>
            </div>
            <div className="md:col-span-9">{children}</div>
        </div>
    )
}

function FieldInput({ icon, placeholder, name, type = "text", required }: {
    icon: React.ReactNode
    placeholder: string
    name: string
    type?: string
    required?: boolean
}) {
    return (
        <div className="relative group">
            <span className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-blue-500 transition-colors">
                {icon}
            </span>
            <Input
                name={name}
                type={type}
                placeholder={placeholder}
                required={required}
                className="h-12 pl-11 rounded-lg border-slate-200 bg-slate-50 focus-visible:bg-white focus-visible:ring-2 focus-visible:ring-blue-500/20 focus-visible:border-blue-500 transition-all font-bold text-[14px]"
            />
        </div>
    )
}

function SelectInput({ value, onChange, children }: {
    value: string
    onChange: (e: React.ChangeEvent<HTMLSelectElement>) => void
    children: React.ReactNode
}) {
    return (
        <div className="relative">
            <select
                value={value}
                onChange={onChange}
                className="w-full h-12 px-4 rounded-lg border border-slate-200 bg-white text-[13px] font-bold text-slate-700 focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all appearance-none cursor-pointer"
            >
                {children}
            </select>
            <div className="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none text-slate-400">
                <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round">
                    <polyline points="6 9 12 15 18 9" />
                </svg>
            </div>
        </div>
    )
}

function Divider() {
    return <div className="h-px bg-slate-100" />
}
