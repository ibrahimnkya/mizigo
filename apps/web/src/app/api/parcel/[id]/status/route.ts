import { NextResponse } from "next/server";
import { prisma } from "@repo/database";
import { auth } from "@/auth";

/**
 * GET /api/parcel/[id]/status
 * Lightweight polling endpoint for mobile app to check parcel status.
 */
export async function GET(
  request: Request,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    const session = await auth();
    if (!session?.user) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const { id } = await params;

    const parcel = await prisma.parcel.findUnique({
      where: { id },
      select: {
        id: true,
        status: true,
        rejectionReason: true,
        reason: true,
        amount: true,
        updatedAt: true,
        payment: {
          select: {
            id: true,
            status: true,
            amount: true,
            paymentMethod: true,
            paidAt: true,
          },
        },
      },
    });

    if (!parcel) {
      return NextResponse.json(
        { error: "Parcel request not found" },
        { status: 404 },
      );
    }

    return NextResponse.json({
      id: parcel.id,
      status: parcel.status,
      rejectionReason: parcel.rejectionReason ?? parcel.reason,
      amount: parcel.amount,
      updatedAt: parcel.updatedAt,
      payment: parcel.payment,
      // UI hint for mobile
      uiState: getUiState(parcel.status as string),
    });
  } catch (error) {
    console.error("Error fetching parcel status:", error);
    return NextResponse.json(
      { error: "Internal Server Error" },
      { status: 500 },
    );
  }
}

function getUiState(status: string) {
  const map: Record<string, { message: string; action: string | null }> = {
    PENDING: { message: "Waiting for admin approval...", action: null },
    APPROVED: { message: "Approved! Preparing payment...", action: "WAIT" },
    PAYMENT_PENDING: { message: "Payment required to proceed.", action: "PAY" },
    PAID: {
      message: "Payment confirmed! Your parcel is being arranged.",
      action: "VIEW_RECEIPT",
    },
    COMPLETED: {
      message: "Delivered! Your parcel has been completed.",
      action: "REVIEW",
    },
    REJECTED: { message: "Your request was rejected.", action: "VIEW_REASON" },
  };
  return map[status] ?? { message: "Unknown status", action: null };
}
