import { Sidebar } from "@/components/layout/sidebar";
import { Topbar } from "@/components/layout/topbar";
import { SessionLock } from "@/components/auth/session-lock";

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="flex h-screen overflow-hidden bg-[#F8F9FC]">
      <SessionLock />
      <Sidebar />
      <div className="flex-1 flex flex-col overflow-hidden lg:ml-72">
        <Topbar />
        <main className="flex-1 overflow-y-auto px-4 pt-3 pb-4 sm:px-8 sm:pt-4 sm:pb-8 lg:px-10 lg:pt-5 lg:pb-10">
          {children}
        </main>
      </div>
    </div>
  );
}
