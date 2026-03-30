"use client"

import { useState } from "react"
import { Building2, Plus, Loader2, Info, CheckCircle2 } from "lucide-react"
import { Button } from "@repo/ui/button"
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
    DialogFooter
} from "@repo/ui/dialog"
import { Input } from "@repo/ui/input"
import { Label } from "@repo/ui/label"
import { cn } from "@/lib/utils"

interface CreateOrganizationModalProps {
    onSuccess: () => void;
}

export function CreateOrganizationModal({ onSuccess }: CreateOrganizationModalProps) {
    const [open, setOpen] = useState(false)
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState<string | null>(null)

    const [name, setName] = useState("")
    const [description, setDescription] = useState("")

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault()
        setLoading(true)
        setError(null)

        try {
            const response = await fetch('/api/organizations', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ name, description }),
            })

            const data = await response.json()

            if (!response.ok) {
                throw new Error(data.error || 'Failed to create organization')
            }

            setOpen(false)
            setName("")
            setDescription("")
            onSuccess()
        } catch (err: any) {
            setError(err.message)
        } finally {
            setLoading(false)
        }
    }

    return (
        <Dialog open={open} onOpenChange={setOpen}>
            <DialogTrigger asChild>
                <button
                    className="h-12 px-6 bg-blue-600 hover:bg-blue-700 text-white rounded-xl font-black text-[13px] uppercase tracking-widest flex items-center gap-2 shadow-xl shadow-blue-100 transition-all active:scale-95 group"
                >
                    <Plus className="w-4 h-4 group-hover:rotate-90 transition-transform duration-300" strokeWidth={3} />
                    Register Organization
                </button>
            </DialogTrigger>
            
            <DialogContent className="sm:max-w-[500px] p-0 overflow-hidden bg-white border-none shadow-[0_0_50px_-12px_rgba(0,0,0,0.25)] rounded-[2.5rem]">
                <div className="bg-slate-900 p-10 flex flex-col gap-6 relative overflow-hidden">
                    <div className="absolute top-0 right-0 w-64 h-64 bg-blue-600/10 rounded-full blur-3xl -mr-32 -mt-32" />
                    <div className="absolute bottom-0 left-0 w-32 h-32 bg-blue-600/5 rounded-full blur-2xl -ml-16 -mb-16" />
                    
                    <div className="w-14 h-14 rounded-2xl bg-white/10 ring-1 ring-white/20 flex items-center justify-center shrink-0 backdrop-blur-md shadow-2xl relative z-10 mx-auto mb-2">
                        <Building2 className="w-7 h-7 text-blue-400" strokeWidth={2.5} />
                    </div>
                    
                    <div className="relative z-10 text-center space-y-2">
                        <DialogTitle className="text-[24px] font-black text-white tracking-tight">Organization Genesis</DialogTitle>
                        <DialogDescription className="text-slate-400 text-[14px] font-bold leading-relaxed max-w-[280px] mx-auto">
                            Establish a new corporate entity within the Mizigo infrastructure.
                        </DialogDescription>
                    </div>
                </div>

                <form onSubmit={handleSubmit} className="p-10 pt-8 space-y-8">
                    {error && (
                        <div className="bg-rose-50 border border-rose-100 text-rose-600 text-[13px] font-bold p-4 rounded-2xl flex items-center gap-3 animate-in fade-in slide-in-from-top-2">
                            <div className="w-2 h-2 rounded-full bg-rose-500 shadow-[0_0_10px_rgba(244,63,94,0.5)]" />
                            {error}
                        </div>
                    )}

                    <div className="space-y-6">
                        <div className="relative">
                            <Label htmlFor="name" className="text-[11px] font-black text-slate-400 uppercase tracking-[0.15em] mb-3 block ml-1">
                                Entity Designation
                            </Label>
                            <Input
                                id="name"
                                value={name}
                                onChange={(e) => setName(e.target.value)}
                                placeholder="e.g. Acme Global Logistics"
                                className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-2xl px-6 text-[15px] font-bold placeholder:text-slate-300 transition-all text-slate-900"
                                required
                            />
                        </div>

                        <div className="relative">
                            <Label htmlFor="description" className="text-[11px] font-black text-slate-400 uppercase tracking-[0.15em] mb-3 block ml-1">
                                Operational Summary <span className="text-slate-300 font-bold lowercase tracking-normal opacity-50">(Optional)</span>
                            </Label>
                            <Input
                                id="description"
                                value={description}
                                onChange={(e) => setDescription(e.target.value)}
                                placeholder="Establishment architecture and scope..."
                                className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-2xl px-6 text-[15px] font-bold placeholder:text-slate-300 transition-all text-slate-900"
                            />
                        </div>
                    </div>

                    <div className="p-5 bg-blue-50/50 rounded-2xl border border-blue-100/50 flex items-start gap-4">
                        <Info className="w-5 h-5 text-blue-600 mt-0.5" />
                        <p className="text-[12px] font-bold text-blue-700 leading-relaxed">
                            Registration will initialize a secure workspace. Corporate admins must be assigned POST-creation.
                        </p>
                    </div>

                    <div className="flex flex-col sm:flex-row gap-4 pt-4">
                        <Button 
                            type="button" 
                            variant="ghost" 
                            onClick={() => setOpen(false)}
                            className="h-14 flex-1 rounded-2xl font-black text-[13px] uppercase tracking-widest text-slate-400 hover:text-slate-900 hover:bg-slate-50 transition-all"
                            disabled={loading}
                        >
                            Cancel
                        </Button>
                        <Button 
                            type="submit" 
                            disabled={loading || !name}
                            className="h-14 flex-[2] rounded-2xl font-black text-[13px] uppercase tracking-widest bg-blue-600 hover:bg-blue-700 text-white shadow-2xl shadow-blue-200 transition-all active:scale-95 flex items-center justify-center gap-2"
                        >
                            {loading ? (
                                <>
                                    <Loader2 className="w-4 h-4 animate-spin" strokeWidth={3} />
                                    Processing...
                                </>
                            ) : (
                                <>
                                    <CheckCircle2 className="w-4 h-4" strokeWidth={3} />
                                    Register Entity
                                </>
                            )}
                        </Button>
                    </div>
                </form>
            </DialogContent>
        </Dialog>
    )
}
