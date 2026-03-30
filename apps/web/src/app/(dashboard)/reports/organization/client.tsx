"use client";

import { Document, Page, Text, View, StyleSheet, PDFDownloadLink, Font } from '@react-pdf/renderer';
import { Download, FileText, ArrowLeft, Building2, Globe, TrendingUp, PieChart, Activity, ShieldCheck, MapPin } from "lucide-react";
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
    list: { marginTop: 10 },
    listItem: { paddingBottom: 15, borderBottomWidth: 1, borderBottomColor: '#f1f5f9', marginBottom: 15, flexDirection: 'row', justifyContent: 'space-between' },
    itemName: { fontSize: 12, fontWeight: 700, color: '#1e293b' },
    itemDetail: { fontSize: 10, color: '#64748b', marginTop: 4, fontWeight: 500 },
    footer: { position: 'absolute', bottom: 40, left: 50, right: 50, fontSize: 10, color: '#94a3b8', textAlign: 'center', borderTopWidth: 1, borderTopColor: '#f1f5f9', paddingTop: 15 },
});

const OrganizationReportPDF = ({ organization, metrics, timeframe }: any) => (
    <Document>
        <Page size="A4" style={styles.page}>
            <View style={styles.header}>
                <View>
                    <Text style={styles.title}>CORPORATE PERFORMANCE REPORT</Text>
                    <Text style={styles.subtitle}>{organization.name.toUpperCase()} • NETWORK INTELLIGENCE • {timeframe?.toUpperCase()}</Text>
                </View>
                <View>
                    <Text style={styles.brand}>MIZIGO</Text>
                    <Text style={[styles.subtitle, { textAlign: 'right', marginTop: 2 }]}>{new Date().toLocaleDateString()}</Text>
                </View>
            </View>

            <View>
                <Text style={styles.sectionTitle}>Global Network Overview</Text>
                <View style={styles.cardGrid}>
                    <View style={styles.card}>
                        <Text style={styles.cardTitle}>Total Volume</Text>
                        <Text style={styles.cardValue}>{metrics.totalVolume.toLocaleString()}</Text>
                    </View>
                    <View style={styles.card}>
                        <Text style={styles.cardTitle}>Received</Text>
                        <Text style={styles.cardValue}>{metrics.received.toLocaleString()}</Text>
                    </View>
                    <View style={styles.card}>
                        <Text style={styles.cardTitle}>Delivered</Text>
                        <Text style={styles.cardValue}>{metrics.delivered.toLocaleString()}</Text>
                    </View>
                    <View style={styles.card}>
                        <Text style={styles.cardTitle}>In Transit (Sent)</Text>
                        <Text style={styles.cardValue}>{metrics.sent.toLocaleString()}</Text>
                    </View>
                    <View style={styles.card}>
                        <Text style={styles.cardTitle}>At Warehouse</Text>
                        <Text style={styles.cardValue}>{metrics.atWarehouse.toLocaleString()}</Text>
                    </View>
                </View>
            </View>

            <View style={{ marginTop: 20 }}>
                <Text style={styles.sectionTitle}>Station Efficiency Leaderboard</Text>
                <View style={styles.list}>
                    {metrics.topStations?.map((station: any, idx: number) => (
                        <View key={idx} style={styles.listItem}>
                            <View>
                                <Text style={styles.itemName}>{station.name}</Text>
                                <Text style={styles.itemDetail}>Network Contribution Rank #{idx + 1}</Text>
                            </View>
                            <View style={{ textAlign: 'right' }}>
                                <Text style={styles.itemName}>{station.volume.toLocaleString()} Units</Text>
                                <Text style={styles.itemDetail}>
                                    {metrics.totalVolume > 0 ? Math.round((station.volume / metrics.totalVolume) * 100) : 0}% share
                                </Text>
                            </View>
                        </View>
                    ))}
                    {(!metrics.topStations || metrics.topStations.length === 0) && (
                        <Text style={styles.itemDetail}>No station data recorded for this period.</Text>
                    )}
                </View>
            </View>

            <View style={{ marginTop: 20 }}>
                <Text style={styles.sectionTitle}>Top Operator Performance</Text>
                <View style={styles.list}>
                    {metrics.topOperators?.map((operator: any, idx: number) => (
                        <View key={idx} style={styles.listItem}>
                            <View>
                                <Text style={styles.itemName}>{operator.name}</Text>
                                <Text style={styles.itemDetail}>Assigned Station: {operator.station}</Text>
                            </View>
                            <View style={{ textAlign: 'right' }}>
                                <Text style={styles.itemName}>{operator.volume.toLocaleString()} Units</Text>
                            </View>
                        </View>
                    ))}
                    {(!metrics.topOperators || metrics.topOperators.length === 0) && (
                        <Text style={styles.itemDetail}>No operator data recorded for this period.</Text>
                    )}
                </View>
            </View>

            <Text style={styles.footer} fixed>
                MASTER LEDGER: STRICTLY CONFIDENTIAL. Distributed for authorized Mizigo executive use only.
            </Text>
        </Page>
    </Document>
);

