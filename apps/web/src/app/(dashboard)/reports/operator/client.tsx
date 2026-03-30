"use client";

import { Document, Page, Text, View, StyleSheet, PDFDownloadLink, Font } from '@react-pdf/renderer';
import { Download, FileText, ArrowLeft, Users, Medal, Clock, Target, UserCheck, Activity, TrendingUp, Package, Truck, CheckCircle2, Warehouse } from "lucide-react";
import Link from "next/link";
import { useState, useEffect } from "react";
import { cn } from "@/lib/utils";

// Register fonts for PDF
Font.register({
    family: 'Inter',
    fonts: [
        { src: 'https://fonts.gstatic.com/s/inter/v12/UcCO3FwrK3iLTeHuS_fvQtMwCp50KnMw2boKoduKmMEVuLyeMZhrib2Bg-4.ttf', fontWeight: 400 },
        { src: 'https://fonts.gstatic.com/s/inter/v12/UcCO3FwrK3iLTeHuS_fvQtMwCp50KnMw2boKoduKmMEVuGKYMZhrib2Bg-4.ttf', fontWeight: 700 }
    ]
});

// PDF Styles
const styles = StyleSheet.create({
    page: { padding: 50, fontFamily: 'Inter', backgroundColor: '#ffffff' },
    header: { flexDirection: 'row', justifyContent: 'space-between', borderBottomWidth: 2, borderBottomColor: '#f1f5f9', paddingBottom: 25, marginBottom: 40 },
    title: { fontSize: 28, fontWeight: 700, color: '#0f172a', letterSpacing: -0.5 },
    subtitle: { fontSize: 11, color: '#64748b', marginTop: 6, fontWeight: 500 },
    brand: { fontSize: 18, fontWeight: 700, color: '#2563eb' },
    sectionTitle: { fontSize: 16, fontWeight: 700, color: '#1e293b', marginBottom: 18, marginTop: 30, textTransform: 'uppercase', letterSpacing: 1 },
    cardGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: 20, marginBottom: 30 },
    card: { width: '47%', padding: 20, backgroundColor: '#f8fafc', borderRadius: 12, border: '1px solid #e2e8f0' },
    cardTitle: { fontSize: 10, color: '#64748b', textTransform: 'uppercase', fontWeight: 700, letterSpacing: 0.5 },
    cardValue: { fontSize: 24, fontWeight: 700, color: '#0f172a', marginTop: 10 },
    list: { marginTop: 10 },
    listItem: { paddingBottom: 12, borderBottomWidth: 1, borderBottomColor: '#f1f5f9', marginBottom: 12 },
    itemName: { fontSize: 12, fontWeight: 700, color: '#1e293b' },
    itemDetail: { fontSize: 10, color: '#64748b', marginTop: 4, fontWeight: 500 },
    footer: { position: 'absolute', bottom: 40, left: 50, right: 50, fontSize: 10, color: '#94a3b8', textAlign: 'center', borderTopWidth: 1, borderTopColor: '#f1f5f9', paddingTop: 15 },
});

const OperatorReportPDF = ({ operators, metrics, generatedAt, stationName }: any) => (
    <Document>
        <Page size="A4" style={styles.page}>
            <View style={styles.header}>
                <View>
                    <Text style={styles.title}>Operator Analytics</Text>
                    <Text style={styles.subtitle}>{stationName} • Resource Performance • {new Date(generatedAt).toLocaleDateString()}</Text>
                </View>
                <View>
                    <Text style={styles.brand}>MIZIGO</Text>
                </View>
            </View>

            <View>
                <Text style={styles.sectionTitle}>Performance Overview</Text>
                <View style={styles.cardGrid}>
                    <View style={styles.card}>
                        <Text style={styles.cardTitle}>Received Units</Text>
                        <Text style={styles.cardValue}>{metrics.received}</Text>
                    </View>
                    <View style={styles.card}>
                        <Text style={styles.cardTitle}>Delivered Units</Text>
                        <Text style={styles.cardValue}>{metrics.delivered}</Text>
                    </View>
                    <View style={styles.card}>
                        <Text style={styles.cardTitle}>Sent Units</Text>
                        <Text style={styles.cardValue}>{metrics.sent}</Text>
                    </View>
                    <View style={styles.card}>
                        <Text style={styles.cardTitle}>At Warehouse</Text>
                        <Text style={styles.cardValue}>{metrics.atWarehouse}</Text>
                    </View>
                </View>
            </View>

            <View style={{ marginTop: 20 }}>
                <Text style={styles.sectionTitle}>Active Personnel Roster</Text>
                <View style={styles.list}>
                    {operators.map((op: any) => (
                        <View key={op.id} style={styles.listItem}>
                            <Text style={styles.itemName}>{op.name}</Text>
                            <Text style={styles.itemDetail}>{op.email} • Active Since {new Date(op.createdAt).toLocaleDateString()}</Text>
                        </View>
                    ))}
                </View>
            </View>

            <Text style={styles.footer} fixed>
                PROPRIETARY DATA: For management purposes within Mizigo platform only.
            </Text>
        </Page>
    </Document>
);


