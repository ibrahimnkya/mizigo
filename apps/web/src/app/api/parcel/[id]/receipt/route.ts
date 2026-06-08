import { NextResponse } from "next/server";
import { prisma } from "@repo/database";
import { auth } from "@/auth";

/**
 * GET /api/parcel/[id]/receipt
 * Returns a full receipt object for a paid parcel request.
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

    const parcel = (await prisma.parcel.findUnique({
      where: { id },
      include: {
        user: {
          select: {
            name: true,
            email: true,
          },
        },
        payment: true,
      },
    })) as any;

    if (!parcel) {
      return NextResponse.json(
        { error: "Parcel request not found" },
        { status: 404 },
      );
    }

    if (!["PAID", "COMPLETED"].includes(parcel.status as string)) {
      return NextResponse.json(
        { error: "Receipt is only available for paid or completed parcel." },
        { status: 400 },
      );
    }

    if (!parcel.payment) {
      return NextResponse.json(
        { error: "No payment record found." },
        { status: 404 },
      );
    }

    const receipt = {
      receiptId: `RCP-${parcel.payment.id.slice(-8).toUpperCase()}`,
      parcelId: parcel.id,
      parcelRef: parcel.id.slice(-6).toUpperCase(),
      status: parcel.status,
      route: {
        from: parcel.fromAddress,
        to: parcel.toAddress,
        pickupType: parcel.pickupType,
      },
      serviceType: parcel.serviceType,
      helpersCount: parcel.peopleNeeded,
      receiverName: parcel.receiverName,
      receiverPhone: parcel.receiverPhone,
      receiverPays: parcel.receiverPays,
      additionalServices: parcel.additionalServices,
      payment: {
        paymentId: parcel.payment.id,
        amount: parcel.payment.amount,
        currency: "TZS",
        method: parcel.payment.paymentMethod,
        transactionReference: parcel.payment.transactionReference,
        paidAt: parcel.payment.paidAt,
        status: parcel.payment.status,
      },
      sender: {
        name: parcel.user?.name,
        email: parcel.user?.email,
      },
      issuedAt: new Date().toISOString(),
    };

    return NextResponse.json(receipt);
  } catch (error) {
    console.error("Error generating receipt:", error);
    return NextResponse.json(
      { error: "Internal Server Error" },
      { status: 500 },
    );
  }
}
