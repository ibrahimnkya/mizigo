"use client";

import { useEffect, useState } from "react";
import { Palette, Image as ImageIcon, Link2, Loader2, Save, Copy } from "lucide-react";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import { toast } from "sonner";
import {
  useOrganizationBranding,
  useUpdateOrganizationBranding,
} from "@/modules/organizations/use-organizations";
import { LogoUploadField } from "@/components/organizations/logo-upload-field";

const inputCls =
  "h-12 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-4 text-[13px] font-bold placeholder:text-slate-300 transition-all text-slate-900";

function isValidHex(value: string) {
  return /^#([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$/.test(value);
}

export default function BrandingSettingsPage() {
  const { data: branding, isLoading } = useOrganizationBranding();
  const { mutate: updateBranding, isPending } = useUpdateOrganizationBranding();

  const [logoUrl, setLogoUrl] = useState("");
  const [faviconUrl, setFaviconUrl] = useState("");
  const [primaryColor, setPrimaryColor] = useState("#1d4ed8");
  const [secondaryColor, setSecondaryColor] = useState("#0ea5e9");
  const [slug, setSlug] = useState("");

  useEffect(() => {
    if (!branding) return;
    setLogoUrl(branding.logoUrl || "");
    setFaviconUrl(branding.faviconUrl || "");
    setPrimaryColor(branding.primaryColor || "#1d4ed8");
    setSecondaryColor(branding.secondaryColor || "#0ea5e9");
    setSlug(branding.slug || "");
  }, [branding]);

  const loginLink =
    typeof window !== "undefined" && slug
      ? `${window.location.origin}/login?org=${slug}`
      : "";

  const handleSave = () => {
    if (primaryColor && !isValidHex(primaryColor)) {
      toast.error("Primary color must be a valid hex color");
      return;
    }
    if (secondaryColor && !isValidHex(secondaryColor)) {
      toast.error("Secondary color must be a valid hex color");
      return;
    }
    if (slug && !/^[a-z0-9-]+$/.test(slug)) {
      toast.error("Slug may only contain lowercase letters, numbers, and hyphens");
      return;
    }
    updateBranding({
      logoUrl: logoUrl || null,
      faviconUrl: faviconUrl || null,
      primaryColor: primaryColor || null,
      secondaryColor: secondaryColor || null,
      slug: slug || null,
    });
  };

  const copyLoginLink = () => {
    if (!loginLink) return;
    navigator.clipboard.writeText(loginLink);
    toast.success("Branded login link copied");
  };

  return (
    <div className="flex flex-col gap-5">
      <div className="max-w-[900px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">
        <div>
          <div className="flex items-center gap-2 mb-2">
            <span className="text-[10px] font-semibold uppercase tracking-[0.05em] text-fuchsia-600 bg-fuchsia-50 px-2.5 py-1 rounded-full">
              Whitelabel
            </span>
          </div>
          <h1 className="text-[20px] font-semibold text-slate-800 tracking-tight">
            Organization Branding
          </h1>
          <p className="text-sm text-slate-400 font-medium mt-0.5">
            Customize your logo, favicon, and brand colors across the
            dashboard, tracking page, and mobile app.
          </p>
        </div>

        {isLoading ? (
          <div className="h-60 flex items-center justify-center text-slate-300">
            <Loader2 className="w-6 h-6 animate-spin" />
          </div>
        ) : (
          <div className="flex flex-col gap-6">
            <Section
              icon={ImageIcon}
              title="Logo & Favicon"
              accent="#6366f1"
              description="Upload your logo to get automatic brand color suggestions, or paste a hosted URL."
            >
              <div className="grid gap-5 sm:grid-cols-2">
                <LogoUploadField
                  value={logoUrl}
                  onChange={setLogoUrl}
                  onColorsExtracted={({ primary, secondary }) => {
                    setPrimaryColor((prev) =>
                      prev && prev !== "#1d4ed8" ? prev : primary,
                    );
                    setSecondaryColor((prev) =>
                      prev && prev !== "#0ea5e9" ? prev : secondary,
                    );
                  }}
                />
                <Field label="Favicon URL">
                  <Input
                    value={faviconUrl}
                    onChange={(e) => setFaviconUrl(e.target.value)}
                    placeholder="https://cdn.acme.com/favicon.ico"
                    className={inputCls}
                  />
                </Field>
              </div>
            </Section>

            <Section
              icon={Palette}
              title="Brand Colors"
              accent="#0ea5e9"
              description="Applied to accent elements across the dashboard."
            >
              <div className="grid gap-5 sm:grid-cols-2">
                <Field label="Primary Color">
                  <ColorInput value={primaryColor} onChange={setPrimaryColor} />
                </Field>
                <Field label="Secondary Color">
                  <ColorInput
                    value={secondaryColor}
                    onChange={setSecondaryColor}
                  />
                </Field>
              </div>
            </Section>

            <Section
              icon={Link2}
              title="Branded Login Link"
              accent="#10b981"
              description="Share this link with your staff so the login page shows your organization's branding before they sign in."
            >
              <Field label="Slug">
                <Input
                  value={slug}
                  onChange={(e) =>
                    setSlug(e.target.value.toLowerCase().replace(/\s+/g, "-"))
                  }
                  placeholder="acme-logistics"
                  className={inputCls}
                />
              </Field>
              {loginLink && (
                <div className="mt-4 flex items-center justify-between gap-3 p-4 bg-slate-50 rounded-xl border border-slate-100">
                  <span className="text-[12px] font-bold text-slate-600 truncate">
                    {loginLink}
                  </span>
                  <button
                    type="button"
                    onClick={copyLoginLink}
                    className="shrink-0 inline-flex items-center gap-1.5 h-8 px-3 text-[11px] font-semibold text-slate-500 hover:text-indigo-600 hover:bg-indigo-50 rounded-xl border border-slate-100 transition-colors"
                  >
                    <Copy size={12} /> Copy
                  </button>
                </div>
              )}
            </Section>

            <div className="flex justify-end">
              <button
                type="button"
                disabled={isPending}
                onClick={handleSave}
                className="inline-flex items-center gap-2 h-12 px-6 bg-blue-600 hover:bg-blue-700 text-white rounded-xl font-semibold text-[13px] uppercase tracking-[0.05em] transition-all active:scale-95 disabled:opacity-60"
              >
                {isPending ? (
                  <Loader2 className="w-4 h-4 animate-spin" />
                ) : (
                  <Save className="w-4 h-4" strokeWidth={2.5} />
                )}
                Save Branding
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

function Section({
  icon: Icon,
  title,
  description,
  accent,
  children,
}: {
  icon: React.ElementType;
  title: string;
  description: string;
  accent: string;
  children: React.ReactNode;
}) {
  return (
    <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden">
      <div className="flex items-center gap-3 px-6 py-4 border-b border-slate-100">
        <div
          className="w-9 h-9 rounded-xl flex items-center justify-center shrink-0"
          style={{ backgroundColor: `${accent}1A` }}
        >
          <Icon size={15} style={{ color: accent }} strokeWidth={2.5} />
        </div>
        <div>
          <h3 className="text-[13px] font-semibold text-slate-900 tracking-tight">
            {title}
          </h3>
          <p className="text-[11px] text-slate-400 font-medium">{description}</p>
        </div>
      </div>
      <div className="p-6">{children}</div>
    </div>
  );
}

function Field({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <div className="space-y-2">
      <Label className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] ml-1">
        {label}
      </Label>
      {children}
    </div>
  );
}

function ColorInput({
  value,
  onChange,
}: {
  value: string;
  onChange: (value: string) => void;
}) {
  return (
    <div className="flex items-center gap-3">
      <input
        type="color"
        value={isValidHex(value) ? value : "#1d4ed8"}
        onChange={(e) => onChange(e.target.value)}
        className="h-12 w-12 rounded-xl border border-slate-100 cursor-pointer shrink-0"
      />
      <Input
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder="#1d4ed8"
        className={inputCls}
      />
    </div>
  );
}