export function OrganizationReportClient({ organization, metrics, generatedAt, timeframe }: any) {
    const [isClient, setIsClient] = useState(false);

    useEffect(() => {
        setIsClient(true);
    }, []);

    const updateTimeframe = (newTimeframe: string, start?: string, end?: string) => {
        const url = new URL(window.location.href);
        url.searchParams.set('timeframe', newTimeframe);
        if (start) url.searchParams.set('startDate', start);
        if (end) url.searchParams.set('endDate', end);
        if (newTimeframe !== 'custom') {
            url.searchParams.delete('startDate');
            url.searchParams.delete('endDate');
        }
        window.location.href = url.toString();
    };

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-10">
                {/* Header Context */}
                <div className="flex flex-col md:flex-row md:items-end justify-between gap-6">
                    <div>
                        <Link href="/reports" className="inline-flex items-center text-[13px] font-black text-slate-400 hover:text-blue-600 mb-4 transition-all group">
                            <ArrowLeft className="w-4 h-4 mr-2 group-hover:-translate-x-1 transition-transform" />
                            Return to Hub
                        </Link>
                        <div className="flex items-center gap-3 mb-3">
                            <div className="w-10 h-10 rounded-xl bg-blue-600 flex items-center justify-center text-white shadow-xl shadow-blue-200">
                                <Globe size={20} strokeWidth={2.5} />
                            </div>
                            <h1 className="text-[32px] font-black text-slate-900 tracking-tight leading-none">Corporate Intelligence</h1>
                        </div>
                        <p className="text-[15px] text-slate-500 font-bold tracking-tight">Consolidated performance registry for <span className="text-blue-600">{organization.name}</span></p>
                    </div>

                    <div className="flex items-center gap-4">
                         {/* Timeframe Selector */}
                         <div className="flex flex-wrap items-center gap-4 bg-white border border-slate-100 rounded-[2rem] p-1.5 shadow-sm">
                            <div className="flex items-center gap-1">
                                {['weekly', 'monthly', 'quarterly', 'custom'].map((tf) => (
                                    <button
                                        key={tf}
                                        onClick={() => updateTimeframe(tf)}
                                        className={cn(
                                            "px-6 py-2.5 rounded-2xl text-[11px] font-black uppercase tracking-widest transition-all",
                                            timeframe === tf 
                                                ? "bg-blue-600 text-white shadow-xl shadow-blue-200" 
                                                : "text-slate-400 hover:text-slate-600 hover:bg-slate-50"
                                        )}
                                    >
                                        {tf}
                                    </button>
                                ))}
                            </div>

                            {timeframe === 'custom' && (
                                <div className="flex items-center gap-3 px-4 border-l border-slate-100">
                                    <input 
                                        type="date" 
                                        className="bg-transparent text-[12px] font-black text-slate-700 outline-none"
                                        onChange={(e) => {
                                            const params = new URLSearchParams(window.location.search);
                                            updateTimeframe('custom', e.target.value, params.get('endDate') || undefined);
                                        }}
                                        value={new URLSearchParams(typeof window !== 'undefined' ? window.location.search : '').get('startDate') || ''}
                                    />
                                    <span className="text-[10px] font-black text-slate-300 uppercase">to</span>
                                    <input 
                                        type="date" 
                                        className="bg-transparent text-[12px] font-black text-slate-700 outline-none"
                                        onChange={(e) => {
                                            const params = new URLSearchParams(window.location.search);
                                            updateTimeframe('custom', params.get('startDate') || undefined, e.target.value);
                                        }}
                                        value={new URLSearchParams(typeof window !== 'undefined' ? window.location.search : '').get('endDate') || ''}
                                    />
                                </div>
                            )}
                        </div>

                        {isClient && (
                             <PDFDownloadLink
                                document={<OrganizationReportPDF organization={organization} metrics={metrics} generatedAt={generatedAt} />}
                                fileName={`org-report-${organization.name.toLowerCase().replace(/\s+/g, '-')}.pdf`}
                            >
                                {({ loading }) => (
                                    <button 
                                        disabled={loading}
                                        className="h-14 px-8 rounded-2xl bg-slate-900 hover:bg-black text-white font-black text-[14px] uppercase tracking-widest shadow-2xl shadow-slate-200 transition-all active:scale-95 flex items-center gap-3 disabled:opacity-50"
                                    >
                                        {loading ? (
                                            <div className="w-5 h-5 rounded-full border-2 border-white/20 border-t-white animate-spin" />
                                        ) : (
                                            <Download className="w-5 h-5" strokeWidth={2.5} />
                                        )}
                                        {loading ? 'Compiling Ledger...' : 'Export Master PDF'}
                                    </button>
                                )}
                            </PDFDownloadLink>
                        )}
                    </div>
                </div>

                {/* Corporate Matrix */}
                <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    <div className="lg:col-span-2 space-y-8">
                        {/* Summary Metrics */}
                        <div className="bg-white rounded-[2.5rem] border border-slate-100 p-10 shadow-sm relative overflow-hidden">
                            <div className="absolute top-0 right-0 w-64 h-64 bg-blue-50/30 rounded-bl-full -mr-32 -mt-32 pointer-events-none" />
                            
                            <div className="flex items-center justify-between mb-10 relative z-10">
                                <h2 className="text-[20px] font-black text-slate-900 flex items-center gap-3">
                                    <Building2 size={18} className="text-blue-600" />
                                    Executive Overview
                                </h2>
                                <div className="flex items-center gap-2 px-4 py-1.5 rounded-full bg-emerald-50 text-emerald-600 border border-emerald-100 font-black text-[11px] uppercase tracking-widest">
                                    LIVE NETWORK
                                </div>
                            </div>

                            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8 relative z-10">
                                <div className="space-y-1">
                                    <span className="text-[11px] font-black text-slate-400 uppercase tracking-widest block mb-2">Total Volume</span>
                                    <div className="text-[28px] font-black text-slate-900 leading-none">{metrics.totalVolume.toLocaleString()}</div>
                                    <span className="text-[12px] font-bold text-slate-400">Total Handled</span>
                                </div>
                                <div className="space-y-1">
                                    <span className="text-[11px] font-black text-slate-400 uppercase tracking-widest block mb-2">Received</span>
                                    <div className="text-[28px] font-black text-slate-900 leading-none">{metrics.received.toLocaleString()}</div>
                                    <span className="text-[12px] font-bold text-blue-500">Intake</span>
                                </div>
                                <div className="space-y-1">
                                    <span className="text-[11px] font-black text-slate-400 uppercase tracking-widest block mb-2">Delivered</span>
                                    <div className="text-[28px] font-black text-slate-900 leading-none">{metrics.delivered.toLocaleString()}</div>
                                    <span className="text-[12px] font-bold text-emerald-500">Outflow</span>
                                </div>
                                <div className="space-y-1">
                                    <span className="text-[11px] font-black text-slate-400 uppercase tracking-widest block mb-2">Sent</span>
                                    <div className="text-[28px] font-black text-slate-900 leading-none">{metrics.sent.toLocaleString()}</div>
                                    <span className="text-[12px] font-bold text-amber-500">In Transit</span>
                                </div>
                                <div className="space-y-1">
                                    <span className="text-[11px] font-black text-slate-400 uppercase tracking-widest block mb-2">Warehouse</span>
                                    <div className="text-[28px] font-black text-slate-900 leading-none">{metrics.atWarehouse.toLocaleString()}</div>
                                    <span className="text-[12px] font-bold text-slate-400">Stocked</span>
                                </div>
                            </div>
                        </div>

                        {/* workforce analytics: Top Stations & Operators */}
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                            <div className="bg-white rounded-[2.5rem] border border-slate-100 p-8 shadow-sm">
                                <h3 className="text-[16px] font-black text-slate-900 uppercase tracking-tight mb-6 flex items-center gap-3">
                                    <MapPin size={18} className="text-blue-600" />
                                    Top Stations
                                </h3>
                                <div className="space-y-4">
                                    {metrics.topStations?.map((s: any, i: number) => (
                                        <div key={i} className="flex items-center justify-between p-4 rounded-2xl bg-slate-50 border border-slate-100">
                                            <div className="flex items-center gap-3">
                                                <div className="w-8 h-8 rounded-lg bg-white flex items-center justify-center text-[11px] font-black text-blue-600 border border-blue-50">#{i + 1}</div>
                                                <span className="text-[14px] font-black text-slate-700">{s.name}</span>
                                            </div>
                                            <span className="text-[14px] font-black text-slate-900">{s.volume} Units</span>
                                        </div>
                                    ))}
                                    {(!metrics.topStations || metrics.topStations.length === 0) && (
                                        <p className="text-[13px] text-slate-400 font-bold text-center py-4">No station data available</p>
                                    )}
                                </div>
                            </div>

                            <div className="bg-white rounded-[2.5rem] border border-slate-100 p-8 shadow-sm">
                                <h3 className="text-[16px] font-black text-slate-900 uppercase tracking-tight mb-6 flex items-center gap-3">
                                    <Activity size={18} className="text-blue-600" />
                                    Top Operators
                                </h3>
                                <div className="space-y-4">
                                    {metrics.topOperators?.map((o: any, i: number) => (
                                        <div key={i} className="flex items-center justify-between p-4 rounded-2xl bg-slate-50 border border-slate-100">
                                            <div className="flex items-center gap-3">
                                                <div className="w-8 h-8 rounded-lg bg-white flex items-center justify-center text-[11px] font-black text-blue-600 border border-blue-50">#{i + 1}</div>
                                                <span className="text-[14px] font-black text-slate-700">{o.name}</span>
                                            </div>
                                            <span className="text-[14px] font-black text-slate-900">{o.volume} Units</span>
                                        </div>
                                    ))}
                                    {(!metrics.topOperators || metrics.topOperators.length === 0) && (
                                        <p className="text-[13px] text-slate-400 font-bold text-center py-4">No operator data available</p>
                                    )}
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Right Sidebar - Analytics */}
                    <div className="space-y-8">
                        <div className="bg-blue-600 rounded-[2.5rem] p-10 text-white relative overflow-hidden shadow-2xl shadow-blue-200">
                            <ShieldCheck size={140} className="absolute -bottom-10 -right-10 text-white/5 -rotate-12" />
                            <div className="relative z-10">
                                <span className="text-[11px] font-black text-blue-200 uppercase tracking-widest block mb-4">Operational Status</span>
                                <h3 className="text-[20px] font-black mb-8">Network Health</h3>
                                <div className="space-y-6">
                                    <div className="flex items-center justify-between">
                                        <span className="text-blue-100 text-[13px] font-bold">Delivery Rate</span>
                                        <span className="font-black">
                                            {metrics.received > 0 
                                                ? Math.round((metrics.delivered / metrics.received) * 100) 
                                                : 0}%
                                        </span>
                                    </div>
                                    <div className="h-2 bg-white/10 rounded-full overflow-hidden">
                                        <div 
                                            className="h-full bg-white shadow-[0_0_15px_rgba(255,255,255,0.5)] transition-all duration-1000" 
                                            style={{ width: `${metrics.received > 0 ? Math.min((metrics.delivered / metrics.received) * 100, 100) : 0}%` }}
                                        />
                                    </div>
                                    <p className="text-[12px] text-blue-100/70 leading-relaxed font-medium pt-4">
                                        The network is currently operating at <span className="text-white font-bold">peak efficiency</span> with all active stations reporting real-time telemetry.
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div className="bg-white rounded-[2.5rem] border border-slate-100 p-8 shadow-sm">
                            <h3 className="text-[14px] font-black text-slate-900 uppercase tracking-[0.15em] mb-6 flex items-center gap-3">
                                <PieChart size={16} className="text-blue-600" />
                                Volume Distribution
                            </h3>
                            <div className="space-y-4">
                                <div className="flex items-center justify-between p-4 rounded-2xl bg-slate-50 border border-slate-100 group hover:border-blue-200 transition-all cursor-default">
                                    <span className="text-[13px] font-bold text-slate-500">In Transit</span>
                                    <span className="text-[14px] font-black text-slate-900">
                                        {metrics.totalVolume > 0 
                                            ? Math.round((metrics.sent / metrics.totalVolume) * 100) 
                                            : 0}%
                                    </span>
                                </div>
                                <div className="flex items-center justify-between p-4 rounded-2xl bg-slate-50 border border-slate-100 group hover:border-blue-200 transition-all cursor-default">
                                    <span className="text-[13px] font-bold text-slate-500">At Destination</span>
                                    <span className="text-[14px] font-black text-slate-900">
                                        {metrics.totalVolume > 0 
                                            ? Math.round((metrics.delivered / metrics.totalVolume) * 100) 
                                            : 0}%
                                    </span>
                                </div>
                                <div className="pt-4 flex items-center gap-2 text-[12px] font-bold text-emerald-500 justify-center">
                                    <TrendingUp size={14} strokeWidth={3} />
                                    Performance Benchmark Met
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
