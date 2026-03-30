'use client'

import { useState, useEffect } from 'react'
import { Users, Mail, Phone, Calendar, Loader2 } from 'lucide-react'
import { Card, CardHeader } from '@/components/dashboard/dashboard-shell'
import { cn } from '@/lib/utils'

interface Agent {
    id: string
    name: string
    email: string
    phone?: string | null
    createdAt: string
    role: { name: string }
}

export function AgentsList() {
    const [agents, setAgents] = useState<Agent[]>([])
    const [loading, setLoading] = useState(true)

    useEffect(() => {
        const fetchAgents = async () => {
            try {
                const res = await fetch('/api/users/agents')
                if (!res.ok) throw new Error('Failed to fetch agents')
                const data = await res.json()
                setAgents(data)
            } catch (error) {
                console.error('Error fetching agents:', error)
            } finally {
                setLoading(false)
            }
        }
        fetchAgents()
    }, [])

    if (loading) {
        return (
            <div className="flex items-center justify-center py-24">
                <Loader2 className="w-8 h-8 text-indigo-500 animate-spin" />
            </div>
        )
    }

    if (agents.length === 0) {
        return (
            <div className="flex flex-col items-center justify-center py-24 text-slate-300 gap-3">
                <Users size={36} strokeWidth={1.5} />
                <p className="text-sm font-semibold text-slate-400">No agents found</p>
            </div>
        )
    }

    return (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 p-6">
            {agents.map((agent) => (
                <div 
                    key={agent.id}
                    className="group bg-white rounded-2xl border border-slate-100 p-6 shadow-[0_1px_3px_rgba(0,0,0,0.04)] hover:shadow-[0_12px_32px_rgba(0,0,0,0.06)] transition-all duration-300 flex flex-col gap-4"
                >
                    <div className="flex items-center gap-4">
                        <div className="w-12 h-12 rounded-2xl bg-indigo-50 flex items-center justify-center text-indigo-600 font-black text-lg group-hover:scale-110 transition-transform duration-300">
                            {agent.name.charAt(0).toUpperCase()}
                        </div>
                        <div>
                            <h3 className="font-extrabold text-slate-900 group-hover:text-indigo-600 transition-colors uppercase tracking-tight">{agent.name}</h3>
                            <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 bg-slate-50 px-2 py-0.5 rounded border border-slate-100">
                                {agent.role.name}
                            </span>
                        </div>
                    </div>

                    <div className="space-y-2.5">
                        <div className="flex items-center gap-2.5 text-[13px] text-slate-500 font-medium">
                            <Mail size={14} className="text-slate-300" />
                            {agent.email}
                        </div>
                        {agent.phone && (
                            <div className="flex items-center gap-2.5 text-[13px] text-slate-500 font-medium">
                                <Phone size={14} className="text-slate-300" />
                                {agent.phone}
                            </div>
                        )}
                        <div className="flex items-center gap-2.5 text-[12px] text-slate-400 font-medium pt-2 border-t border-slate-50">
                            <Calendar size={14} className="text-slate-300" />
                            Joined {new Date(agent.createdAt).toLocaleDateString(undefined, { month: 'short', day: 'numeric', year: 'numeric' })}
                        </div>
                    </div>
                </div>
            ))}
        </div>
    )
}
