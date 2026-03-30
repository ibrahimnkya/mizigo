"use client"

import { useState, useEffect } from "react"
import { 
    Search as SearchIcon, 
    Building2 as BuildingIcon, 
    Clock as ClockIcon,
    MapPin as MapPinIcon,
    Activity as ActivityIcon,
    ArrowRight as ArrowRightIcon,
    TrendingUp as TrendingUpIcon,
    MoreHorizontal,
    Globe
} from "lucide-react"
import { Input } from "@repo/ui/input"
import { CreateOrganizationModal } from "./create-organization-modal"
import { cn } from "@/lib/utils"

export function OrganizationList() {
    const [organizations, setOrganizations] = useState<any[]>([])
    const [loading, setLoading] = useState(true)
    const [searchQuery, setSearchQuery] = useState("")

    const fetchOrganizations = async () => {
        try {
            setLoading(true)
            const response = await fetch('/api/organizations')
            if (response.ok) {
                const data = await response.json()
                setOrganizations(data)
            }
        } catch (error) {
            console.error('Failed to fetch organizations:', error)
        } finally {
            setLoading(false)
        }
    }

    useEffect(() => {
        fetchOrganizations()
    }, [])

    const filteredOrganizations = organizations.filter(org => 
        org.name.toLowerCase().includes(searchQuery.toLowerCase())
    )

    return (
        <div className="flex flex-col gap-8 p-6 md:p-10 bg-white max-w-[1440px] mx-auto min-h-[85vh] shadow-[0_0_80px_-20px_rgba(0,0,0,0.08)] rounded-[2.5rem] my-8 border border-slate-100/50 relative overflow-hidden">
             {/* Background Decoration */}
             <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-blue-50/20 rounded-full blur-3xl -mr-64 -mt-64 pointer-events-none" />
             <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-slate-50/30 rounded-full blur-3xl -ml-48 -mb-48 pointer-events-none" />

            {/* Header Section */}
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-6 pb-6 border-b border-slate-100 relative z-10">
                <div>
                    <h1 className="text-2xl font-black text-slate-900 tracking-tight flex items-center gap-3">
                        <Globe className="w-6 h-6 text-blue-600" strokeWidth={3} />
                        Entity Registry
                        <span className="px-3 py-1 bg-blue-50 text-blue-600 text-[12px] font-bold rounded-full border border-blue-100 uppercase tracking-widest">
                            {organizations.length} Organizations
                        </span>
                    </h1>
                    <p className="text-slate-500 font-medium text-[14px] mt-1">Managing high-level infrastructure and logistics partners</p>
                </div>
                
                <div className="flex items-center gap-4">
                     <div className="relative group min-w-[320px]">
                        <SearchIcon className="absolute left-4 top-1/2 -translate-y-1/2 h-4 w-4 text-slate-400 group-focus-within:text-blue-600 transition-colors" strokeWidth={3} />
                        <Input
                            placeholder="Search entities by name..."
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            className="pl-11 h-12 w-full bg-slate-50 border-slate-200 rounded-2xl focus:outline-none focus:ring-4 focus:ring-blue-500/10 focus:border-blue-500/50 transition-all text-slate-700 font-bold text-[14px] shadow-sm placeholder:text-slate-300"
                        />
                    </div>
                    <CreateOrganizationModal onSuccess={fetchOrganizations} />
                </div>
            </div>

            {/* Content Area */}
            <div className="relative z-10 flex-1">
                {loading ? (
                    <div className="flex flex-col h-96 items-center justify-center gap-6">
                        <div className="relative">
                            <div className="w-16 h-16 rounded-3xl border-4 border-slate-100 border-t-blue-600 animate-spin" />
                            <BuildingIcon className="w-6 h-6 text-blue-600 absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2" />
                        </div>
                        <p className="text-[13px] font-black text-slate-400 uppercase tracking-[0.2em] animate-pulse">Synchronizing Infrastructure...</p>
                    </div>
                ) : filteredOrganizations.length === 0 ? (
                    <div className="flex flex-col h-96 items-center justify-center text-slate-500 border-2 border-dashed border-slate-200 rounded-[2.5rem] bg-white shadow-sm max-w-2xl mx-auto mt-20">
                        <div className="w-20 h-20 rounded-3xl bg-slate-50 flex items-center justify-center mb-6">
                            <BuildingIcon className="w-10 h-10 text-slate-300" strokeWidth={1.5} />
                        </div>
                        <p className="text-[20px] font-black text-slate-900 uppercase">Void Entity State</p>
                        <p className="text-[14px] mt-2 max-w-[320px] text-center font-bold text-slate-400 leading-relaxed">
                            {searchQuery ? "Your query returned zero matches." : "Establish your first organizational node to begin infrastructure routing."}
                        </p>
                    </div>
                ) : (
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8 py-4">
                        {filteredOrganizations.map((org: any) => (
                            <div
                                key={org.id}
                                className="group bg-white rounded-[2.5rem] border border-slate-100 p-8 shadow-sm hover:shadow-2xl hover:shadow-blue-500/10 hover:-translate-y-2 transition-all duration-500 flex flex-col relative overflow-hidden border-slate-100/50 shadow-sm"
                            >
                                <div className="absolute top-0 right-0 w-32 h-32 bg-blue-50/50 rounded-bl-[4rem] group-hover:bg-blue-600/5 transition-colors duration-500" />
                                
                                <div className="flex items-start justify-between mb-8 relative z-10">
                                    <div className="w-14 h-14 rounded-2xl bg-slate-900 flex items-center justify-center text-[20px] font-black text-white group-hover:bg-blue-600 transition-colors duration-500 shadow-xl shadow-slate-200">
                                        {org.name.charAt(0).toUpperCase()}
                                    </div>
                                    <div className="flex flex-col items-end gap-2">
                                        <span className={cn(
                                            "text-[10px] font-black uppercase tracking-widest px-3 py-1.5 rounded-full border transition-all",
                                            org.isActive 
                                                ? 'bg-emerald-50 text-emerald-600 border-emerald-100' 
                                                : 'bg-slate-50 text-slate-400 border-slate-100'
                                        )}>
                                            {org.isActive ? "Operational" : "Deactivated"}
                                        </span>
                                        {org.isActive && (
                                            <div className="flex items-center gap-1.5 text-blue-600 font-black text-[11px] uppercase tracking-widest">
                                                <TrendingUpIcon size={12} strokeWidth={3} />
                                                Active
                                            </div>
                                        )}
                                    </div>
                                </div>
                                
                                <div className="flex-1 relative z-10 pb-8">
                                    <h3 className="font-black text-slate-900 text-[20px] tracking-tight group-hover:text-blue-600 transition-colors truncate mb-2">
                                        {org.name}
                                    </h3>
                                    <p className="text-[13px] text-slate-400 font-bold leading-relaxed line-clamp-2 min-h-[40px]">
                                        {org.description || "Baseline infrastructure entity for logistics and resource distribution."}
                                    </p>
                                </div>

                                <div className="pt-6 border-t border-slate-50 flex items-center justify-between relative z-10">
                                    <div className="flex items-center gap-6">
                                        <div className="flex flex-col">
                                            <span className="text-[10px] font-black text-slate-300 uppercase tracking-widest mb-1.5">Nodes</span>
                                            <span className="text-[14px] font-black text-slate-700">{org._count?.stations || 0} Stations</span>
                                        </div>
                                        <div className="w-[1px] h-8 bg-slate-100" />
                                        <div className="flex flex-col">
                                            <span className="text-[10px] font-black text-slate-300 uppercase tracking-widest mb-1.5">Established</span>
                                            <span className="text-[14px] font-black text-slate-700">{new Date(org.createdAt).toLocaleDateString()}</span>
                                        </div>
                                    </div>
                                    
                                    <button className="w-12 h-12 rounded-2xl bg-slate-50 text-slate-400 flex items-center justify-center hover:bg-blue-600 hover:text-white transition-all duration-300 shadow-sm border border-slate-100 active:scale-90">
                                        <ArrowRightIcon size={18} strokeWidth={3} />
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
