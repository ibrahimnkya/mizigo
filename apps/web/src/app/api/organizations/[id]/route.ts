import { NextResponse } from "next/server";
import { prisma } from "@repo/database";
import { auth } from "@/auth";

export async function PUT(
  request: Request,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    const { id } = await params;
    console.log(`[API Proxy] PUT Organization ID: ${id}`);

    const session = await auth();
    if (!session?.user || session.user.role !== "SUPER_ADMIN") {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const body = await request.json();

    const response = await fetch(
      `${process.env.NEXT_PUBLIC_API_URL || "http://localhost:3001/api/v1"}/organizations/${id}`,
      {
        method: "PUT",
        headers: {
          Authorization: `Bearer ${(session.user as any).token}`,
          "Content-Type": "application/json",
        },
        body: JSON.stringify(body),
      },
    );

    const result = await response.json();
    if (!response.ok)
      throw new Error(result.error?.message || "Failed to update organization");

    return NextResponse.json(result.data);
  } catch (error: any) {
    console.error("Error updating organization:", error);
    return NextResponse.json(
      { error: error.message || "Internal Server Error" },
      { status: 500 },
    );
  }
}

export async function DELETE(
  request: Request,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    const { id } = await params;
    console.log(`[API Proxy] DELETE Organization ID: ${id}`);

    const session = await auth();
    if (!session?.user || session.user.role !== "SUPER_ADMIN") {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const response = await fetch(
      `${process.env.NEXT_PUBLIC_API_URL || "http://localhost:3001/api/v1"}/organizations/${id}`,
      {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${(session.user as any).token}`,
          "Content-Type": "application/json",
        },
      },
    );

    const result = await response.json();
    if (!response.ok)
      throw new Error(result.error?.message || "Failed to delete organization");

    return NextResponse.json(result.data);
  } catch (error: any) {
    console.error("Error deleting organization:", error);
    return NextResponse.json(
      { error: error.message || "Internal Server Error" },
      { status: 500 },
    );
  }
}
