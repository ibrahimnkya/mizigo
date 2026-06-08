"use client";

import { useQuery, useMutation } from "@tanstack/react-query";
import api from "@/lib/api/client";
import {
  Settings,
  Globe,
  CheckCircle2,
  Database,
  Lock,
  Clock,
  DollarSign,
  Scale,
  Save,
  RefreshCcw,
  Loader2,
  AlertTriangle,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { useState } from "react";
import { toast } from "sonner";

export default function PlatformSettingsPage() {
  const {
    data: settings,
    isLoading,
    refetch,
  } = useQuery({
    queryKey: ["platform-settings"],
    queryFn: async () => {
      const { data } = await api.get("/admin/platform/settings");
      return data.data || data;
    },
  });

  const { mutate: updateSettings, isPending: isUpdating } = useMutation({
    mutationFn: async (newSettings: any) => {
      const { data } = await api.patch("/admin/platform/settings", newSettings);
      return data.data;
    },
    onSuccess: () => {
      toast.success("Platform settings saved successfully");
      refetch();
    },
  });

  const [form, setForm] = useState<any>({});

  if (isLoading) {
    return (
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    );
  }

  const currentSettings = { ...settings, ...form };

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 space-y-10">
      <div className="max-w-[1520px] mx-auto space-y-10">
        {/* Action Bar */}
        <div className="flex items-center justify-between gap-6 bg-white border border-slate-100 rounded-[10px] p-4 shadow-sm">
          <div className="flex items-center gap-3 text-blue-600">
            <Settings size={18} className="animate-pulse" />
            <span className="text-[10px] font-black uppercase tracking-[0.3em]">
              Platform Configuration
            </span>
          </div>

          <div className="flex items-center gap-4">
            <div className="hidden lg:flex items-center gap-6 pr-6 border-r border-slate-100">
              <div className="text-right">
                <p className="text-[9px] font-black text-slate-300 uppercase tracking-widest leading-none mb-1">
                  Environment
                </p>
                <h3 className="text-[16px] font-black text-slate-900 uppercase">
                  Production
                </h3>
              </div>
            </div>
            <button
              onClick={() => updateSettings(form)}
              disabled={isUpdating || Object.keys(form).length === 0}
              className="h-11 px-6 bg-slate-900 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 shadow-xl shadow-slate-900/10 hover:bg-slate-800 transition-all active:scale-95 disabled:opacity-50 disabled:grayscale"
            >
              {isUpdating ? (
                <Loader2 size={14} className="animate-spin" />
              ) : (
                <Save size={14} strokeWidth={3} />
              )}
              Save Changes
            </button>
          </div>
        </div>

        {/* Settings Panels */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-10">
          {/* Operational Settings */}
          <div className="bg-white rounded-[10px] border border-slate-100 shadow-sm p-10 space-y-10">
            <div>
              <h3 className="text-[20px] font-black text-slate-900 tracking-tight mb-2">
                General Settings
              </h3>
              <p className="text-slate-500 font-bold text-[14px]">
                Default currency, weight units and timezone for the platform.
              </p>
            </div>

            <div className="space-y-8">
              <div className="grid grid-cols-2 gap-6">
                <div className="space-y-2">
                  <label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1 flex items-center gap-2">
                    <DollarSign size={12} /> Default Currency
                  </label>
                  <select
                    className="w-full h-14 px-6 bg-slate-50 border border-slate-100 rounded-[10px] text-sm font-black text-slate-900 focus:ring-4 ring-blue-500/5 focus:border-blue-500 transition-all outline-none appearance-none"
                    value={currentSettings.DEFAULT_CURRENCY || "TZS"}
                    onChange={(e) =>
                      setForm({ ...form, DEFAULT_CURRENCY: e.target.value })
                    }
                  >
                    <option value="TZS">TZS - Tanzanian Shilling</option>
                    <option value="USD">USD - United States Dollar</option>
                    <option value="KES">KES - Kenyan Shilling</option>
                  </select>
                </div>
                <div className="space-y-2">
                  <label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1 flex items-center gap-2">
                    <Scale size={12} /> Weight Unit
                  </label>
                  <select
                    className="w-full h-14 px-6 bg-slate-50 border border-slate-100 rounded-[10px] text-sm font-black text-slate-900 focus:ring-4 ring-blue-500/5 focus:border-blue-500 transition-all outline-none appearance-none"
                    value={currentSettings.WEIGHT_UNIT || "KG"}
                    onChange={(e) =>
                      setForm({ ...form, WEIGHT_UNIT: e.target.value })
                    }
                  >
                    <option value="KG">KG - Kilograms</option>
                    <option value="LB">LB - Pounds</option>
                    <option value="TON">TON - Metric Tonnes</option>
                  </select>
                </div>
              </div>

              <div className="space-y-2">
                <label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1 flex items-center gap-2">
                  <Globe size={12} /> Timezone
                </label>
                <select
                  className="w-full h-14 px-6 bg-slate-50 border border-slate-100 rounded-[10px] text-sm font-black text-slate-900 focus:ring-4 ring-blue-500/5 focus:border-blue-500 transition-all outline-none appearance-none"
                  value={currentSettings.TIMEZONE || "Africa/Dar_es_Salaam"}
                  onChange={(e) =>
                    setForm({ ...form, TIMEZONE: e.target.value })
                  }
                >
                  <option value="Africa/Dar_es_Salaam">
                    EAT - (UTC+3) Dar es Salaam
                  </option>
                  <option value="Africa/Nairobi">EAT - (UTC+3) Nairobi</option>
                  <option value="UTC">UTC - Universal Coordinated Time</option>
                </select>
              </div>
            </div>
          </div>

          {/* Security Settings */}
          <div className="bg-white rounded-[10px] border border-slate-100 shadow-sm p-10 space-y-10">
            <div>
              <h3 className="text-[20px] font-black text-slate-900 tracking-tight mb-2">
                Security Settings
              </h3>
              <p className="text-slate-500 font-bold text-[14px]">
                Configure OTP expiry times and login attempt limits.
              </p>
            </div>

            <div className="space-y-8">
              <div className="grid grid-cols-2 gap-6">
                <div className="space-y-2">
                  <label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1 flex items-center gap-2">
                    <Clock size={12} /> OTP Expiry (seconds)
                  </label>
                  <input
                    type="number"
                    className="w-full h-14 px-6 bg-slate-50 border border-slate-100 rounded-[10px] text-sm font-black text-slate-900 focus:ring-4 ring-blue-500/5 focus:border-blue-500 transition-all outline-none"
                    value={currentSettings.OTP_EXPIRY || 300}
                    onChange={(e) =>
                      setForm({ ...form, OTP_EXPIRY: parseInt(e.target.value) })
                    }
                  />
                </div>
                <div className="space-y-2">
                  <label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1 flex items-center gap-2">
                    <Lock size={12} /> Max Login Attempts
                  </label>
                  <input
                    type="number"
                    className="w-full h-14 px-6 bg-slate-50 border border-slate-100 rounded-[10px] text-sm font-black text-slate-900 focus:ring-4 ring-blue-500/5 focus:border-blue-500 transition-all outline-none"
                    value={currentSettings.LOGIN_RETRIES || 5}
                    onChange={(e) =>
                      setForm({
                        ...form,
                        LOGIN_RETRIES: parseInt(e.target.value),
                      })
                    }
                  />
                </div>
              </div>

              <div className="p-6 bg-slate-950 rounded-[10px] border border-white/10 relative overflow-hidden group">
                <div className="relative z-10 flex items-center justify-between">
                  <div>
                    <h4 className="text-white font-black text-[14px]">
                      Maintenance Mode
                    </h4>
                    <p className="text-slate-500 text-[11px] font-bold mt-0.5">
                      Temporarily suspend all platform activity.
                    </p>
                  </div>
                  <div
                    onClick={() =>
                      setForm({
                        ...form,
                        MAINTENANCE_MODE: !currentSettings.MAINTENANCE_MODE,
                      })
                    }
                    className={cn(
                      "w-12 h-6 rounded-full p-1 cursor-pointer transition-all duration-300",
                      currentSettings.MAINTENANCE_MODE
                        ? "bg-red-600"
                        : "bg-slate-800",
                    )}
                  >
                    <div
                      className={cn(
                        "h-4 w-4 bg-white rounded-full transition-all duration-300 transform",
                        currentSettings.MAINTENANCE_MODE
                          ? "translate-x-6"
                          : "translate-x-0",
                      )}
                    />
                  </div>
                </div>
                <div className="absolute top-0 right-0 w-24 h-full bg-white/5 skew-x-[-15deg] translate-x-10" />
              </div>
            </div>
          </div>
        </div>

        {/* Quick Stats */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {[
            {
              label: "Database Storage",
              value: "—",
              icon: Database,
              color: "text-blue-600",
              tag: "Storage",
            },
            {
              label: "API Response Time",
              value: "—",
              icon: RefreshCcw,
              color: "text-emerald-600",
              tag: "Performance",
            },
            {
              label: "Maintenance Mode",
              value: currentSettings.MAINTENANCE_MODE ? "Enabled" : "Disabled",
              icon: AlertTriangle,
              color: currentSettings.MAINTENANCE_MODE
                ? "text-red-600"
                : "text-slate-400",
              tag: "Status",
            },
          ].map((stat, i) => (
            <div
              key={i}
              className="bg-white p-8 rounded-[10px] border border-slate-100 shadow-sm flex flex-col gap-8 group hover:border-slate-200 transition-all"
            >
              <div className="flex items-center justify-between">
                <div
                  className={cn(
                    "w-12 h-12 rounded-[10px] bg-slate-50 flex items-center justify-center border border-slate-100 transition-all group-hover:bg-slate-900 group-hover:text-white group-hover:scale-110",
                    stat.color,
                  )}
                >
                  <stat.icon size={22} strokeWidth={2.5} />
                </div>
                <span className="text-[10px] font-black uppercase tracking-widest px-3 py-1.5 rounded-[10px] bg-slate-50 text-slate-400 group-hover:bg-blue-50 group-hover:text-blue-600">
                  {stat.tag}
                </span>
              </div>
              <div>
                <h4 className="text-[32px] font-black tracking-tight text-slate-900 leading-none">
                  {stat.value}
                </h4>
                <p className="text-[12px] font-black text-slate-400 uppercase tracking-[0.2em] mt-3">
                  {stat.label}
                </p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
