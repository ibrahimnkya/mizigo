"use client";

import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";
import {
  ClipboardList,
  Plus,
  Trash2,
  Save,
  RotateCcw,
  Loader2,
  HelpCircle,
  Pencil
} from "lucide-react";
import { useState, useEffect } from "react";
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

// Detailed interface for Parameter item
interface ParameterItem {
  name: string;
  description: string;
  isActive: boolean;
}

// Dialog editing state
interface EditingParam {
  category: "types" | "conditions" | "sizes" | "priorities";
  index: number;
  name: string;
  description: string;
}

// Defaults with names and description details
const DEFAULT_TYPES: ParameterItem[] = [
  { name: "Document", description: "Letters, documents, and paper items", isActive: true },
  { name: "Envelope", description: "Large letters, flat cardboards, or envelopes", isActive: true },
  { name: "Small package", description: "Box or package up to 2 kg", isActive: true },
  { name: "Medium package", description: "Box or package from 2 kg to 10 kg", isActive: true },
  { name: "Large package", description: "Box or package from 10 kg to 30 kg", isActive: true },
  { name: "Fragile item", description: "Items requiring delicate handling (glass, electronics)", isActive: true },
  { name: "Commercial Goods", description: "Merchandise for trade or commercial sale", isActive: true },
  { name: "Cargo", description: "Heavy or bulky cargo items", isActive: true },
  { name: "Perishable Goods", description: "Food, flowers, or items requiring climate control", isActive: true },
  { name: "Other", description: "Classifications not matching other categories", isActive: true }
];

const DEFAULT_CONDITIONS: ParameterItem[] = [
  { name: "Intact", description: "No visible damage, package is in perfect shape", isActive: true },
  { name: "Minor Damage", description: "Small dents, scratches or wear on packaging", isActive: true },
  { name: "Damaged", description: "Visible damage affecting the packaging structure", isActive: true },
  { name: "Opened/Tampered", description: "Package appears opened, resealed, or tampered with", isActive: true },
  { name: "Wet", description: "Signs of water, moisture, or liquid exposure", isActive: true },
  { name: "Crushed", description: "Package deformed or crushed due to pressure", isActive: true },
  { name: "Leaking", description: "Contents or liquids leaking from packaging", isActive: true },
  { name: "Spoiled", description: "Perishable goods showing signs of decay or spoilage", isActive: true },
  { name: "Broken", description: "Fragile items showing clear signs of breakage", isActive: true },
  { name: "Not inspected", description: "Condition not verified or inspected", isActive: true }
];

const DEFAULT_SIZES: ParameterItem[] = [
  { name: "Document", description: "Very small flat envelope or document pack", isActive: true },
  { name: "Small Parcel", description: "Small box, typically under 30x20x10 cm", isActive: true },
  { name: "Medium Parcel", description: "Medium box, typically under 50x40x30 cm", isActive: true },
  { name: "Large Parcel", description: "Large box, typically under 80x60x50 cm", isActive: true },
  { name: "Oversized Parcel", description: "Any package exceeding standard large dimensions", isActive: true },
  { name: "Cargo Item", description: "Bulk or palletized cargo item", isActive: true },
  { name: "Bulk Cargo", description: "Loose bulk cargo or containerized shipments", isActive: true }
];

const DEFAULT_PRIORITIES: ParameterItem[] = [
  { name: "Express", description: "High-priority, same-day or next-day delivery", isActive: true },
  { name: "Standard", description: "Regular ground delivery service", isActive: true },
  { name: "MGR", description: "Mizigo Golden Route - scheduled premium service", isActive: true }
];

// Normalize backend inputs (string arrays vs object arrays)
function normalizeParameters(dataStr: string | null | undefined, defaults: ParameterItem[]): ParameterItem[] {
  if (!dataStr) {
    return defaults;
  }
  try {
    const parsed = JSON.parse(dataStr);
    if (Array.isArray(parsed)) {
      return parsed.map((item: any) => {
        if (typeof item === "string") {
          const match = defaults.find(d => d.name.toLowerCase() === item.toLowerCase());
          return {
            name: item,
            description: match?.description || `Description for ${item}`,
            isActive: true,
          };
        }
        return {
          name: item.name || "",
          description: item.description || "",
          isActive: typeof item.isActive === "boolean" ? item.isActive : true,
        };
      });
    }
  } catch (e) {
    console.error("Failed to parse settings JSON: ", e);
  }
  return defaults;
}

