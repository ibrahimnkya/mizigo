import { type ClassValue, clsx } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

export function getInternalUrl(path: string): string {
  if (typeof window !== "undefined") {
    return path; // Client-side can use relative paths
  }
  const envUrl = process.env.AUTH_URL || process.env.NEXTAUTH_URL || "http://localhost:3000";
  try {
    const origin = new URL(envUrl).origin;
    return `${origin}${path}`;
  } catch {
    return `http://localhost:3000${path}`;
  }
}

