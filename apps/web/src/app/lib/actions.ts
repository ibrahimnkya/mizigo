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
    // NEXT_REDIRECT is how Next.js performs navigation after sign-in — must re-throw
    if (
      (error as any).message === "NEXT_REDIRECT" ||
      (error as any).digest?.startsWith("NEXT_REDIRECT")
    ) {
      throw error;
    }

    if (error instanceof AuthError) {
      switch (error.type) {
        case "CredentialsSignin":
          return "Invalid email/phone or access code.";
        case "CallbackRouteError":
          return "Authentication error. Please try again.";
        default:
          return "Something went wrong. Please try again.";
      }
    }

    // Return instead of throw so the form stays mounted and shows the error
    return "Unable to sign in. Please check your credentials and try again.";
  }
}

export async function logout() {
  await signOut({ redirectTo: "/login" });
}
