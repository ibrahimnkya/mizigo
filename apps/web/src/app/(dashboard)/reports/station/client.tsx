"use client";

import { Document, Page, Text, View, StyleSheet, PDFDownloadLink, Font } from '@react-pdf/renderer';
import { Download, FileText, ArrowLeft, BarChart3, PieChart, Activity, Globe, TrendingUp, Package, Truck, CheckCircle2, Warehouse, Search } from "lucide-react";
import Link from "next/link";
import { cn } from '@/lib/utils';
import { useState, useEffect } from "react";

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
    footer: { position: 'absolute', bottom: 40, left: 50, right: 50, fontSize: 10, color: '#94a3b8', textAlign: 'center', borderTopWidth: 1, borderTopColor: '#f1f5f9', paddingTop: 15 },
});

// The PDF Document Component
const StationReportPDF = ({ station, metrics, generatedAt }: any) => (
    <Document>
        <Page size="A4" style={styles.page}>
            <View style={styles.header}>
                <View>
                    <Text style={styles.title}>Station Performance</Text>
                    <Text style={styles.subtitle}>{station.name} • Internal Audit • {new Date(generatedAt).toLocaleDateString()}</Text>
                </View>
                <View>
                    <Text style={styles.brand}>MIZIGO</Text>
                </View>
            </View>

            <View>
                <Text style={styles.sectionTitle}>Operational Throughput</Text>
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
                        <Text style={styles.cardTitle}>Warehouse Stock</Text>
                        <Text style={styles.cardValue}>{metrics.atWarehouse}</Text>
                    </View>
                </View>
            </View>

            <Text style={styles.footer} fixed>
                CONFIDENTIAL: This document is for internal use within {station.organization?.name || 'Mizigo'} only.
            </Text>
        </Page>
    </Document>
);


export function StationReportClient({ station, metrics, generatedAt, timeframe }: any) {
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
                            <Activity size={24} strokeWidth={2.5} />
                        </div>
                        <h1 className="text-[32px] font-black text-slate-900 tracking-tight leading-none">Station Intelligence</h1>
                    </div>
                    <p className="text-[15px] text-slate-500 font-bold tracking-tight">Logistic telemetry for <span className="text-blue-600">{station.name}</span></p>
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
                            document={<StationReportPDF station={station} metrics={metrics} generatedAt={generatedAt} />}
                            fileName={`station-report-${station.name.toLowerCase().replace(/\s+/g, '-')}.pdf`}
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

            {/* KPI Performance Matrix */}
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
                            <div key={stat.label} className="bg-white rounded-3xl border border-slate-100 p-6 shadow-sm hover:shadow-xl hover:shadow-slate-100 transition-all group border-slate-100/50">
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

                    {/* Operational Visuals */}
                    <div className="bg-white rounded-[2.5rem] border border-slate-100 p-10 shadow-sm relative overflow-hidden group">
                         <div className="flex items-center justify-between mb-8">
                            <h2 className="text-[18px] font-black text-slate-900 flex items-center gap-3">
                                <BarChart3 size={18} className="text-blue-600" />
                                Workload Throughput
                            </h2>
                            <div className="flex items-center gap-2 px-4 py-1.5 rounded-full bg-blue-50 text-blue-600 border border-blue-100 font-black text-[10px] uppercase tracking-widest">
                                Global Benchmark
                            </div>
                         </div>
                         <div className="aspect-[21/9] rounded-[2rem] bg-slate-50 border border-dashed border-slate-200 flex flex-col items-center justify-center text-slate-400 gap-3 group-hover:bg-blue-50/30 transition-colors">
                            <div className="w-12 h-12 rounded-full border-2 border-slate-200 border-t-blue-500 animate-spin opacity-50" />
                            <p className="text-[13px] font-black uppercase tracking-widest text-slate-400">Compiling Visual Datasets...</p>
                         </div>
                    </div>
                </div>

                {/* Performance Sidebar */}
                <div className="space-y-10">
                    <div className="bg-slate-900 rounded-[2.5rem] p-10 text-white relative overflow-hidden shadow-2xl shadow-slate-200 border border-slate-800">
                        <Globe size={160} className="absolute -bottom-10 -right-10 text-white/5 rotate-12" />
                        <div className="relative z-10">
                            <span className="text-[11px] font-black text-blue-400 uppercase tracking-[0.2em] block mb-6">Network Nodes</span>
                            <h3 className="text-[24px] font-black mb-8 leading-tight">Station Health Overview</h3>
                            <div className="space-y-6">
                                <div className="flex justify-between items-center text-[13px] font-black">
                                    <span className="text-slate-400">Sync Status</span>
                                    <span className="text-emerald-400 uppercase tracking-widest">Optimal</span>
                                </div>
                                <div className="h-2 bg-white/10 rounded-full overflow-hidden">
                                    <div className="h-full bg-blue-600 w-[95%]" />
                                </div>
                                <p className="text-[12px] text-slate-400 leading-relaxed font-bold pt-4">
                                    Operational efficiency is currently rated as <span className="text-white">highly stable</span> with zero unresolved exceptions logged in the last 24 hours.
                                </p>
                            </div>
                        </div>
                    </div>

                    <div className="bg-white rounded-[2.5rem] border border-slate-100 p-8 shadow-sm">
                        <h3 className="text-[14px] font-black text-slate-900 uppercase tracking-[0.15em] mb-6 flex items-center gap-3">
                            <PieChart size={16} className="text-blue-600" />
                            Resource Allocation
                        </h3>
                        <div className="space-y-5">
                            {[
                                { label: "Local Intake", value: 65, color: "bg-blue-600" },
                                { label: "Inter-Hub Transfer", value: 25, color: "bg-indigo-600" },
                                { label: "Final Delivery", value: 10, color: "bg-emerald-500" },
                            ].map((item) => (
                                <div key={item.label} className="space-y-2">
                                    <div className="flex justify-between text-[12px] font-black uppercase tracking-tight">
                                        <span className="text-slate-400">{item.label}</span>
                                        <span className="text-slate-900">{item.value}%</span>
                                    </div>
                                    <div className="h-1.5 bg-slate-50 rounded-full overflow-hidden">
                                        <div className={cn("h-full", item.color)} style={{ width: `${item.value}%` }} />
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
