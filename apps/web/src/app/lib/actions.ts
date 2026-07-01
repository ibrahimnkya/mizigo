"use server";

import { signIn, signOut } from "@/auth";
import { AuthError } from "next-auth";

export async function authenticate(
  prevState: string | undefined,
  formData: FormData,
) {
  try {
    const identifier = formData.get("identifier") as string;
    const otp = formData.get("otp") as string;

    await signIn("credentials", {
      email: identifier,
      otp,
      deviceId: "web-portal-default",
      redirectTo: "/dashboard",
    });
  } catch (error) {
    if (error instanceof AuthError) {
      console.error("AuthError during signin:", error.type);
      switch (error.type) {
        case "CredentialsSignin":
          return "Invalid credentials.";
        default:
          return "Something went wrong.";
      }
    }

    // Next.js redirect throws — must re-throw so navigation completes
    if (
      (error as any).message === "NEXT_REDIRECT" ||
      (error as any).digest?.startsWith("NEXT_REDIRECT")
    ) {
      throw error;
    }

    console.error("Unexpected error during authentication:", error);
    throw error;
  }
}

export async function logout() {
  await signOut({ redirectTo: "/login" });
}
