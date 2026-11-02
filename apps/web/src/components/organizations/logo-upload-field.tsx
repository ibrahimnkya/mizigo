"use client";

import { useRef, useState } from "react";
import { UploadCloud, Link2, Loader2, Sparkles, X } from "lucide-react";
import { Input } from "@repo/ui/input";
import { cn } from "@/lib/utils";

interface ExtractedColors {
  primary: string;
  secondary: string;
}

interface LogoUploadFieldProps {
  value: string;
  onChange: (dataUrlOrEmpty: string) => void;
  onColorsExtracted?: (colors: ExtractedColors) => void;
  label?: string;
}

const MAX_DIMENSION = 256;
const MAX_FILE_BYTES = 5 * 1024 * 1024; // 5MB, pre-compression

function toHex(c: { r: number; g: number; b: number }) {
  return (
    "#" +
    [c.r, c.g, c.b].map((v) => v.toString(16).padStart(2, "0")).join("")
  );
}

function hueOf(c: { r: number; g: number; b: number }) {
  const r = c.r / 255,
    g = c.g / 255,
    b = c.b / 255;
  const max = Math.max(r, g, b),
    min = Math.min(r, g, b);
  if (max === min) return 0;
  const d = max - min;
  let h = 0;
  switch (max) {
    case r:
      h = (g - b) / d + (g < b ? 6 : 0);
      break;
    case g:
      h = (b - r) / d + 2;
      break;
    default:
      h = (r - g) / d + 4;
  }
  return h * 60;
}

/** Samples canvas pixels to suggest a primary/secondary brand color pair from a logo image. */
function extractPalette(
  ctx: CanvasRenderingContext2D,
  width: number,
  height: number,
): ExtractedColors | null {
  let imageData: ImageData;
  try {
    imageData = ctx.getImageData(0, 0, width, height);
  } catch {
    // Cross-origin image (e.g. a pasted external URL) taints the canvas —
    // extraction isn't possible, but the logo itself is still usable.
    return null;
  }

  const data = imageData.data;
  const buckets = new Map<
    string,
    { count: number; r: number; g: number; b: number }
  >();

  for (let i = 0; i < data.length; i += 4) {
    const r = data[i] as number;
    const g = data[i + 1] as number;
    const b = data[i + 2] as number;
    const a = data[i + 3] as number;
    if (a < 128) continue; // skip transparent pixels

    const max = Math.max(r, g, b),
      min = Math.min(r, g, b);
    const lightness = (max + min) / 2;
    if (lightness > 235 || lightness < 20) continue; // skip near-white/near-black background

    const sat = max === min ? 0 : (max - min) / (255 - Math.abs(2 * lightness - 255));
    if (sat < 0.15) continue; // skip near-gray, prefer vivid brand colors

    const qr = Math.round(r / 24) * 24;
    const qg = Math.round(g / 24) * 24;
    const qb = Math.round(b / 24) * 24;
    const key = `${qr},${qg},${qb}`;
    const bucket = buckets.get(key);
    if (bucket) bucket.count++;
    else buckets.set(key, { count: 1, r: qr, g: qg, b: qb });
  }

  const sorted = Array.from(buckets.values()).sort((a, b) => b.count - a.count);
  if (sorted.length === 0) return null;

  const primary = sorted[0]!;
  const primaryHue = hueOf(primary);
  const secondary =
    sorted.find((c) => Math.abs(hueOf(c) - primaryHue) > 30) ??
    sorted[1] ??
    primary;

  return { primary: toHex(primary), secondary: toHex(secondary) };
}

function loadImage(src: string, crossOrigin?: "anonymous"): Promise<HTMLImageElement> {
  return new Promise((resolve, reject) => {
    const img = new window.Image();
    if (crossOrigin) img.crossOrigin = crossOrigin;
    img.onload = () => resolve(img);
    img.onerror = () => reject(new Error("Could not load image"));
    img.src = src;
  });
}

async function processImage(
  src: string,
  crossOrigin?: "anonymous",
): Promise<{ dataUrl: string; colors: ExtractedColors | null }> {
  const img = await loadImage(src, crossOrigin);
  const scale = Math.min(1, MAX_DIMENSION / Math.max(img.width, img.height));
  const width = Math.max(1, Math.round(img.width * scale));
  const height = Math.max(1, Math.round(img.height * scale));

  const canvas = document.createElement("canvas");
  canvas.width = width;
  canvas.height = height;
  const ctx = canvas.getContext("2d");
  if (!ctx) throw new Error("Canvas unsupported");
  ctx.drawImage(img, 0, 0, width, height);

  const colors = extractPalette(ctx, width, height);
  const dataUrl = canvas.toDataURL("image/png");
  return { dataUrl, colors };
}

