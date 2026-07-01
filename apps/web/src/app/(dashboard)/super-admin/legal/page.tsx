"use client";

import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";
import {
  ShieldCheck,
  Save,
  Loader2,
  HelpCircle,
  FileText,
  Lock,
} from "lucide-react";
import { useState, useEffect } from "react";
import { toast } from "sonner";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { cn } from "@/lib/utils";

export default function SuperAdminLegalPage() {
  const queryClient = useQueryClient();
  const [activeTab, setActiveTab] = useState<"terms" | "privacy">("terms");

  // Local state for edits
  const [termsText, setTermsText] = useState("");
  const [privacyText, setPrivacyText] = useState("");

  // Fetch current configs
  const { data: settings, isLoading } = useQuery({
    queryKey: ["platform-settings"],
    queryFn: async () => {
      const { data } = await api.get("/admin/platform/settings");
      return data.data || data;
    },
  });

  // Sync to local state
  useEffect(() => {
    if (settings) {
      setTermsText(settings.TERMS_AND_CONDITIONS || "");
      setPrivacyText(settings.PRIVACY_POLICY || "");
    }
  }, [settings]);

  // Mutation to save settings
  const { mutate: saveLegalConfig, isPending: isSaving } = useMutation({
    mutationFn: async () => {
      await Promise.all([
        api.patch("/admin/platform/settings", {
          key: "TERMS_AND_CONDITIONS",
          value: termsText,
          description: "System terms and conditions content",
        }),
        api.patch("/admin/platform/settings", {
          key: "PRIVACY_POLICY",
          value: privacyText,
          description: "System privacy policy content",
        }),
      ]);
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["platform-settings"] });
      toast.success("Legal policies updated successfully");
    },
    onError: (err: any) => {
      toast.error(
        err.response?.data?.error?.message || "Failed to save legal policies"
      );
    },
  });

  const hasUnsavedChanges =
    settings &&
    (termsText !== (settings.TERMS_AND_CONDITIONS || "") ||
      privacyText !== (settings.PRIVACY_POLICY || ""));

  if (isLoading) {
    return (
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1200px] mx-auto flex flex-col gap-6">
        <ReportPageHeader
          title="Legal Policies Dashboard"
          subtitle="Configure system-wide terms, service agreements, and privacy compliance guidelines"
          iconName="ShieldCheck"
          hideBackArrow={true}
          action={
            <button
              onClick={() => saveLegalConfig()}
              disabled={isSaving || !hasUnsavedChanges}
              className="h-11 px-6 bg-blue-600 disabled:bg-slate-800 disabled:text-slate-500 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 shadow-xl shadow-blue-600/10 hover:bg-blue-500 transition-all active:scale-95"
            >
              {isSaving ? (
                <Loader2 size={13} className="animate-spin" />
              ) : (
                <Save size={13} strokeWidth={2.5} />
              )}
              Save Policies
            </button>
          }
        />

        {/* Info Box */}
        <div className="bg-blue-50/50 border border-blue-100 rounded-[10px] p-5 flex items-start gap-4">
          <HelpCircle className="w-5 h-5 text-blue-500 shrink-0 mt-0.5" />
          <div className="space-y-1">
            <h4 className="text-[12px] font-extrabold text-blue-800 uppercase tracking-wider">
              Legal Settings Note
            </h4>
            <p className="text-[12px] font-semibold text-blue-600/90 leading-relaxed">
              These guidelines are rendered globally on the public web portals, customer receipts, and mobile applications. Use clear, descriptive sections. You can paste formatted plain text or Markdown.
            </p>
          </div>
        </div>

        {/* Tab System */}
        <div className="flex border-b border-slate-100 gap-6">
          <button
            onClick={() => setActiveTab("terms")}
            className={cn(
              "pb-4 text-[11px] font-black uppercase tracking-widest border-b-2 transition-all flex items-center gap-2",
              activeTab === "terms"
                ? "border-blue-600 text-blue-600"
                : "border-transparent text-slate-400 hover:text-slate-600"
            )}
          >
            <FileText size={14} />
            Terms & Conditions
          </button>
          <button
            onClick={() => setActiveTab("privacy")}
            className={cn(
              "pb-4 text-[11px] font-black uppercase tracking-widest border-b-2 transition-all flex items-center gap-2",
              activeTab === "privacy"
                ? "border-blue-600 text-blue-600"
                : "border-transparent text-slate-400 hover:text-slate-600"
            )}
          >
            <Lock size={14} />
            Privacy Policy
          </button>
        </div>

        {/* Editor Area */}
        <div className="bg-white rounded-[10px] border border-slate-100 shadow-sm p-6 flex flex-col gap-4">
          <div className="flex flex-col gap-1">
            <h3 className="text-md font-black text-slate-900 tracking-tight">
              {activeTab === "terms"
                ? "Edit Terms & Conditions Content"
                : "Edit Privacy Policy Content"}
            </h3>
            <p className="text-slate-400 font-semibold text-[11px]">
              {activeTab === "terms"
                ? "Manage customer booking rules, system liabilities, and parcel pick-up terms."
                : "Manage data collection parameters, compliance settings, and security policies."}
            </p>
          </div>

          {activeTab === "terms" ? (
            <textarea
              value={termsText}
              onChange={(e) => setTermsText(e.target.value)}
              placeholder="Paste or write Terms & Conditions..."
              className="w-full min-h-[500px] p-6 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-800 outline-none focus:border-blue-500 focus:bg-white resize-y transition-all leading-relaxed"
            />
          ) : (
            <textarea
              value={privacyText}
              onChange={(e) => setPrivacyText(e.target.value)}
              placeholder="Paste or write Privacy Policy..."
              className="w-full min-h-[500px] p-6 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-800 outline-none focus:border-blue-500 focus:bg-white resize-y transition-all leading-relaxed"
            />
          )}
        </div>
      </div>
    </div>
  );
}
