import type { Metadata } from "next";
import { Outfit } from "next/font/google";
import { Toaster } from "@repo/ui/sonner";
import { SessionProvider } from "next-auth/react";
import QueryProvider from "@/lib/api/query-provider";
import "./globals.css";

const outfit = Outfit({ subsets: ["latin"], variable: "--font-outfit" });

export const metadata: Metadata = {
  title: "MiziGO Portal",
  description: "Enterprise Logistics Management System",
  icons: {
    icon: "/brand/logo_icon.png",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className={`${outfit.variable} ${outfit.className}`} suppressHydrationWarning>
        <SessionProvider>
          <QueryProvider>
            {children}
            <Toaster />
          </QueryProvider>
        </SessionProvider>
      </body>
    </html>
  );
}
