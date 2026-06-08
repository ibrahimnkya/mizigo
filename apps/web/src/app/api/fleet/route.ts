import { NextResponse } from "next/server";
import { prisma } from "@repo/database";
import { auth } from "@/auth";

export async function GET(request: Request) {
  try {
    const session = await auth();
    if (!session?.user) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const isSuperAdmin = session.user.role === "SUPER_ADMIN";
    const where = isSuperAdmin
      ? {}
      : { organizationId: (session.user as any).organizationId || "" };

    const vehicles = await prisma.vehicle.findMany({
      where,
      include: {
        organization: {
          select: {
            name: true,
          },
        },
      },
      orderBy: {
        createdAt: "desc",
      },
    });

    return NextResponse.json({ data: vehicles });
  } catch (error: any) {
    console.error("Error fetching fleet:", error);
    return NextResponse.json(
      { error: "Internal Server Error" },
      { status: 500 },
    );
  }
}

export async function POST(request: Request) {
  try {
    const session = await auth();
    if (
      !session?.user ||
      (session.user.role !== "SUPER_ADMIN" && session.user.role !== "ADMIN")
    ) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const body = await request.json();
    const { plateNumber, type, carrier, organizationId, status } = body;

    if (!plateNumber || !type) {
      return NextResponse.json(
        { error: "Plate number and type are required" },
        { status: 400 },
      );
    }

    const targetOrgId =
      session.user.role === "SUPER_ADMIN"
        ? organizationId
        : (session.user as any).organizationId;

    const vehicle = await prisma.vehicle.create({
      data: {
        plateNumber,
        type,
        carrier,
        organizationId: targetOrgId || undefined,
        status: status || "ACTIVE",
      },
      include: {
        organization: true,
      },
    });

    return NextResponse.json(vehicle, { status: 201 });
  } catch (error: any) {
    console.error("Error creating vehicle:", error);
    return NextResponse.json(
      { error: "Internal Server Error", details: error.message },
      { status: 500 },
    );
  }
}

export async function PATCH(request: Request) {
  try {
    const session = await auth();
    if (
      !session?.user ||
      (session.user.role !== "SUPER_ADMIN" && session.user.role !== "ADMIN")
    ) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const body = await request.json();
    const { id, ...data } = body;

    if (!id) {
      return NextResponse.json(
        { error: "Vehicle ID is required" },
        { status: 400 },
      );
    }

    if (session.user.role !== "SUPER_ADMIN") {
      const existing = await prisma.vehicle.findUnique({ where: { id } });
      if (
        !existing ||
        existing.organizationId !== (session.user as any).organizationId
      ) {
        return NextResponse.json({ error: "Forbidden" }, { status: 403 });
      }
      delete data.organizationId;
    }

    const vehicle = await prisma.vehicle.update({
      where: { id },
      data,
      include: {
        organization: true,
      },
    });

    return NextResponse.json(vehicle);
  } catch (error: any) {
    console.error("Error updating vehicle:", error);
    return NextResponse.json(
      { error: "Internal Server Error" },
      { status: 500 },
    );
  }
}

export async function DELETE(request: Request) {
  try {
    const session = await auth();
    if (
      !session?.user ||
      (session.user.role !== "SUPER_ADMIN" && session.user.role !== "ADMIN")
    ) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const { searchParams } = new URL(request.url);
    const id = searchParams.get("id");

    if (!id) {
      return NextResponse.json(
        { error: "Vehicle ID is required" },
        { status: 400 },
      );
    }

    if (session.user.role !== "SUPER_ADMIN") {
      const existing = await prisma.vehicle.findUnique({ where: { id } });
      if (
        !existing ||
        existing.organizationId !== (session.user as any).organizationId
      ) {
        return NextResponse.json({ error: "Forbidden" }, { status: 403 });
      }
    }

    await prisma.vehicle.delete({
      where: { id },
    });

    return NextResponse.json({ message: "Vehicle deleted successfully" });
  } catch (error: any) {
    console.error("Error deleting vehicle:", error);
    return NextResponse.json(
      { error: "Internal Server Error" },
      { status: 500 },
    );
  }
}