export default function ParcelParametersPage() {
  const queryClient = useQueryClient();

  // Local state for modified lists
  const [types, setTypes] = useState<ParameterItem[]>([]);
  const [conditions, setConditions] = useState<ParameterItem[]>([]);
  const [sizes, setSizes] = useState<ParameterItem[]>([]);
  const [priorities, setPriorities] = useState<ParameterItem[]>([]);

  // Add inputs state
  const [newType, setNewType] = useState("");
  const [newCondition, setNewCondition] = useState("");
  const [newSize, setNewSize] = useState("");
  const [newPriority, setNewPriority] = useState("");

  // Edit Dialog State
  const [editingParam, setEditingParam] = useState<EditingParam | null>(null);

  // Fetch current configs from system settings
  const { data: settings, isLoading } = useQuery({
    queryKey: ["platform-settings"],
    queryFn: async () => {
      const { data } = await api.get("/admin/platform/settings");
      return data.data || data;
    },
  });

  // Load from query data to local states when loaded
  useEffect(() => {
    if (settings) {
      setTypes(normalizeParameters(settings.PARCEL_TYPES, DEFAULT_TYPES));
      setConditions(normalizeParameters(settings.PARCEL_CONDITIONS, DEFAULT_CONDITIONS));
      setSizes(normalizeParameters(settings.PACKAGE_SIZES, DEFAULT_SIZES));
      setPriorities(normalizeParameters(settings.DELIVERY_PRIORITIES, DEFAULT_PRIORITIES));
    }
  }, [settings]);

  // Mutation to save all configs sequentially
  const { mutate: saveParameters, isPending: isSaving } = useMutation({
    mutationFn: async () => {
      await Promise.all([
        api.patch("/admin/platform/settings", {
          key: "PARCEL_TYPES",
          value: JSON.stringify(types),
          description: "Available parcel classification types",
        }),
        api.patch("/admin/platform/settings", {
          key: "PARCEL_CONDITIONS",
          value: JSON.stringify(conditions),
          description: "Parcel condition status values",
        }),
        api.patch("/admin/platform/settings", {
          key: "PACKAGE_SIZES",
          value: JSON.stringify(sizes),
          description: "Available package volume/size categories",
        }),
        api.patch("/admin/platform/settings", {
          key: "DELIVERY_PRIORITIES",
          value: JSON.stringify(priorities),
          description: "Available delivery priority levels",
        }),
      ]);
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["platform-settings"] });
      toast.success("Parcel parameters updated successfully");
    },
    onError: (err: any) => {
      toast.error(
        err.response?.data?.error?.message || "Failed to save parcel parameters"
      );
    },
  });

  // Action Helpers
  const addType = () => {
    const trimmed = newType.trim();
    if (!trimmed) return;
    if (types.some(t => t.name.toLowerCase() === trimmed.toLowerCase())) {
      toast.error("Type already exists");
      return;
    }
    setTypes([...types, { name: trimmed, description: "Custom parcel type", isActive: true }]);
    setNewType("");
  };

  const removeType = (index: number) => {
    setTypes(types.filter((_, i) => i !== index));
  };

  const addCondition = () => {
    const trimmed = newCondition.trim();
    if (!trimmed) return;
    if (conditions.some(c => c.name.toLowerCase() === trimmed.toLowerCase())) {
      toast.error("Condition already exists");
      return;
    }
    setConditions([...conditions, { name: trimmed, description: "Custom inspection condition", isActive: true }]);
    setNewCondition("");
  };

  const removeCondition = (index: number) => {
    setConditions(conditions.filter((_, i) => i !== index));
  };

  const addSize = () => {
    const trimmed = newSize.trim();
    if (!trimmed) return;
    if (sizes.some(s => s.name.toLowerCase() === trimmed.toLowerCase())) {
      toast.error("Size already exists");
      return;
    }
    setSizes([...sizes, { name: trimmed, description: "Custom size bracket", isActive: true }]);
    setNewSize("");
  };

  const removeSize = (index: number) => {
    setSizes(sizes.filter((_, i) => i !== index));
  };

  const addPriority = () => {
    const trimmed = newPriority.trim();
    if (!trimmed) return;
    if (priorities.some(p => p.name.toLowerCase() === trimmed.toLowerCase())) {
      toast.error("Priority level already exists");
      return;
    }
    setPriorities([...priorities, { name: trimmed, description: "Custom delivery priority", isActive: true }]);
    setNewPriority("");
  };

  const removePriority = (index: number) => {
    setPriorities(priorities.filter((_, i) => i !== index));
  };

  const handleResetToDefaults = () => {
    setTypes(DEFAULT_TYPES);
    setConditions(DEFAULT_CONDITIONS);
    setSizes(DEFAULT_SIZES);
    setPriorities(DEFAULT_PRIORITIES);
    toast.info("Reset local parameters to system defaults. Save to apply.");
  };

  const parsedTypes = settings ? normalizeParameters(settings.PARCEL_TYPES, DEFAULT_TYPES) : [];
  const parsedConditions = settings ? normalizeParameters(settings.PARCEL_CONDITIONS, DEFAULT_CONDITIONS) : [];
  const parsedSizes = settings ? normalizeParameters(settings.PACKAGE_SIZES, DEFAULT_SIZES) : [];
  const parsedPriorities = settings ? normalizeParameters(settings.DELIVERY_PRIORITIES, DEFAULT_PRIORITIES) : [];

  const hasUnsavedChanges =
    settings &&
    (JSON.stringify(types) !== JSON.stringify(parsedTypes) ||
      JSON.stringify(conditions) !== JSON.stringify(parsedConditions) ||
      JSON.stringify(sizes) !== JSON.stringify(parsedSizes) ||
      JSON.stringify(priorities) !== JSON.stringify(parsedPriorities));

  const saveEditedParam = () => {
    if (!editingParam) return;
    const { category, index, name, description } = editingParam;
    if (!name.trim()) {
      toast.error("Name is required");
      return;
    }

    if (category === "types") {
      const updated = [...types];
      const current = updated[index];
      if (current) {
        updated[index] = { ...current, name: name.trim(), description: description.trim() };
        setTypes(updated);
      }
    } else if (category === "conditions") {
      const updated = [...conditions];
      const current = updated[index];
      if (current) {
        updated[index] = { ...current, name: name.trim(), description: description.trim() };
        setConditions(updated);
      }
    } else if (category === "sizes") {
      const updated = [...sizes];
      const current = updated[index];
      if (current) {
        updated[index] = { ...current, name: name.trim(), description: description.trim() };
        setSizes(updated);
      }
    } else if (category === "priorities") {
      const updated = [...priorities];
      const current = updated[index];
      if (current) {
        updated[index] = { ...current, name: name.trim(), description: description.trim() };
        setPriorities(updated);
      }
    }
    setEditingParam(null);
    toast.success("Parameter details updated locally. Save Configuration to apply.");
  };

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
          title="Parameter Management Dashboard"
          subtitle="Configure platform-wide parcel categories, inspection conditions, and size matrices"
          iconName="ClipboardList"
          hideBackArrow={true}
          action={
            <div className="flex items-center gap-3">
              <button
                onClick={handleResetToDefaults}
                className="h-11 px-5 bg-white/10 hover:bg-white/15 border border-white/10 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 transition-all active:scale-95"
              >
                <RotateCcw size={13} strokeWidth={2.5} />
                Reset Defaults
              </button>
              <button
                onClick={() => saveParameters()}
                disabled={isSaving || !hasUnsavedChanges}
                className="h-11 px-6 bg-blue-600 disabled:bg-slate-800 disabled:text-slate-500 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 shadow-xl shadow-blue-600/10 hover:bg-blue-500 transition-all active:scale-95"
              >
                {isSaving ? (
                  <Loader2 size={13} className="animate-spin" />
                ) : (
                  <Save size={13} strokeWidth={2.5} />
                )}
                Save Configuration
              </button>
            </div>
          }
        />

        {/* Information Callout */}
        <div className="bg-blue-50/50 border border-blue-100 rounded-[10px] p-5 flex items-start gap-4">
          <HelpCircle className="w-5 h-5 text-blue-500 shrink-0 mt-0.5" />
          <div className="space-y-1">
            <h4 className="text-[12px] font-extrabold text-blue-800 uppercase tracking-wider">
              Super Admin Settings Note
            </h4>
            <p className="text-[12px] font-semibold text-blue-600/90 leading-relaxed">
              These lists govern how parcels are classified during registration and evaluated during inspections across the entire platform. Modifying these settings updates the selection forms globally for all clerks and operators.
            </p>
          </div>
        </div>

        {/* 3 Columns for Parameters */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          
          {/* Column 1: Parcel Types */}
          <div className="bg-white rounded-[10px] border border-slate-100 shadow-sm p-6 flex flex-col justify-between min-h-[500px]">
            <div className="space-y-6">
              <div>
                <h3 className="text-md font-black text-slate-900 tracking-tight">
                  Parcel Types
                </h3>
                <p className="text-slate-400 font-bold text-[11px] uppercase tracking-wider mt-1">
                  Item Classifications
                </p>
              </div>

              {/* Add form */}
              <div className="flex gap-2">
                <input
                  type="text"
                  placeholder="e.g. Electronics"
                  value={newType}
                  onChange={(e) => setNewType(e.target.value)}
                  onKeyDown={(e) => e.key === "Enter" && addType()}
                  className="flex-1 h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all"
                />
                <button
                  onClick={addType}
                  className="w-11 h-11 bg-slate-900 text-white rounded-[10px] flex items-center justify-center hover:bg-slate-800 transition-all"
                >
                  <Plus size={16} strokeWidth={2.5} />
                </button>
              </div>

              {/* List */}
              <div className="space-y-2 max-h-[400px] overflow-y-auto pr-1">
                {types.map((item, idx) => (
                  <div
                    key={idx}
                    className={cn(
                      "flex items-center justify-between px-4 py-3 bg-slate-50 border border-slate-100 rounded-[10px] group hover:border-slate-200 transition-all",
                      !item.isActive && "opacity-60 bg-slate-100/50"
                    )}
                  >
                    <div className="flex-1 min-w-0 pr-4">
                      <h4 className="text-xs font-black text-slate-800 truncate">
                        {idx + 1}. {item.name}
                      </h4>
                      {item.description && (
                        <p className="text-[10px] font-semibold text-slate-400 truncate mt-0.5">
                          {item.description}
                        </p>
                      )}
                    </div>
                    <div className="flex items-center gap-2 shrink-0">
                      <Switch
                        checked={item.isActive}
                        onCheckedChange={(checked) => {
                          const updated = [...types];
                          const current = updated[idx];
                          if (current) {
                            updated[idx] = { ...current, isActive: checked };
                            setTypes(updated);
                          }
                        }}
                      />
                      <button
                        onClick={() => setEditingParam({ category: "types", index: idx, name: item.name, description: item.description })}
                        className="text-slate-400 hover:text-blue-600 p-1.5 rounded-[5px] hover:bg-slate-100 transition-all"
                        title="View / Edit details"
                      >
                        <Pencil size={12} strokeWidth={2.5} />
                      </button>
                      <button
                        onClick={() => removeType(idx)}
                        className="text-slate-400 hover:text-red-500 p-1.5 rounded-[5px] hover:bg-slate-100 opacity-0 group-hover:opacity-100 transition-all"
                        title="Delete"
                      >
                        <Trash2 size={12} />
                      </button>
                    </div>
                  </div>
                ))}
                {types.length === 0 && (
                  <p className="text-center text-xs text-slate-400 py-6 font-bold uppercase tracking-wider">
                    No types specified
                  </p>
                )}
              </div>
            </div>
          </div>

          {/* Column 2: Conditions */}
          <div className="bg-white rounded-[10px] border border-slate-100 shadow-sm p-6 flex flex-col justify-between min-h-[500px]">
            <div className="space-y-6">
              <div>
                <h3 className="text-md font-black text-slate-900 tracking-tight">
                  Parcel Conditions
                </h3>
                <p className="text-slate-400 font-bold text-[11px] uppercase tracking-wider mt-1">
                  Inspection Statuses
                </p>
              </div>

              {/* Add form */}
              <div className="flex gap-2">
                <input
                  type="text"
                  placeholder="e.g. Scratched"
                  value={newCondition}
                  onChange={(e) => setNewCondition(e.target.value)}
                  onKeyDown={(e) => e.key === "Enter" && addCondition()}
                  className="flex-1 h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all"
                />
                <button
                  onClick={addCondition}
                  className="w-11 h-11 bg-slate-900 text-white rounded-[10px] flex items-center justify-center hover:bg-slate-800 transition-all"
                >
                  <Plus size={16} strokeWidth={2.5} />
                </button>
              </div>

              {/* List */}
              <div className="space-y-2 max-h-[400px] overflow-y-auto pr-1">
                {conditions.map((item, idx) => (
                  <div
                    key={idx}
                    className={cn(
                      "flex items-center justify-between px-4 py-3 bg-slate-50 border border-slate-100 rounded-[10px] group hover:border-slate-200 transition-all",
                      !item.isActive && "opacity-60 bg-slate-100/50"
                    )}
                  >
                    <div className="flex-1 min-w-0 pr-4">
                      <h4 className="text-xs font-black text-slate-800 truncate">
                        {idx + 1}. {item.name}
                      </h4>
                      {item.description && (
                        <p className="text-[10px] font-semibold text-slate-400 truncate mt-0.5">
                          {item.description}
                        </p>
                      )}
                    </div>
                    <div className="flex items-center gap-2 shrink-0">
                      <Switch
                        checked={item.isActive}
                        onCheckedChange={(checked) => {
                          const updated = [...conditions];
                          const current = updated[idx];
                          if (current) {
                            updated[idx] = { ...current, isActive: checked };
                            setConditions(updated);
                          }
                        }}
                      />
                      <button
                        onClick={() => setEditingParam({ category: "conditions", index: idx, name: item.name, description: item.description })}
                        className="text-slate-400 hover:text-blue-600 p-1.5 rounded-[5px] hover:bg-slate-100 transition-all"
                        title="View / Edit details"
                      >
                        <Pencil size={12} strokeWidth={2.5} />
                      </button>
                      <button
                        onClick={() => removeCondition(idx)}
                        className="text-slate-400 hover:text-red-500 p-1.5 rounded-[5px] hover:bg-slate-100 opacity-0 group-hover:opacity-100 transition-all"
                        title="Delete"
                      >
                        <Trash2 size={12} />
                      </button>
                    </div>
                  </div>
                ))}
                {conditions.length === 0 && (
                  <p className="text-center text-xs text-slate-400 py-6 font-bold uppercase tracking-wider">
                    No conditions specified
                  </p>
                )}
              </div>
            </div>
          </div>

          {/* Column 3: Package Sizes */}
          <div className="bg-white rounded-[10px] border border-slate-100 shadow-sm p-6 flex flex-col justify-between min-h-[500px]">
            <div className="space-y-6">
              <div>
                <h3 className="text-md font-black text-slate-900 tracking-tight">
                  Package Sizes
                </h3>
                <p className="text-slate-400 font-bold text-[11px] uppercase tracking-wider mt-1">
                  Volume Classifications
                </p>
              </div>

              {/* Add form */}
              <div className="flex gap-2">
                <input
                  type="text"
                  placeholder="e.g. Standard Box"
                  value={newSize}
                  onChange={(e) => setNewSize(e.target.value)}
                  onKeyDown={(e) => e.key === "Enter" && addSize()}
                  className="flex-1 h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all"
                />
                <button
                  onClick={addSize}
                  className="w-11 h-11 bg-slate-900 text-white rounded-[10px] flex items-center justify-center hover:bg-slate-800 transition-all"
                >
                  <Plus size={16} strokeWidth={2.5} />
                </button>
              </div>

              {/* List */}
              <div className="space-y-2 max-h-[400px] overflow-y-auto pr-1">
                {sizes.map((item, idx) => (
                  <div
                    key={idx}
                    className={cn(
                      "flex items-center justify-between px-4 py-3 bg-slate-50 border border-slate-100 rounded-[10px] group hover:border-slate-200 transition-all",
                      !item.isActive && "opacity-60 bg-slate-100/50"
                    )}
                  >
                    <div className="flex-1 min-w-0 pr-4">
                      <h4 className="text-xs font-black text-slate-800 truncate">
                        {idx + 1}. {item.name}
                      </h4>
                      {item.description && (
                        <p className="text-[10px] font-semibold text-slate-400 truncate mt-0.5">
                          {item.description}
                        </p>
                      )}
                    </div>
                    <div className="flex items-center gap-2 shrink-0">
                      <Switch
                        checked={item.isActive}
                        onCheckedChange={(checked) => {
                          const updated = [...sizes];
                          const current = updated[idx];
                          if (current) {
                            updated[idx] = { ...current, isActive: checked };
                            setSizes(updated);
                          }
                        }}
                      />
                      <button
                        onClick={() => setEditingParam({ category: "sizes", index: idx, name: item.name, description: item.description })}
                        className="text-slate-400 hover:text-blue-600 p-1.5 rounded-[5px] hover:bg-slate-100 transition-all"
                        title="View / Edit details"
                      >
                        <Pencil size={12} strokeWidth={2.5} />
                      </button>
                      <button
                        onClick={() => removeSize(idx)}
                        className="text-slate-400 hover:text-red-500 p-1.5 rounded-[5px] hover:bg-slate-100 opacity-0 group-hover:opacity-100 transition-all"
                        title="Delete"
                      >
                        <Trash2 size={12} />
                      </button>
                    </div>
                  </div>
                ))}
                {sizes.length === 0 && (
                  <p className="text-center text-xs text-slate-400 py-6 font-bold uppercase tracking-wider">
                    No sizes specified
                  </p>
                )}
              </div>
            </div>
          </div>

        </div>

        {/* Delivery Priorities (Placed just below the parcel parameters grid) */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          <div className="bg-white rounded-[10px] border border-slate-100 shadow-sm p-6 flex flex-col justify-between min-h-[500px]">
            <div className="space-y-6">
              <div>
                <h3 className="text-md font-black text-slate-900 tracking-tight">
                  Delivery Priorities
                </h3>
                <p className="text-slate-400 font-bold text-[11px] uppercase tracking-wider mt-1">
                  Urgency Settings
                </p>
              </div>

              {/* Add form */}
              <div className="flex gap-2">
                <input
                  type="text"
                  placeholder="e.g. Express"
                  value={newPriority}
                  onChange={(e) => setNewPriority(e.target.value)}
                  onKeyDown={(e) => e.key === "Enter" && addPriority()}
                  className="flex-1 h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all"
                />
                <button
                  onClick={addPriority}
                  className="w-11 h-11 bg-slate-900 text-white rounded-[10px] flex items-center justify-center hover:bg-slate-800 transition-all"
                >
                  <Plus size={16} strokeWidth={2.5} />
                </button>
              </div>

              {/* List */}
              <div className="space-y-2 max-h-[400px] overflow-y-auto pr-1">
                {priorities.map((item, idx) => (
                  <div
                    key={idx}
                    className={cn(
                      "flex items-center justify-between px-4 py-3 bg-slate-50 border border-slate-100 rounded-[10px] group hover:border-slate-200 transition-all",
                      !item.isActive && "opacity-60 bg-slate-100/50"
                    )}
                  >
                    <div className="flex-1 min-w-0 pr-4">
                      <h4 className="text-xs font-black text-slate-800 truncate">
                        {idx + 1}. {item.name}
                      </h4>
                      {item.description && (
                        <p className="text-[10px] font-semibold text-slate-400 truncate mt-0.5">
                          {item.description}
                        </p>
                      )}
                    </div>
                    <div className="flex items-center gap-2 shrink-0">
                      <Switch
                        checked={item.isActive}
                        onCheckedChange={(checked) => {
                          const updated = [...priorities];
                          const current = updated[idx];
                          if (current) {
                            updated[idx] = { ...current, isActive: checked };
                            setPriorities(updated);
                          }
                        }}
                      />
                      <button
                        onClick={() => setEditingParam({ category: "priorities", index: idx, name: item.name, description: item.description })}
                        className="text-slate-400 hover:text-blue-600 p-1.5 rounded-[5px] hover:bg-slate-100 transition-all"
                        title="View / Edit details"
                      >
                        <Pencil size={12} strokeWidth={2.5} />
                      </button>
                      <button
                        onClick={() => removePriority(idx)}
                        className="text-slate-400 hover:text-red-500 p-1.5 rounded-[5px] hover:bg-slate-100 opacity-0 group-hover:opacity-100 transition-all"
                        title="Delete"
                      >
                        <Trash2 size={12} />
                      </button>
                    </div>
                  </div>
                ))}
                {priorities.length === 0 && (
                  <p className="text-center text-xs text-slate-400 py-6 font-bold uppercase tracking-wider">
                    No priorities specified
                  </p>
                )}
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Edit Details Dialog */}
      <Dialog open={!!editingParam} onOpenChange={(open) => !open && setEditingParam(null)}>
        <DialogContent className="w-full sm:w-[500px] p-6 bg-white rounded-2xl border border-slate-100 shadow-2xl">
          <DialogHeader className="mb-5">
            <DialogTitle className="text-[18px] font-black text-slate-900 tracking-tight leading-none mb-2">
              Edit Parameter Details
            </DialogTitle>
            <span className="text-[11px] font-extrabold text-slate-400 uppercase tracking-widest leading-none">
              Modify custom parameter settings and metadata
            </span>
          </DialogHeader>

          {editingParam && (
            <div className="space-y-5">
              <div className="space-y-2">
                <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
                  Parameter Name
                </label>
                <input
                  type="text"
                  value={editingParam.name}
                  onChange={(e) => setEditingParam({ ...editingParam, name: e.target.value })}
                  className="w-full h-11 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white transition-all"
                />
              </div>

              <div className="space-y-2">
                <label className="text-[10px] font-black text-slate-500 uppercase tracking-widest">
                  Description
                </label>
                <textarea
                  rows={3}
                  value={editingParam.description}
                  onChange={(e) => setEditingParam({ ...editingParam, description: e.target.value })}
                  className="w-full p-4 bg-slate-50 border border-slate-100 rounded-[10px] text-xs font-semibold text-slate-900 outline-none focus:border-blue-500 focus:bg-white resize-none transition-all"
                  placeholder="Enter detailed description..."
                />
              </div>
            </div>
          )}

          <DialogFooter className="mt-8 flex items-center justify-end gap-3">
            <DialogClose asChild>
              <button
                type="button"
                className="h-11 px-5 border border-slate-200 hover:border-slate-300 text-slate-700 hover:text-slate-900 rounded-[10px] text-[11px] font-black uppercase tracking-widest transition-all active:scale-95"
              >
                Cancel
              </button>
            </DialogClose>
            <button
              onClick={saveEditedParam}
              className="h-11 px-6 bg-slate-900 text-white hover:bg-slate-800 rounded-[10px] text-[11px] font-black uppercase tracking-widest shadow-xl shadow-slate-900/10 transition-all active:scale-95"
            >
              Update Parameter
            </button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </div>
  );
}
