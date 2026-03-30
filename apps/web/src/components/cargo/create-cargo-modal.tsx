"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Button } from "@repo/ui/button"
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from "@repo/ui/dialog"
import { Input } from "@repo/ui/input"
import { Label } from "@repo/ui/label"

export function CreateCargoModal() {
    const router = useRouter()
    const [open, setOpen] = useState(false)
    const [loading, setLoading] = useState(false)

    async function onSubmit(event: React.FormEvent<HTMLFormElement>) {
        event.preventDefault()
        setLoading(true)

        const formData = new FormData(event.currentTarget)
        const data = {
            fromAddress: formData.get("fromAddress"),
            toAddress: formData.get("toAddress"),
            serviceType: formData.get("serviceType"),
            receiverName: formData.get("receiverName"),
            receiverPhone: formData.get("receiverPhone"),
            peopleNeeded: Number(formData.get("peopleNeeded")),
            cargoType: formData.get("cargoType"),
            cargoSize: formData.get("cargoSize"),
            pickupType: formData.get("pickupType"),
        }

        try {
            const response = await fetch("/api/cargo", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(data),
            })

            if (!response.ok) {
                throw new Error("Failed to create request")
            }

            setOpen(false)
            router.refresh()
        } catch (error) {
            console.error(error)
            alert("Failed to create cargo request")
        } finally {
            setLoading(false)
        }
    }

    return (
        <Dialog open={open} onOpenChange={setOpen}>
            <DialogTrigger asChild>
                <Button>New Request</Button>
            </DialogTrigger>
            <DialogContent className="sm:max-w-[425px]">
                <DialogHeader>
                    <DialogTitle>Create Cargo Request</DialogTitle>
                    <DialogDescription>
                        Enter the details for the new cargo request.
                    </DialogDescription>
                </DialogHeader>
                <form onSubmit={onSubmit}>
                    <div className="grid gap-4 py-4">
                        <div className="grid grid-cols-4 items-center gap-4">
                            <Label htmlFor="fromAddress" className="text-right">
                                From
                            </Label>
                            <Input
                                id="fromAddress"
                                name="fromAddress"
                                className="col-span-3"
                                required
                            />
                        </div>
                        <div className="grid grid-cols-4 items-center gap-4">
                            <Label htmlFor="toAddress" className="text-right">
                                To
                            </Label>
                            <Input
                                id="toAddress"
                                name="toAddress"
                                className="col-span-3"
                                required
                            />
                        </div>
                        <div className="grid grid-cols-4 items-center gap-4">
                            <Label htmlFor="serviceType" className="text-right">
                                Service
                            </Label>
                            <Input
                                id="serviceType"
                                name="serviceType"
                                className="col-span-3"
                                required
                            />
                        </div>
                        <div className="grid grid-cols-4 items-center gap-4">
                            <Label htmlFor="receiverName" className="text-right">
                                Receiver
                            </Label>
                            <Input
                                id="receiverName"
                                name="receiverName"
                                className="col-span-3"
                                required
                            />
                        </div>
                        <div className="grid grid-cols-4 items-center gap-4">
                            <Label htmlFor="receiverPhone" className="text-right">
                                Phone
                            </Label>
                            <Input
                                id="receiverPhone"
                                name="receiverPhone"
                                className="col-span-3"
                                required
                            />
                        </div>
                    </div>
                    <DialogFooter>
                        <Button type="submit" disabled={loading}>
                            {loading ? "Creating..." : "Create Request"}
                        </Button>
                    </DialogFooter>
                </form>
            </DialogContent>
        </Dialog>
    )
}
