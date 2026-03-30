import { MapPin, Globe, Building2, Phone, Plus, ArrowUpRight, Search } from "lucide-react"
import { cn } from "@/lib/utils"

async function getLocations() {
    try {
        const res = await fetch("http://localhost:3000/api/locations", { cache: "no-store" })
        if (!res.ok) return []
        return res.json()
    } catch (e) {
        console.error("Failed to fetch locations", e)
        return []
    }
}

export default async function LocationsPage() {
    const locations = await getLocations()

    return (
        <div className="flex flex-col gap-8 p-6 md:p-10 bg-white max-w-[1440px] mx-auto min-h-[85vh] shadow-[0_0_80px_-20px_rgba(0,0,0,0.08)] rounded-[2.5rem] my-8 border border-slate-100/50 relative overflow-hidden">
            {/* Background Decoration */}
            <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-blue-50/20 rounded-full blur-3xl -mr-64 -mt-64 pointer-events-none" />
            <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-slate-50/30 rounded-full blur-3xl -ml-48 -mb-48 pointer-events-none" />

            {/* Header Section */}
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-6 pb-6 border-b border-slate-100 relative z-10">
                <div>
                    <h1 className="text-2xl font-black text-slate-900 tracking-tight flex items-center gap-3">
                        <MapPin className="w-6 h-6 text-blue-600" strokeWidth={3} />
                        Terminal Infrastructure
                        <span className="px-3 py-1 bg-blue-50 text-blue-600 text-[12px] font-bold rounded-full border border-blue-100 uppercase tracking-widest">
                            {locations.length} Hubs
                        </span>
                    </h1>
                    <p className="text-slate-500 font-medium text-[14px] mt-1">Operational hubs and strategic SGR terminal locations</p>
                </div>
                
                <div className="flex items-center gap-4">
                    <button className="inline-flex items-center gap-2.5 bg-slate-900 hover:bg-slate-800 text-white text-[12px] font-black uppercase tracking-widest px-6 py-3 rounded-2xl shadow-xl shadow-slate-200 transition-all hover:-translate-y-0.5 active:scale-95 whitespace-nowrap">
                        <Plus size={16} strokeWidth={3} /> Add New Station
                    </button>
                </div>
            </div>

            {/* Toolbar Section */}
            <div className="flex flex-col gap-4 bg-slate-50/50 p-5 rounded-[2rem] border border-slate-100 shadow-sm relative z-10">
                <div className="flex flex-wrap items-center gap-4">
                    <div className="relative group min-w-[320px] flex-1">
                        <Search size={18} className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-blue-600 transition-colors" />
                        <input 
                            type="text"
                            placeholder="Find terminals by name, code or region..."
                            className="w-full pl-12 pr-4 py-3 bg-white border border-slate-200 rounded-2xl focus:outline-none focus:ring-4 focus:ring-blue-500/10 focus:border-blue-500/50 transition-all text-slate-700 font-bold text-[14px] shadow-sm placeholder:text-slate-300"
                        />
                    </div>
                </div>
            </div>

            {/* Content Area */}
            <div className="relative z-10 flex-1">
                {locations.length === 0 ? (
                    <div className="flex flex-col h-96 items-center justify-center text-slate-500 border-2 border-dashed border-slate-200 rounded-[2.5rem] bg-white shadow-sm max-w-2xl mx-auto mt-10">
                        <div className="w-20 h-20 rounded-3xl bg-slate-50 flex items-center justify-center mb-6">
                            <MapPin className="w-10 h-10 text-slate-300" strokeWidth={1.5} />
                        </div>
                        <p className="text-[20px] font-black text-slate-900 uppercase">No Network Hubs</p>
                        <p className="text-[14px] mt-2 max-w-[320px] text-center font-bold text-slate-400 leading-relaxed">
                            Initialize your logistics network by registering primary terminal locations.
                        </p>
                    </div>
                ) : (
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8 py-4">
                        {locations.map((station: any) => (
                            <div
                                key={station.id}
                                className="group bg-white rounded-[2.5rem] border border-slate-100 p-8 shadow-sm hover:shadow-2xl hover:shadow-blue-500/5 hover:-translate-y-2 transition-all duration-500 flex flex-col relative overflow-hidden border-slate-100/50"
                            >
                                <div className="absolute top-0 right-0 w-32 h-32 bg-blue-50/50 rounded-bl-[4rem] group-hover:bg-blue-600/5 transition-colors duration-500" />
                                
                                <div className="flex items-start justify-between mb-8 relative z-10">
                                    <div className="w-14 h-14 rounded-2xl bg-slate-900 flex items-center justify-center text-white group-hover:bg-blue-600 transition-colors duration-500 shadow-xl shadow-slate-200">
                                        <MapPin size={24} strokeWidth={2.5} />
                                    </div>
                                    <div className="flex flex-col items-end gap-2">
                                        <span className={cn(
                                            "text-[10px] font-black uppercase tracking-widest px-3 py-1.5 rounded-full border transition-all",
                                            station.isActive 
                                                ? 'bg-emerald-50 text-emerald-600 border-emerald-100' 
                                                : 'bg-rose-50 text-rose-600 border-rose-100'
                                        )}>
                                            {station.isActive ? "Operational" : "Offline"}
                                        </span>
                                        <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest bg-slate-50 px-2 py-1 rounded-lg border border-slate-100">
                                            {station.code}
                                        </span>
                                    </div>
                                </div>
                                
                                <div className="flex-1 relative z-10 pb-8">
                                    <h3 className="font-black text-slate-900 text-[20px] tracking-tight group-hover:text-blue-600 transition-colors truncate mb-3">
                                        {station.name}
                                    </h3>
                                    <div className="space-y-2">
                                        {station.region && (
                                            <div className="flex items-center gap-2 text-[13px] text-slate-400 font-bold">
                                                <Globe size={14} className="text-slate-300 shrink-0" />
                                                {station.region}
                                            </div>
                                        )}
                                        {station.phone && (
                                            <div className="flex items-center gap-2 text-[13px] text-slate-400 font-bold">
                                                <Phone size={14} className="text-slate-300 shrink-0" />
                                                {station.phone}
                                            </div>
                                        )}
                                    </div>
                                </div>

                                <div className="pt-6 border-t border-slate-50 flex items-center justify-between relative z-10">
                                    <div className="flex flex-col">
                                        <span className="text-[10px] font-black text-slate-300 uppercase tracking-widest mb-1.5">Asset Type</span>
                                        <span className="text-[14px] font-black text-slate-700">Terminal Hub</span>
                                    </div>
                                    
                                    <button className="w-12 h-12 rounded-2xl bg-slate-50 text-slate-400 flex items-center justify-center hover:bg-blue-600 hover:text-white transition-all duration-300 shadow-sm border border-slate-100 active:scale-90">
                                        <ArrowUpRight size={18} strokeWidth={3} />
                                    </button>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </div>
        </div>
    )
}