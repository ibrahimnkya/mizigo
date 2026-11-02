"use client";

import { useState } from "react";
import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";
import {
  Package,
  BarChart3,
  CreditCard,
  Truck,
  Building2,
  Users,
  MapPin,
  MessageSquare,
  Bell,
  ShieldCheck,
  ClipboardList,
  Globe,
  QrCode,
  Camera,
  WifiOff,
  Receipt,
  ChevronDown,
  Save,
  Palette,
  Check,
  Layers,
  Sparkles,
  Target,
  FileBarChart2,
  Smartphone,
  Building,
  Layout,
  CheckCircle2,
  ChevronRight,
} from "lucide-react";

// ─── Module Definitions ────────────────────────────────────────────────────

interface ModuleDef {
  id: string;
  name: string;
  desc: string;
  icon: any;
  required?: boolean;
}
interface ModuleGroup {
  group: string;
  modules: ModuleDef[];
}

const WEB_GROUPS: ModuleGroup[] = [
  {
    group: "Core Operations",
    modules: [
      { id: "parcel-mgmt", name: "Parcel Management", desc: "Create, track, and manage parcels across all stations", icon: Package, required: true },
      { id: "public-tracking", name: "Public Tracking Portal", desc: "Customer-facing parcel tracking page accessible without login", icon: Globe },
      { id: "manifests", name: "Manifest Generation", desc: "Generate trip manifests and transport documentation", icon: ClipboardList },
    ],
  },
  {
    group: "Finance & Pricing",
    modules: [
      { id: "payments", name: "Payment Processing", desc: "Manage and process all payment transactions", icon: CreditCard, required: true },
      { id: "revenue-reports", name: "Revenue Reports", desc: "Financial analytics, earnings summaries, and collections", icon: BarChart3 },
      { id: "pricing", name: "Pricing Management", desc: "Configure tariffs, zones, and pricing rules", icon: Sparkles },
    ],
  },
  {
    group: "Operations",
    modules: [
      { id: "fleet", name: "Fleet Management", desc: "Manage vehicles, wagons, locomotives, and route schedules", icon: Truck },
      { id: "stations", name: "Station Network", desc: "Manage service points, terminals, and station operations", icon: Building2 },
      { id: "last-mile", name: "Last Mile Delivery", desc: "Agent dispatch and management for final delivery", icon: MapPin },
      { id: "agent-network", name: "Agent Network", desc: "Manage agents, KYC verification, and office locations", icon: Users },
    ],
  },
  {
    group: "Analytics & Reporting",
    modules: [
      { id: "reports-suite", name: "Full Reports Suite", desc: "Analytics dashboard covering operations, finance, and performance", icon: FileBarChart2 },
      { id: "audit-logs", name: "Audit Logs", desc: "Platform event history, user actions, and activity trail", icon: ShieldCheck },
    ],
  },
  {
    group: "Communications",
    modules: [
      { id: "sms-alerts", name: "SMS Alerts", desc: "Automated parcel status notifications via SMS gateway", icon: MessageSquare },
      { id: "web-push", name: "Push Notifications", desc: "Real-time web push alerts for operators and admins", icon: Bell },
    ],
  },
  {
    group: "Admin Tools",
    modules: [
      { id: "user-mgmt", name: "User Management", desc: "Manage staff accounts, roles, and access control", icon: Users },
      { id: "org-mgmt", name: "Organization Management", desc: "Multi-org structure, branches, and hierarchy", icon: Building },
    ],
  },
];

