"use client";

import { useState } from "react";
import {
  Building2,
  Plus,
  Loader2,
  CheckCircle2,
  Percent,
  CreditCard,
  ClipboardList,
  ChevronRight,
  ChevronLeft,
  Landmark,
  Phone,
  Palette,
} from "lucide-react";
import { Button } from "@repo/ui/button";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetTitle,
  SheetTrigger,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import { useCreateOrganization } from "@/modules/organizations/use-organizations";
import { LogoUploadField } from "@/components/organizations/logo-upload-field";
import { cn } from "@/lib/utils";

function slugify(value: string): string {
  return value
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9\s-]/g, "")
    .replace(/\s+/g, "-")
    .replace(/-+/g, "-")
    .replace(/^-|-$/g, "");
}

interface CreateOrganizationModalProps {
  onSuccess: () => void;
}

const STEPS = [
  { id: 1, label: "Company Info", icon: Building2 },
  { id: 2, label: "Branding", icon: Palette },
  { id: 3, label: "Commission", icon: Percent },
  { id: 4, label: "Beneficiary", icon: CreditCard },
  { id: 5, label: "Review", icon: ClipboardList },
];

function isValidHex(value: string) {
  return /^#([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$/.test(value);
}

export function CreateOrganizationModal({
  onSuccess,
}: CreateOrganizationModalProps) {
  const [open, setOpen] = useState(false);
  const [step, setStep] = useState(1);
  const [success, setSuccess] = useState(false);
  const { mutate: createOrg, isPending: loading } = useCreateOrganization();
  const [error, setError] = useState<string | null>(null);

  // Step 1
  const [name, setName] = useState("");
  const [description, setDescription] = useState("");
  const [supportUrl, setSupportUrl] = useState("");

  // Step 2
  const [logoUrl, setLogoUrl] = useState("");
  const [faviconUrl, setFaviconUrl] = useState("");
  const [primaryColor, setPrimaryColor] = useState("");
  const [secondaryColor, setSecondaryColor] = useState("");
  const [slug, setSlug] = useState("");
  const [slugTouched, setSlugTouched] = useState(false);

  const handleNameChange = (value: string) => {
    setName(value);
    if (!slugTouched) setSlug(slugify(value));
  };

  const handleSlugChange = (value: string) => {
    setSlugTouched(true);
    // Lenient live transform only (lowercase, spaces to hyphens, strip
    // invalid chars) — full normalization (trimming/collapsing hyphens)
    // happens via slugify() only when deriving from the name field, so
    // typing a slug directly doesn't fight the user mid-keystroke.
    setSlug(
      value
        .toLowerCase()
        .replace(/\s+/g, "-")
        .replace(/[^a-z0-9-]/g, ""),
    );
  };

  // Step 3
  const [commissionRate, setCommissionRate] = useState("0");
  const [commissionNotes, setCommissionNotes] = useState("");

  // Step 4
  const [beneficiaryName, setBeneficiaryName] = useState("");
  const [paymentMethod, setPaymentMethod] = useState<"bank" | "mpesa">("bank");
  const [bankName, setBankName] = useState("");
  const [accountNumber, setAccountNumber] = useState("");

  const resetAll = () => {
    setStep(1);
    setSuccess(false);
    setError(null);
    setName("");
    setDescription("");
    setSupportUrl("");
    setLogoUrl("");
    setFaviconUrl("");
    setPrimaryColor("");
    setSecondaryColor("");
    setSlug("");
    setSlugTouched(false);
    setCommissionRate("0");
    setCommissionNotes("");
    setBeneficiaryName("");
    setPaymentMethod("bank");
    setBankName("");
    setAccountNumber("");
  };

  const handleClose = (val: boolean) => {
    if (!val) resetAll();
    setOpen(val);
  };

  const canAdvance = () => {
    if (step === 1) return name.trim().length > 0;
    if (step === 2) {
      if (primaryColor.trim() && !isValidHex(primaryColor.trim())) return false;
      if (secondaryColor.trim() && !isValidHex(secondaryColor.trim())) return false;
      if (slug.trim() && !/^[a-z0-9-]+$/.test(slug.trim())) return false;
      return true;
    }
    return true;
  };

  const buildNotesWithBeneficiary = () => {
    const parts: string[] = [];
    if (commissionNotes.trim()) parts.push(commissionNotes.trim());
    if (beneficiaryName.trim()) {
      const method =
        paymentMethod === "bank"
          ? `Bank: ${bankName} | Acc: ${accountNumber}`
          : `M-Pesa: ${accountNumber}`;
      parts.push(`Beneficiary: ${beneficiaryName} | ${method}`);
    }
    return parts.join("\n");
  };

  const handleCreate = () => {
    setError(null);
    const payload = {
      name,
      description,
      supportUrl,
      logoUrl: logoUrl.trim() || undefined,
      faviconUrl: faviconUrl.trim() || undefined,
      primaryColor: primaryColor.trim() || undefined,
      secondaryColor: secondaryColor.trim() || undefined,
      slug: slug.trim() || undefined,
      commissionRate: parseFloat(commissionRate) / 100,
      commissionNotes: buildNotesWithBeneficiary(),
    };
    createOrg(payload, {
      onSuccess: () => {
        setSuccess(true);
        setTimeout(() => {
          setOpen(false);
          resetAll();
          onSuccess();
        }, 1400);
      },
      onError: (err: any) => {
        setError(err.message);
        const msg = String(err.message || "").toLowerCase();
        if (msg.includes("slug")) setStep(2);
        else if (msg.includes("name")) setStep(1);
      },
    });
  };

  return (
    <Sheet open={open} onOpenChange={handleClose}>
      <SheetTrigger asChild>
        <button className="h-12 px-6 bg-slate-900 hover:bg-slate-800 text-white rounded-xl font-semibold text-[13px] uppercase tracking-[0.05em] flex items-center gap-2 transition-all active:scale-95 group">
          <Plus
            className="w-4 h-4 group-hover:rotate-90 transition-transform duration-300"
            strokeWidth={3}
          />
          Register Organization
        </button>
      </SheetTrigger>

      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100  flex flex-col rounded-xl">
        {/* Header */}
        <div className="bg-slate-900 px-8 py-6 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="w-11 h-11 rounded-xl bg-white/10 border border-slate-200 flex items-center justify-center shrink-0 relative z-10">
            <Building2 className="w-5 h-5 text-white" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10">
            <SheetTitle className="text-[18px] font-semibold text-white tracking-tight uppercase leading-tight">
              Register Organization
            </SheetTitle>
            <SheetDescription className="text-slate-500 text-[10px] font-bold uppercase tracking-[0.05em] mt-0.5">
              {STEPS[step - 1]?.label} — Step {step} of {STEPS.length}
            </SheetDescription>
          </div>
        </div>

        {/* Step indicator */}
        <div className="flex items-center px-8 py-4 gap-2 border-b border-slate-100 shrink-0 bg-slate-50">
          {STEPS.map((s, i) => {
            const Icon = s.icon;
            const done = step > s.id;
            const active = step === s.id;
            return (
              <div key={s.id} className="flex items-center gap-2 flex-1 min-w-0">
                <div
                  className={cn(
                    "w-7 h-7 rounded-full flex items-center justify-center shrink-0 transition-all",
                    done
                      ? "bg-emerald-500 text-white"
                      : active
                      ? "bg-slate-900 text-white"
                      : "bg-slate-100 text-slate-300"
                  )}
                >
                  {done ? (
                    <CheckCircle2 className="w-3.5 h-3.5" strokeWidth={3} />
                  ) : (
                    <Icon className="w-3.5 h-3.5" strokeWidth={2.5} />
                  )}
                </div>
                <span
                  className={cn(
                    "text-[9px] font-semibold uppercase tracking-[0.05em] truncate transition-colors",
                    active ? "text-slate-900" : done ? "text-emerald-600" : "text-slate-300"
                  )}
                >
                  {s.label}
                </span>
                {i < STEPS.length - 1 && (
                  <div
                    className={cn(
                      "h-px flex-1 transition-colors",
                      done ? "bg-emerald-300" : "bg-slate-200"
                    )}
                  />
                )}
              </div>
            );
          })}
        </div>

        {/* Body */}
        <div className="flex-1 overflow-y-auto custom-scrollbar">
          {success ? (
            <div className="flex flex-col items-center justify-center h-full gap-4 py-20">
              <div className="w-16 h-16 rounded-full bg-emerald-50 border-2 border-emerald-200 flex items-center justify-center">
                <CheckCircle2 className="w-8 h-8 text-emerald-500" strokeWidth={2.5} />
              </div>
              <p className="text-[13px] font-semibold text-slate-900 uppercase tracking-[0.05em]">
                Organization Created
              </p>
            </div>
          ) : (
            <div className="p-8 space-y-6">
              {error && (
                <div className="bg-rose-50 border border-rose-100 text-rose-600 text-[12px] font-bold p-4 rounded-xl flex items-center gap-3">
                  <div className="w-2 h-2 rounded-full bg-rose-500 shrink-0" />
                  {error}
                </div>
              )}

              {/* Step 1: Company Info */}
              {step === 1 && (
                <div className="space-y-5">
                  <Field label="Organization Name" required>
                    <Input
                      value={name}
                      onChange={(e) => handleNameChange(e.target.value)}
                      placeholder="Acme Global Logistics"
                      className={inputCls}
                      required
                    />
                  </Field>
                  <Field label="Description">
                    <Input
                      value={description}
                      onChange={(e) => setDescription(e.target.value)}
                      placeholder="High-level summary of services..."
                      className={inputCls}
                    />
                  </Field>
                  <Field label="Support URL">
                    <Input
                      value={supportUrl}
                      onChange={(e) => setSupportUrl(e.target.value)}
                      placeholder="https://support.acme.com"
                      className={inputCls}
                    />
                  </Field>
                </div>
              )}

              {/* Step 2: Branding */}
              {step === 2 && (
                <div className="space-y-5">
                  <p className="text-[11px] font-bold text-slate-400 -mt-1">
                    Optional — you can also set these later from Organization
                    Branding settings.
                  </p>
                  <LogoUploadField
                    value={logoUrl}
                    onChange={setLogoUrl}
                    onColorsExtracted={({ primary, secondary }) => {
                      if (!primaryColor.trim()) setPrimaryColor(primary);
                      if (!secondaryColor.trim()) setSecondaryColor(secondary);
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
                  <div className="grid grid-cols-2 gap-4">
                    <Field label="Primary Color">
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
                          className={inputCls}
                        />
                      </div>
                    </Field>
                    <Field label="Secondary Color">
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
                          className={inputCls}
                        />
                      </div>
                    </Field>
                  </div>
                  <Field label="Branded Login Slug">
                    <Input
                      value={slug}
                      onChange={(e) => handleSlugChange(e.target.value)}
                      placeholder="acme-logistics"
                      className={inputCls}
                    />
                    {slug && (
                      <p className="text-[10px] font-bold text-slate-400 mt-2 ml-1">
                        Login link:{" "}
                        <span className="text-slate-600">
                          /login?org={slug}
                        </span>
                      </p>
                    )}
                  </Field>
                </div>
              )}

              {/* Step 3: Commission */}
              {step === 3 && (
                <div className="space-y-5">
                  <Field label="Commission Rate (%)">
                    <div className="relative">
                      <Input
                        type="number"
                        min="0"
                        max="100"
                        step="0.01"
                        value={commissionRate}
                        onChange={(e) => setCommissionRate(e.target.value)}
                        className={cn(inputCls, "pr-12")}
                      />
                      <span className="absolute right-5 top-1/2 -translate-y-1/2 font-semibold text-[12px] text-blue-600">
                        %
                      </span>
                    </div>
                    {parseFloat(commissionRate) > 0 && (
                      <div className="mt-2 inline-flex items-center gap-1.5 px-3 py-1 bg-blue-50 border border-blue-100 rounded-full">
                        <Percent className="w-3 h-3 text-blue-500" strokeWidth={3} />
                        <span className="text-[10px] font-semibold text-blue-600 uppercase tracking-[0.05em]">
                          {commissionRate}% commission applied
                        </span>
                      </div>
                    )}
                  </Field>
                  <Field label="Commission Notes">
                    <textarea
                      value={commissionNotes}
                      onChange={(e) => setCommissionNotes(e.target.value)}
                      placeholder="Special commission logic agreements..."
                      className="w-full h-28 py-4 bg-slate-50 border border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-5 text-[14px] font-bold placeholder:text-slate-300 transition-all text-slate-900 resize-none custom-scrollbar outline-none"
                    />
                  </Field>
                </div>
              )}

              {/* Step 4: Beneficiary */}
              {step === 4 && (
                <div className="space-y-5">
                  <Field label="Beneficiary Name">
                    <Input
                      value={beneficiaryName}
                      onChange={(e) => setBeneficiaryName(e.target.value)}
                      placeholder="John Doe"
                      className={inputCls}
                    />
                  </Field>
                  <div className="space-y-2">
                    <span className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] ml-1">
                      Payment Method
                    </span>
                    <div className="flex gap-3">
                      {(["bank", "mpesa"] as const).map((m) => (
                        <button
                          key={m}
                          type="button"
                          onClick={() => setPaymentMethod(m)}
                          className={cn(
                            "flex-1 h-12 rounded-xl border font-semibold text-[11px] uppercase tracking-[0.05em] flex items-center justify-center gap-2 transition-all",
                            paymentMethod === m
                              ? "bg-slate-900 text-white border-slate-900"
                              : "bg-slate-50 text-slate-400 border-slate-100 hover:border-slate-300"
                          )}
                        >
                          {m === "bank" ? (
                            <Landmark className="w-4 h-4" strokeWidth={2.5} />
                          ) : (
                            <Phone className="w-4 h-4" strokeWidth={2.5} />
                          )}
                          {m === "bank" ? "Bank Transfer" : "M-Pesa"}
                        </button>
                      ))}
                    </div>
                  </div>
                  {paymentMethod === "bank" && (
                    <Field label="Bank Name">
                      <Input
                        value={bankName}
                        onChange={(e) => setBankName(e.target.value)}
                        placeholder="Equity Bank"
                        className={inputCls}
                      />
                    </Field>
                  )}
                  <Field label={paymentMethod === "bank" ? "Account Number" : "M-Pesa Number"}>
                    <Input
                      value={accountNumber}
                      onChange={(e) => setAccountNumber(e.target.value)}
                      placeholder={paymentMethod === "bank" ? "0123456789" : "+256 7XX XXX XXX"}
                      className={inputCls}
                    />
                  </Field>
                </div>
              )}

              {/* Step 5: Review */}
              {step === 5 && (
                <div className="space-y-4">
                  <ReviewCard title="Company Info" icon={Building2}>
                    <ReviewRow label="Name" value={name} />
                    {description && <ReviewRow label="Description" value={description} />}
                    {supportUrl && <ReviewRow label="Support URL" value={supportUrl} />}
                  </ReviewCard>
                  {(logoUrl || faviconUrl || primaryColor || secondaryColor || slug) && (
                    <ReviewCard title="Branding" icon={Palette}>
                      {logoUrl && <ReviewRow label="Logo URL" value={logoUrl} />}
                      {faviconUrl && <ReviewRow label="Favicon URL" value={faviconUrl} />}
                      {primaryColor && <ReviewRow label="Primary Color" value={primaryColor} />}
                      {secondaryColor && (
                        <ReviewRow label="Secondary Color" value={secondaryColor} />
                      )}
                      {slug && <ReviewRow label="Login Slug" value={slug} />}
                    </ReviewCard>
                  )}
                  <ReviewCard title="Commission" icon={Percent}>
                    <ReviewRow label="Rate" value={`${commissionRate}%`} />
                    {commissionNotes && <ReviewRow label="Notes" value={commissionNotes} />}
                  </ReviewCard>
                  {beneficiaryName && (
                    <ReviewCard title="Beneficiary" icon={CreditCard}>
                      <ReviewRow label="Name" value={beneficiaryName} />
                      <ReviewRow
                        label="Method"
                        value={paymentMethod === "bank" ? "Bank Transfer" : "M-Pesa"}
                      />
                      {paymentMethod === "bank" && bankName && (
                        <ReviewRow label="Bank" value={bankName} />
                      )}
                      {accountNumber && (
                        <ReviewRow
                          label={paymentMethod === "bank" ? "Account" : "Number"}
                          value={accountNumber}
                        />
                      )}
                    </ReviewCard>
                  )}
                </div>
              )}
            </div>
          )}
        </div>

        {/* Footer */}
        {!success && (
          <div className="p-6 bg-slate-50 border-t border-slate-100 flex gap-3 shrink-0">
            {step > 1 ? (
              <button
                type="button"
                onClick={() => { setError(null); setStep((s) => s - 1); }}
                className="h-14 px-6 rounded-xl bg-white border border-slate-200 text-slate-500 text-[11px] font-semibold uppercase tracking-[0.05em] hover:bg-slate-100 transition-all active:scale-[0.98] flex items-center gap-2"
              >
                <ChevronLeft className="w-4 h-4" strokeWidth={3} />
                Back
              </button>
            ) : (
              <button
                type="button"
                onClick={() => setOpen(false)}
                className="h-14 px-6 rounded-xl bg-white border border-slate-200 text-slate-400 text-[11px] font-semibold uppercase tracking-[0.05em] hover:bg-slate-50 transition-all active:scale-[0.98]"
              >
                Cancel
              </button>
            )}

            {step < 5 ? (
              <button
                type="button"
                disabled={!canAdvance()}
                onClick={() => setStep((s) => s + 1)}
                className="flex-1 h-14 rounded-xl bg-slate-900 text-white text-[11px] font-semibold uppercase tracking-[0.05em] hover:bg-slate-800 transition-all  shadow-slate-200 flex items-center justify-center gap-2 active:scale-[0.98] disabled:opacity-40 disabled:cursor-not-allowed"
              >
                Next
                <ChevronRight className="w-4 h-4" strokeWidth={3} />
              </button>
            ) : (
              <button
                type="button"
                disabled={loading}
                onClick={handleCreate}
                className="flex-1 h-14 rounded-xl bg-emerald-600 hover:bg-emerald-500 text-white text-[11px] font-semibold uppercase tracking-[0.05em] transition-all  shadow-emerald-100 flex items-center justify-center gap-2 active:scale-[0.98] disabled:opacity-60"
              >
                {loading ? (
                  <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
                ) : (
                  <>
                    <CheckCircle2 className="w-5 h-5" strokeWidth={3} />
                    Create Company
                  </>
                )}
              </button>
            )}
          </div>
        )}
      </SheetContent>
    </Sheet>
  );
}

const inputCls =
  "h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-5 text-[14px] font-bold placeholder:text-slate-300 transition-all text-slate-900";

function Field({
  label,
  required,
  children,
}: {
  label: string;
  required?: boolean;
  children: React.ReactNode;
}) {
  return (
    <div className="space-y-2">
      <Label className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] ml-1">
        {label}
        {required && <span className="text-rose-400 ml-1">*</span>}
      </Label>
      {children}
    </div>
  );
}

function ReviewCard({
  title,
  icon: Icon,
  children,
}: {
  title: string;
  icon: React.ElementType;
  children: React.ReactNode;
}) {
  return (
    <div className="border border-slate-100 rounded-xl overflow-hidden">
      <div className="flex items-center gap-2 px-4 py-3 bg-slate-50 border-b border-slate-100">
        <Icon className="w-3.5 h-3.5 text-slate-400" strokeWidth={2.5} />
        <span className="text-[10px] font-semibold uppercase tracking-[0.05em] text-slate-500">
          {title}
        </span>
      </div>
      <div className="px-4 py-3 space-y-2">{children}</div>
    </div>
  );
}

function ReviewRow({ label, value }: { label: string; value: string }) {
  return (
    <div className="flex items-start justify-between gap-4">
      <span className="text-[11px] font-bold text-slate-400 shrink-0">{label}</span>
      <span className="text-[12px] font-semibold text-slate-900 text-right break-all">{value}</span>
    </div>
  );
}
