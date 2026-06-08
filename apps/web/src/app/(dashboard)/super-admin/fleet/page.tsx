"use client";
import { Suspense } from "react";

import { useFleet } from "@/modules/fleet/use-fleet";
import { DataTable } from "@/components/shared/data-table";
import {
  TrainFront,
  ShieldCheck,
  Activity,
  MapPin,
  Zap,
  Container,
  Wrench,
  ArrowUpRight,
  Network,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { CreateVehicleModal } from "@/components/fleet/create-vehicle-modal";
import { useSearchParams } from "next/navigation";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { DashboardTabs } from "@/components/dashboard/dashboard-tabs";

function FleetPageInner() {
  const { data: fleet, isLoading } = useFleet();
  const wagons = Array.isArray(fleet) ? fleet : fleet?.data || [];

  const totalWagons = wagons.length;
  const activeWagons = wagons.filter((v: any) => v.status === "ACTIVE").length;
  const maintenanceWagons = wagons.filter(
    (v: any) => v.status === "MAINTENANCE",
  ).length;
  const capacityIndex = "84%"; // Placeholder for overall capacity

  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  const columns = [
    {
      header: "Wagon Details",
      accessor: (v: any) => (
        <div className="flex items-center gap-4 cursor-pointer group">
          <div
            className={cn(
              "h-12 w-12 rounded-[10px] flex items-center justify-center shadow transition-all",
              v.status === "ACTIVE"
                ? "bg-slate-900 text-blue-400"
                : "bg-slate-50 text-slate-400",
            )}
          >
            <TrainFront className="h-6 w-6" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col">
            <span className="font-black text-slate-900 uppercase tracking-tight group-hover:text-blue-600 transition-colors">
              {v.plateNumber}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">
              {v.type || "Standard Wagon"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Operator",
      accessor: (v: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-2 px-3 py-1 bg-slate-50 border border-slate-100 rounded-[10px] w-fit">
            <ShieldCheck size={12} className="text-blue-600" />
            <span className="text-[10px] font-black text-slate-600 uppercase tracking-tight">
              {v.carrier || "Internal"}
            </span>
          </div>
          <div className="flex items-center gap-2 pl-1">
            <div className="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-pulse" />
            <span className="text-[9px] font-bold text-slate-400 uppercase tracking-widest">
              {v.organization?.name || "Mizigo Global"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Activity Status",
      accessor: (v: any) => (
        <div className="flex items-center gap-2">
          <div
            className={cn(
              "w-1.5 h-1.5 rounded-full",
              v.status === "ACTIVE"
                ? "bg-emerald-500 shadow-[0_0_8px_rgba(16,185,129,0.5)]"
                : "bg-amber-500 shadow-[0_0_8px_rgba(245,158,11,0.5)]",
            )}
          />
          <span className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em]">
            {v.status || "ACTIVE"}
          </span>
        </div>
      ),
    },
    {
      header: "Efficiency Index",
      accessor: (v: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-2 text-slate-900">
            <span className="text-[16px] font-black tracking-tighter">
              98.2%
            </span>
            <ArrowUpRight size={14} className="text-emerald-500" />
          </div>
          <div className="flex items-center gap-3">
            <div className="flex-1 h-1 bg-slate-100 rounded-full overflow-hidden w-20">
              <div className="h-full bg-blue-500 w-[98%]" />
            </div>
            <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest">
              Active
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Action Suite",
      accessor: (v: any) => (
        <div className="flex items-center justify-end gap-3 pr-4">
          <button className="h-9 px-4 bg-slate-50 hover:bg-slate-900 text-slate-400 hover:text-white border border-slate-100 rounded-lg text-[10px] font-black uppercase tracking-widest transition-all">
            Inspect
          </button>
          <button className="h-9 px-4 bg-slate-900 text-white rounded-lg text-[10px] font-black uppercase tracking-widest transition-all hover:bg-slate-800 shadow-md shadow-slate-200">
            Dispatch
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
        <ReportPageHeader
          title="Rail Network"
          subtitle="Monitor and track all transport assets and assignments"
          iconName="TrainFront"
          action={<CreateVehicleModal />}
          tabs={["Overview", "All Wagons"]}
          tabParamName="tab"
          activeTab={tab}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          {/* Summary Cards */}
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-6">
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                {[
                  {
                    label: "Active",
                    count: activeWagons,
                    icon: Zap,
                    color: "text-emerald-500",
                    bg: "bg-emerald-50",
                  },
                  {
                    label: "Maintenance",
                    count: maintenanceWagons,
                    icon: Wrench,
                    color: "text-amber-500",
                    bg: "bg-amber-50",
                  },
                  {
                    label: "On Track",
                    count: activeWagons,
                    icon: MapPin,
                    color: "text-blue-500",
                    bg: "bg-blue-50",
                  },
                  {
                    label: "Network Capacity",
                    count: capacityIndex,
                    icon: Container,
                    color: "text-indigo-500",
                    bg: "bg-indigo-50",
                  },
                ].map((stat, i) => (
                  <div
                    key={i}
                    className="flex flex-col p-6 bg-white border border-slate-100 rounded-[10px] shadow-sm group hover:border-slate-300 transition-all hover:shadow-xl hover:shadow-slate-100/50"
                  >
                    <div className="flex items-center justify-between mb-4">
                      <div className={cn("p-2.5 rounded-[10px]", stat.bg)}>
                        <stat.icon className={cn("w-5 h-5", stat.color)} />
                      </div>
                      <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest leading-none">
                        {stat.label}
                      </span>
                    </div>
                    <div className="flex items-baseline gap-2">
                      <span className="text-3xl font-black text-slate-900 tabular-nums">
                        {stat.count}
                      </span>
                    </div>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-slate-900 rounded-[10px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[400px]">
                  <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-blue-500/10 rounded-full blur-[100px]" />

                  <div className="relative z-10">
                    <div className="h-12 w-12 rounded-[10px] bg-white/10 flex items-center justify-center mb-8 border border-white/10 backdrop-blur-md shadow-2xl shadow-blue-500/10">
                      <TrainFront
                        className="h-6 w-6 text-blue-400"
                        strokeWidth={2.5}
                      />
                    </div>
                    <h3 className="text-[24px] font-black tracking-tight leading-none mb-3">
                      Rail Logistics
                    </h3>
                    <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-80 mb-6">
                      Real-time monitoring of all transport assets. Wagons are
                      actively tracked from dispatch through to delivery
                      confirmation.
                    </p>
                  </div>

                  <div className="relative z-10 space-y-3">
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          Active Wagons
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          On Route
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-emerald-400 tabular-nums">
                        {activeWagons}
                      </span>
                    </div>
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          Maintenance
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          Grounded
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-amber-400 tabular-nums">
                        {maintenanceWagons}
                      </span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-16 h-16 rounded-full bg-blue-50 flex items-center justify-center mb-4">
                    <Activity className="w-8 h-8 text-blue-500" />
                  </div>
                  <h4 className="text-[16px] font-black text-slate-900 mb-2">
                    Network Utilization Graph
                  </h4>
                  <p className="text-[13px] text-slate-400 max-w-md">
                    Detailed graphical analysis of network utilization rates and
                    movement trends will be populated here as logistics data
                    accumulates.
                  </p>
                </div>
              </div>
            </div>
          )}

          {/* Wagon Table */}
          {tab.toLowerCase() === "all wagons" && (
            <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden p-1">
              <DataTable
                title="Wagon Registry"
                data={wagons}
                columns={columns}
                isLoading={isLoading}
                hideInternalSearch={true}
                hideActions={true}
              />
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default function FleetPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">
          Loading page...
        </div>
      }
    >
      <FleetPageInner />
    </Suspense>
  );
}
