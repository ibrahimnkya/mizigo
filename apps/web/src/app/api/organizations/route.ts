import { NextResponse } from "next/server";
import { prisma } from "@repo/database";
import { auth } from "@/auth";

export async function GET() {
  try {
    const session = await auth();
    if (!session?.user || session.user.role !== "SUPER_ADMIN") {
      console.warn("[API Proxy] Unauthorized or non-SuperAdmin access attempt");
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const backendUrl = `${process.env.NEXT_PUBLIC_API_URL || "http://localhost:3001/api/v1"}/organizations`;
    const token = (session.user as any).token;

    console.log(`[API Proxy] Fetching from: ${backendUrl}`);
    console.log(`[API Proxy] Token present: ${!!token}`);

    const response = await fetch(backendUrl, {
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      cache: "no-store", // Ensure we get fresh data
    });

    const result = await response.json();
    console.log("[API Proxy] Backend Status:", response.status);
    console.log("[API Proxy] Result Success:", result?.success);
    console.log("[API Proxy] Data Count:", result?.data?.length);

    if (!response.ok) {
      console.error("[API Proxy] Backend Error:", result.error);
      throw new Error(result.error?.message || "Failed to fetch organizations");
    }

    return NextResponse.json(result.data || []);
  } catch (error: any) {
    console.error("[API Proxy] Caught Error:", error.message);
    return NextResponse.json(
      { error: error.message || "Internal Server Error" },
      { status: 500 },
    );
  }
}

export async function POST(request: Request) {
  try {
    const session = await auth();
    if (!session?.user || session.user.role !== "SUPER_ADMIN") {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const body = await request.json();

    const response = await fetch(
      `${process.env.NEXT_PUBLIC_API_URL || "http://localhost:3001/api/v1"}/organizations`,
      {
        method: "POST",
        headers: {
          Authorization: `Bearer ${(session.user as any).token}`,
          "Content-Type": "application/json",
        },
        body: JSON.stringify(body),
      },
    );

    const result = await response.json();
    if (!response.ok)
      throw new Error(result.error?.message || "Failed to create organization");

    return NextResponse.json(result.data, { status: 201 });
  } catch (error: any) {
    console.error("Error creating organization:", error);
    return NextResponse.json(
      { error: error.message || "Internal Server Error" },
      { status: 500 },
    );
  }
}