const MOBILE_GROUPS: ModuleGroup[] = [
  {
    group: "Scanning & Verification",
    modules: [
      { id: "m-parcel-scanner", name: "Parcel Scanner", desc: "QR and barcode scanner for parcel intake and handoff", icon: QrCode, required: true },
      { id: "m-otp-verify", name: "OTP Verification", desc: "Customer verification at the delivery point", icon: ShieldCheck },
      { id: "m-photo-capture", name: "Photo Capture (POD)", desc: "Proof of delivery photo attachments", icon: Camera },
    ],
  },
  {
    group: "Operations",
    modules: [
      { id: "m-delivery", name: "Delivery Confirmation", desc: "Confirm delivery with OTP and optional photo proof", icon: CheckCircle2 },
      { id: "m-handoff", name: "Parcel Handoff", desc: "Scan-based parcel transfer between operators at stations", icon: Package },
      { id: "m-driver", name: "Driver / GPS Mode", desc: "Live location tracking for drivers and vehicle assignments", icon: MapPin },
    ],
  },
  {
    group: "Finance",
    modules: [
      { id: "m-payments", name: "Mobile Payments", desc: "POS and mobile money payment collection on-device", icon: CreditCard },
      { id: "m-commission", name: "Agent Commission View", desc: "View and track agent earnings and payouts", icon: BarChart3 },
    ],
  },
  {
    group: "Hardware Integration",
    modules: [
      { id: "m-thermal", name: "Thermal Printing", desc: "Bluetooth and USB thermal printer connectivity", icon: Receipt },
      { id: "m-receipt", name: "Receipt Printing", desc: "Generate and print receipts directly from the mobile app", icon: Receipt },
    ],
  },
  {
    group: "System",
    modules: [
      { id: "m-offline", name: "Offline Mode", desc: "Continue scanning and recording without internet connectivity", icon: WifiOff },
      { id: "m-push", name: "Push Notifications", desc: "Real-time mobile push alerts for status updates", icon: Bell },
    ],
  },
];

// ─── Theme Presets ─────────────────────────────────────────────────────────

const THEME_PRESETS = [
  { name: "Ocean Blue",  primary: "#2563eb", accent: "#0ea5e9" },
  { name: "Midnight",    primary: "#1e293b", accent: "#475569" },
  { name: "Emerald",     primary: "#059669", accent: "#10b981" },
  { name: "Rose",        primary: "#e11d48", accent: "#f43f5e" },
  { name: "Amber",       primary: "#d97706", accent: "#f59e0b" },
  { name: "Violet",      primary: "#7c3aed", accent: "#8b5cf6" },
  { name: "Cyan",        primary: "#0891b2", accent: "#06b6d4" },
  { name: "Slate",       primary: "#334155", accent: "#64748b" },
];

const FONT_OPTIONS = [
  { id: "modern",  label: "Modern",  sample: "Inter" },
  { id: "classic", label: "Classic", sample: "Georgia" },
  { id: "mono",    label: "Compact", sample: "Mono" },
];

// ─── Helpers ───────────────────────────────────────────────────────────────

function defaultModuleState(groups: ModuleGroup[]) {
  const state: Record<string, boolean> = {};
  groups.forEach((g) => g.modules.forEach((m) => { state[m.id] = true; }));
  return state;
}

// ─── Sub-components ────────────────────────────────────────────────────────

function Toggle({ checked, onChange, disabled }: { checked: boolean; onChange: (v: boolean) => void; disabled?: boolean }) {
  return (
    <button
      type="button"
      onClick={() => !disabled && onChange(!checked)}
      className={cn(
        "relative w-10 h-5 rounded-full transition-colors duration-200 flex-shrink-0",
        checked ? "bg-blue-600" : "bg-slate-200",
        disabled ? "opacity-40 cursor-not-allowed" : "cursor-pointer hover:opacity-90",
      )}
    >
      <span className={cn(
        "absolute top-0.5 w-4 h-4 rounded-full bg-white  transition-transform duration-200",
        checked ? "translate-x-5" : "translate-x-0.5",
      )} />
    </button>
  );
}

function ModuleRow({ mod, enabled, onToggle }: { mod: ModuleDef; enabled: boolean; onToggle: () => void }) {
  const Icon = mod.icon;
  return (
    <div className={cn(
      "flex items-center gap-4 py-3 px-4 rounded-xl transition-colors",
      enabled ? "bg-white" : "bg-slate-50 opacity-60",
      !mod.required && "hover:bg-slate-50 cursor-pointer",
    )} onClick={() => !mod.required && onToggle()}>
      <div className={cn(
        "w-8 h-8 rounded-xl flex items-center justify-center flex-shrink-0 transition-colors",
        enabled ? "bg-blue-50" : "bg-slate-100",
      )}>
        <Icon size={15} strokeWidth={2} className={enabled ? "text-blue-600" : "text-slate-400"} />
      </div>
      <div className="flex-1 min-w-0">
        <p className="text-[13px] font-semibold text-slate-800 leading-none">{mod.name}</p>
        <p className="text-[11px] text-slate-500 font-medium mt-0.5 leading-normal line-clamp-1">{mod.desc}</p>
      </div>
      {mod.required ? (
        <span className="inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border border-blue-200 text-blue-700 bg-blue-50 flex-shrink-0">
          Required
        </span>
      ) : (
        <Toggle checked={enabled} onChange={onToggle} />
      )}
    </div>
  );
}

