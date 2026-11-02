import Image from "next/image";
import Link from "next/link";

/** Public site footer — shared by the landing and tracking pages. */
export function SiteFooter() {
  return (
    <footer className="shrink-0 border-t border-[#E2E2E2] bg-white">
      <div className="mx-auto flex w-full max-w-6xl flex-col items-center justify-between gap-4 px-5 py-5 sm:flex-row sm:px-8">
        <div className="flex items-center gap-3">
          <Image src="/brand/logo_icon.png" alt="" width={32} height={32} className="h-8 w-8" />
          <Image src="/brand/logo_text_dark.png" alt="MiziGO" width={90} height={28} className="h-6 w-auto" />
        </div>
        <div className="flex items-center gap-6 text-[14px] text-slate-500">
          <Link href="/terms" className="transition hover:text-orange-600">
            Terms
          </Link>
          <Link href="/privacy" className="transition hover:text-orange-600">
            Privacy
          </Link>
          <Link href="/login" className="transition hover:text-orange-600">
            Staff sign in
          </Link>
        </div>
        <p className="text-[13px] text-slate-400">© {new Date().getFullYear()} MiziGO</p>
      </div>
    </footer>
  );
}
