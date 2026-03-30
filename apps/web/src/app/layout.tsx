import type { Metadata } from "next";
import { Inter } from "next/font/google"; // Import Inter font
import { Toaster } from "@repo/ui/sonner";
import { SessionProvider } from "next-auth/react";
import "./globals.css";

const inter = Inter({ subsets: ["latin"] }); // Configure Inter font

export const metadata: Metadata = {
  title: "Mizigo Web App",
  description: "Manage cargo requests and deliveries.",
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
          {children}
          <Toaster />
        </SessionProvider>
      </body>
    </html>
  );
}
