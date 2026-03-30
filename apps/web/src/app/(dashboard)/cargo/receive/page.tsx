"use client"

import { useState, useEffect } from "react"
import { useRouter } from "next/navigation"
import { 
    Package, 
    User, 
    MapPin, 
    Phone, 
    ChevronRight, 
    Loader2, 
    CheckCircle2, 
    AlertCircle,
    Truck,
    Info,
    CreditCard
} from "lucide-react"
import { cn } from "@/lib/utils"

export default function ReceiveCargoPage() {
    const router = useRouter()
    const [loading, setLoading] = useState(false)
    const [step, setStep] = useState(1)
    const [error, setError] = useState<string | null>(null)
    const [success, setSuccess] = useState(false)
    const [stations, setStations] = useState<any[]>([])

    useEffect(() => {
        const fetchStations = async () => {
            try {
                const res = await fetch("/api/locations")
                if (res.ok) {
                    const data = await res.json()
                    setStations(data)
                }
            } catch (err) {
                console.error("Failed to fetch stations", err)
            }
        }
        fetchStations()
    }, [])

    const [formData, setFormData] = useState({
        senderName: "",
        senderPhone: "",
        senderAddress: "",
        receiverName: "",
        receiverPhone: "",
        receiverAddress: "",
        cargoType: "Standard",
        cargoSize: "Medium",
        weight: "",
        length: "",
        width: "",
        height: "",
        urgency: "Normal",
        isFragile: false,
        condition: "New",
        specialInstructions: "",
        paymentMethod: "CASH",
        receiverPays: false,
        isPaid: false
    })

    const baseRate = 2000;
    const calculatedAmount = Math.ceil((parseFloat(formData.weight) || 0) * baseRate);

    const handleBack = () => {
        if (step > 1) setStep(step - 1)
    }

    const handleNext = () => {
        if (step < totalSteps) {
            setStep(step + 1)
        }
    }

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault()
        setLoading(true)
        setError(null)

        try {
            const res = await fetch("/api/cargo/receive", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    fromAddress: formData.senderAddress,
                    toAddress: formData.receiverAddress, // Corrected to receiverAddress
                    receiverName: formData.receiverName,
                    receiverPhone: formData.receiverPhone,
                    receiverPays: formData.receiverPays,
                    weight: parseFloat(formData.weight),
                    length: formData.length ? parseFloat(formData.length) : null,
                    width: formData.width ? parseFloat(formData.width) : null,
                    height: formData.height ? parseFloat(formData.height) : null,
                    cargoType: formData.cargoType,
                    cargoSize: formData.cargoSize,
                    urgency: formData.urgency,
                    isFragile: formData.isFragile,
                    condition: formData.condition,
                    specialInstructions: formData.specialInstructions,
                    serviceType: "Standard",
                    pickupType: "SGR_STATION",
                    paymentMethod: formData.paymentMethod,
                })
            })

            if (!res.ok) throw new Error("Failed to submit request")
            
            setSuccess(true)
            setTimeout(() => {
                router.push("/cargo/pending")
            }, 2000)
        } catch (err: any) {
            setError(err.message || "An unexpected error occurred")
        } finally {
            setLoading(false)
        }
    }

    if (success) {
        return (
            <div className="min-h-[70vh] flex flex-col items-center justify-center p-6 text-center">
                <div className="w-20 h-20 bg-emerald-100 rounded-full flex items-center justify-center mb-6 animate-in zoom-in duration-300">
                    <CheckCircle2 size={40} className="text-emerald-600" />
                </div>
                <h2 className="text-2xl font-black text-slate-900 mb-2">Request Submitted!</h2>
                <p className="text-slate-500 max-w-sm">The cargo request has been successfully created. Redirecting to pending list...</p>
            </div>
        )
    }

    const totalSteps = 2

    return (
        <div className="min-h-screen bg-[#f8f9fb] py-10 px-6">
            <div className="max-w-3xl mx-auto">
                <div className="flex items-center gap-3 mb-8">
                    <div className="w-12 h-12 bg-indigo-600 rounded-2xl flex items-center justify-center text-white shadow-lg shadow-indigo-100">
                        <Package size={24} />
                    </div>
                    <div>
                        <h1 className="text-2xl font-black text-slate-900 tracking-tight">Receive Cargo</h1>
                        <p className="text-slate-400 text-sm font-medium">Step {step} of {totalSteps}: {
                            step === 1 ? "Sender & Receiver" : "Package Details"
                        }</p>
                    </div>
                </div>

                {error && (
                    <div className="mb-6 bg-red-50 border border-red-100 p-4 rounded-2xl flex items-center gap-3 text-red-600 text-sm font-medium animate-in fade-in slide-in-from-top-4">
                        <AlertCircle size={18} />
                        {error}
                    </div>
                )}

                <form onSubmit={handleSubmit} className="space-y-6">
                    {/* Step 1: Parties */}
                    {step === 1 && (
                        <div className="grid gap-6 animate-in fade-in slide-in-from-right-4 duration-300">
                            <div className="bg-white rounded-3xl border border-slate-100 p-8 shadow-sm">
                                <h3 className="text-sm font-bold text-slate-900 uppercase tracking-widest mb-6 flex items-center gap-2">
                                    <div className="w-6 h-6 bg-indigo-50 rounded-lg flex items-center justify-center">
                                        <User size={12} className="text-indigo-600" />
                                    </div>
                                    Sender Information
                                </h3>
                                <div className="space-y-4">
                                    <div className="grid md:grid-cols-2 gap-4">
                                        <div className="space-y-1.5">
                                            <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">Full Name</label>
                                            <input 
                                                required
                                                type="text" 
                                                className="w-full bg-slate-50 border-none rounded-xl px-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all"
                                                placeholder="e.g. John Doe"
                                                value={formData.senderName}
                                                onChange={e => setFormData({...formData, senderName: e.target.value})}
                                            />
                                        </div>
                                        <div className="space-y-1.5">
                                            <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">Phone Number</label>
                                            <input 
                                                required
                                                type="tel" 
                                                className="w-full bg-slate-50 border-none rounded-xl px-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all"
                                                placeholder="0712 345 678"
                                                value={formData.senderPhone}
                                                onChange={e => setFormData({...formData, senderPhone: e.target.value})}
                                            />
                                        </div>
                                    </div>
                                    <div className="space-y-1.5">
                                        <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">From Station</label>
                                        <div className="relative">
                                            <MapPin size={16} className="absolute left-4 top-3.5 text-slate-300 z-10" />
                                            <select 
                                                required
                                                className="w-full bg-slate-50 border-none rounded-xl pl-11 pr-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all appearance-none"
                                                value={formData.senderAddress}
                                                onChange={e => setFormData({...formData, senderAddress: e.target.value})}
                                            >
                                                <option value="">Select origin station</option>
                                                {stations.map(station => (
                                                    <option key={station.id} value={station.name}>{station.name}</option>
                                                ))}
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="bg-white rounded-3xl border border-slate-100 p-8 shadow-sm">
                                <h3 className="text-sm font-bold text-slate-900 uppercase tracking-widest mb-6 flex items-center gap-2">
                                    <div className="w-6 h-6 bg-amber-50 rounded-lg flex items-center justify-center">
                                        <User size={12} className="text-amber-600" />
                                    </div>
                                    Receiver Information
                                </h3>
                                <div className="space-y-4">
                                    <div className="grid md:grid-cols-2 gap-4">
                                        <div className="space-y-1.5">
                                            <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">Full Name</label>
                                            <input 
                                                required
                                                type="text" 
                                                className="w-full bg-slate-50 border-none rounded-xl px-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all"
                                                placeholder="e.g. Jane Smith"
                                                value={formData.receiverName}
                                                onChange={e => setFormData({...formData, receiverName: e.target.value})}
                                            />
                                        </div>
                                        <div className="space-y-1.5">
                                            <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">Phone Number</label>
                                            <input 
                                                required
                                                type="tel" 
                                                className="w-full bg-slate-50 border-none rounded-xl px-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all"
                                                placeholder="0712 345 678"
                                                value={formData.receiverPhone}
                                                onChange={e => setFormData({...formData, receiverPhone: e.target.value})}
                                            />
                                        </div>
                                    </div>
                                    <div className="space-y-1.5">
                                        <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">Destination Station</label>
                                        <div className="relative">
                                            <MapPin size={16} className="absolute left-4 top-3.5 text-slate-300 z-10" />
                                            <select 
                                                required
                                                className="w-full bg-slate-50 border-none rounded-xl pl-11 pr-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all appearance-none"
                                                value={formData.receiverAddress}
                                                onChange={e => setFormData({...formData, receiverAddress: e.target.value})}
                                            >
                                                <option value="">Select destination station</option>
                                                {stations.map(station => (
                                                    <option key={station.id} value={station.name}>{station.name}</option>
                                                ))}
                                            </select>
                                        </div>
                                    </div>

                                    <div className="pt-2">
                                        <label className="flex items-center gap-3 cursor-pointer group">
                                            <div className="relative">
                                                <input 
                                                    type="checkbox" 
                                                    className="sr-only peer"
                                                    checked={formData.receiverPays}
                                                    onChange={e => setFormData({...formData, receiverPays: e.target.checked})}
                                                />
                                                <div className="w-10 h-6 bg-slate-200 peer-checked:bg-indigo-600 rounded-full transition-colors"></div>
                                                <div className="absolute left-1 top-1 w-4 h-4 bg-white rounded-full transition-transform peer-checked:translate-x-4 shadow"></div>
                                            </div>
                                            <span className="text-sm font-bold text-slate-600 group-hover:text-slate-900 transition-colors">Receiver Pays on Delivery</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    )}

                    {/* Step 2: Package */}
                    {step === 2 && (
                        <div className="animate-in fade-in slide-in-from-right-4 duration-300 space-y-6">
                            <div className="bg-white rounded-3xl border border-slate-100 p-8 shadow-sm">
                                <h3 className="text-sm font-bold text-slate-900 uppercase tracking-widest mb-6 flex items-center gap-2">
                                    <div className="w-6 h-6 bg-emerald-50 rounded-lg flex items-center justify-center">
                                        <Package size={12} className="text-emerald-600" />
                                    </div>
                                    Package Classification
                                </h3>
                                <div className="space-y-6">
                                    <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
                                        {['Standard', 'Fragile', 'Perishable', 'Hazardous'].map(type => (
                                            <button
                                                key={type}
                                                type="button"
                                                onClick={() => setFormData({...formData, cargoType: type, isFragile: type === 'Fragile'})}
                                                className={cn(
                                                    "px-4 py-4 rounded-2xl text-[10px] font-black uppercase tracking-tighter transition-all flex flex-col items-center gap-2",
                                                    formData.cargoType === type 
                                                        ? "bg-indigo-600 text-white shadow-xl shadow-indigo-100 scale-105" 
                                                        : "bg-slate-50 text-slate-400 hover:bg-slate-100"
                                                )}
                                            >
                                                {type === 'Standard' && <Package size={20} />}
                                                {type === 'Fragile' && <AlertCircle size={20} />}
                                                {type === 'Perishable' && <Truck size={20} />}
                                                {type === 'Hazardous' && <AlertCircle size={20} />}
                                                {type}
                                            </button>
                                        ))}
                                    </div>

                                    <div className="grid md:grid-cols-2 gap-4">
                                        <div className="space-y-1.5">
                                            <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">Cargo Size</label>
                                            <select 
                                                className="w-full bg-slate-50 border-none rounded-xl px-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all font-bold"
                                                value={formData.cargoSize}
                                                onChange={e => setFormData({...formData, cargoSize: e.target.value})}
                                            >
                                                <option value="Small">Small (Envelope, Box)</option>
                                                <option value="Medium">Medium (Carton, Suitcase)</option>
                                                <option value="Large">Large (Furniture, Crate)</option>
                                                <option value="Custom">Custom / Bulk</option>
                                            </select>
                                        </div>
                                        <div className="space-y-1.5">
                                            <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">Urgency</label>
                                            <select 
                                                className="w-full bg-slate-50 border-none rounded-xl px-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all font-bold"
                                                value={formData.urgency}
                                                onChange={e => setFormData({...formData, urgency: e.target.value})}
                                            >
                                                <option value="Normal">Normal (3-5 Days)</option>
                                                <option value="Express">Express (1-2 Days)</option>
                                                <option value="Urgent">Urgent (Same Day / Next Train)</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                                        <div className="space-y-1.5">
                                            <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">Weight (kg)</label>
                                            <input 
                                                required
                                                type="number" 
                                                className="w-full bg-slate-50 border-none rounded-xl px-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all font-bold"
                                                placeholder="0.0"
                                                value={formData.weight}
                                                onChange={e => setFormData({...formData, weight: e.target.value})}
                                            />
                                        </div>
                                        <div className="space-y-1.5">
                                            <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">Length (cm)</label>
                                            <input 
                                                type="number" 
                                                className="w-full bg-slate-50 border-none rounded-xl px-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all font-bold"
                                                placeholder="L"
                                                value={formData.length}
                                                onChange={e => setFormData({...formData, length: e.target.value})}
                                            />
                                        </div>
                                        <div className="space-y-1.5">
                                            <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">Width (cm)</label>
                                            <input 
                                                type="number" 
                                                className="w-full bg-slate-50 border-none rounded-xl px-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all font-bold"
                                                placeholder="W"
                                                value={formData.width}
                                                onChange={e => setFormData({...formData, width: e.target.value})}
                                            />
                                        </div>
                                        <div className="space-y-1.5">
                                            <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">Height (cm)</label>
                                            <input 
                                                type="number" 
                                                className="w-full bg-slate-50 border-none rounded-xl px-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all font-bold"
                                                placeholder="H"
                                                value={formData.height}
                                                onChange={e => setFormData({...formData, height: e.target.value})}
                                            />
                                        </div>
                                    </div>

                                    <div className="grid md:grid-cols-2 gap-4">
                                        <div className="space-y-1.5">
                                            <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">Condition</label>
                                            <select 
                                                className="w-full bg-slate-50 border-none rounded-xl px-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all font-bold"
                                                value={formData.condition}
                                                onChange={e => setFormData({...formData, condition: e.target.value})}
                                            >
                                                <option value="New">New / Original Packing</option>
                                                <option value="Used">Used / Repacked</option>
                                                <option value="Refurbished">Refurbished</option>
                                            </select>
                                        </div>
                                        <div className="flex items-center gap-3 pt-6 ml-1">
                                            <label className="flex items-center gap-3 cursor-pointer group">
                                                <div className="relative">
                                                    <input 
                                                        type="checkbox" 
                                                        className="sr-only peer"
                                                        checked={formData.isFragile}
                                                        onChange={e => setFormData({...formData, isFragile: e.target.checked})}
                                                    />
                                                    <div className="w-10 h-6 bg-slate-200 peer-checked:bg-red-500 rounded-full transition-colors"></div>
                                                    <div className="absolute left-1 top-1 w-4 h-4 bg-white rounded-full transition-transform peer-checked:translate-x-4 shadow"></div>
                                                </div>
                                                <span className="text-sm font-bold text-slate-600 group-hover:text-slate-900 transition-colors">Mark as Fragile</span>
                                            </label>
                                        </div>
                                    </div>

                                    <div className="space-y-1.5">
                                        <label className="text-[11px] font-bold text-slate-400 uppercase ml-1">Special Instructions</label>
                                        <textarea 
                                            className="w-full bg-slate-50 border-none rounded-xl px-4 py-3 text-sm focus:ring-2 ring-indigo-500 transition-all min-h-[100px] resize-none"
                                            placeholder="e.g. Keep upright, do not stack, perishable items..."
                                            value={formData.specialInstructions}
                                            onChange={e => setFormData({...formData, specialInstructions: e.target.value})}
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                    )}



                    {/* Navigation */}
                    <div className="flex items-center justify-between pt-4">
                        <button
                            type="button"
                            onClick={handleBack}
                            disabled={step === 1 || loading}
                            className="text-sm font-bold text-slate-400 hover:text-slate-600 disabled:opacity-0 transition-all uppercase tracking-widest px-4"
                        >
                            Previous
                        </button>
                        
                        <div className="flex items-center gap-2">
                            {step < totalSteps ? (
                                <button
                                    type="button"
                                    onClick={handleNext}
                                    className="bg-white border border-slate-100 text-slate-900 px-8 py-3.5 rounded-2xl font-black text-sm shadow-sm hover:shadow-md transition-all flex items-center gap-2"
                                >
                                    Continue
                                    <ChevronRight size={16} />
                                </button>
                            ) : (
                                <button
                                    type="submit"
                                    disabled={loading}
                                    className="bg-indigo-600 text-white px-10 py-3.5 rounded-2xl font-black text-sm shadow-xl shadow-indigo-100 hover:scale-105 active:scale-95 transition-all flex items-center gap-3"
                                >
                                    {loading && <Loader2 size={16} className="animate-spin" />}
                                    Submit Request
                                </button>
                            )}
                        </div>
                    </div>
                </form>
            </div>
        </div>
    )
}