export function OperatorReportClient({ operators, metrics, generatedAt, stationName, timeframe }: any) {
    const [isClient, setIsClient] = useState(false);

    useEffect(() => {
        setIsClient(true);
    }, []);

    const updateTimeframe = (newTimeframe: string) => {
        const url = new URL(window.location.href);
        url.searchParams.set('timeframe', newTimeframe);
        window.location.href = url.toString();
    };

    return (
        <div className="flex flex-col gap-10 p-6 md:p-10 bg-white max-w-[1440px] mx-auto min-h-[85vh] shadow-[0_0_80px_-20px_rgba(0,0,0,0.08)] rounded-[2.5rem] my-8 border border-slate-100/50 relative overflow-hidden">
            {/* Background Decoration */}
            <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-blue-50/20 rounded-full blur-3xl -mr-64 -mt-64 pointer-events-none" />
            <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-slate-50/30 rounded-full blur-3xl -ml-48 -mb-48 pointer-events-none" />

            {/* Header Section */}
            <div className="flex flex-col md:flex-row md:items-end justify-between gap-6 pb-2 relative z-10">
                <div>
                    <Link href="/reports" className="inline-flex items-center text-[12px] font-black text-slate-400 hover:text-blue-600 mb-6 transition-all group uppercase tracking-widest">
                        <ArrowLeft className="w-4 h-4 mr-2 group-hover:-translate-x-1 transition-transform" strokeWidth={3} />
                        Analytics Hub
                    </Link>
                    <div className="flex items-center gap-4 mb-3">
                        <div className="w-12 h-12 rounded-2xl bg-blue-600 flex items-center justify-center text-white shadow-xl shadow-blue-200">
                            <Users size={24} strokeWidth={2.5} />
                        </div>
                        <h1 className="text-[32px] font-black text-slate-900 tracking-tight leading-none">Operator Intelligence</h1>
                    </div>
                    <p className="text-[15px] text-slate-500 font-bold">Performance telemetry for <span className="text-blue-600">{stationName}</span> operators</p>
                </div>

                <div className="flex items-center gap-4">
                    {/* Timeframe Selector */}
                    <div className="flex items-center bg-slate-50 border border-slate-100 rounded-2xl p-1.5 shadow-sm">
                        {['weekly', 'monthly', 'quarterly'].map((tf) => (
                            <button
                                key={tf}
                                onClick={() => updateTimeframe(tf)}
                                className={cn(
                                    "px-6 py-2.5 rounded-xl text-[11px] font-black uppercase tracking-widest transition-all",
                                    timeframe === tf 
                                        ? "bg-white text-blue-600 shadow-md border border-slate-100" 
                                        : "text-slate-400 hover:text-slate-600"
                                )}
                            >
                                {tf}
                            </button>
                        ))}
                    </div>

                    {isClient && (
                         <PDFDownloadLink
                            document={<OperatorReportPDF operators={operators} metrics={metrics} generatedAt={generatedAt} stationName={stationName} />}
                            fileName={`operator-report-${stationName.toLowerCase().replace(/\s+/g, '-')}.pdf`}
                        >
                            {({ loading }) => (
                                <button 
                                    disabled={loading}
                                    className="h-14 px-8 rounded-2xl bg-slate-900 hover:bg-black text-white font-black text-[12px] uppercase tracking-widest shadow-xl shadow-slate-200 transition-all active:scale-95 flex items-center gap-3 disabled:opacity-50"
                                >
                                    {loading ? (
                                        <div className="w-5 h-5 rounded-full border-2 border-white/20 border-t-white animate-spin" />
                                    ) : (
                                        <Download className="w-5 h-5" strokeWidth={3} />
                                    )}
                                    {loading ? 'Processing...' : 'Export Analytics'}
                                </button>
                            )}
                        </PDFDownloadLink>
                    )}
                </div>
            </div>

            {/* Dashboard Content */}
            <div className="grid grid-cols-1 lg:grid-cols-3 gap-10 relative z-10 flex-1">
                <div className="lg:col-span-2 space-y-10">
                    {/* Core Operational Stats */}
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                        {[
                            { label: "Received", value: metrics.received, icon: Package, color: "text-blue-600", bg: "bg-blue-50" },
                            { label: "Delivered", value: metrics.delivered, icon: CheckCircle2, color: "text-emerald-600", bg: "bg-emerald-50" },
                            { label: "Sent", value: metrics.sent, icon: Truck, color: "text-indigo-600", bg: "bg-indigo-50" },
                            { label: "At Warehouse", value: metrics.atWarehouse, icon: Warehouse, color: "text-amber-600", bg: "bg-amber-50" },
                        ].map((stat) => (
                            <div key={stat.label} className="bg-white rounded-3xl border border-slate-100 p-6 shadow-sm hover:shadow-xl hover:shadow-slate-100 transition-all group">
                                <div className={cn("w-12 h-12 rounded-2xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform", stat.bg, stat.color)}>
                                    <stat.icon size={20} strokeWidth={2.5} />
                                </div>
                                <div className="space-y-1">
                                    <p className="text-[11px] font-black text-slate-400 uppercase tracking-widest">{stat.label}</p>
                                    <p className="text-[28px] font-black text-slate-900 tabular-nums leading-none tracking-tight">{stat.value}</p>
                                </div>
                            </div>
                        ))}
                    </div>

                    {/* Personnel Productivity Table */}
                    <div className="bg-white rounded-[2.5rem] border border-slate-100 overflow-hidden shadow-sm flex-1 flex flex-col">
                        <div className="p-8 border-b border-slate-100 flex items-center justify-between bg-slate-50/30">
                            <h3 className="text-[18px] font-black text-slate-900 flex items-center gap-3">
                                <UserCheck size={18} className="text-blue-600" />
                                Active Personnel Performance
                            </h3>
                            <div className="flex items-center gap-2 px-4 py-1.5 rounded-full bg-blue-50 text-blue-600 border border-blue-100 font-black text-[10px] uppercase tracking-widest animate-pulse">
                                Live Data
                            </div>
                        </div>
                        <div className="divide-y divide-slate-50">
                            {operators.map((op: any) => (
                                <div key={op.id} className="p-8 flex items-center justify-between hover:bg-blue-50/30 transition-all duration-300 group">
                                    <div className="flex items-center gap-5">
                                        <div className="w-14 h-14 rounded-2xl bg-slate-900 flex items-center justify-center text-white group-hover:bg-blue-600 group-hover:rotate-6 transition-all shadow-xl shadow-slate-200">
                                            <Users size={24} strokeWidth={2.5} />
                                        </div>
                                        <div>
                                            <p className="font-black text-slate-900 text-[16px] tracking-tight">{op.name}</p>
                                            <p className="text-[13px] text-slate-400 font-bold">{op.email}</p>
                                        </div>
                                    </div>
                                    <div className="flex items-center gap-12 text-right">
                                        <div className="hidden xl:block">
                                            <p className="text-[10px] font-black text-slate-300 uppercase tracking-widest mb-1.5">System Status</p>
                                            <div className="flex items-center gap-2 justify-end">
                                                <span className="w-2 h-2 rounded-full bg-emerald-500" />
                                                <span className="text-[13px] font-black text-slate-600">Sync Active</span>
                                            </div>
                                        </div>
                                        <div className="flex flex-col items-end">
                                            <p className="text-[10px] font-black text-slate-300 uppercase tracking-widest mb-1.5">Onboarded</p>
                                            <p className="text-[14px] font-black text-slate-900">{new Date(op.createdAt).toLocaleDateString("en-GB", { day: '2-digit', month: 'short', year: 'numeric' })}</p>
                                        </div>
                                        <button className="w-10 h-10 rounded-xl bg-slate-50 text-slate-300 flex items-center justify-center group-hover:bg-blue-600 group-hover:text-white transition-all">
                                            <ArrowLeft className="rotate-180" size={16} strokeWidth={3} />
                                        </button>
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>

                {/* Performance Sidebar */}
                <div className="space-y-10">
                    {/* Leaderboard Card */}
                    <div className="bg-slate-900 rounded-[2.5rem] p-10 text-white relative overflow-hidden shadow-2xl shadow-slate-200 border border-slate-800">
                        <Medal size={160} className="absolute -bottom-10 -right-10 text-white/5 rotate-12" />
                        <div className="relative z-10">
                            <span className="text-[11px] font-black text-blue-400 uppercase tracking-[0.2em] block mb-6">Efficiency Leader</span>
                            <div className="flex flex-col gap-6">
                                <div className="w-20 h-20 rounded-[2rem] bg-white/10 flex items-center justify-center text-blue-400 border border-white/10 shadow-inner">
                                    <Medal size={40} strokeWidth={2} />
                                </div>
                                <div>
                                    <h3 className="text-[24px] font-black leading-tight mb-2">{metrics.topPerformer || "N/A"}</h3>
                                    <p className="text-[14px] text-slate-400 font-bold">Highest individual throughput recorded in this cycle.</p>
                                </div>
                                <div className="pt-6 border-t border-white/10">
                                    <div className="flex justify-between items-center mb-2">
                                        <span className="text-[11px] font-black text-slate-500 uppercase tracking-widest">Target Accuracy</span>
                                        <span className="text-[13px] font-black text-emerald-400">98%</span>
                                    </div>
                                    <div className="h-2 bg-white/5 rounded-full overflow-hidden">
                                        <div className="h-full bg-blue-600 w-[98%] shadow-glow" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Peak Performance Matrix */}
                    <div className="bg-white rounded-[2.5rem] border border-slate-100 p-10 shadow-sm relative overflow-hidden">
                        <div className="flex items-center gap-3 mb-8">
                            <div className="w-8 h-8 rounded-lg bg-blue-50 flex items-center justify-center text-blue-600">
                                <Clock size={16} strokeWidth={2.5} />
                            </div>
                            <h3 className="text-[14px] font-black text-slate-900 uppercase tracking-[0.15em]">Workflow Velocity</h3>
                        </div>
                        
                        <div className="space-y-8">
                            {[
                                { label: "Morning Shift", value: 75, color: "bg-blue-600", status: "Optimal" },
                                { label: "Afternoon Shift", value: 92, color: "bg-emerald-500", status: "Peak" },
                                { label: "Night Shift", value: 45, color: "bg-indigo-500", status: "Stable" },
                            ].map((shift) => (
                                <div key={shift.label} className="space-y-3">
                                    <div className="flex justify-between text-[13px] font-black">
                                        <span className="text-slate-500">{shift.label}</span>
                                        <span className="text-slate-900 uppercase text-[10px] tracking-widest px-2 py-0.5 rounded-md bg-slate-50">{shift.status}</span>
                                    </div>
                                    <div className="h-2 bg-slate-50 rounded-full overflow-hidden border border-slate-100 italic">
                                        <div 
                                            className={cn("h-full transition-all duration-1000", shift.color)} 
                                            style={{ width: `${shift.value}%` }} 
                                        />
                                    </div>
                                </div>
                            ))}
                        </div>
                        
                        <div className="mt-10 p-5 rounded-3xl bg-blue-50 border border-blue-100">
                            <p className="text-[12px] text-blue-700 font-bold leading-relaxed flex items-start gap-3">
                                <Activity size={14} className="shrink-0 mt-0.5" />
                                Personnel productivity is currently at 
                                <span className="text-slate-900 font-black px-1.5 py-0.5 bg-white rounded-lg mx-1 border border-blue-100 shadow-sm">84.2%</span> 
                                across all terminals.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
