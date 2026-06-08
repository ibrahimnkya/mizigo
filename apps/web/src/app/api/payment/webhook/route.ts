import { NextResponse } from "next/server";
import { prisma } from "@repo/database";

/**
 * POST /api/payment/webhook — Payment provider callback
 * Called by M-Pesa, Tigo, Airtel, or Stripe webhook after payment confirmation.
 */
export async function POST(request: Request) {
  try {
    const body = await request.json();
    const { transactionReference, status, parcelId, paymentId } = body;

    if (!transactionReference || !status || !parcelId) {
      return NextResponse.json(
        { error: "transactionReference, status, and parcelId are required" },
        { status: 400 },
      );
    }

    const isSuccess = ["SUCCESS", "COMPLETED", "PAID"].includes(
      status.toUpperCase(),
    );

    // Update payment record
    let payment = await prisma.payment.findFirst({
      where: paymentId ? { id: paymentId } : { parcelId },
    });

    if (!payment) {
      return NextResponse.json({ error: "Payment not found" }, { status: 404 });
    }

    payment = await prisma.payment.update({
      where: { id: payment.id },
      data: {
        transactionReference,
        status: isSuccess ? "SUCCESS" : "FAILED",
        paidAt: isSuccess ? new Date() : null,
      },
    });

    if (isSuccess) {
      // Transition parcel to PAID
      const parcel = await prisma.parcel.update({
        where: { id: parcelId },
        data: { status: "PAID" },
        select: { userId: true, id: true },
      });

      // Notify user
      if (parcel.userId) {
        await (prisma as any).notification.create({
          data: {
            userId: parcel.userId,
            title: "Payment Confirmed ✅",
            message: `TZS ${payment.amount.toLocaleString()} received via ${payment.paymentMethod ?? "mobile payment"}. Ref: ${transactionReference}`,
            type: "SUCCESS",
          },
        });
      }
    }

    return NextResponse.json({ received: true, status: payment.status });
  } catch (error) {
    console.error("Error processing payment webhook:", error);
    return NextResponse.json(
      { error: "Internal Server Error" },
      { status: 500 },
    );
  }
}
