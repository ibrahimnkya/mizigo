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
        <div className="flex items-center gap-3 cursor-pointer">
          <div
            className={cn(
              "h-8 w-8 rounded-xl flex items-center justify-center",
              v.status === "ACTIVE"
                ? "bg-slate-900 text-blue-400"
                : "bg-slate-100 text-slate-400",
            )}
          >
            <TrainFront className="h-4 w-4" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col">
            <span className="font-semibold text-[14px] text-slate-800">
              {v.plateNumber}
            </span>
            <span className="text-[11px] font-medium text-slate-400 uppercase tracking-[0.05em]">
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
          <span className="inline-flex items-center gap-1.5 px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border border-slate-200 bg-slate-50 text-slate-600 w-fit">
            <ShieldCheck size={10} className="text-blue-600" />
            {v.carrier || "Internal"}
          </span>
          <span className="text-[11px] font-medium text-slate-400">
            {v.organization?.name || "Mizigo Global"}
          </span>
        </div>
      ),
    },
    {
      header: "Status",
      accessor: (v: any) => (
        <span
          className={cn(
            "inline-flex items-center px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border",
            v.status === "ACTIVE"
              ? "bg-emerald-50 text-emerald-700 border-emerald-200"
              : "bg-amber-50 text-amber-700 border-amber-200",
          )}
        >
          {v.status || "ACTIVE"}
        </span>
      ),
    },
    {
      header: "Efficiency Index",
      accessor: (v: any) => (
        <div className="flex items-center gap-2 text-slate-900">
          <span className="text-[14px] font-semibold text-slate-800">
            98.2%
          </span>
          <ArrowUpRight size={13} className="text-emerald-500" />
        </div>
      ),
    },
    {
      header: "Actions",
      accessor: (v: any) => (
        <div className="flex items-center justify-end gap-2 pr-4">
          <button className="h-8 px-3 bg-white border border-slate-200 hover:bg-slate-50 text-slate-600 rounded-xl text-[12px] font-medium transition-colors">
            Inspect
          </button>
          <button className="h-8 px-3 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-[12px] font-semibold transition-colors">
            Dispatch
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="flex flex-col gap-5">
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
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-6">
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                {[
                  {
                    label: "Active",
                    count: activeWagons,
                    icon: Zap,
                    color: "text-emerald-600",
                    bg: "bg-emerald-50",
                  },
                  {
                    label: "Maintenance",
                    count: maintenanceWagons,
                    icon: Wrench,
                    color: "text-amber-600",
                    bg: "bg-amber-50",
                  },
                  {
                    label: "On Track",
                    count: activeWagons,
                    icon: MapPin,
                    color: "text-blue-600",
                    bg: "bg-blue-50",
                  },
                  {
                    label: "Network Capacity",
                    count: capacityIndex,
                    icon: Container,
                    color: "text-indigo-600",
                    bg: "bg-indigo-50",
                  },
                ].map((stat, i) => (
                  <div
                    key={i}
                    className="flex flex-col p-5 bg-white border border-[#E2E2E2] rounded-[20px]"
                  >
                    <div className="flex items-center justify-between mb-3">
                      <div className={cn("p-2 rounded-xl", stat.bg)}>
                        <stat.icon className={cn("w-4 h-4", stat.color)} />
                      </div>
                      <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                        {stat.label}
                      </span>
                    </div>
                    <span className="text-[26px] font-semibold text-slate-900 tabular-nums">
                      {stat.count}
                    </span>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-white border border-[#E2E2E2] rounded-[20px] flex flex-col min-h-[360px]">
                  <div className="px-5 py-4 border-b border-slate-200 flex items-center gap-2">
                    <TrainFront className="h-4 w-4 text-slate-500" strokeWidth={2.5} />
                    <h3 className="text-[14px] font-semibold text-slate-800">
                      Rail Logistics
                    </h3>
                  </div>
                  <div className="p-5 flex flex-col flex-1">
                    <p className="text-[13px] text-slate-500 leading-relaxed mb-5">
                      Real-time monitoring of all transport assets. Wagons are
                      actively tracked from dispatch through to delivery
                      confirmation.
                    </p>
                    <div className="space-y-2 mt-auto">
                      <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Active Wagons
                        </span>
                        <span className="text-[14px] font-semibold text-emerald-600 tabular-nums">
                          {activeWagons}
                        </span>
                      </div>
                      <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Maintenance
                        </span>
                        <span className="text-[14px] font-semibold text-amber-600 tabular-nums">
                          {maintenanceWagons}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[20px] border border-[#E2E2E2] p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-12 h-12 rounded-xl bg-blue-50 flex items-center justify-center mb-4">
                    <Activity className="w-6 h-6 text-blue-600" />
                  </div>
                  <h4 className="text-[14px] font-semibold text-slate-800 mb-2">
                    Network Utilization Graph
                  </h4>
                  <p className="text-[13px] text-slate-500 max-w-md">
                    Detailed graphical analysis of network utilization rates and
                    movement trends will be populated here as logistics data
                    accumulates.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all wagons" && (
            <div className="bg-white rounded-[20px] border border-[#E2E2E2] overflow-hidden">
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
  );
}

export default function FleetPage() {
  return (
    <Suspense
      fallback={
        <div className="flex items-center justify-center min-h-[300px]">
          Loading page...
        </div>
      }
    >
      <FleetPageInner />
    </Suspense>
  );
}
