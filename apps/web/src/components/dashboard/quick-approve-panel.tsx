"use client"

import { Card, CardContent, CardHeader, CardTitle } from "@repo/ui/card"
import { Button } from "@repo/ui/button"
import { Badge } from "@repo/ui/badge"
import { Check, X, Clock, Package, User, MapPin } from "lucide-react"
import { cn } from "@repo/ui/utils"

interface CargoRequest {
    id: string;
    fromAddress: string;
    toAddress: string;
    cargoType: string;
    createdAt: string;
    receiverName: string;
    status: string;
}

export function ActionRequiredPanel({ requests, role }: { requests: CargoRequest[], role: string }) {
    const isAdminOrOps = ['ADMIN', 'SUPER_ADMIN', 'OPERATOR'].includes(role);

    if (!requests || requests.length === 0) {
        return (
            <Card className="border-none shadow-md bg-white">
                <CardHeader>
                    <CardTitle className="text-lg font-semibold flex items-center gap-2">
                        <Clock className="w-5 h-5 text-amber-500" />
                        Action Required
                    </CardTitle>
                </CardHeader>
                <CardContent className="flex flex-col items-center justify-center py-12 text-slate-400">
                    <Package className="w-12 h-12 opacity-10 mb-4" />
                    <p>No immediate actions required.</p>
                </CardContent>
            </Card>
        )
    }

    return (
        <Card className="border-none shadow-md bg-white overflow-hidden">
            <CardHeader className="border-b border-slate-50 pb-4">
                <div className="flex items-center justify-between">
                    <CardTitle className="text-lg font-semibold flex items-center gap-2 text-slate-900">
                        <Activity className="w-5 h-5 text-indigo-600" />
                        {isAdminOrOps ? "Critical Approvals" : "Tasks for You"}
                    </CardTitle>
                    <Badge variant="secondary" className="bg-amber-100 text-amber-700 hover:bg-amber-100 border-none">
                        {requests.length} Items
                    </Badge>
                </div>
            </CardHeader>
            <CardContent className="p-0">
                <div className="divide-y divide-slate-50">
                    {requests.map((request) => {
                        const isRejected = request.status === 'REJECTED';
                        const isAwaitingPayment = request.status === 'PAYMENT_PENDING';
                        
                        return (
                            <div key={request.id} className="p-4 hover:bg-slate-50/50 transition-colors group">
                                <div className="flex items-start justify-between gap-4">
                                    <div className="space-y-1 flex-1">
                                        <div className="flex items-center gap-2">
                                            <span className="font-semibold text-slate-900">{request.cargoType}</span>
                                            <Badge className={cn(
                                                "text-[9px] px-1.5 py-0 border-none",
                                                request.status === 'PAYMENT_PENDING' ? "bg-violet-100 text-violet-700" :
                                                request.status === 'REJECTED' ? "bg-rose-100 text-rose-700" :
                                                "bg-amber-100 text-amber-700"
                                            )}>
                                                {request.status.replace('_', ' ')}
                                            </Badge>
                                            <span className="text-xs text-slate-400 ml-auto">{new Date(request.createdAt).toLocaleDateString()}</span>
                                        </div>
                                        <div className="flex flex-col gap-1 text-sm text-slate-600">
                                            <div className="flex items-center gap-2">
                                                <MapPin className="w-3.5 h-3.5 text-slate-400" />
                                                <span className="truncate max-w-[200px]">{request.fromAddress} → {request.toAddress}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="flex items-center gap-2 pt-1">
                                        <Link href={`/cargo/${request.id}`}>
                                            <Button
                                                size="sm"
                                                variant="outline"
                                                className="h-8 text-[11px] font-bold border-indigo-100 text-indigo-600 hover:bg-indigo-50"
                                            >
                                                {isAwaitingPayment ? 'Pay Now' : 'View'}
                                            </Button>
                                        </Link>
                                    </div>
                                </div>
                            </div>
                        );
                    })}
                </div>
            </CardContent>
            <div className="p-3 bg-slate-50/50 border-t border-slate-50 text-center">
                <Button variant="ghost" size="sm" className="text-indigo-600 hover:text-indigo-700 hover:bg-transparent font-medium" asChild>
                    <Link href="/cargo">View all cargo entries</Link>
                </Button>
            </div>
        </Card>
    )
}

import { Activity, ShieldCheck } from "lucide-react"
import Link from "next/link"
