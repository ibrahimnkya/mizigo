import Link from "next/link";
import { TrendingUp, Package2, Timer, ArrowUpRight, MapPin, Users, Building2, FileBarChart2 } from "lucide-react";

const reportCards = [
    {
        title: "Station Performance",
        description: "Analyze individual branch metrics, revenue, and cargo volume tracking.",
        href: "/reports/station",
        icon: MapPin,
        accent: "#2563eb",
        tag: "Logistic Hubs",
    },
    {
        title: "Operator Efficiency",
        description: "Review processing times, operations handled, and agent productivity logs.",
        href: "/reports/operator",
        icon: Users,
        accent: "#2563eb",
        tag: "Human Capital",
    },
    {
        title: "Organization Intelligence",
        description: "High-level strategic aggregate view of the entire organization's performance.",
        href: "/reports/organization",
        icon: Building2,
        accent: "#2563eb",
        tag: "Enterprise",
    },
    {
        title: "Revenue Analytics",
        description: "View detailed financial performance, collections, and growth projections.",
        href: "/reports/revenue",
        icon: TrendingUp,
        accent: "#2563eb",
        tag: "Financials",
    },
    {
        title: "Operational Volume",
        description: "Deep dive into shipment quantities and regional station activity.",
        href: "/reports/volume",
        icon: Package2,
        accent: "#2563eb",
        tag: "Operations",
    },
    {
        title: "Throughput Analysis",
        description: "Monitor turnaround times and operational velocity across the network.",
        href: "/reports/turnaround",
        icon: Timer,
        accent: "#2563eb",
        tag: "Efficiency",
    },
]

export default function ReportsPage() {
    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-10">

                {/* Strategic Header */}
                <div className="flex flex-col md:flex-row md:items-end justify-between gap-6">
                    <div>
                        <div className="flex items-center gap-2 mb-3">
                            <div className="w-8 h-8 rounded-lg bg-blue-600 flex items-center justify-center text-white shadow-lg shadow-blue-200">
                                <FileBarChart2 size={16} strokeWidth={2.5} />
                            </div>
                            <span className="text-[11px] font-black uppercase tracking-[0.2em] text-blue-600">
                                Strategic Intelligence
                            </span>
                        </div>
                        <h1 className="text-[32px] font-black text-slate-900 tracking-tight leading-none mb-3">Reports & Analytics</h1>
                        <p className="text-[15px] text-slate-500 font-bold max-w-xl">Comprehensive insights into your logistics network, personnel efficiency, and financial health.</p>
                    </div>

                    <div className="flex items-center gap-4 bg-white p-2 rounded-2xl border border-slate-100 shadow-sm">
                        <div className="px-5 py-2.5 bg-blue-50 text-blue-700 rounded-xl text-[13px] font-black uppercase tracking-widest border border-blue-100/50">
                            Live Feed
                        </div>
                        <div className="h-4 w-px bg-slate-100" />
                        <span className="pr-5 text-[12px] font-black text-slate-400 uppercase tracking-widest">
                            {new Date().toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' })}
                        </span>
                    </div>
                </div>

                {/* Analytical Matrices Grid */}
                <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
                    {reportCards.map((report) => (
                        <Link key={report.title} href={report.href} className="group">
                            <div className="relative bg-white rounded-[2.5rem] border border-slate-100 p-10 shadow-[0_1px_3px_rgba(0,0,0,0.02)] hover:shadow-[0_20px_50px_rgba(0,0,0,0.06)] hover:-translate-y-2 transition-all duration-500 overflow-hidden h-full flex flex-col gap-8">

                                {/* Top row with semantic branding */}
                                <div className="flex items-start justify-between relative z-10">
                                    <div
                                        className="w-14 h-14 rounded-[1.25rem] flex items-center justify-center bg-blue-50 text-blue-600 border border-blue-100 group-hover:bg-blue-600 group-hover:text-white group-hover:scale-110 transition-all duration-500 shadow-sm"
                                    >
                                        <report.icon size={24} strokeWidth={2.5} />
                                    </div>
                                    <span className="text-[10px] font-black uppercase tracking-[0.18em] px-3 py-1.5 rounded-xl bg-slate-50 text-slate-400 group-hover:bg-blue-50 group-hover:text-blue-600 transition-colors duration-500">
                                        {report.tag}
                                    </span>
                                </div>

                                {/* Content Architecture */}
                                <div className="flex-1 relative z-10">
                                    <h3 className="text-[20px] font-black text-slate-900 tracking-tight group-hover:text-blue-600 transition-colors duration-500 mb-3">
                                        {report.title}
                                    </h3>
                                    <p className="text-[14px] text-slate-500 font-bold leading-relaxed">
                                        {report.description}
                                    </p>
                                </div>

                                {/* Interactive Indicator */}
                                <div className="flex items-center justify-between mt-auto pt-6 border-t border-slate-50 relative z-10">
                                    <div className="flex items-center gap-1.5 text-[12px] font-black text-slate-400 group-hover:text-blue-600 transition-all duration-500 translate-x-0 group-hover:translate-x-1">
                                        Access Intel <ArrowUpRight size={14} strokeWidth={3} />
                                    </div>
                                    
                                    <div className="w-8 h-8 rounded-full bg-slate-50 flex items-center justify-center opacity-0 group-hover:opacity-100 scale-50 group-hover:scale-100 transition-all duration-500">
                                        <div className="w-1.5 h-1.5 rounded-full bg-blue-600 animate-pulse" />
                                    </div>
                                </div>

                                {/* Structural Enhancements */}
                                <div className="absolute top-0 right-0 w-32 h-32 bg-blue-50/30 rounded-bl-[4rem] translate-x-8 -translate-y-8 group-hover:translate-x-4 group-hover:-translate-y-4 transition-transform duration-700" />
                                <div className="absolute bottom-0 left-0 w-full h-[3px] bg-blue-600 scale-x-0 group-hover:scale-x-100 origin-left transition-transform duration-500" />
                            </div>
                        </Link>
                    ))}
                </div>

                {/* Enterprise Footer Note */}
                <div className="bg-slate-900 rounded-[2rem] p-8 flex items-center justify-between text-white overflow-hidden relative">
                    <div className="relative z-10">
                        <h4 className="text-[18px] font-black mb-1">Export All Financials</h4>
                        <p className="text-slate-400 text-[13px] font-bold">Generate a consolidated PDF containing all organizational metrics and station performance.</p>
                    </div>
                    <button className="bg-blue-600 hover:bg-blue-700 text-white h-12 px-8 rounded-xl font-black text-[13px] uppercase tracking-widest shadow-xl shadow-blue-500/20 transition-all active:scale-95 relative z-10 flex items-center gap-2">
                        Download Master Report <TrendingUp size={16} />
                    </button>
                    
                    <div className="absolute right-0 top-0 bottom-0 w-1/3 bg-white/5 skew-x-[-20deg] translate-x-20" />
                </div>
            </div>
        </div>
    )
}

