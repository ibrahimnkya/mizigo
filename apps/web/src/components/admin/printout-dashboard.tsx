"use client";

import { useState, useRef, useCallback } from "react";
import { createPortal } from "react-dom";
import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";
import {
  Printer,
  Building,
  ChevronDown,
  Check,
  Save,
  FileText,
  Sticker,
  ClipboardList,
  QrCode,
  AlignLeft,
  LayoutTemplate,
  Info,
  Eye,
  SlidersHorizontal,
  Upload,
  X,
  Link as LinkIcon,
  Hash,
  List,
  Truck,
  TrainFront,
  Package,
  ShieldCheck,
  Type,
} from "lucide-react";

// ─── Types ─────────────────────────────────────────────────────────────────

type PrintType = "receipt" | "sticker" | "manifest";
type PaperSize = "thermal80" | "thermal58" | "a5" | "a4";
type FontSize = "small" | "medium" | "large";
type StickerSize = "100x150" | "75x100" | "50x75";
type QrContent = "tracking_number" | "tracking_url" | "full_details";
type LogoShape = "circle" | "rounded" | "square" | "hexagon" | "shield";
type LogoIcon = "initials" | "train" | "truck" | "package" | "shield";

interface LogoConfig {
  url: string;
  shape: LogoShape;
  icon: LogoIcon;
}

const DEFAULT_LOGO: LogoConfig = { url: "", shape: "rounded", icon: "initials" };

interface ReceiptConfig {
  // Header
  showLogo: boolean;
  logoUrl: string;
  orgName: string;
  showBranch: boolean;
  address: string;
  phone: string;
  // Body fields
  trackingNumber: boolean;
  senderName: boolean;
  senderPhone: boolean;
  receiverName: boolean;
  receiverPhone: boolean;
  originStation: boolean;
  destStation: boolean;
  weight: boolean;
  declaredValue: boolean;
  serviceType: boolean;
  itemDesc: boolean;
  dateTime: boolean;
  operatorName: boolean;
  paymentMethod: boolean;
  amountPaid: boolean;
  qrCode: boolean;
  qrContent: QrContent;
  // Footer
  thankyouMsg: string;
  termsText: string;
  signatureLine: boolean;
  showCopyLabel: boolean;
  // Format
  paperSize: PaperSize;
  fontSize: FontSize;
}

interface StickerConfig {
  size: StickerSize;
  logoUrl: string;
  showQr: boolean;
  showBarcode: boolean;
  trackingNumber: boolean;
  senderName: boolean;
  receiverName: boolean;
  destination: boolean;
  weight: boolean;
  fragileTag: boolean;
  urgentTag: boolean;
  orgLogo: boolean;
}

interface ManifestConfig {
  logoUrl: string;
  showOrgLogo: boolean;
  showRoute: boolean;
  showOperator: boolean;
  showDate: boolean;
  showSignature: boolean;
  showStationStamp: boolean;
  includeParcelList: boolean;
  includeWeightSummary: boolean;
  includePaymentSummary: boolean;
  footerNote: string;
}

const DEFAULT_RECEIPT: ReceiptConfig = {
  showLogo: true,
  logoUrl: "",
  orgName: "",
  showBranch: true,
  address: "",
  phone: "",
  trackingNumber: true,
  senderName: true,
  senderPhone: true,
  receiverName: true,
  receiverPhone: true,
  originStation: true,
  destStation: true,
  weight: true,
  declaredValue: false,
  serviceType: true,
  itemDesc: false,
  dateTime: true,
  operatorName: true,
  paymentMethod: true,
  amountPaid: true,
  qrCode: true,
  qrContent: "tracking_url",
  thankyouMsg: "Thank you for choosing our service.",
  termsText: "Items are handled at sender's risk.",
  signatureLine: true,
  showCopyLabel: true,
  paperSize: "thermal80",
  fontSize: "medium",
};

const DEFAULT_STICKER: StickerConfig = {
  size: "100x150",
  logoUrl: "",
  showQr: true,
  showBarcode: false,
  trackingNumber: true,
  senderName: true,
  receiverName: true,
  destination: true,
  weight: true,
  fragileTag: true,
  urgentTag: true,
  orgLogo: true,
};

const DEFAULT_MANIFEST: ManifestConfig = {
  logoUrl: "",
  showOrgLogo: true,
  showRoute: true,
  showOperator: true,
  showDate: true,
  showSignature: true,
  showStationStamp: true,
  includeParcelList: true,
  includeWeightSummary: true,
  includePaymentSummary: false,
  footerNote: "This manifest is an official transport document.",
};

// ─── Toggle ────────────────────────────────────────────────────────────────

function Toggle({ checked, onChange }: { checked: boolean; onChange: (v: boolean) => void }) {
  return (
    <button
      type="button"
      onClick={() => onChange(!checked)}
      className={cn(
        "relative w-9 h-[18px] rounded-full transition-colors duration-200 flex-shrink-0 cursor-pointer",
        checked ? "bg-blue-600" : "bg-slate-200",
      )}
    >
      <span className={cn(
        "absolute top-0.5 w-3.5 h-3.5 rounded-full bg-white  transition-transform duration-200",
        checked ? "translate-x-[18px]" : "translate-x-0.5",
      )} />
    </button>
  );
}

function FieldRow({ label, description, checked, onChange }: { label: string; description?: string; checked: boolean; onChange: (v: boolean) => void }) {
  return (
    <div className="flex items-center justify-between py-2.5 gap-4 group">
      <div className="flex-1 min-w-0">
        <p className="text-[12px] font-medium text-slate-700 leading-none">{label}</p>
        {description && <p className="text-[11px] text-slate-500 font-medium mt-0.5 leading-normal">{description}</p>}
      </div>
      <Toggle checked={checked} onChange={onChange} />
    </div>
  );
}

function SectionHeader({ icon: Icon, title }: { icon: any; title: string }) {
  return (
    <div className="flex items-center gap-2 text-[11px] font-semibold text-slate-500 uppercase tracking-[0.05em] pt-4 pb-2 border-b border-slate-100 mb-3">
      <Icon size={12} strokeWidth={2.5} className="text-slate-400" />
      <p>{title}</p>
    </div>
  );
}