function ModuleGroupCard({ group, states, onToggle }: { group: ModuleGroup; states: Record<string, boolean>; onToggle: (id: string) => void }) {
  const [open, setOpen] = useState(true);
  const enabledCount = group.modules.filter((m) => states[m.id] !== false).length;

  return (
    <div className="bg-white rounded-[20px] border border-[#E2E2E2] overflow-hidden">
      <button
        type="button"
        onClick={() => setOpen((v) => !v)}
        className="w-full flex items-center justify-between px-4 py-3 hover:bg-slate-50 transition-colors"
      >
        <div className="flex items-center gap-3">
          <span className="text-[11px] font-semibold uppercase tracking-[0.05em] text-slate-500">{group.group}</span>
          <span className="inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-medium border border-slate-200 text-slate-500 bg-slate-50">
            {enabledCount}/{group.modules.length} active
          </span>
        </div>
        <ChevronDown size={14} strokeWidth={2.5} className={cn("text-slate-400 transition-transform duration-200", open ? "" : "-rotate-90")} />
      </button>
      {open && (
        <div className="px-2 pb-2 flex flex-col gap-1 border-t border-slate-100">
          {group.modules.map((mod) => (
            <ModuleRow
              key={mod.id}
              mod={mod}
              enabled={states[mod.id] !== false}
              onToggle={() => onToggle(mod.id)}
            />
          ))}
        </div>
      )}
    </div>
  );
}

// ─── Main Component ────────────────────────────────────────────────────────

type Platform = "web" | "mobile";
type ThemeMode = "light" | "dark" | "system";

interface ThemeConfig {
  preset: number;
  primaryColor: string;
  accentColor: string;
  displayName: string;
  logoUrl: string;
  themeMode: ThemeMode;
  font: string;
  compactMode: boolean;
}

const DEFAULT_THEME: ThemeConfig = {
  preset: 0,
  primaryColor: "#2563eb",
  accentColor: "#0ea5e9",
  displayName: "",
  logoUrl: "",
  themeMode: "system",
  font: "modern",
  compactMode: false,
};

