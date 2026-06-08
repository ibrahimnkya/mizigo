import type { Metadata } from "next";
import { Inter } from "next/font/google"; // Import Inter font
import { Toaster } from "@repo/ui/sonner";
import { SessionProvider } from "next-auth/react";
import QueryProvider from "@/lib/api/query-provider";
import "./globals.css";

const inter = Inter({ subsets: ["latin"] }); // Configure Inter font

export const metadata: Metadata = {
  title: "Mizigo Portal",
  description: "Enterprise Logistics Management System",
  icons: {
    icon: "/icon.png",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className={inter.className} suppressHydrationWarning>
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
