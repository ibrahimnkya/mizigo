import { Router, Request, Response } from "express";
import { prisma } from "@repo/database";

const router: Router = Router();

// 1. Receive Cargo
router.post("/", async (req: Request, res: Response) => {
    try {
        const payload = req.body;
        
        // Basic validation
        if (!payload.fromAddress || !payload.toAddress || !payload.serviceType || !payload.cargoType || !payload.cargoSize || !payload.receiverName || !payload.receiverPhone || !payload.pickupType) {
            return res.status(400).json({ success: false, error: "Missing required fields" });
        }

        const cargo = await prisma.cargoRequest.create({
            data: {
                userId: payload.userId || null,
                fromAddress: payload.fromAddress,
                toAddress: payload.toAddress,
                serviceType: payload.serviceType,
                peopleNeeded: payload.peopleNeeded || 0,
                cargoType: payload.cargoType,
                cargoSize: payload.cargoSize,
                receiverName: payload.receiverName,
                receiverPhone: payload.receiverPhone,
                receiverPays: payload.receiverPays || false,
                additionalServices: payload.additionalServices || null,
                pickupType: payload.pickupType,
                wagonType: payload.wagonType || "STANDARD",
                status: "PENDING"
            }
        });
        res.status(201).json({ success: true, data: cargo });
    } catch (error: any) {
        console.error("Error creating cargo request", error);
        res.status(500).json({ success: false, error: error.message });
    }
});

// 2. Check for Space
router.get("/space-check", async (req: Request, res: Response) => {
    try {
        // const { stationId } = req.query;
        // Mocking logic: always return true for MVP
        res.json({ success: true, hasSpace: true, availableCapacity: 100 });
    } catch (error: any) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// 3. Approve/Decline Order
router.patch("/:id/adjudicate", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const { status, adminId, amount, rejectionReason } = req.body;

        if (!status || !['APPROVED', 'REJECTED'].includes(status)) {
            return res.status(400).json({ success: false, error: "Invalid status, must be APPROVED or REJECTED" });
        }
        if (status === "APPROVED" && amount === undefined) {
             // For express or MVP, amount could be 0, but undefined means not provided.
            return res.status(400).json({ success: false, error: "Amount required for approval" });
        }
        if (status === "REJECTED" && !rejectionReason) {
            return res.status(400).json({ success: false, error: "Rejection reason required for rejection" });
        }

        const cargo = await prisma.cargoRequest.update({
            where: { id },
            data: {
                status,
                approvedById: adminId || null,
                amount: status === "APPROVED" ? Number(amount) : null,
                rejectionReason: status === "REJECTED" ? String(rejectionReason) : null,
            }
        });
        res.json({ success: true, data: cargo });
    } catch (error: any) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// 4. Get Order Status
router.get("/:id/status", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const cargo = await prisma.cargoRequest.findUnique({
            where: { id },
            select: { id: true, status: true }
        });
        if (!cargo) return res.status(404).json({ success: false, error: "Cargo request not found" });
        res.json({ success: true, data: cargo });
    } catch (error: any) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// 5. Pay for Parcel
router.post("/:id/pay", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const { userId, amount, paymentMethod, transactionReference } = req.body;

        if (!userId || amount === undefined) {
            return res.status(400).json({ success: false, error: "userId and amount are required" });
        }

        const cargo = await prisma.cargoRequest.findUnique({ where: { id } });
        if (!cargo) return res.status(404).json({ success: false, error: "Cargo request not found" });

        // Execute in transaction to ensure consistency
        const [payment, updatedCargo] = await prisma.$transaction([
            prisma.payment.upsert({
                where: { cargoId: id as string },
                update: {
                    userId,
                    amount: Number(amount),
                    status: "SUCCESS",
                    paymentMethod: paymentMethod || "M-PESA",
                    transactionReference,
                    paidAt: new Date()
                },
                create: {
                    cargoId: id as string,
                    userId,
                    amount: Number(amount),
                    status: "SUCCESS",
                    paymentMethod: paymentMethod || "M-PESA",
                    transactionReference,
                    paidAt: new Date()
                }
            }),
            prisma.cargoRequest.update({
                where: { id },
                data: { status: "PAID" }
            })
        ]);

        res.json({ success: true, data: { payment, cargo: updatedCargo } });
    } catch (error: any) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// 7. Track Cargo 
// (Note: Put specific routes before generic /:id route)
router.get("/:id/track", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const cargo = await prisma.cargoRequest.findUnique({
            where: { id },
            select: { 
                id: true, 
                status: true, 
                fromAddress: true, 
                toAddress: true, 
                createdAt: true, 
                updatedAt: true 
            }
        });
        if (!cargo) return res.status(404).json({ success: false, error: "Cargo request not found" });
        res.json({ success: true, data: cargo });
    } catch (error: any) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// 6. Get Cargo Details
router.get("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const cargo = await prisma.cargoRequest.findUnique({
            where: { id },
            include: { 
                user: { select: { id: true, name: true, email: true, phone: true } }, 
                payment: true, 
                approvedBy: { select: { id: true, name: true, email: true } }
            }
        });
        if (!cargo) return res.status(404).json({ success: false, error: "Cargo request not found" });
        res.json({ success: true, data: cargo });
    } catch (error: any) {
        res.status(500).json({ success: false, error: error.message });
    }
});

export default router;