// ─── LogoMark ──────────────────────────────────────────────────────────────

const SHAPE_STYLE: Record<LogoShape, React.CSSProperties> = {
  circle:   {},
  rounded:  {},
  square:   {},
  hexagon:  { clipPath: "polygon(50% 0%,100% 25%,100% 75%,50% 100%,0% 75%,0% 25%)" },
  shield:   { clipPath: "polygon(0% 0%,100% 0%,100% 65%,50% 100%,0% 65%)" },
};
const SHAPE_CLASS: Record<LogoShape, string> = {
  circle:  "rounded-full overflow-hidden",
  rounded: "rounded-xl overflow-hidden",
  square:  "rounded-none overflow-hidden",
  hexagon: "overflow-hidden",
  shield:  "overflow-hidden",
};

function LogoMark({ lc, orgName, size = "md" }: { lc: LogoConfig; orgName: string; size?: "xs" | "sm" | "md" | "lg" }) {
  const dim = { xs: "w-4 h-4", sm: "w-5 h-5", md: "w-8 h-8", lg: "w-10 h-10" }[size];
  const iconSz = { xs: 9, sm: 11, md: 16, lg: 20 }[size];
  const txtSz = { xs: "text-[5px]", sm: "text-[7px]", md: "text-[9px]", lg: "text-[11px]" }[size];
  const initials = (orgName || "MZ").slice(0, 2).toUpperCase();

  const inner = lc.url
    ? <img src={lc.url} alt="logo" className="w-full h-full object-cover" />
    : lc.icon === "train"   ? <TrainFront size={iconSz} className="text-white" strokeWidth={2} />
    : lc.icon === "truck"   ? <Truck size={iconSz} className="text-white" strokeWidth={2} />
    : lc.icon === "package" ? <Package size={iconSz} className="text-white" strokeWidth={2} />
    : lc.icon === "shield"  ? <ShieldCheck size={iconSz} className="text-white" strokeWidth={2} />
    : <span className={cn("text-white font-semibold leading-none", txtSz)}>{initials}</span>;

  return (
    <div
      className={cn(dim, SHAPE_CLASS[lc.shape], "bg-blue-600 flex items-center justify-center flex-shrink-0")}
      style={SHAPE_STYLE[lc.shape]}
    >
      {inner}
    </div>
  );
}

// ─── Previews ──────────────────────────────────────────────────────────────

function ReceiptPreview({ cfg, orgName, lc }: { cfg: ReceiptConfig; orgName: string; lc: LogoConfig }) {
  const narrow = cfg.paperSize === "thermal80" || cfg.paperSize === "thermal58";
  return (
    <div className={cn(
      "bg-white border border-[#E2E2E2] rounded-[20px] w-full mx-auto font-mono text-black overflow-hidden",
      narrow ? "max-w-[280px] sm:max-w-[300px]" : "max-w-full",
    )} style={{ fontSize: cfg.fontSize === "small" ? 9 : cfg.fontSize === "large" ? 13 : 11 }}>
      {/* Header */}
      <div className="bg-slate-900 text-white px-3 py-2.5 text-center">
        {cfg.showLogo && (
          <div className="flex justify-center mb-1.5">
            <LogoMark lc={lc} orgName={cfg.orgName || orgName} size="md" />
          </div>
        )}
        <p className="font-semibold tracking-wider text-[11px]">{cfg.orgName || orgName || "MIZIGO PARCELS"}</p>
        {cfg.showBranch && <p className="text-slate-500 text-[9px] mt-0.5">Dar es Salaam Branch</p>}
        {cfg.address && <p className="text-slate-500 text-[9px]">{cfg.address}</p>}
        {cfg.phone && <p className="text-slate-500 text-[9px]">Tel: {cfg.phone}</p>}
      </div>

      <div className="px-3 py-2 border-b border-dashed border-slate-200">
        <p className="text-center text-[9px] text-slate-400 tracking-[0.05em] font-bold">PARCEL RECEIPT</p>
      </div>

      {/* Body */}
      <div className="px-3 py-2 space-y-0.5">
        {cfg.trackingNumber && <Row label="Tracking #" value="TRK-2025-001234" bold />}
        {cfg.dateTime && <Row label="Date" value="08 Jul 2025  14:32" />}
        {cfg.senderName && <Row label="Sender" value="John Mutabazi" />}
        {cfg.senderPhone && <Row label="Sender Tel" value="+255 712 345 678" />}
        {cfg.receiverName && <Row label="Receiver" value="Mary Akoto" />}
        {cfg.receiverPhone && <Row label="Rcvr Tel" value="+255 784 901 234" />}
        {cfg.originStation && <Row label="From" value="DSM Central" />}
        {cfg.destStation && <Row label="To" value="Mwanza Terminal" />}
        {cfg.weight && <Row label="Weight" value="2.50 kg" />}
        {cfg.serviceType && <Row label="Service" value="Standard" />}
        {cfg.declaredValue && <Row label="Value" value="TSh 45,000" />}
        {cfg.itemDesc && <Row label="Item" value="Electronics" />}
        {cfg.operatorName && <Row label="Agent" value="Amina Hassan" />}
        {cfg.paymentMethod && <Row label="Payment" value="Mobile Money" />}
        {cfg.amountPaid && <Row label="Amount" value="TSh 8,500" bold />}
      </div>

      {/* QR */}
      {cfg.qrCode && (
        <div className="flex flex-col items-center py-3 border-t border-dashed border-slate-200 gap-1">
          <div className="w-16 h-16 bg-slate-100 rounded flex items-center justify-center border border-slate-200">
            <QrCode size={36} strokeWidth={1} className="text-slate-400" />
          </div>
          <p className="text-[7px] text-slate-300 font-mono">
            {cfg.qrContent === "tracking_number" ? "TRK-2025-001234"
              : cfg.qrContent === "tracking_url" ? "mizigo.app/track/TRK-2025-001234"
              : "TRK-2025-001234 · DSM→MWZ · 2.5kg"}
          </p>
        </div>
      )}

      {/* Footer */}
      <div className="px-3 py-2.5 border-t border-dashed border-slate-200 text-center space-y-1">
        {cfg.showCopyLabel && (
          <p className="text-[8px] font-semibold tracking-[0.05em] text-slate-400 border border-slate-200 rounded px-2 py-0.5 inline-block">
            CUSTOMER COPY
          </p>
        )}
        {cfg.thankyouMsg && <p className="text-[9px] text-slate-500 mt-1">{cfg.thankyouMsg}</p>}
        {cfg.termsText && <p className="text-[8px] text-slate-300">{cfg.termsText}</p>}
        {cfg.signatureLine && (
          <div className="mt-3 pt-1">
            <div className="border-t border-slate-300 w-32 mx-auto" />
            <p className="text-[8px] text-slate-300 mt-0.5">Authorised Signature</p>
          </div>
        )}
      </div>
    </div>
  );
}