export function ModulesDashboard() {
  const [selectedOrgId, setSelectedOrgId] = useState<string>("");
  const [platform, setPlatform] = useState<Platform>("web");
  const [webStates, setWebStates] = useState<Record<string, boolean>>(defaultModuleState(WEB_GROUPS));
  const [mobileStates, setMobileStates] = useState<Record<string, boolean>>(defaultModuleState(MOBILE_GROUPS));
  const [theme, setTheme] = useState<ThemeConfig>(DEFAULT_THEME);
  const [saved, setSaved] = useState(false);
  const [orgOpen, setOrgOpen] = useState(false);

  const { data: orgs = [] } = useQuery<any[]>({
    queryKey: ["orgs-list"],
    queryFn: async () => {
      const res = await api.get("/organizations");
      return res.data.data || res.data || [];
    },
  });

  const selectedOrg = orgs.find((o: any) => o.id === selectedOrgId);
  const activeGroups = platform === "web" ? WEB_GROUPS : MOBILE_GROUPS;
  const states = platform === "web" ? webStates : mobileStates;
  const setStates = platform === "web" ? setWebStates : setMobileStates;

  const toggleModule = (id: string) => {
    setStates((prev) => ({ ...prev, [id]: !prev[id] }));
  };

  const applyPreset = (idx: number) => {
    const p = THEME_PRESETS[idx]!;
    setTheme((t) => ({ ...t, preset: idx, primaryColor: p.primary, accentColor: p.accent }));
  };

  const handleSave = () => {
    setSaved(true);
    setTimeout(() => setSaved(false), 2500);
  };

  return (
    <div className="flex flex-col gap-5">

        {/* ── Top Banner ── */}
        <div className="flex items-center gap-3 bg-white border-b border-slate-200 px-6 py-4 flex-shrink-0 flex-wrap gap-y-3 rounded-xl">
          {/* Title */}
          <div className="flex items-center gap-3 flex-shrink-0">
            <div className="w-8 h-8 rounded-xl bg-blue-50 border border-blue-100 flex items-center justify-center">
              <Layers size={15} className="text-blue-600" />
            </div>
            <div>
              <p className="text-[20px] font-semibold text-slate-800 leading-none">Module Config</p>
              <p className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em] mt-0.5">Per-organisation feature flags</p>
            </div>
          </div>

          <div className="h-6 w-px bg-slate-200 mx-2 flex-shrink-0" />

          {/* Org Selector */}
          <div className="relative">
            <button
              type="button"
              onClick={() => setOrgOpen((v) => !v)}
              className="flex items-center gap-2 h-8 bg-white border border-slate-300 rounded-xl px-3 hover:bg-slate-50 transition-colors text-slate-700 text-[12px] font-medium min-w-[180px] justify-between"
            >
              <Building size={13} className="text-slate-400 flex-shrink-0" />
              <span className="truncate flex-1 text-left">
                {selectedOrg ? selectedOrg.name : "Select Organisation"}
              </span>
              <ChevronDown size={13} className="text-slate-400 flex-shrink-0" />
            </button>
            {orgOpen && (
              <div className="absolute top-full mt-1 left-0 w-64 bg-white rounded-[20px] border border-[#E2E2E2] shadow-md z-50 py-1 max-h-64 overflow-y-auto">
                {orgs.length === 0 && (
                  <p className="text-[12px] text-slate-400 px-3 py-2 font-medium">No organisations found</p>
                )}
                {orgs.map((org: any) => (
                  <button
                    key={org.id}
                    type="button"
                    onClick={() => { setSelectedOrgId(org.id); setOrgOpen(false); }}
                    className={cn(
                      "w-full text-left px-3 py-2 text-[12px] font-medium hover:bg-slate-50 transition-colors flex items-center gap-2",
                      selectedOrgId === org.id ? "text-blue-600 bg-blue-50" : "text-slate-700",
                    )}
                  >
                    {selectedOrgId === org.id && <Check size={12} className="text-blue-600 flex-shrink-0" />}
                    {org.name}
                  </button>
                ))}
              </div>
            )}
          </div>

          {/* Platform Tabs */}
          <div className="flex items-center border border-slate-200 rounded-xl overflow-hidden">
            {(["web", "mobile"] as Platform[]).map((p) => (
              <button
                key={p}
                type="button"
                onClick={() => setPlatform(p)}
                className={cn(
                  "flex items-center gap-1.5 px-3 h-8 text-[12px] font-medium transition-colors capitalize",
                  platform === p ? "bg-blue-600 text-white" : "bg-white text-slate-600 hover:bg-slate-50",
                )}
              >
                {p === "web" ? <Layout size={12} /> : <Smartphone size={12} />}
                {p}
              </button>
            ))}
          </div>

          {/* Spacer */}
          <div className="flex-1" />

          {/* Save Button */}
          <button
            type="button"
            onClick={handleSave}
            disabled={!selectedOrgId}
            className={cn(
              "flex items-center gap-2 h-8 px-3 rounded-xl text-[12px] font-semibold transition-colors",
              saved
                ? "bg-emerald-600 text-white hover:bg-emerald-700"
                : selectedOrgId
                ? "bg-blue-600 text-white hover:bg-blue-700"
                : "bg-slate-100 text-slate-400 cursor-not-allowed border border-slate-200",
            )}
          >
            {saved ? <Check size={13} strokeWidth={2.5} /> : <Save size={13} />}
            {saved ? "Saved!" : "Save Changes"}
          </button>
        </div>

        {/* ── Content ── */}
        {!selectedOrgId ? (
          /* Empty state */
          <div className="flex flex-col items-center justify-center min-h-[420px] bg-white rounded-[20px] border border-[#E2E2E2]">
            <div className="w-14 h-14 rounded-xl bg-slate-50 border border-slate-200 flex items-center justify-center mb-4">
              <Building size={26} strokeWidth={1.5} className="text-slate-300" />
            </div>
            <h3 className="text-[14px] font-semibold text-slate-800 tracking-tight">Select an Organisation</h3>
            <p className="text-[12px] text-slate-500 font-medium mt-1.5 max-w-[300px] text-center leading-relaxed">
              Choose an organisation from the dropdown above to configure its modules and custom theme.
            </p>
          </div>
        ) : (
          <div className="grid grid-cols-1 lg:grid-cols-5 gap-4">

            {/* ── Left: Module Groups ── */}
            <div className="lg:col-span-3 flex flex-col gap-3">
              <div className="flex items-center gap-2 px-1">
                <p className="text-[11px] font-semibold text-slate-500 uppercase tracking-[0.05em]">
                  {platform === "web" ? "Web" : "Mobile"} Modules
                </p>
                <span className="text-[11px] font-medium text-slate-400">
                  — features available to {selectedOrg?.name}
                </span>
              </div>
              {activeGroups.map((group) => (
                <ModuleGroupCard
                  key={group.group}
                  group={group}
                  states={states}
                  onToggle={toggleModule}
                />
              ))}
            </div>

            {/* ── Right: Theme Configuration ── */}
            <div className="lg:col-span-2 flex flex-col gap-4">
              <div className="bg-white rounded-[20px] border border-[#E2E2E2] p-5 flex flex-col gap-5">
                <div className="flex items-center gap-2.5">
                  <div className="w-7 h-7 rounded-xl bg-violet-50 border border-violet-100 flex items-center justify-center">
                    <Palette size={14} className="text-violet-600" />
                  </div>
                  <p className="text-[14px] font-semibold text-slate-800">Custom Theme</p>
                </div>

                {/* Color presets */}
                <div>
                  <p className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em] mb-2">Color Palette</p>
                  <div className="grid grid-cols-4 gap-2">
                    {THEME_PRESETS.map((preset, idx) => (
                      <button
                        key={idx}
                        type="button"
                        onClick={() => applyPreset(idx)}
                        title={preset.name}
                        className={cn(
                          "group relative h-8 rounded-xl overflow-hidden border-2 transition-all",
                          theme.preset === idx ? "border-slate-700" : "border-transparent hover:border-slate-300",
                        )}
                        style={{ background: `linear-gradient(135deg, ${preset.primary} 50%, ${preset.accent} 100%)` }}
                      >
                        {theme.preset === idx && (
                          <div className="absolute inset-0 flex items-center justify-center">
                            <Check size={12} strokeWidth={3} className="text-white" />
                          </div>
                        )}
                      </button>
                    ))}
                  </div>
                  <p className="text-[11px] text-slate-500 font-medium mt-1.5">{THEME_PRESETS[theme.preset]?.name}</p>
                </div>

                {/* Custom hex */}
                <div className="grid grid-cols-2 gap-3">
                  <div>
                    <p className="text-[12px] font-medium text-slate-700 mb-1.5">Primary</p>
                    <div className="flex items-center gap-2">
                      <div className="w-7 h-7 rounded-xl border border-slate-200 flex-shrink-0 cursor-pointer" style={{ background: theme.primaryColor }} />
                      <input
                        type="text"
                        value={theme.primaryColor}
                        onChange={(e) => setTheme((t) => ({ ...t, primaryColor: e.target.value, preset: -1 }))}
                        className="flex-1 text-[12px] font-medium text-slate-700 border border-slate-300 rounded-xl px-2 h-8 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-100 w-0"
                      />
                    </div>
                  </div>
                  <div>
                    <p className="text-[12px] font-medium text-slate-700 mb-1.5">Accent</p>
                    <div className="flex items-center gap-2">
                      <div className="w-7 h-7 rounded-xl border border-slate-200 flex-shrink-0" style={{ background: theme.accentColor }} />
                      <input
                        type="text"
                        value={theme.accentColor}
                        onChange={(e) => setTheme((t) => ({ ...t, accentColor: e.target.value, preset: -1 }))}
                        className="flex-1 text-[12px] font-medium text-slate-700 border border-slate-300 rounded-xl px-2 h-8 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-100 w-0"
                      />
                    </div>
                  </div>
                </div>

                <hr className="border-slate-100" />

                {/* Display name */}
                <div>
                  <p className="text-[12px] font-medium text-slate-700 mb-1.5">App Display Name</p>
                  <input
                    type="text"
                    placeholder={selectedOrg?.name || "Organisation name…"}
                    value={theme.displayName}
                    onChange={(e) => setTheme((t) => ({ ...t, displayName: e.target.value }))}
                    className="w-full border border-slate-300 rounded-xl h-8 px-3 text-[13px] focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none placeholder:text-slate-400"
                  />
                </div>

                {/* Logo URL */}
                <div>
                  <p className="text-[12px] font-medium text-slate-700 mb-1.5">Logo URL</p>
                  <input
                    type="url"
                    placeholder="https://…/logo.png"
                    value={theme.logoUrl}
                    onChange={(e) => setTheme((t) => ({ ...t, logoUrl: e.target.value }))}
                    className="w-full border border-slate-300 rounded-xl h-8 px-3 text-[13px] focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none placeholder:text-slate-400"
                  />
                  {theme.logoUrl && (
                    <div className="mt-2 h-12 w-full bg-slate-50 border border-slate-200 rounded-xl flex items-center justify-center overflow-hidden px-3">
                      {/* eslint-disable-next-line @next/next/no-img-element */}
                      <img src={theme.logoUrl} alt="logo preview" className="max-h-9 max-w-full object-contain" onError={(e) => { (e.target as HTMLImageElement).style.display = "none"; }} />
                    </div>
                  )}
                </div>

                <hr className="border-slate-100" />

                {/* Theme mode */}
                <div>
                  <p className="text-[12px] font-medium text-slate-700 mb-2">Default Theme Mode</p>
                  <div className="grid grid-cols-3 gap-1.5">
                    {(["light", "dark", "system"] as ThemeMode[]).map((m) => (
                      <button
                        key={m}
                        type="button"
                        onClick={() => setTheme((t) => ({ ...t, themeMode: m }))}
                        className={cn(
                          "py-1.5 rounded-xl text-[12px] font-medium border transition-colors capitalize",
                          theme.themeMode === m
                            ? "bg-blue-600 text-white border-blue-600"
                            : "bg-white text-slate-600 border-slate-300 hover:bg-slate-50",
                        )}
                      >
                        {m}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Font */}
                <div>
                  <p className="text-[12px] font-medium text-slate-700 mb-2">Font Style</p>
                  <div className="grid grid-cols-3 gap-1.5">
                    {FONT_OPTIONS.map((f) => (
                      <button
                        key={f.id}
                        type="button"
                        onClick={() => setTheme((t) => ({ ...t, font: f.id }))}
                        className={cn(
                          "py-1.5 rounded-xl text-[12px] font-medium border transition-colors",
                          theme.font === f.id
                            ? "bg-blue-600 text-white border-blue-600"
                            : "bg-white text-slate-600 border-slate-300 hover:bg-slate-50",
                        )}
                      >
                        {f.label}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Compact mode */}
                <div className="flex items-center justify-between">
                  <div>
                    <p className="text-[12px] font-medium text-slate-700">Compact Mode</p>
                    <p className="text-[11px] text-slate-500 font-medium">Reduce padding and element sizes on mobile</p>
                  </div>
                  <Toggle checked={theme.compactMode} onChange={(v) => setTheme((t) => ({ ...t, compactMode: v }))} />
                </div>
              </div>

              {/* Preview swatch */}
              <div className="rounded-xl border border-slate-200 overflow-hidden bg-white p-4">
                <p className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em] mb-3">Preview</p>
                <div className="rounded-xl overflow-hidden border border-slate-200">
                  <div className="h-8 flex items-center px-3 gap-2" style={{ background: theme.primaryColor }}>
                    <div className="w-4 h-4 rounded-lg bg-white/20" />
                    <span className="text-white text-[11px] font-semibold truncate">{theme.displayName || selectedOrg?.name || "App Name"}</span>
                  </div>
                  <div className="p-3 bg-white flex flex-col gap-2">
                    <div className="h-2 w-2/3 bg-slate-100 rounded" />
                    <div className="h-2 w-1/2 bg-slate-100 rounded" />
                    <div className="h-5 w-1/3 rounded-xl mt-1" style={{ background: theme.accentColor }} />
                  </div>
                </div>
              </div>
            </div>
          </div>
        )}
    </div>
  );
}
