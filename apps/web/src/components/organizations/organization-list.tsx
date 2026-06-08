import { cn } from "@/lib/utils";
import { DataTable } from "@/components/shared/data-table";
import api from "@/lib/api/client";
import { useQuery } from "@tanstack/react-query";

export function OrganizationList({ tab = "overview" }: { tab?: string }) {
  const {
    data: organizations,
    isLoading,
    refetch,
  } = useQuery({
    queryKey: ["organizations"],
    queryFn: async () => {
      const { data } = await api.get("/organizations");
      return data.data || data || [];
    },
  });

  const columns = [
    {
      header: "Entity Node",
      accessor: (org: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-10 w-10 rounded-[10px] flex items-center justify-center shadow-lg transition-all duration-300",
              org.isActive
                ? "bg-slate-900 shadow-slate-100"
                : "bg-slate-200 shadow-transparent grayscale",
            )}
          >
            <Building2
              className={cn(
                "h-5 w-5 text-white",
                !org.isActive && "text-slate-400",
              )}
            />
          </div>
          <div className="flex flex-col">
            <span className="font-black text-slate-900 text-[13px] tracking-tight group-hover:text-blue-600 transition-colors uppercase">
              {org.name}
            </span>
            <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest line-clamp-1">
              {org.description || "Operational logistics node"}
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "System Protocol",
      accessor: (org: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1.5 px-2.5 py-1 bg-slate-50 border border-slate-100 rounded-[10px] w-fit">
            <span className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
              ID:{org.id.slice(0, 8)}
            </span>
          </div>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest pl-1">
            V.PROTO: 2.1
          </span>
        </div>
      ),
    },
    {
      header: "Service Capability",
      accessor: (org: any) => (
        <div
          className={cn(
            "inline-flex items-center gap-2 px-3 py-1.5 rounded-[10px] border text-[10px] font-black uppercase tracking-widest shadow-sm",
            org.isActive
              ? "bg-emerald-50 text-emerald-600 border-emerald-100"
              : "bg-rose-50 text-rose-600 border-rose-100",
          )}
        >
          <div
            className={cn(
              "w-1.5 h-1.5 rounded-full",
              org.isActive ? "bg-emerald-500 animate-pulse" : "bg-rose-500",
            )}
          />
          {org.isActive ? "Active Network" : "Node Suspended"}
        </div>
      ),
    },
    {
      header: "Fee Protocol",
      accessor: (org: any) => (
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1 text-blue-600">
            <BadgePercent className="w-4 h-4" strokeWidth={3} />
            <span className="text-[14px] font-black tracking-tighter">
              {(org.commissionRate * 100).toFixed(1)}%
            </span>
          </div>
          <span className="text-[9px] font-black text-slate-300 uppercase tracking-widest">
            Service Fee
          </span>
        </div>
      ),
    },
    {
      header: "Action Suite",
      accessor: (org: any) => (
        <div className="flex items-center justify-end gap-2 pr-4">
          <UpdateOrganizationModal organization={org} onSuccess={refetch} />
          <StatusConfirmationModal organization={org} onSuccess={refetch} />
          <button className="h-9 px-4 bg-slate-900 hover:bg-blue-600 text-white rounded-[10px] text-[10px] font-black uppercase tracking-widest transition-all active:scale-95 shadow-sm flex items-center gap-2">
            Manage
          </button>
        </div>
      ),
    },
  ];

  const activeCount = organizations?.filter((o: any) => o.isActive).length || 0;
  const inactiveCount = (organizations?.length || 0) - activeCount;

  return (
    <div className="space-y-6">
      {tab.toLowerCase() === "overview" && (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {[
            {
              label: "Total Organizations",
              count: organizations?.length || 0,
              icon: Building2,
              color: "text-slate-600",
              bg: "bg-slate-50",
            },
            {
              label: "Active Network",
              count: activeCount,
              icon: Zap,
              color: "text-emerald-600",
              bg: "bg-emerald-50",
            },
            {
              label: "Suspended Nodes",
              count: inactiveCount,
              icon: Shield,
              color: "text-rose-600",
              bg: "bg-rose-50",
            },
            {
              label: "Avg Commission",
              count: "15%",
              icon: BadgePercent,
              color: "text-blue-600",
              bg: "bg-blue-50",
            },
          ].map((stat, i) => (
            <div
              key={i}
              className="flex flex-col p-6 bg-white border border-slate-100 rounded-[12px] shadow-sm"
            >
              <div className="flex items-center justify-between mb-4">
                <div className={cn("p-2.5 rounded-[10px]", stat.bg)}>
                  <stat.icon className={cn("w-5 h-5", stat.color)} />
                </div>
                <span className="text-[10px] text-slate-400 uppercase">
                  {stat.label}
                </span>
              </div>
              <span className="text-3xl font-black text-slate-900">
                {stat.count}
              </span>
            </div>
          ))}
        </div>
      )}

      {tab.toLowerCase() === "all" && (
        <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden">
          <DataTable
            title="Entity Directory"
            columns={columns}
            data={organizations || []}
            isLoading={isLoading}
            searchPlaceholder="QUERY ORGANIZATIONAL HUB..."
            searchKey="name"
          />
        </div>
      )}
    </div>
  );
}

import { Building2, BadgePercent, Zap, Shield } from "lucide-react";
import { UpdateOrganizationModal } from "./update-organization-modal";
import { StatusConfirmationModal } from "./status-confirmation-modal";
