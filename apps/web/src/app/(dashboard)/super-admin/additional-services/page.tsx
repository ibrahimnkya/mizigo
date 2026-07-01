"use client";

import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";
import {
  Sparkles,
  Plus,
  Trash2,
  Pencil,
  Loader2,
  Info,
  Calendar,
  Layers,
  CheckCircle,
  AlertCircle,
  CircleDollarSign,
  TrendingUp,
} from "lucide-react";
import { useState, Suspense } from "react";
import { useSearchParams } from "next/navigation";
import { toast } from "sonner";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { Switch } from "@repo/ui/switch";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
  DialogClose
} from "@repo/ui/dialog";
import { cn } from "@/lib/utils";

interface ServiceType {
  id: string;
  name: string;
  description: string | null;
  basePrice: number;
  isActive: boolean;
  createdAt: string;
  updatedAt: string;
}

interface ServiceFormState {
  id?: string;
  name: string;
  description: string;
  basePrice: string;
  isActive: boolean;
}

function AdditionalServicesPageInner() {
  const queryClient = useQueryClient();
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  // State to manage Create/Edit modal dialog
  const [openModal, setOpenModal] = useState(false);
  const [formState, setFormState] = useState<ServiceFormState>({
    name: "",
    description: "",
    basePrice: "",
    isActive: true,
  });

  // Fetch all service types
  const { data: services, isLoading } = useQuery<ServiceType[]>({
    queryKey: ["service-types"],
    queryFn: async () => {
      const { data } = await api.get("/service-types");
      return data.data || data;
    },
  });

  // Create service type mutation
  const { mutate: createService, isPending: isCreating } = useMutation({
    mutationFn: async (payload: Omit<ServiceFormState, "id">) => {
      const { data } = await api.post("/service-types", {
        ...payload,
        basePrice: parseFloat(payload.basePrice),
      });
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["service-types"] });
      toast.success("Additional service created successfully");
      setOpenModal(false);
      resetForm();
    },
    onError: (err: any) => {
      toast.error(
        err.response?.data?.error?.message || "Failed to create service type"
      );
    },
  });

  // Update service type mutation
  const { mutate: updateService, isPending: isUpdating } = useMutation({
    mutationFn: async ({ id, payload }: { id: string; payload: Partial<ServiceFormState> }) => {
      const { data } = await api.put(`/service-types/${id}`, {
        ...payload,
        basePrice: payload.basePrice !== undefined ? parseFloat(payload.basePrice) : undefined,
      });
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["service-types"] });
      toast.success("Service type updated successfully");
      setOpenModal(false);
      resetForm();
    },
    onError: (err: any) => {
      toast.error(
        err.response?.data?.error?.message || "Failed to update service type"
      );
    },
  });

  // Toggle active status mutation (quick update)
  const { mutate: toggleActive } = useMutation({
    mutationFn: async ({ id, isActive }: { id: string; isActive: boolean }) => {
      const { data } = await api.put(`/service-types/${id}`, { isActive });
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["service-types"] });
      toast.success("Service visibility status updated");
    },
    onError: (err: any) => {
      toast.error(
        err.response?.data?.error?.message || "Failed to update service status"
      );
    },
  });

  // Delete service type mutation
  const { mutate: deleteService } = useMutation({
    mutationFn: async (id: string) => {
      const { data } = await api.delete(`/service-types/${id}`);
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["service-types"] });
      toast.success("Service type deleted successfully");
    },
    onError: (err: any) => {
      toast.error(
        err.response?.data?.error?.message || "Failed to delete service type"
      );
    },
  });

  const resetForm = () => {
    setFormState({
      name: "",
      description: "",
      basePrice: "",
      isActive: true,
    });
  };

  const handleEditClick = (service: ServiceType) => {
    setFormState({
      id: service.id,
      name: service.name,
      description: service.description || "",
      basePrice: String(service.basePrice),
      isActive: service.isActive,
    });
    setOpenModal(true);
  };

  const handleCreateClick = () => {
    resetForm();
    setOpenModal(true);
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const { id, name, description, basePrice, isActive } = formState;

    if (!name.trim()) {
      toast.error("Service name is required");
      return;
    }

    const price = parseFloat(basePrice);
    if (isNaN(price) || price < 0) {
      toast.error("Price must be a valid positive number");
      return;
    }

    const payload = { name: name.trim(), description: description.trim(), basePrice, isActive };

    if (id) {
      updateService({ id, payload });
    } else {
      createService(payload);
    }
  };

  const formatCurrency = (amount: number) => {
    return new Intl.NumberFormat("en-TZ", {
      style: "currency",
      currency: "TZS",
      minimumFractionDigits: 0,
    }).format(amount);
  };

  const formatDate = (dateStr: string) => {
    return new Date(dateStr).toLocaleDateString("en-US", {
      year: "numeric",
      month: "short",
      day: "numeric",
    });
  };

  const totalServices = services?.length || 0;
  const activeServices = services?.filter((s) => s.isActive).length || 0;
  const inactiveServices = totalServices - activeServices;
  const avgSurcharge = totalServices > 0
    ? (services?.reduce((acc, s) => acc + s.basePrice, 0) || 0) / totalServices
    : 0;

  if (isLoading) {
    return (
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
        <ReportPageHeader
          title="Additional Services"
          subtitle="Configure extra platform service offerings, parcel processing options, and surcharge pricing"
          icon={(props: any) => <Sparkles className="text-blue-400" {...props} />}
          hideBackArrow={true}
          tabs={["Overview", "All Services"]}
          tabParamName="tab"
          activeTab={tab}
          action={
            <button
              onClick={handleCreateClick}
              className="h-11 px-6 bg-blue-600 hover:bg-blue-500 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 shadow-xl shadow-blue-600/10 transition-all active:scale-95 shrink-0"
            >
              <Plus size={14} strokeWidth={3} />
              Add New Service
            </button>
          }
        />

        {/* Tab 1: Overview Dashboard */}
        {tab.toLowerCase() === "overview" && (
          <div className="space-y-6 animate-in fade-in duration-500">
            {/* Stats Overview */}
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
              {[
                {
                  label: "Total Offerings",
                  val: totalServices,
                  icon: Layers,
                  color: "text-blue-500",
                  bg: "bg-blue-50",
                },
                {
                  label: "Active Services",
                  val: activeServices,
                  icon: CheckCircle,
                  color: "text-emerald-500",
                  bg: "bg-emerald-50",
                },
                {
                  label: "Inactive Tiers",
                  val: inactiveServices,
                  icon: AlertCircle,
                  color: "text-amber-500",
                  bg: "bg-amber-50",
                },
                {
                  label: "Avg Base Surcharge",
                  val: formatCurrency(avgSurcharge),
                  icon: CircleDollarSign,
                  color: "text-indigo-500",
                  bg: "bg-indigo-50",
                },
              ].map((stat, i) => (
                <div
                  key={i}
                  className="flex flex-col p-6 bg-white border border-slate-100 rounded-[10px] shadow-sm hover:border-slate-300 transition-all hover:shadow-xl hover:shadow-slate-100/50"
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
                      {stat.val}
                    </span>
                  </div>
                </div>
              ))}
            </div>

            {/* Core Info & Quick List */}
            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
              
              {/* Marketing / Explainer Callout */}
              <div className="lg:col-span-1 bg-slate-900 rounded-[10px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[400px]">
                <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-blue-500/10 rounded-full blur-[100px]" />
                
                <div className="relative z-10 space-y-6">
                  <div className="h-12 w-12 rounded-[10px] bg-white/10 flex items-center justify-center mb-8 border border-white/10 backdrop-blur-md shadow-2xl shadow-blue-500/10">
                    <Sparkles className="h-6 w-6 text-blue-400" />
                  </div>
                  <h3 className="text-[24px] font-black tracking-tight leading-none mb-3">
                    Premium Offering
                  </h3>
                  <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-85">
                    Configure auxiliary logistics packages for customers during order placement. These surcharges are added dynamically to base tariff rates depending on package size, destination, and selected options.
                  </p>
                </div>

                <div className="relative z-10 flex items-center gap-3 pt-6 border-t border-white/10">
                  <TrendingUp className="w-5 h-5 text-emerald-400" />
                  <span className="text-[11px] font-black uppercase tracking-wider text-slate-300">
                    Boosts platform revenue margins
                  </span>
                </div>
              </div>

              {/* Quick List Table */}
              <div className="lg:col-span-2 bg-white border border-slate-100 rounded-[10px] p-6 shadow-sm flex flex-col justify-between">
                <div className="space-y-4">
                  <div className="flex items-center justify-between pb-3 border-b border-slate-100">
                    <div>
                      <h3 className="text-md font-black text-slate-900 tracking-tight">
                        Active Services Matrix
                      </h3>
                      <p className="text-slate-400 font-bold text-[10px] uppercase tracking-wider mt-0.5">
                        Overview of currently operational additional services
                      </p>
                    </div>
                  </div>

                  <div className="divide-y divide-slate-100 max-h-[280px] overflow-y-auto pr-1">
                    {services?.filter(s => s.isActive).map((service, idx) => (
                      <div key={service.id} className="py-3.5 flex items-center justify-between gap-4 first:pt-0 last:pb-0">
                        <div className="flex-1 min-w-0">
                          <h4 className="text-xs font-black text-slate-800 truncate">
                            {idx + 1}. {service.name}
                          </h4>
                          <p className="text-[10px] font-bold text-slate-400 truncate mt-0.5">
                            {service.description || "No description provided."}
                          </p>
                        </div>
                        <div className="text-right shrink-0">
                          <span className="text-xs font-black text-blue-600 tabular-nums">
                            {formatCurrency(service.basePrice)}
                          </span>
                        </div>
                      </div>
                    ))}
                    {services?.filter(s => s.isActive).length === 0 && (
                      <p className="text-center text-xs text-slate-400 py-12 font-bold uppercase tracking-wider">
                        No active service offerings configured.
                      </p>
                    )}
                  </div>
                </div>

                <div className="pt-4 border-t border-slate-100 flex justify-end">
                  <button
                    onClick={() => {
                      const params = new URLSearchParams(searchParams.toString());
                      params.set("tab", "all services");
                      window.history.pushState(null, "", `?${params.toString()}`);
                    }}
                    className="text-[11px] font-black text-blue-600 hover:text-blue-500 uppercase tracking-widest transition-colors"
                  >
                    View All & Manage
                  </button>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* Tab 2: All Services Management */}
        {tab.toLowerCase() !== "overview" && (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 animate-in fade-in duration-500">
            {services?.map((service) => (
              <div
                key={service.id}
                className={cn(
                  "bg-white rounded-[10px] border border-slate-100 p-6 shadow-sm flex flex-col justify-between hover:shadow-md hover:border-slate-200/80 transition-all duration-300 relative group",
                  !service.isActive && "opacity-75 bg-slate-50/50"
                )}
              >
                <div className="space-y-4">
                  <div className="flex items-start justify-between gap-4">
                    <div className="space-y-1">
                      <h3 className="text-[16px] font-black text-slate-900 tracking-tight leading-tight">
                        {service.name}
                      </h3>
                      <div className="flex items-center gap-2">
                        <span
                          className={cn(
                            "px-2 py-0.5 text-[9px] font-extrabold uppercase tracking-widest rounded-[5px]",
                            service.isActive
                              ? "bg-emerald-50 text-emerald-600"
                              : "bg-amber-50 text-amber-600"
                          )}
                        >
                          {service.isActive ? "Active" : "Inactive"}
                        </span>
                      </div>
                    </div>

                    <div className="text-right shrink-0">
                      <p className="text-[10px] font-black text-slate-400 uppercase tracking-wider leading-none mb-1">
                        Base Surcharge
                      </p>
                      <p className="text-[18px] font-black text-blue-600 tabular-nums">
                        {formatCurrency(service.basePrice)}
                      </p>
                    </div>
                  </div>

                  <p className="text-slate-500 text-xs font-semibold leading-relaxed min-h-[48px]">
                    {service.description || "No description provided for this service offering."}
                  </p>

                  <div className="flex items-center gap-3 pt-2 text-[11px] font-bold text-slate-400 border-t border-slate-50">
                    <div className="flex items-center gap-1.5">
                      <Calendar size={13} />
                      <span>Created: {formatDate(service.createdAt)}</span>
                    </div>
                  </div>
                </div>

                {/* Action Bar */}
                <div className="flex items-center justify-between gap-4 mt-6 pt-4 border-t border-slate-100">
                  <div className="flex items-center gap-3">
                    <span className="text-[10px] font-black text-slate-400 uppercase tracking-wider">
                      Status
                    </span>
                    <Switch
                      checked={service.isActive}
                      onCheckedChange={(checked) => toggleActive({ id: service.id, isActive: checked })}
                    />
                  </div>

                  <div className="flex items-center gap-1.5">
                    <button
                      onClick={() => handleEditClick(service)}
                      className="p-2 text-slate-400 hover:text-blue-600 hover:bg-slate-50 rounded-[5px] transition-all"
                      title="Edit Service"
                    >
                      <Pencil size={14} />
                    </button>
                    <button
                      onClick={() => {
                        if (confirm("Are you sure you want to delete this service type?")) {
                          deleteService(service.id);
                        }
                      }}
                      className="p-2 text-slate-400 hover:text-red-500 hover:bg-slate-50 rounded-[5px] transition-all"
                      title="Delete Service"
                    >
                      <Trash2 size={14} />
                    </button>
                  </div>
                </div>
              </div>
            ))}

            {services?.length === 0 && (
              <div className="col-span-full bg-white border border-dashed border-slate-200 rounded-[10px] p-16 flex flex-col items-center justify-center text-center">
                <Sparkles className="w-12 h-12 text-slate-300 mb-4 animate-pulse" />
                <h3 className="text-md font-black text-slate-700 mb-1">
                  No Additional Services Found
                </h3>
                <p className="text-slate-400 text-xs font-semibold max-w-sm leading-relaxed mb-6">
                  Create premium processing tiers or logistics surcharges to start displaying them on your dashboards.
                </p>
                <button
                  onClick={handleCreateClick}
                  className="h-11 px-6 bg-slate-900 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 hover:bg-slate-800 transition-all"
                >
                  <Plus size={14} strokeWidth={3} />
                  Create First Service
                </button>
              </div>
            )}
          </div>
        )}
      </div>

      {/* Create / Edit Dialog */}
      <Dialog open={openModal} onOpenChange={setOpenModal}>
        <DialogContent className="w-full sm:w-[550px] p-6 bg-white rounded-2xl border border-slate-100 shadow-2xl">
          <form onSubmit={handleSubmit}>
            <DialogHeader className="mb-5">
              <DialogTitle className="text-[18px] font-black text-slate-900 tracking-tight leading-none mb-2">
                {formState.id ? "Edit Additional Service" : "Add Additional Service"}
              </DialogTitle>
              <span className="text-[11px] font-extrabold text-slate-400 uppercase tracking-widest leading-none">
                {formState.id ? "Update service pricing, details, and active status" : "Create a new service offering and set surcharge rates"}
              </span>
            </DialogHeader>

            <div className="space-y-5">
              <div className="space-y-2">
                <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
                  Service Name
                </label>
                <input
                  type="text"
                  placeholder="e.g. Express Next-Day"
                  value={formState.name}
                  onChange={(e) => setFormState({ ...formState, name: e.target.value })}
                  className="w-full h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all"
                />
              </div>

              <div className="space-y-2">
                <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
                  Description
                </label>
                <textarea
                  rows={3}
                  placeholder="Enter detailed description of what this service covers..."
                  value={formState.description}
                  onChange={(e) => setFormState({ ...formState, description: e.target.value })}
                  className="w-full p-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white resize-none transition-all"
                />
              </div>

              <div className="space-y-2">
                <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
                  Base Price Surcharge (TZS)
                </label>
                <div className="relative">
                  <div className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 text-xs font-black">
                    TZS
                  </div>
                  <input
                    type="number"
                    min="0"
                    step="any"
                    placeholder="0"
                    value={formState.basePrice}
                    onChange={(e) => setFormState({ ...formState, basePrice: e.target.value })}
                    className="w-full h-11 pl-12 pr-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all"
                  />
                </div>
              </div>

              <div className="flex items-center justify-between p-4 bg-slate-50 border border-slate-100 rounded-[10px]">
                <div className="space-y-0.5">
                  <h4 className="text-xs font-black text-slate-900">
                    Active Status
                  </h4>
                  <p className="text-[10px] font-semibold text-slate-400 leading-normal">
                    Toggle visibility of this service during parcel registration
                  </p>
                </div>
                <Switch
                  checked={formState.isActive}
                  onCheckedChange={(checked) => setFormState({ ...formState, isActive: checked })}
                />
              </div>
            </div>

            <DialogFooter className="mt-8 flex items-center justify-end gap-3">
              <DialogClose asChild>
                <button
                  type="button"
                  onClick={resetForm}
                  className="h-11 px-5 border border-slate-200 hover:border-slate-300 text-slate-700 hover:text-slate-900 rounded-[10px] text-[11px] font-black uppercase tracking-widest transition-all active:scale-95"
                >
                  Cancel
                </button>
              </DialogClose>
              <button
                type="submit"
                disabled={isCreating || isUpdating}
                className="h-11 px-6 bg-slate-900 text-white hover:bg-slate-800 rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 shadow-xl shadow-slate-900/10 transition-all active:scale-95 disabled:bg-slate-100 disabled:text-slate-400"
              >
                {(isCreating || isUpdating) ? (
                  <Loader2 size={13} className="animate-spin" />
                ) : null}
                {formState.id ? "Update Service" : "Create Service"}
              </button>
            </DialogFooter>
          </form>
        </DialogContent>
      </Dialog>
    </div>
  );
}

export default function AdditionalServicesPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">
          Loading page...
        </div>
      }
    >
      <AdditionalServicesPageInner />
    </Suspense>
  );
}
