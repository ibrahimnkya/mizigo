import { NextResponse } from 'next/server'
import { renderToStream } from '@react-pdf/renderer'
import { prisma } from '@repo/database'
import { auth } from '@/auth'
import { createReceiptPDF, type ReceiptData } from '@/lib/pdf/receipt-pdf'

/**
 * GET /api/cargo/[id]/receipt/pdf
 * Streams a branded PDF receipt for a paid or completed cargo request.
 *
 * Auth: Requires a valid session. Admin can access any; customer can only
 * access their own cargo.
 */
export async function GET(
    _request: Request,
    { params }: { params: Promise<{ id: string }> }
) {
    try {
        const session = await auth()
        if (!session?.user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const { id } = await params

        const cargo = await prisma.cargoRequest.findUnique({
            where: { id },
            include: {
                user: { select: { name: true, email: true } },
                payment: true,
            },
        })

        if (!cargo) {
            return NextResponse.json({ error: 'Cargo request not found' }, { status: 404 })
        }

        // Only admins or the owning user may download the receipt
        const isAdmin = (session.user as any).role === 'ADMIN'
        if (!isAdmin && cargo.userId !== session.user.id) {
            return NextResponse.json({ error: 'Forbidden' }, { status: 403 })
        }

        if (!['PAID', 'COMPLETED'].includes(cargo.status as string)) {
            return NextResponse.json(
                { error: 'Receipt only available for PAID or COMPLETED cargo.' },
                { status: 400 }
            )
        }

        if (!cargo.payment) {
            return NextResponse.json({ error: 'No payment record found.' }, { status: 404 })
        }

        const receiptData: ReceiptData = {
            receiptId: `RCP-${cargo.payment.id.slice(-8).toUpperCase()}`,
            cargoId: cargo.id,
            cargoRef: cargo.id.slice(-6).toUpperCase(),
            status: cargo.status as string,
            route: {
                from: cargo.fromAddress,
                to: cargo.toAddress,
                pickupType: cargo.pickupType ?? 'Standard',
            },
            serviceType: cargo.serviceType,
            helpersCount: cargo.peopleNeeded ?? 0,
            receiverName: cargo.receiverName,
            receiverPhone: cargo.receiverPhone ?? null,
            payment: {
                paymentId: cargo.payment.id,
                amount: cargo.payment.amount,
                currency: 'TZS',
                method: cargo.payment.paymentMethod ?? null,
                transactionReference: cargo.payment.transactionReference ?? null,
                paidAt: cargo.payment.paidAt ?? null,
                status: cargo.payment.status,
            },
            sender: {
                name: cargo.user?.name ?? null,
                email: cargo.user?.email ?? null,
            },
            issuedAt: new Date().toISOString(),
        }

        // Render PDF to a Node.js ReadableStream
        const pdfStream = await renderToStream(createReceiptPDF(receiptData))

        // Convert to Web ReadableStream for the Next.js Response
        const webStream = new ReadableStream({
            start(controller) {
                ; (pdfStream as any).on('data', (chunk: Buffer) => controller.enqueue(chunk))
                    ; (pdfStream as any).on('end', () => controller.close())
                    ; (pdfStream as any).on('error', (err: Error) => controller.error(err))
            },
        })

        const filename = `mizigo-receipt-${receiptData.cargoRef}.pdf`

        return new Response(webStream, {
            headers: {
                'Content-Type': 'application/pdf',
                'Content-Disposition': `attachment; filename="${filename}"`,
                'Cache-Control': 'no-store',
            },
        })
    } catch (error) {
        console.error('[PDF Receipt] Error:', error)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
