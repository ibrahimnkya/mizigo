"use client";

import { PDFDownloadLink } from "@react-pdf/renderer";
import { FileText, Loader2 } from "lucide-react";
import { ReportPDF } from "./report-pdf";

/** PDF export button. Load with next/dynamic (ssr: false) — react-pdf is browser-only. */
export default function PdfDownloadButton({
  title,
  subtitle,
  data,
  columns,
  fileName,
}: {
  title: string;
  subtitle: string;
  data: Record<string, any>[];
  columns: { header: string; key: string; width?: number }[];
  fileName: string;
}) {
  return (
    <PDFDownloadLink document={<ReportPDF title={title} subtitle={subtitle} data={data} columns={columns} />} fileName={fileName}>
      {({ loading }) => (
        <span className="flex h-10 items-center gap-2 rounded-full bg-white/10 px-4 text-[13px] font-semibold text-white transition hover:bg-white/20">
          {loading ? <Loader2 size={15} className="animate-spin" /> : <FileText size={15} className="text-rose-300" />} PDF
        </span>
      )}
    </PDFDownloadLink>
  );
}
