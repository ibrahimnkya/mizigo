import { NextResponse } from "next/server";
import { renderToStream } from "@react-pdf/renderer";
import { prisma } from "@repo/database";
import { auth } from "@/auth";
import { createReceiptPDF, type ReceiptData } from "@/lib/pdf/receipt-pdf";

/**
 * GET /api/parcel/[id]/receipt/pdf
 * Streams a branded PDF receipt for a paid or completed parcel request.
 *
 * Auth: Requires a valid session. Admin can access any; customer can only
 * access their own parcel.
 */
export async function GET(
  _request: Request,
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
      include: {
        user: { select: { name: true, email: true } },
        payment: true,
      },
    });

    if (!parcel) {
      return NextResponse.json(
        { error: "Parcel request not found" },
        { status: 404 },
      );
    }

    // Only admins or the owning user may download the receipt
    const isAdmin = (session.user as any).role === "ADMIN";
    if (!isAdmin && parcel.userId !== session.user.id) {
      return NextResponse.json({ error: "Forbidden" }, { status: 403 });
    }

    if (!["PAID", "COMPLETED"].includes(parcel.status as string)) {
      return NextResponse.json(
        { error: "Receipt only available for PAID or COMPLETED parcel." },
        { status: 400 },
      );
    }

    if (!parcel.payment) {
      return NextResponse.json(
        { error: "No payment record found." },
        { status: 404 },
      );
    }

    const receiptData: ReceiptData = {
      receiptId: `RCP-${parcel.payment.id.slice(-8).toUpperCase()}`,
      parcelId: parcel.id,
      parcelRef: parcel.id.slice(-6).toUpperCase(),
      status: parcel.status as string,
      route: {
        from: parcel.fromAddress,
        to: parcel.toAddress,
        pickupType: parcel.pickupType ?? "Standard",
      },
      serviceType: parcel.serviceType,
      helpersCount: parcel.peopleNeeded ?? 0,
      receiverName: parcel.receiverName,
      receiverPhone: parcel.receiverPhone ?? null,
      payment: {
        paymentId: parcel.payment.id,
        amount: parcel.payment.amount,
        currency: "TZS",
        method: parcel.payment.paymentMethod ?? null,
        transactionReference: parcel.payment.transactionReference ?? null,
        paidAt: parcel.payment.paidAt ?? null,
        status: parcel.payment.status,
      },
      sender: {
        name: parcel.user?.name ?? null,
        email: parcel.user?.email ?? null,
      },
      issuedAt: new Date().toISOString(),
    };

    // Render PDF to a Node.js ReadableStream
    const pdfStream = await renderToStream(createReceiptPDF(receiptData));

    // Convert to Web ReadableStream for the Next.js Response
    const webStream = new ReadableStream({
      start(controller) {
        (pdfStream as any).on("data", (chunk: Buffer) =>
          controller.enqueue(chunk),
        );
        (pdfStream as any).on("end", () => controller.close());
        (pdfStream as any).on("error", (err: Error) => controller.error(err));
      },
    });

    const filename = `mizigo-receipt-${receiptData.parcelRef}.pdf`;

    return new Response(webStream, {
      headers: {
        "Content-Type": "application/pdf",
        "Content-Disposition": `attachment; filename="${filename}"`,
        "Cache-Control": "no-store",
      },
    });
  } catch (error) {
    console.error("[PDF Receipt] Error:", error);
    return NextResponse.json(
      { error: "Internal Server Error" },
      { status: 500 },
    );
  }
}