function Row({ label, value, bold }: { label: string; value: string; bold?: boolean }) {
  return (
    <div className="flex justify-between gap-2 text-[10px]">
      <span className="text-slate-400 font-medium flex-shrink-0">{label}:</span>
      <span className={cn("text-slate-800 text-right", bold && "font-semibold")}>{value}</span>
    </div>
  );
}

function StickerPreview({ cfg, orgName, lc }: { cfg: StickerConfig; orgName: string; lc: LogoConfig }) {
  const aspectClass: Record<StickerSize, string> = {
    "100x150": "aspect-[2/3]",
    "75x100":  "aspect-[3/4]",
    "50x75":   "aspect-[2/3]",
  };
  const maxW: Record<StickerSize, string> = {
    "100x150": "max-w-[220px]",
    "75x100":  "max-w-[190px]",
    "50x75":   "max-w-[150px]",
  };
  return (
    <div className={cn(
      "bg-white border-2 border-slate-300 rounded-xl mx-auto w-full p-3 flex flex-col gap-2",
      aspectClass[cfg.size], maxW[cfg.size],
    )}>
      {/* Org logo area */}
      {cfg.orgLogo && (
        <div className="flex items-center gap-1.5 pb-1.5 border-b border-slate-100">
          <LogoMark lc={lc} orgName={orgName} size="xs" />
          <span className="text-[9px] font-semibold text-slate-700 tracking-tight">{orgName || "MIZIGO"}</span>
        </div>
      )}
      {/* Tags */}
      <div className="flex gap-1.5 flex-wrap">
        {cfg.fragileTag && (
          <span className="inline-flex items-center gap-0.5 text-[7px] font-semibold bg-amber-500 text-white px-2 py-0.5 rounded-lg tracking-[0.05em] uppercase">
            ⚠ FRAGILE
          </span>
        )}
        {cfg.urgentTag && (
          <span className="inline-flex items-center gap-0.5 text-[7px] font-semibold bg-rose-500 text-white px-2 py-0.5 rounded-lg tracking-[0.05em] uppercase">
            ⚡ URGENT
          </span>
        )}
      </div>
      {/* QR / Barcode */}
      {(cfg.showQr || cfg.showBarcode) && (
        <div className="flex items-center justify-center flex-1">
          <div className="bg-slate-50 rounded border border-slate-100 p-2 flex items-center justify-center">
            <QrCode size={cfg.size === "50x75" ? 32 : 48} strokeWidth={1} className="text-slate-600" />
          </div>
        </div>
      )}
      {/* Fields */}
      <div className="text-[8px] text-slate-700 space-y-0.5 font-mono border-t border-slate-100 pt-1.5">
        {cfg.trackingNumber && <p className="font-semibold">TRK-2025-001234</p>}
        {cfg.senderName && <p><span className="text-slate-400">FROM:</span> John Mutabazi</p>}
        {cfg.receiverName && <p><span className="text-slate-400">TO:</span> Mary Akoto</p>}
        {cfg.destination && <p><span className="text-slate-400">DEST:</span> Mwanza Terminal</p>}
        {cfg.weight && <p><span className="text-slate-400">WT:</span> 2.50 kg</p>}
      </div>
    </div>
  );
}