export function LogoUploadField({
  value,
  onChange,
  onColorsExtracted,
  label = "Logo",
}: LogoUploadFieldProps) {
  const fileInputRef = useRef<HTMLInputElement>(null);
  const [showUrlInput, setShowUrlInput] = useState(false);
  const [urlDraft, setUrlDraft] = useState("");
  const [processing, setProcessing] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [extractedNote, setExtractedNote] = useState<string | null>(null);

  const handleFile = async (file: File) => {
    setError(null);
    setExtractedNote(null);

    if (!file.type.startsWith("image/")) {
      setError("Please choose an image file");
      return;
    }
    if (file.size > MAX_FILE_BYTES) {
      setError("Image is too large (max 5MB)");
      return;
    }

    setProcessing(true);
    try {
      const objectUrl = URL.createObjectURL(file);
      const { dataUrl, colors } = await processImage(objectUrl);
      URL.revokeObjectURL(objectUrl);

      onChange(dataUrl);
      if (colors) {
        onColorsExtracted?.(colors);
        setExtractedNote("Brand colors suggested from your logo");
      } else {
        setExtractedNote(null);
      }
    } catch {
      setError("Couldn't process that image. Try a different file.");
    } finally {
      setProcessing(false);
    }
  };

  const handleUrlSubmit = async () => {
    const url = urlDraft.trim();
    if (!url) return;
    setError(null);
    setExtractedNote(null);
    setProcessing(true);
    try {
      // Attempt CORS-enabled load so we can still extract colors when the
      // remote host allows it; if not, extraction is silently skipped.
      const { dataUrl, colors } = await processImage(url, "anonymous");
      onChange(dataUrl);
      if (colors) {
        onColorsExtracted?.(colors);
        setExtractedNote("Brand colors suggested from your logo");
      } else {
        setExtractedNote(
          "Logo saved — that host doesn't allow automatic color extraction",
        );
      }
    } catch {
      // Fall back to just using the URL directly as the logo source.
      onChange(url);
      setExtractedNote(null);
    } finally {
      setProcessing(false);
      setShowUrlInput(false);
      setUrlDraft("");
    }
  };

  const clear = () => {
    onChange("");
    setError(null);
    setExtractedNote(null);
  };

  return (
    <div className="space-y-3">
      <div className="flex items-center justify-between">
        <span className="text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] ml-1">
          {label}
        </span>
        <button
          type="button"
          onClick={() => setShowUrlInput((v) => !v)}
          className="text-[9px] font-bold uppercase tracking-[0.05em] text-slate-400 hover:text-blue-600 transition-colors flex items-center gap-1"
        >
          <Link2 className="w-3 h-3" />
          {showUrlInput ? "Cancel" : "Paste URL instead"}
        </button>
      </div>

      {showUrlInput ? (
        <div className="flex gap-2">
          <Input
            value={urlDraft}
            onChange={(e) => setUrlDraft(e.target.value)}
            placeholder="https://cdn.acme.com/logo.png"
            className="h-12 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-xl px-4 text-[13px] font-bold transition-all text-slate-900"
          />
          <button
            type="button"
            onClick={handleUrlSubmit}
            disabled={!urlDraft.trim() || processing}
            className="shrink-0 h-12 px-4 bg-[#5C0B19] hover:bg-[#4F0A0C] text-white rounded-xl text-[11px] font-semibold uppercase tracking-[0.05em] transition-all disabled:opacity-40"
          >
            {processing ? <Loader2 className="w-4 h-4 animate-spin" /> : "Use"}
          </button>
        </div>
      ) : (
        <div
          onClick={() => !processing && fileInputRef.current?.click()}
          className={cn(
            "relative border-2 border-dashed rounded-xl transition-all cursor-pointer",
            value
              ? "border-slate-100 bg-slate-50 p-4"
              : "border-slate-200 hover:border-blue-400 hover:bg-blue-50/30 p-8 flex flex-col items-center justify-center gap-2 text-center",
          )}
        >
          <input
            ref={fileInputRef}
            type="file"
            accept="image/*"
            className="hidden"
            onChange={(e) => {
              const file = e.target.files?.[0];
              if (file) handleFile(file);
              e.target.value = "";
            }}
          />

          {processing ? (
            <div className="flex items-center gap-2 py-6 text-slate-400">
              <Loader2 className="w-5 h-5 animate-spin" />
              <span className="text-[11px] font-bold uppercase tracking-[0.05em]">
                Processing logo…
              </span>
            </div>
          ) : value ? (
            <div className="flex items-center gap-4">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src={value}
                alt="Logo preview"
                className="h-14 w-14 object-contain rounded-xl bg-white border border-slate-100 shrink-0"
              />
              <div className="flex-1 min-w-0">
                <p className="text-[11px] font-semibold text-slate-700 uppercase tracking-[0.05em]">
                  Logo ready
                </p>
                <p className="text-[10px] font-bold text-slate-400 mt-0.5">
                  Click to replace
                </p>
              </div>
              <button
                type="button"
                onClick={(e) => {
                  e.stopPropagation();
                  clear();
                }}
                className="shrink-0 w-8 h-8 rounded-xl bg-white border border-slate-100 text-slate-400 hover:text-rose-600 hover:border-rose-200 flex items-center justify-center transition-colors"
              >
                <X className="w-4 h-4" />
              </button>
            </div>
          ) : (
            <>
              <div className="w-10 h-10 rounded-full bg-blue-50 flex items-center justify-center text-blue-500">
                <UploadCloud className="w-5 h-5" />
              </div>
              <p className="text-[11px] font-semibold text-slate-600 uppercase tracking-[0.05em]">
                Upload your logo
              </p>
              <p className="text-[10px] font-bold text-slate-400">
                PNG, JPG or SVG · we'll suggest brand colors automatically
              </p>
            </>
          )}
        </div>
      )}

      {extractedNote && (
        <div className="flex items-center gap-1.5 text-[10px] font-bold text-emerald-600">
          <Sparkles className="w-3 h-3" />
          {extractedNote}
        </div>
      )}
      {error && (
        <p className="text-[10px] font-bold text-rose-600">{error}</p>
      )}
    </div>
  );
}
