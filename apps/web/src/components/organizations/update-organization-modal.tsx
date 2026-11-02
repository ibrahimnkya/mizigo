"use client";

import { useState, useEffect } from "react";
import {
  Building2,
  Save,
  Loader2,
  AlertCircle,
  CheckCircle2,
  MoreHorizontal,
  Edit3,
  Palette,
} from "lucide-react";
import { Button } from "@repo/ui/button";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import { useUpdateOrganization } from "@/modules/organizations/use-organizations";
import { LogoUploadField } from "@/components/organizations/logo-upload-field";
import { cn } from "@/lib/utils";

interface UpdateOrganizationModalProps {
  organization: any;
  onSuccess: () => void;
}

function isValidHex(value: string) {
  return /^#([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$/.test(value);
}

export function UpdateOrganizationModal({
  organization,
  onSuccess,
}: UpdateOrganizationModalProps) {
  const [open, setOpen] = useState(false);
  const { mutate: updateOrg, isPending: loading } = useUpdateOrganization();
  const [error, setError] = useState<string | null>(null);

  const [name, setName] = useState(organization.name || "");
  const [description, setDescription] = useState(
    organization.description || "",
  );
  const [supportUrl, setSupportUrl] = useState(organization.supportUrl || "");
  const [commissionRate, setCommissionRate] = useState<string>(
    (organization.commissionRate * 100).toString() || "0",
  );
  const [commissionNotes, setCommissionNotes] = useState(
    organization.commissionNotes || "",
  );
  const [isActive, setIsActive] = useState(organization.isActive);

  const [logoUrl, setLogoUrl] = useState(organization.logoUrl || "");
  const [faviconUrl, setFaviconUrl] = useState(organization.faviconUrl || "");
  const [primaryColor, setPrimaryColor] = useState(
    organization.primaryColor || "",
  );
  const [secondaryColor, setSecondaryColor] = useState(
    organization.secondaryColor || "",
  );
  const [slug, setSlug] = useState(organization.slug || "");
  const [brandingError, setBrandingError] = useState<string | null>(null);

  // Sync state if prop changes
  useEffect(() => {
    if (open) {
      setName(organization.name || "");
      setDescription(organization.description || "");
      setSupportUrl(organization.supportUrl || "");
      setCommissionRate(((organization.commissionRate || 0) * 100).toString());
      setCommissionNotes(organization.commissionNotes || "");
      setIsActive(organization.isActive);
      setLogoUrl(organization.logoUrl || "");
      setFaviconUrl(organization.faviconUrl || "");
      setPrimaryColor(organization.primaryColor || "");
      setSecondaryColor(organization.secondaryColor || "");
      setSlug(organization.slug || "");
      setBrandingError(null);
    }
  }, [open, organization]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    setBrandingError(null);

    if (primaryColor.trim() && !isValidHex(primaryColor.trim())) {
      setBrandingError("Primary color must be a valid hex color");
      return;
    }
    if (secondaryColor.trim() && !isValidHex(secondaryColor.trim())) {
      setBrandingError("Secondary color must be a valid hex color");
      return;
    }
    if (slug.trim() && !/^[a-z0-9-]+$/.test(slug.trim())) {
      setBrandingError(
        "Slug may only contain lowercase letters, numbers, and hyphens",
      );
      return;
    }

    const payload = {
      id: organization.id,
      name,
      description,
      supportUrl,
      commissionRate: parseFloat(commissionRate) / 100,
      commissionNotes,
      isActive,
      logoUrl: logoUrl.trim() || null,
      faviconUrl: faviconUrl.trim() || null,
      primaryColor: primaryColor.trim() || null,
      secondaryColor: secondaryColor.trim() || null,
      slug: slug.trim() || null,
    };

    updateOrg(payload, {
      onSuccess: () => {
        setOpen(false);
        onSuccess();
      },
      onError: (err: any) => {
        setError(err.message);
      },
    });
  };

  return (
    <Sheet open={open} onOpenChange={setOpen}>
      <SheetTrigger asChild>
        <button className="w-10 h-10 rounded-xl bg-slate-50 text-slate-400 flex items-center justify-center hover:bg-slate-900 hover:text-white transition-all duration-300  border border-slate-100 active:scale-90">
          <Edit3 size={16} strokeWidth={3} />
        </button>
      </SheetTrigger>

      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100  flex flex-col rounded-xl">
        {/* Header Section */}
        <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="w-12 h-12 rounded-xl bg-white/10 border border-slate-200 flex items-center justify-center shrink-0 relative z-10  ">
            <Building2 className="w-6 h-6 text-white" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10 text-left">
            <SheetTitle className="text-[20px] font-semibold text-white tracking-tight leading-tight uppercase">
              Edit Organization
            </SheetTitle>
            <SheetDescription className="text-slate-500 text-[11px] font-bold uppercase tracking-[0.05em] mt-0.5">
              ID: {organization.id.substring(0, 8).toUpperCase()} · Management
              Portal
            </SheetDescription>
          </div>
        </div>

        <form
          id="update-org-form"
          onSubmit={handleSubmit}
          className="p-8 space-y-10 flex-1 overflow-y-auto custom-scrollbar"
        >
          {error && (
            <div className="bg-rose-50 border border-rose-100 text-rose-600 text-[13px] font-bold p-4 rounded-xl flex items-center gap-3">
              <AlertCircle className="w-5 h-5" />
              {error}
            </div>
          )}

          <div className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-10">
            <div className="space-y-8">
              <div className="space-y-3">
                <Label
                  htmlFor="edit-name"
                  className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] ml-1"
                >
                  Organization Name
                </Label>
                <Input
                  id="edit-name"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-5 text-[14px] font-bold transition-all text-slate-900"
                  required
                />
              </div>

              <div className="space-y-3">
                <Label
                  htmlFor="edit-description"
                  className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] ml-1"
                >
                  Description
                </Label>
                <Input
                  id="edit-description"
                  value={description}
                  onChange={(e) => setDescription(e.target.value)}
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-5 text-[14px] font-bold transition-all text-slate-900"
                />
              </div>

              <div className="space-y-3">
                <Label
                  htmlFor="edit-supportUrl"
                  className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] ml-1"
                >
                  Support URL
                </Label>
                <Input
                  id="edit-supportUrl"
                  value={supportUrl}
                  onChange={(e) => setSupportUrl(e.target.value)}
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-5 text-[14px] font-bold transition-all text-slate-900"
                />
              </div>

              <div className="flex items-center justify-between p-4 bg-slate-50 rounded-xl border border-slate-100">
                <div className="flex flex-col gap-0.5">
                  <span className="text-[11px] font-semibold text-slate-900 uppercase tracking-tight">
                    Active Status
                  </span>
                  <span className="text-[9px] font-bold text-slate-400 uppercase tracking-[0.05em]">
                    Public availability
                  </span>
                </div>
                <button
                  type="button"
                  onClick={() => setIsActive(!isActive)}
                  className={cn(
                    "h-7 w-12 rounded-full transition-all relative",
                    isActive
                      ? "bg-emerald-500 shadow-[0_0_15px_rgba(16,185,129,0.3)]"
                      : "bg-slate-200",
                  )}
                >
                  <div
                    className={cn(
                      "absolute top-1 w-5 h-5 rounded-full bg-white  transition-all",
                      isActive ? "left-6" : "left-1",
                    )}
                  />
                </button>
              </div>
            </div>

            <div className="space-y-8">
              <div className="space-y-3">
                <Label
                  htmlFor="edit-commissionRate"
                  className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] ml-1"
                >
                  Commission Rate (%)
                </Label>
                <div className="relative">
                  <Input
                    id="edit-commissionRate"
                    type="number"
                    min="0"
                    max="100"
                    step="0.01"
                    value={commissionRate}
                    onChange={(e) => setCommissionRate(e.target.value)}
                    className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-5 text-[14px] font-bold transition-all text-slate-900 pr-12"
                  />
                  <span className="absolute right-5 top-1/2 -translate-y-1/2 font-semibold text-[12px] text-blue-600">
                    %
                  </span>
                </div>
              </div>

              <div className="space-y-3">
                <Label
                  htmlFor="edit-commissionNotes"
                  className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] ml-1"
                >
                  Commission Notes
                </Label>
                <textarea
                  id="edit-commissionNotes"
                  value={commissionNotes}
                  onChange={(e) => setCommissionNotes(e.target.value)}
                  className="w-full h-[184px] py-4 bg-slate-50 border border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-5 text-[14px] font-bold transition-all text-slate-900 resize-none custom-scrollbar"
                />
              </div>
            </div>
          </div>

          {/* Branding */}
          <div className="pt-8 border-t border-slate-100 space-y-6">
            <div className="flex items-center gap-2">
              <Palette className="w-3.5 h-3.5 text-blue-600" strokeWidth={3} />
              <span className="text-[10px] font-semibold uppercase tracking-[0.05em] text-slate-400">
                Whitelabel Branding
              </span>
            </div>

            {brandingError && (
              <div className="bg-rose-50 border border-rose-100 text-rose-600 text-[13px] font-bold p-4 rounded-xl flex items-center gap-3">
                <AlertCircle className="w-5 h-5" />
                {brandingError}
              </div>
            )}

            <div className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6">
              <div className="space-y-6">
                <LogoUploadField
                  value={logoUrl}
                  onChange={setLogoUrl}
                  onColorsExtracted={({ primary, secondary }) => {
                    if (!primaryColor.trim()) setPrimaryColor(primary);
                    if (!secondaryColor.trim()) setSecondaryColor(secondary);
                  }}
                />
                <div className="space-y-3">
                  <Label
                    htmlFor="edit-faviconUrl"
                    className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] ml-1"
                  >
                    Favicon URL
                  </Label>
                  <Input
                    id="edit-faviconUrl"
                    value={faviconUrl}
                    onChange={(e) => setFaviconUrl(e.target.value)}
                    placeholder="https://cdn.acme.com/favicon.ico"
                    className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-5 text-[14px] font-bold transition-all text-slate-900"
                  />
                </div>
              </div>

              <div className="space-y-6">
                <div className="grid grid-cols-2 gap-4">
                  <div className="space-y-3">
                    <Label className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] ml-1">
                      Primary Color
                    </Label>
                    <div className="flex items-center gap-2">
                      <input
                        type="color"
                        value={isValidHex(primaryColor) ? primaryColor : "#1d4ed8"}
                        onChange={(e) => setPrimaryColor(e.target.value)}
                        className="h-14 w-14 rounded-xl border border-slate-100 cursor-pointer shrink-0"
                      />
                      <Input
                        value={primaryColor}
                        onChange={(e) => setPrimaryColor(e.target.value)}
                        placeholder="#1d4ed8"
                        className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-5 text-[14px] font-bold transition-all text-slate-900"
                      />
                    </div>
                  </div>
                  <div className="space-y-3">
                    <Label className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] ml-1">
                      Secondary Color
                    </Label>
                    <div className="flex items-center gap-2">
                      <input
                        type="color"
                        value={isValidHex(secondaryColor) ? secondaryColor : "#0ea5e9"}
                        onChange={(e) => setSecondaryColor(e.target.value)}
                        className="h-14 w-14 rounded-xl border border-slate-100 cursor-pointer shrink-0"
                      />
                      <Input
                        value={secondaryColor}
                        onChange={(e) => setSecondaryColor(e.target.value)}
                        placeholder="#0ea5e9"
                        className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-5 text-[14px] font-bold transition-all text-slate-900"
                      />
                    </div>
                  </div>
                </div>
                <div className="space-y-3">
                  <Label
                    htmlFor="edit-slug"
                    className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] ml-1"
                  >
                    Branded Login Slug
                  </Label>
                  <Input
                    id="edit-slug"
                    value={slug}
                    onChange={(e) =>
                      setSlug(
                        e.target.value
                          .toLowerCase()
                          .replace(/\s+/g, "-")
                          .replace(/[^a-z0-9-]/g, ""),
                      )
                    }
                    placeholder="acme-logistics"
                    className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-5 text-[14px] font-bold transition-all text-slate-900"
                  />
                  {slug && (
                    <p className="text-[10px] font-bold text-slate-400 ml-1">
                      Login link:{" "}
                      <span className="text-slate-600">/login?org={slug}</span>
                    </p>
                  )}
                </div>
              </div>
            </div>
          </div>

          {/* Metadata */}
          <div className="pt-8 border-t border-slate-100 flex items-center justify-between">
            <div className="flex flex-col gap-1">
              <span className="text-[10px] font-semibold uppercase tracking-[0.05em] text-slate-400">
                Governance
              </span>
              <p className="text-[10px] font-bold text-slate-400 leading-tight max-w-[280px]">
                Configuration changes are applied instantly.
              </p>
            </div>
            <div className="flex items-center gap-1.5 px-3 py-1.5 bg-emerald-50 text-emerald-600 rounded-lg border border-emerald-100">
              <CheckCircle2 size={12} strokeWidth={3} />
              <span className="text-[9px] font-semibold uppercase tracking-[0.05em]">
                Authorized Entry
              </span>
            </div>
          </div>
        </form>

        {/* Action Footer */}
        <div className="p-6 bg-slate-50 border-t border-slate-100 flex gap-3">
          <button
            type="button"
            onClick={() => setOpen(false)}
            className="flex-1 h-14 rounded-xl bg-white border border-slate-200 text-slate-400 text-[11px] font-semibold uppercase tracking-[0.05em] hover:bg-slate-50 transition-all active:scale-[0.98]"
          >
            Cancel
          </button>
          <button
            type="submit"
            form="update-org-form"
            disabled={loading || !name}
            className="flex-[1.5] h-14 rounded-xl bg-slate-900 text-white text-[11px] font-semibold uppercase tracking-[0.05em] hover:bg-slate-800 transition-all  shadow-slate-200 flex items-center justify-center gap-3 active:scale-[0.98]"
          >
            {loading ? (
              <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
            ) : (
              <>
                <Save className="w-5 h-5" strokeWidth={3} />
                Save Changes
              </>
            )}
          </button>
        </div>
      </SheetContent>
    </Sheet>
  );
}
