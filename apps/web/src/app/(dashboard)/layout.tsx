import { Sidebar } from "@/components/layout/sidebar";
import { Topbar } from "@/components/layout/topbar";
import { SessionLock } from "@/components/auth/session-lock";
import { BrandingProvider } from "@/providers/branding-provider";

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <BrandingProvider>
      <div className="flex h-screen overflow-hidden bg-[#F3F3F3]">
        <SessionLock />
        <Sidebar />
        <div className="flex-1 flex flex-col overflow-hidden lg:ml-60">
          <Topbar />
          <main className="flex-1 overflow-y-auto px-4 pt-4 pb-4 sm:px-6 sm:pt-5 sm:pb-6 lg:px-8 lg:pt-6 lg:pb-8">
            {children}
          </main>
        </div>
      </div>
    </BrandingProvider>
  );
}
