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
} from "lucide-react";
import { cn } from "@/lib/utils";
import { CreateVehicleModal } from "@/components/fleet/create-vehicle-modal";
import { useSearchParams } from "next/navigation";
import { ReportPageHeader } from "@/components/reports/report-page-header";

function FleetPageInner() {
  const { data: fleet, isLoading } = useFleet();
  const wagons = Array.isArray(fleet) ? fleet : fleet?.data || [];

  const totalWagons = wagons.length;
  const activeWagons = wagons.filter((v: any) => v.status === "ACTIVE").length;
  const maintenanceWagons = wagons.filter(
    (v: any) => v.status === "MAINTENANCE",
  ).length;
  const capacityIndex = "92%"; // Scoped performance metric placeholder

  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  const columns = [
    {
      header: "Wagon Details",
      accessor: (v: any) => (
        <div className="flex items-center gap-3 cursor-pointer animate-in fade-in">
          <div
            className={cn(
              "h-10 w-10 rounded-xl flex items-center justify-center border",
              v.status === "ACTIVE"
                ? "bg-slate-900 border-slate-700 text-blue-400"
                : "bg-slate-50 border-slate-200 text-slate-400",
            )}
          >
            <TrainFront className="h-5 w-5" strokeWidth={2} />
          </div>
          <div className="flex flex-col">
            <span className="font-semibold text-slate-800 uppercase tracking-tight text-[13px]">
              {v.plateNumber}
            </span>
            <span className="text-[11px] font-medium text-slate-500">
              {v.type || "Standard Wagon"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Operator / Owner",
      accessor: (v: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-2 px-2 py-1 bg-slate-50 border border-slate-200 rounded-xl w-fit">
            <ShieldCheck size={11} className="text-blue-600" />
            <span className="text-[11px] font-medium text-slate-600">
              {v.carrier || "Internal"}
            </span>
          </div>
          <span className="text-[11px] font-medium text-slate-500 pl-1">
            {v.organization?.name || "My Organization"}
          </span>
        </div>
      ),
    },
    {
      header: "Activity Status",
      accessor: (v: any) => (
        <span
          className={cn(
            "inline-flex items-center gap-1.5 px-1.5 py-0.5 rounded-lg text-[10px] font-semibold border",
            v.status === "ACTIVE"
              ? "bg-emerald-50 text-emerald-700 border-emerald-200"
              : "bg-amber-50 text-amber-700 border-amber-200",
          )}
        >
          <div
            className={cn(
              "w-1.5 h-1.5 rounded-full",
              v.status === "ACTIVE" ? "bg-emerald-500" : "bg-amber-500",
            )}
          />
          {v.status || "ACTIVE"}
        </span>
      ),
    },
    {
      header: "Efficiency Index",
      accessor: (v: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-2 text-slate-800">
            <span className="text-[16px] font-semibold">98.2%</span>
            <ArrowUpRight size={13} className="text-emerald-600" />
          </div>
          <div className="flex items-center gap-2">
            <div className="flex-1 h-1 bg-slate-100 rounded-full overflow-hidden w-20">
              <div className="h-full bg-blue-500 w-[98%]" />
            </div>
            <span className="text-[11px] font-medium text-slate-400">Active</span>
          </div>
        </div>
      ),
    },
    {
      header: "Action Suite",
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
          title="Fleet Management"
          subtitle="Monitor and manage your organization's locomotives and transport assets"
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
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                {[
                  {
                    label: "Active Assets",
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
                    label: "Asset Capacity",
                    count: capacityIndex,
                    icon: Container,
                    color: "text-indigo-600",
                    bg: "bg-indigo-50",
                  },
                ].map((stat, i) => (
                  <div
                    key={i}
                    className="bg-white border border-[#E2E2E2] rounded-[20px] p-5 flex flex-col gap-3"
                  >
                    <div className="flex items-center justify-between">
                      <div className={cn("p-2 rounded-xl", stat.bg)}>
                        <stat.icon className={cn("w-4 h-4", stat.color)} strokeWidth={2} />
                      </div>
                      <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                        {stat.label}
                      </span>
                    </div>
                    <span className="text-[26px] font-semibold text-slate-800 tabular-nums">
                      {stat.count}
                    </span>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-white border border-[#E2E2E2] rounded-[20px] p-6 flex flex-col justify-between min-h-[400px]">
                  <div>
                    <div className="h-10 w-10 rounded-xl bg-slate-100 border border-slate-200 flex items-center justify-center mb-6">
                      <TrainFront className="h-5 w-5 text-slate-600" strokeWidth={2} />
                    </div>
                    <h3 className="text-[20px] font-semibold text-slate-800 mb-2">
                      Rail Logistics
                    </h3>
                    <p className="text-[13px] font-medium text-slate-500 leading-relaxed mb-6">
                      Real-time monitoring of all transport assets. Wagons are
                      actively tracked from dispatch through to delivery
                      confirmation.
                    </p>
                  </div>

                  <div className="space-y-2">
                    <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                      <div className="flex flex-col">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Active Wagons
                        </span>
                        <span className="text-[11px] font-medium text-slate-400">
                          On Route
                        </span>
                      </div>
                      <span className="text-[14px] font-semibold text-emerald-600 tabular-nums">
                        {activeWagons}
                      </span>
                    </div>
                    <div className="px-4 py-3 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-between">
                      <div className="flex flex-col">
                        <span className="text-[11px] font-medium text-slate-500 uppercase tracking-[0.05em]">
                          Maintenance
                        </span>
                        <span className="text-[11px] font-medium text-slate-400">
                          Grounded
                        </span>
                      </div>
                      <span className="text-[14px] font-semibold text-amber-600 tabular-nums">
                        {maintenanceWagons}
                      </span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white border border-[#E2E2E2] rounded-[20px] p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-12 h-12 rounded-xl bg-blue-50 border border-blue-200 flex items-center justify-center mb-4">
                    <Activity className="w-6 h-6 text-blue-600" strokeWidth={2} />
                  </div>
                  <h4 className="text-[14px] font-semibold text-slate-800 mb-2">
                    Network Utilization Graph
                  </h4>
                  <p className="text-[13px] font-medium text-slate-500 max-w-md">
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
            <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden p-1">
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