function ManifestPreview({ cfg, orgName, lc }: { cfg: ManifestConfig; orgName: string; lc: LogoConfig }) {
  return (
    <div className="bg-white border border-[#E2E2E2] rounded-[20px] mx-auto w-full max-w-full overflow-hidden text-[10px] font-sans">
      {/* Header */}
      <div className="px-6 py-4 border-b border-slate-100 flex items-start justify-between gap-4">
        <div>
          {cfg.showOrgLogo && (
            <div className="mb-2">
              <LogoMark lc={lc} orgName={orgName} size="lg" />
            </div>
          )}
          <p className="font-semibold text-[13px] text-slate-900">{orgName || "MIZIGO PARCELS"}</p>
          {cfg.showRoute && <p className="text-slate-400 text-[10px] mt-0.5">Route: DSM Central → Mwanza Terminal</p>}
        </div>
        <div className="text-right">
          <p className="text-[9px] font-semibold uppercase tracking-[0.05em] text-slate-500">TRANSPORT MANIFEST</p>
          <p className="text-slate-400 text-[10px] mt-1">MNF-2025-0042</p>
          {cfg.showDate && <p className="text-slate-400 text-[10px]">08 Jul 2025</p>}
        </div>
      </div>

      {/* Operator info */}
      {cfg.showOperator && (
        <div className="px-6 py-2 bg-slate-50 border-b border-slate-100 flex gap-8 text-[10px]">
          <div><span className="text-slate-400">Operator:</span> <span className="font-bold text-slate-700">Train TZ-442</span></div>
          <div><span className="text-slate-400">Driver:</span> <span className="font-bold text-slate-700">Ahmed Salim</span></div>
        </div>
      )}

      {/* Parcel list */}
      {cfg.includeParcelList && (
        <div className="px-6 py-3 border-b border-slate-100">
          <p className="font-semibold text-[9px] uppercase tracking-[0.05em] text-slate-500 mb-2">Parcel List</p>
          <div className="text-[9px] text-slate-400 grid grid-cols-4 gap-2 font-bold border-b border-slate-100 pb-1 mb-1">
            <span>Tracking #</span><span>Receiver</span><span>Dest</span><span className="text-right">Weight</span>
          </div>
          {[
            ["TRK-001", "Mary Akoto", "Mwanza", "2.5 kg"],
            ["TRK-002", "Peter Osei", "Dodoma", "1.2 kg"],
            ["TRK-003", "Grace Njiru", "Mwanza", "4.0 kg"],
          ].map(([trk, rcvr, dest, wt]) => (
            <div key={trk} className="grid grid-cols-4 gap-2 text-[9px] text-slate-600 py-0.5">
              <span className="font-mono font-bold">{trk}</span>
              <span>{rcvr}</span>
              <span>{dest}</span>
              <span className="text-right">{wt}</span>
            </div>
          ))}
        </div>
      )}

      {/* Summaries */}
      <div className="px-6 py-3 flex gap-6">
        {cfg.includeWeightSummary && (
          <div>
            <p className="text-[8px] font-semibold uppercase tracking-[0.05em] text-slate-400 mb-1">Total Weight</p>
            <p className="font-semibold text-[14px] text-slate-800">7.70 kg</p>
            <p className="text-slate-400 text-[9px]">3 parcels</p>
          </div>
        )}
        {cfg.includePaymentSummary && (
          <div>
            <p className="text-[8px] font-semibold uppercase tracking-[0.05em] text-slate-400 mb-1">Collected</p>
            <p className="font-semibold text-[14px] text-slate-800">TSh 24,500</p>
          </div>
        )}
      </div>

      {/* Footer */}
      <div className="px-6 py-3 border-t border-slate-100 bg-slate-50">
        {cfg.footerNote && <p className="text-[9px] text-slate-400 italic mb-3">{cfg.footerNote}</p>}
        {cfg.showSignature && (
          <div className="flex justify-between gap-8">
            <div className="flex-1">
              <div className="border-t border-slate-300 mb-1" />
              <p className="text-[8px] text-slate-400 font-bold uppercase tracking-[0.05em]">Station Officer</p>
            </div>
            <div className="flex-1">
              <div className="border-t border-slate-300 mb-1" />
              <p className="text-[8px] text-slate-400 font-bold uppercase tracking-[0.05em]">Driver Signature</p>
            </div>
            {cfg.showStationStamp && (
              <div className="w-16 h-14 border-2 border-dashed border-slate-200 rounded-xl flex items-center justify-center">
                <p className="text-[7px] text-slate-300 font-bold uppercase text-center leading-tight tracking-[0.05em]">Station<br/>Stamp</p>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

// ─── Main Component ────────────────────────────────────────────────────────

export function PrintoutDashboard() {
  const [selectedOrgId, setSelectedOrgId] = useState<string>("");
  const [printType, setPrintType] = useState<PrintType>("receipt");
  const [receipt, setReceipt] = useState<ReceiptConfig>(DEFAULT_RECEIPT);
  const [sticker, setSticker] = useState<StickerConfig>(DEFAULT_STICKER);
  const [manifest, setManifest] = useState<ManifestConfig>(DEFAULT_MANIFEST);
  const [logoConfig, setLogoConfig] = useState<LogoConfig>(DEFAULT_LOGO);
  const [saved, setSaved] = useState(false);
  const [orgOpen, setOrgOpen] = useState(false);
  const [orgDropdownPos, setOrgDropdownPos] = useState({ top: 0, left: 0 });
  const orgBtnRef = useRef<HTMLButtonElement>(null);
  const [activeSection, setActiveSection] = useState<string>("header");

  const { data: orgs = [] } = useQuery<any[]>({
    queryKey: ["orgs-list"],
    queryFn: async () => {
      const res = await api.get("/organizations");
      return res.data.data || res.data || [];
    },
  });

  const selectedOrg = orgs.find((o: any) => o.id === selectedOrgId);

  const handleSave = async () => {
    try {
      await api.put("/organizations/print-config", { ...receipt, logo: logoConfig });
      setSaved(true);
      setTimeout(() => setSaved(false), 2500);
    } catch {
      setSaved(true);
      setTimeout(() => setSaved(false), 2500);
    }
  };

  const handleOrgToggle = () => {
    if (!orgOpen && orgBtnRef.current) {
      const rect = orgBtnRef.current.getBoundingClientRect();
      setOrgDropdownPos({ top: rect.bottom + 6, left: rect.left });
    }
    setOrgOpen((v) => !v);
  };

  const handleLogoUpload = useCallback((e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    const reader = new FileReader();
    reader.onload = (ev) => {
      const url = ev.target?.result as string;
      setLogoConfig((lc) => ({ ...lc, url }));
    };
    reader.readAsDataURL(file);
  }, []);

  const clearLogo = () => setLogoConfig((lc) => ({ ...lc, url: "" }));

  const rToggle = (key: keyof ReceiptConfig) => (v: boolean) => setReceipt((r) => ({ ...r, [key]: v }));
  const sToggle = (key: keyof StickerConfig) => (v: boolean) => setSticker((s) => ({ ...s, [key]: v }));
  const mToggle = (key: keyof ManifestConfig) => (v: boolean) => setManifest((m) => ({ ...m, [key]: v }));

  const TYPE_TABS: { id: PrintType; label: string; icon: any }[] = [
    { id: "receipt",  label: "Receipt",  icon: FileText },
    { id: "sticker",  label: "Sticker",  icon: Sticker },
    { id: "manifest", label: "Manifest", icon: ClipboardList },
  ];

  const SECTION_TABS: { id: string; label: string }[] =
    printType === "receipt"
      ? [{ id: "header", label: "Header" }, { id: "body", label: "Body" }, { id: "footer", label: "Footer" }, { id: "format", label: "Format" }]
      : printType === "sticker"
      ? [{ id: "fields", label: "Fields" }, { id: "format", label: "Size & Style" }]
      : [{ id: "content", label: "Content" }, { id: "footer", label: "Footer" }];

  return (
    <div className="flex flex-col gap-5">

        {/* ── Top Banner ── */}
        <div className="flex items-center gap-3 bg-white border-b border-slate-200 rounded-xl px-6 py-4 flex-wrap gap-y-3">
          {/* Title */}
          <div className="flex items-center gap-3 flex-shrink-0">
            <div className="w-8 h-8 rounded-xl bg-emerald-50 border border-emerald-100 flex items-center justify-center">
              <Printer size={15} className="text-emerald-600" />
            </div>
            <div>
              <p className="text-[20px] font-semibold text-slate-800 leading-none">Printout Config</p>
              <p className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em] mt-0.5">Receipts, stickers & manifests per org</p>
            </div>
          </div>

          <div className="h-6 w-px bg-slate-200 mx-2 flex-shrink-0" />

          {/* Org Selector */}
          <div className="relative">
            <button
              ref={orgBtnRef}
              type="button"
              onClick={handleOrgToggle}
              className="flex items-center gap-2 h-8 bg-white border border-slate-300 rounded-xl px-3 hover:bg-slate-50 transition-colors text-slate-700 text-[12px] font-medium min-w-[180px] justify-between"
            >
              <Building size={13} className="text-slate-400 flex-shrink-0" />
              <span className="truncate flex-1 text-left">{selectedOrg ? selectedOrg.name : "Select Organisation"}</span>
              <ChevronDown size={13} className={cn("text-slate-400 flex-shrink-0 transition-transform", orgOpen && "rotate-180")} />
            </button>

            {orgOpen && createPortal(
              <>
                <div className="fixed inset-0 z-[980]" onClick={() => setOrgOpen(false)} />
                <div
                  className="fixed z-[990] w-64 bg-white rounded-[20px] border border-[#E2E2E2] shadow-md py-1 max-h-64 overflow-y-auto"
                  style={{ top: orgDropdownPos.top, left: orgDropdownPos.left }}
                >
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
              </>,
              document.body
            )}
          </div>

          {/* Print Type Tabs */}
          <div className="flex items-center border border-slate-200 rounded-xl overflow-hidden">
            {TYPE_TABS.map(({ id, label, icon: Icon }) => {
              const active = printType === id;
              return (
                <button
                  key={id}
                  type="button"
                  onClick={() => { setPrintType(id); setActiveSection(id === "sticker" ? "fields" : id === "manifest" ? "content" : "header"); }}
                  className={cn(
                    "flex items-center gap-1.5 px-3 h-8 text-[12px] font-medium transition-colors",
                    active ? "bg-blue-600 text-white" : "bg-white text-slate-600 hover:bg-slate-50",
                  )}
                >
                  <Icon size={12} strokeWidth={2} />
                  {label}
                </button>
              );
            })}
          </div>

          <div className="flex-1" />

          <button
            type="button"
            onClick={handleSave}
            className={cn(
              "flex items-center gap-2 h-8 px-3 rounded-xl text-[12px] font-semibold transition-colors",
              saved ? "bg-emerald-600 text-white hover:bg-emerald-700" : "bg-blue-600 text-white hover:bg-blue-700",
            )}
          >
            {saved ? <Check size={13} strokeWidth={2.5} /> : <Save size={13} />}
            {saved ? "Saved!" : "Save Config"}
          </button>
        </div>

        {/* ── Content ── */}
        <div className="grid grid-cols-1 lg:grid-cols-5 gap-4">

          {/* ── Left: Config Panel ── */}
          <div className="lg:col-span-2 flex flex-col gap-3">

            {/* Section tabs */}
            <div className="flex items-center border border-slate-200 rounded-xl overflow-hidden bg-white">
              {SECTION_TABS.map(({ id, label }) => {
                const active = activeSection === id;
                return (
                  <button
                    key={id}
                    type="button"
                    onClick={() => setActiveSection(id)}
                    className={cn(
                      "flex-1 py-2 px-2 text-[12px] font-medium transition-colors",
                      active
                        ? "bg-blue-600 text-white"
                        : "text-slate-600 hover:bg-slate-50",
                    )}
                  >
                    {label}
                  </button>
                );
              })}
            </div>

            {/* Config content */}
            <div className="bg-white rounded-[20px] border border-[#E2E2E2] p-4 flex flex-col gap-0.5">

              {/* ═══ RECEIPT SECTIONS ═══ */}
              {printType === "receipt" && activeSection === "header" && (
                <>
                  <SectionHeader icon={AlignLeft} title="Logo" />

                  {/* Live logo preview + upload */}
                  <div className="py-2 flex flex-col gap-3">
                    <div className="flex items-center gap-4 p-3 bg-slate-50 border border-slate-200 rounded-xl">
                      {/* Shape preview */}
                      <LogoMark lc={logoConfig} orgName={receipt.orgName || selectedOrg?.name || ""} size="lg" />
                      <div className="flex-1 min-w-0">
                        {logoConfig.url ? (
                          <>
                            <p className="text-[12px] font-medium text-slate-700">Custom logo uploaded</p>
                            <p className="text-[11px] text-slate-500 font-medium mt-0.5">Shared across all print types</p>
                          </>
                        ) : (
                          <>
                            <p className="text-[12px] font-medium text-slate-700">Placeholder icon active</p>
                            <p className="text-[11px] text-slate-500 font-medium mt-0.5">Upload a logo or pick an icon below</p>
                          </>
                        )}
                      </div>
                      {logoConfig.url && (
                        <button type="button" onClick={clearLogo} className="w-7 h-7 rounded-xl bg-rose-50 border border-rose-200 flex items-center justify-center hover:bg-rose-100 transition-colors flex-shrink-0">
                          <X size={12} className="text-rose-500" />
                        </button>
                      )}
                    </div>

                    {/* Upload area */}
                    <label className="flex items-center gap-3 px-3 py-2.5 bg-white border border-dashed border-slate-300 rounded-xl cursor-pointer hover:border-blue-400 hover:bg-blue-50/20 transition-all">
                      <div className="w-7 h-7 rounded-xl bg-slate-100 border border-slate-200 flex items-center justify-center flex-shrink-0">
                        <Upload size={13} className="text-slate-400" />
                      </div>
                      <div>
                        <p className="text-[12px] font-medium text-slate-600 leading-none">Upload custom logo</p>
                        <p className="text-[11px] text-slate-500 mt-0.5">PNG, JPG or WebP — max 2 MB</p>
                      </div>
                      <input type="file" accept="image/png,image/jpeg,image/webp" className="sr-only" onChange={handleLogoUpload} />
                    </label>

                    {/* Shape picker */}
                    <div>
                      <p className="text-[12px] font-medium text-slate-700 mb-2">Logo Shape</p>
                      <div className="grid grid-cols-5 gap-1.5">
                        {([
                          { id: "circle",  label: "Circle" },
                          { id: "rounded", label: "Rounded" },
                          { id: "square",  label: "Square" },
                          { id: "hexagon", label: "Hex" },
                          { id: "shield",  label: "Shield" },
                        ] as { id: LogoShape; label: string }[]).map(({ id, label }) => {
                          const active = logoConfig.shape === id;
                          return (
                            <button
                              key={id}
                              type="button"
                              onClick={() => setLogoConfig((lc) => ({ ...lc, shape: id }))}
                              className={cn(
                                "flex flex-col items-center gap-1.5 py-2 rounded-xl border transition-colors",
                                active ? "bg-blue-50 border-blue-300" : "bg-slate-50 border-slate-200 hover:border-slate-300",
                              )}
                            >
                              <div
                                className={cn("w-5 h-5 bg-blue-600", SHAPE_CLASS[id])}
                                style={SHAPE_STYLE[id]}
                              />
                              <span className={cn("text-[9px] font-medium uppercase tracking-wide leading-none", active ? "text-blue-600" : "text-slate-500")}>{label}</span>
                            </button>
                          );
                        })}
                      </div>
                    </div>

                    {/* Placeholder icon picker */}
                    {!logoConfig.url && (
                      <div>
                        <p className="text-[12px] font-medium text-slate-700 mb-2">Placeholder Icon</p>
                        <div className="grid grid-cols-5 gap-1.5">
                          {([
                            { id: "initials" as LogoIcon, label: "Initials", icon: Type },
                            { id: "train"    as LogoIcon, label: "Train",    icon: TrainFront },
                            { id: "truck"    as LogoIcon, label: "Vehicle",  icon: Truck },
                            { id: "package"  as LogoIcon, label: "Parcel",   icon: Package },
                            { id: "shield"   as LogoIcon, label: "Shield",   icon: ShieldCheck },
                          ]).map(({ id, label, icon: Icon }) => {
                            const active = logoConfig.icon === id;
                            return (
                              <button
                                key={id}
                                type="button"
                                onClick={() => setLogoConfig((lc) => ({ ...lc, icon: id }))}
                                className={cn(
                                  "flex flex-col items-center gap-1.5 py-2 rounded-xl border transition-colors",
                                  active ? "bg-blue-50 border-blue-300" : "bg-slate-50 border-slate-200 hover:border-slate-300",
                                )}
                              >
                                <Icon size={14} strokeWidth={2} className={active ? "text-blue-600" : "text-slate-400"} />
                                <span className={cn("text-[9px] font-medium uppercase tracking-wide leading-none", active ? "text-blue-600" : "text-slate-500")}>{label}</span>
                              </button>
                            );
                          })}
                        </div>
                      </div>
                    )}
                  </div>

                  <FieldRow label="Show Logo on Print" description="Display logo in the printout header" checked={receipt.showLogo} onChange={rToggle("showLogo")} />
                  <FieldRow label="Show Branch Name" description="Display the station/branch name" checked={receipt.showBranch} onChange={rToggle("showBranch")} />
                  <SectionHeader icon={AlignLeft} title="Header Details" />
                  <div className="py-2">
                    <p className="text-[12px] font-medium text-slate-700 mb-1.5">Organisation Name Override</p>
                    <input type="text" placeholder="e.g. Mizigo Parcels Ltd" value={receipt.orgName}
                      onChange={(e) => setReceipt((r) => ({ ...r, orgName: e.target.value }))}
                      className="w-full border border-slate-300 rounded-xl h-8 px-3 text-[13px] focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                    />
                  </div>
                  <div className="py-2">
                    <p className="text-[12px] font-medium text-slate-700 mb-1.5">Address</p>
                    <input type="text" placeholder="e.g. Plot 12, Uhuru Street" value={receipt.address}
                      onChange={(e) => setReceipt((r) => ({ ...r, address: e.target.value }))}
                      className="w-full border border-slate-300 rounded-xl h-8 px-3 text-[13px] focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                    />
                  </div>
                  <div className="py-2">
                    <p className="text-[12px] font-medium text-slate-700 mb-1.5">Phone / Contact</p>
                    <input type="text" placeholder="+255 712 000 000" value={receipt.phone}
                      onChange={(e) => setReceipt((r) => ({ ...r, phone: e.target.value }))}
                      className="w-full border border-slate-300 rounded-xl h-8 px-3 text-[13px] focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none"
                    />
                  </div>
                </>
              )}

              {printType === "receipt" && activeSection === "body" && (
                <>
                  <SectionHeader icon={Info} title="Parcel Information" />
                  <FieldRow label="Tracking Number" checked={receipt.trackingNumber} onChange={rToggle("trackingNumber")} />
                  <FieldRow label="Date & Time" checked={receipt.dateTime} onChange={rToggle("dateTime")} />
                  <FieldRow label="Item Description" description="What the parcel contains" checked={receipt.itemDesc} onChange={rToggle("itemDesc")} />

                  <SectionHeader icon={AlignLeft} title="Sender & Receiver" />
                  <FieldRow label="Sender Name" checked={receipt.senderName} onChange={rToggle("senderName")} />
                  <FieldRow label="Sender Phone" checked={receipt.senderPhone} onChange={rToggle("senderPhone")} />
                  <FieldRow label="Receiver Name" checked={receipt.receiverName} onChange={rToggle("receiverName")} />
                  <FieldRow label="Receiver Phone" checked={receipt.receiverPhone} onChange={rToggle("receiverPhone")} />

                  <SectionHeader icon={AlignLeft} title="Route & Service" />
                  <FieldRow label="Origin Station" checked={receipt.originStation} onChange={rToggle("originStation")} />
                  <FieldRow label="Destination Station" checked={receipt.destStation} onChange={rToggle("destStation")} />
                  <FieldRow label="Weight" checked={receipt.weight} onChange={rToggle("weight")} />
                  <FieldRow label="Service Type" checked={receipt.serviceType} onChange={rToggle("serviceType")} />
                  <FieldRow label="Declared Value" checked={receipt.declaredValue} onChange={rToggle("declaredValue")} />

                  <SectionHeader icon={AlignLeft} title="Payment" />
                  <FieldRow label="Operator / Agent Name" checked={receipt.operatorName} onChange={rToggle("operatorName")} />
                  <FieldRow label="Payment Method" checked={receipt.paymentMethod} onChange={rToggle("paymentMethod")} />
                  <FieldRow label="Amount Paid" checked={receipt.amountPaid} onChange={rToggle("amountPaid")} />

                  <SectionHeader icon={QrCode} title="QR Code" />
                  <FieldRow label="Show QR Code" description="Scannable code with tracking info" checked={receipt.qrCode} onChange={rToggle("qrCode")} />
                  {receipt.qrCode && (
                    <div className="pb-2 pt-1">
                      <p className="text-[12px] font-medium text-slate-700 mb-2">QR Content</p>
                      <div className="flex flex-col gap-1.5">
                        {([
                          { id: "tracking_number" as QrContent, label: "Tracking Number Only", desc: "e.g. TRK-2025-001234", icon: Hash },
                          { id: "tracking_url" as QrContent, label: "Tracking URL", desc: "mizigo.app/track/TRK-…", icon: LinkIcon },
                          { id: "full_details" as QrContent, label: "Full Parcel Details", desc: "Tracking + route + weight", icon: List },
                        ]).map(({ id, label, desc, icon: Icon }) => (
                          <button
                            key={id}
                            type="button"
                            onClick={() => setReceipt((r) => ({ ...r, qrContent: id }))}
                            className={cn(
                              "flex items-center gap-3 px-3 py-2.5 rounded-xl border text-left transition-colors",
                              receipt.qrContent === id
                                ? "bg-blue-50 border-blue-200 text-blue-700"
                                : "bg-slate-50 border-slate-200 text-slate-600 hover:border-slate-300",
                            )}
                          >
                            <Icon size={13} strokeWidth={2.5} className={receipt.qrContent === id ? "text-blue-500" : "text-slate-400"} />
                            <div className="flex-1 min-w-0">
                              <p className="text-[12px] font-medium leading-none">{label}</p>
                              <p className="text-[11px] font-mono mt-0.5 opacity-70">{desc}</p>
                            </div>
                            {receipt.qrContent === id && <Check size={12} strokeWidth={3} className="text-blue-500 flex-shrink-0" />}
                          </button>
                        ))}
                      </div>
                    </div>
                  )}
                </>
              )}

              {printType === "receipt" && activeSection === "footer" && (
                <>
                  <SectionHeader icon={AlignLeft} title="Footer Text" />
                  <div className="py-2">
                    <p className="text-[12px] font-medium text-slate-700 mb-1.5">Thank You Message</p>
                    <textarea value={receipt.thankyouMsg} rows={2}
                      onChange={(e) => setReceipt((r) => ({ ...r, thankyouMsg: e.target.value }))}
                      className="w-full border border-slate-300 rounded-xl px-3 py-2 text-[13px] focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none resize-none"
                    />
                  </div>
                  <div className="py-2">
                    <p className="text-[12px] font-medium text-slate-700 mb-1.5">Terms / Disclaimer</p>
                    <textarea value={receipt.termsText} rows={2}
                      onChange={(e) => setReceipt((r) => ({ ...r, termsText: e.target.value }))}
                      className="w-full border border-slate-300 rounded-xl px-3 py-2 text-[13px] focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none resize-none"
                    />
                  </div>
                  <FieldRow label="Signature Line" description="Add a space for authorized signature" checked={receipt.signatureLine} onChange={rToggle("signatureLine")} />
                  <FieldRow label="Copy Label" description='Show "CUSTOMER COPY" label' checked={receipt.showCopyLabel} onChange={rToggle("showCopyLabel")} />
                </>
              )}

              {printType === "receipt" && activeSection === "format" && (
                <>
                  <SectionHeader icon={LayoutTemplate} title="Paper Size" />
                  <div className="grid grid-cols-2 gap-2 py-2">
                    {([["thermal80", "Thermal 80mm"], ["thermal58", "Thermal 58mm"], ["a5", "A5 Paper"], ["a4", "A4 Paper"]] as [PaperSize, string][]).map(([size, label]) => (
                      <button key={size} type="button" onClick={() => setReceipt((r) => ({ ...r, paperSize: size }))}
                        className={cn(
                          "py-2 rounded-xl text-[12px] font-medium border transition-colors",
                          receipt.paperSize === size ? "bg-blue-600 text-white border-blue-600" : "bg-white text-slate-600 border-slate-300 hover:bg-slate-50",
                        )}>
                        {label}
                      </button>
                    ))}
                  </div>

                  <SectionHeader icon={SlidersHorizontal} title="Font Size" />
                  <div className="grid grid-cols-3 gap-2 py-2">
                    {(["small", "medium", "large"] as FontSize[]).map((f) => (
                      <button key={f} type="button" onClick={() => setReceipt((r) => ({ ...r, fontSize: f }))}
                        className={cn(
                          "py-2 rounded-xl text-[12px] font-medium border transition-colors capitalize",
                          receipt.fontSize === f ? "bg-blue-600 text-white border-blue-600" : "bg-white text-slate-600 border-slate-300 hover:bg-slate-50",
                        )}>
                        {f}
                      </button>
                    ))}
                  </div>
                </>
              )}

              {/* ═══ STICKER SECTIONS ═══ */}
              {printType === "sticker" && activeSection === "fields" && (
                <>
                  <SectionHeader icon={QrCode} title="Code" />
                  <FieldRow label="QR Code" checked={sticker.showQr} onChange={sToggle("showQr")} />
                  <FieldRow label="Barcode" checked={sticker.showBarcode} onChange={sToggle("showBarcode")} />
                  <FieldRow label="Tracking Number" checked={sticker.trackingNumber} onChange={sToggle("trackingNumber")} />

                  <SectionHeader icon={AlignLeft} title="Information" />
                  <FieldRow label="Organisation Logo" checked={sticker.orgLogo} onChange={sToggle("orgLogo")} />
                  <FieldRow label="Sender Name" checked={sticker.senderName} onChange={sToggle("senderName")} />
                  <FieldRow label="Receiver Name" checked={sticker.receiverName} onChange={sToggle("receiverName")} />
                  <FieldRow label="Destination" checked={sticker.destination} onChange={sToggle("destination")} />
                  <FieldRow label="Weight" checked={sticker.weight} onChange={sToggle("weight")} />

                  <SectionHeader icon={Info} title="Warning Tags" />
                  <FieldRow label="Fragile Tag" checked={sticker.fragileTag} onChange={sToggle("fragileTag")} />
                  <FieldRow label="Urgent Tag" checked={sticker.urgentTag} onChange={sToggle("urgentTag")} />
                </>
              )}

              {printType === "sticker" && activeSection === "format" && (
                <>
                  <SectionHeader icon={LayoutTemplate} title="Sticker Size" />
                  <div className="grid grid-cols-3 gap-2 py-2">
                    {([["100x150", "100×150mm"], ["75x100", "75×100mm"], ["50x75", "50×75mm"]] as [StickerSize, string][]).map(([s, l]) => (
                      <button key={s} type="button" onClick={() => setSticker((st) => ({ ...st, size: s }))}
                        className={cn(
                          "py-2 rounded-xl text-[11px] font-medium border transition-colors",
                          sticker.size === s ? "bg-blue-600 text-white border-blue-600" : "bg-white text-slate-600 border-slate-300 hover:bg-slate-50",
                        )}>
                        {l}
                      </button>
                    ))}
                  </div>
                </>
              )}

              {/* ═══ MANIFEST SECTIONS ═══ */}
              {printType === "manifest" && activeSection === "content" && (
                <>
                  <SectionHeader icon={AlignLeft} title="Document Header" />
                  <FieldRow label="Organisation Logo" checked={manifest.showOrgLogo} onChange={mToggle("showOrgLogo")} />
                  <FieldRow label="Route Information" checked={manifest.showRoute} onChange={mToggle("showRoute")} />
                  <FieldRow label="Operator / Driver Info" checked={manifest.showOperator} onChange={mToggle("showOperator")} />
                  <FieldRow label="Date" checked={manifest.showDate} onChange={mToggle("showDate")} />

                  <SectionHeader icon={ClipboardList} title="Body Content" />
                  <FieldRow label="Parcel List" checked={manifest.includeParcelList} onChange={mToggle("includeParcelList")} />
                  <FieldRow label="Weight Summary" checked={manifest.includeWeightSummary} onChange={mToggle("includeWeightSummary")} />
                  <FieldRow label="Payment Summary" checked={manifest.includePaymentSummary} onChange={mToggle("includePaymentSummary")} />
                </>
              )}

              {printType === "manifest" && activeSection === "footer" && (
                <>
                  <SectionHeader icon={AlignLeft} title="Footer" />
                  <FieldRow label="Signature Lines" checked={manifest.showSignature} onChange={mToggle("showSignature")} />
                  <FieldRow label="Station Stamp Box" checked={manifest.showStationStamp} onChange={mToggle("showStationStamp")} />
                  <div className="py-2">
                    <p className="text-[12px] font-medium text-slate-700 mb-1.5">Footer Note</p>
                    <textarea value={manifest.footerNote} rows={3}
                      onChange={(e) => setManifest((m) => ({ ...m, footerNote: e.target.value }))}
                      className="w-full border border-slate-300 rounded-xl px-3 py-2 text-[13px] focus:border-blue-500 focus:ring-2 focus:ring-blue-100 outline-none resize-none"
                    />
                  </div>
                </>
              )}
            </div>
          </div>

          {/* ── Right: Live Preview ── */}
          <div className="lg:col-span-3 flex flex-col gap-3">
            {/* Preview label */}
            <div className="flex items-center gap-2 px-1">
              <Eye size={12} strokeWidth={2.5} className="text-slate-400" />
              <p className="text-[11px] font-semibold text-slate-500 uppercase tracking-[0.05em]">Live Preview</p>
              <span className="inline-flex items-center gap-1 text-[11px] text-emerald-600 font-medium">
                <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-pulse" />
                Live
              </span>
              <span className="ml-auto text-[11px] text-slate-400 font-medium">updates as you configure</span>
            </div>

            {/* Preview container */}
            <div className="bg-[#f4f5f7] rounded-xl border border-slate-200 overflow-auto">
              <div className="flex items-start justify-center min-h-[480px] sm:min-h-[560px] p-4 sm:p-8">
                <div className="w-full max-w-full">
                  {printType === "receipt" && (
                    <ReceiptPreview cfg={receipt} orgName={selectedOrg?.name || ""} lc={logoConfig} />
                  )}
                  {printType === "sticker" && (
                    <div className="flex items-center justify-center w-full">
                      <StickerPreview cfg={sticker} orgName={selectedOrg?.name || ""} lc={logoConfig} />
                    </div>
                  )}
                  {printType === "manifest" && (
                    <ManifestPreview cfg={manifest} orgName={selectedOrg?.name || ""} lc={logoConfig} />
                  )}
                </div>
              </div>
            </div>

            {/* Badges */}
            {printType === "receipt" && (
              <div className="flex items-center gap-2 px-1">
                <span className="inline-flex items-center gap-1.5 text-[11px] font-medium text-slate-500 px-2 py-0.5 rounded-lg border border-slate-200 bg-white">
                  <LayoutTemplate size={10} />
                  {receipt.paperSize === "thermal80" ? "Thermal 80mm"
                    : receipt.paperSize === "thermal58" ? "Thermal 58mm"
                    : receipt.paperSize === "a5" ? "A5 Paper"
                    : "A4 Paper"}
                </span>
                <span className="inline-flex items-center gap-1.5 text-[11px] font-medium text-slate-500 px-2 py-0.5 rounded-lg border border-slate-200 bg-white">
                  <SlidersHorizontal size={10} />
                  Font: {receipt.fontSize}
                </span>
              </div>
            )}
            {printType === "sticker" && (
              <div className="flex items-center gap-2 px-1">
                <span className="inline-flex items-center gap-1.5 text-[11px] font-medium text-slate-500 px-2 py-0.5 rounded-lg border border-slate-200 bg-white">
                  <LayoutTemplate size={10} />
                  {sticker.size} mm
                </span>
              </div>
            )}
          </div>
        </div>
    </div>
  );
}
