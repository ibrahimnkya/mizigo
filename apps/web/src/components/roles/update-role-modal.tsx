"use client";

import { useState, useEffect } from "react";
import {
  ShieldAlert,
  Plus,
  Loader2,
  CheckCircle2,
  FileText,
  Fingerprint,
  ShieldCheck,
  Key,
  Settings2,
} from "lucide-react";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetTitle,
  SheetTrigger,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import api from "@/lib/api/client";
import { cn } from "@/lib/utils";

interface UpdateRoleModalProps {
  role: any;
  onSuccess?: () => void;
}

export function UpdateRoleModal({ role, onSuccess }: UpdateRoleModalProps) {
  const [open, setOpen] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // Form State
  const [name, setName] = useState(role?.name || "");
  const [description, setDescription] = useState(role?.description || "");
  const [selectedPermissions, setSelectedPermissions] = useState<string[]>([]);
  const [permissions, setPermissions] = useState<any[]>([]);
  const [isLoadingPermissions, setIsLoadingPermissions] = useState(false);

  // Sync form state when role changes or modal opens
  useEffect(() => {
    if (open && role) {
      setName(role.name || "");
      setDescription(role.description || "");
      // role.permissions is usually an array of objects like { permission: { id, name } }
      const pIds =
        role.permissions?.map((p: any) => p.permissionId || p.permission?.id) ||
        [];
      setSelectedPermissions(pIds);
      fetchPermissions();
    }
  }, [open, role]);

  const fetchPermissions = async () => {
    setIsLoadingPermissions(true);
    try {
      const { data } = await api.get("/permissions");
      setPermissions(data.data || data || []);
    } catch (err) {
      console.error("Failed to fetch permissions:", err);
    } finally {
      setIsLoadingPermissions(false);
    }
  };

  const togglePermission = (id: string) => {
    setSelectedPermissions((prev) =>
      prev.includes(id) ? prev.filter((pId) => pId !== id) : [...prev, id],
    );
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError(null);

    try {
      const formattedName = name.trim().toUpperCase().replace(/\s+/g, "_");

      const response = await api.patch(`/roles/${role.id}`, {
        name: formattedName,
        description,
        permissionIds: selectedPermissions,
      });

      if (response.status === 200) {
        setOpen(false);
        onSuccess?.();
      }
    } catch (err: any) {
      setError(
        err.response?.data?.error?.message ||
          err.message ||
          "Failed to update role",
      );
    } finally {
      setLoading(false);
    }
  };

  // Group permissions by prefix (e.g. "users:", "roles:")
  const groupedPermissions = permissions.reduce((acc: any, p: any) => {
    const [group] = p.name.split(":");
    if (!acc[group]) acc[group] = [];
    acc[group].push(p);
    return acc;
  }, {});

  return (
    <Sheet open={open} onOpenChange={setOpen}>
      <SheetTrigger asChild>
        <button className="h-9 px-4 bg-slate-900 text-white rounded-lg text-[10px] font-black uppercase tracking-widest transition-all hover:bg-slate-800 shadow-md shadow-slate-200 active:scale-95">
          Manage
        </button>
      </SheetTrigger>

      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 shadow-2xl flex flex-col rounded-2xl">
        {/* Header Section */}
        <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md">
            <Settings2 className="w-6 h-6 text-white" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10 text-left">
            <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase">
              Refine Security Node
            </SheetTitle>
            <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
              Modify permissions & metadata for {role?.name?.replace(/_/g, " ")}
            </SheetDescription>
          </div>
        </div>

        <form
          id="update-role-form"
          onSubmit={handleSubmit}
          className="p-8 space-y-10 flex-1 overflow-y-auto custom-scrollbar"
        >
          {error && (
            <div className="bg-rose-50 border border-rose-100 text-rose-600 text-[13px] font-bold p-4 rounded-[10px] flex items-center gap-3 animate-in fade-in slide-in-from-top-2">
              <div className="w-2 h-2 rounded-full bg-rose-500 shadow-[0_0_10px_rgba(244,63,94,0.5)]" />
              {error}
            </div>
          )}

          <div className="space-y-8">
            {/* Section 1: Basic Info */}
            <div className="space-y-6">
              <div className="flex items-center gap-2 text-slate-400 mb-2">
                <Fingerprint size={14} strokeWidth={3} />
                <span className="text-[10px] font-black uppercase tracking-[0.2em]">
                  Identity Metadata
                </span>
              </div>

              <div className="space-y-3">
                <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
                  Role Identifier (System Name)
                </Label>
                <Input
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  placeholder="e.g. QUALITY_ASSURANCE"
                  className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] px-5 text-[14px] font-bold transition-all uppercase placeholder:normal-case placeholder:font-medium"
                  required
                />
                <p className="text-[10px] text-slate-400 font-bold italic ml-1">
                  Spaces will be automatically replaced with underscores.
                </p>
              </div>

              <div className="space-y-3">
                <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
                  Role Scope Description
                </Label>
                <textarea
                  value={description}
                  onChange={(e) => setDescription(e.target.value)}
                  rows={3}
                  placeholder="Describe the capabilities and access scope of this role..."
                  className="w-full bg-slate-50 border border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] p-5 text-[13px] font-bold transition-all outline-none resize-none placeholder:font-medium min-h-[100px]"
                  required
                />
              </div>
            </div>

            {/* Section 2: Permission Matrix */}
            <div className="space-y-6">
              <div className="flex items-center justify-between mb-2">
                <div className="flex items-center gap-2 text-slate-400">
                  <Key size={14} strokeWidth={3} />
                  <span className="text-[10px] font-black uppercase tracking-[0.2em]">
                    Capability Matrix
                  </span>
                </div>
                <span className="text-[10px] font-black text-blue-600 uppercase tracking-widest bg-blue-50 px-2.5 py-1 rounded-full">
                  {selectedPermissions.length} Assigned
                </span>
              </div>

              {isLoadingPermissions ? (
                <div className="py-20 flex flex-col items-center justify-center gap-3 bg-slate-50 rounded-2xl border border-slate-100">
                  <Loader2 className="w-6 h-6 text-slate-300 animate-spin" />
                  <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                    Fetching Matrix...
                  </span>
                </div>
              ) : (
                <div className="space-y-8">
                  {Object.entries(groupedPermissions).map(
                    ([group, perms]: [string, any]) => (
                      <div key={group} className="space-y-3">
                        <div className="flex items-center gap-2 ml-1">
                          <div className="h-1 w-4 bg-blue-500 rounded-full" />
                          <span className="text-[11px] font-black text-slate-900 uppercase tracking-tight">
                            {group.replace(/_/g, " ")} Protocols
                          </span>
                        </div>
                        <div className="grid grid-cols-1 gap-2">
                          {perms.map((p: any) => (
                            <div
                              key={p.id}
                              onClick={() => togglePermission(p.id)}
                              className={cn(
                                "group flex items-center justify-between p-4 rounded-xl border transition-all cursor-pointer",
                                selectedPermissions.includes(p.id)
                                  ? "bg-blue-50 border-blue-200 shadow-sm"
                                  : "bg-white border-slate-100 hover:border-slate-300",
                              )}
                            >
                              <div className="flex items-center gap-3">
                                <div
                                  className={cn(
                                    "w-5 h-5 rounded-md border flex items-center justify-center transition-all",
                                    selectedPermissions.includes(p.id)
                                      ? "bg-blue-600 border-blue-600"
                                      : "bg-slate-50 border-slate-200 group-hover:border-slate-400",
                                  )}
                                >
                                  {selectedPermissions.includes(p.id) && (
                                    <CheckCircle2
                                      size={12}
                                      className="text-white"
                                      strokeWidth={4}
                                    />
                                  )}
                                </div>
                                <div className="flex flex-col">
                                  <span
                                    className={cn(
                                      "text-[12px] font-black uppercase tracking-tight transition-colors",
                                      selectedPermissions.includes(p.id)
                                        ? "text-blue-900"
                                        : "text-slate-600",
                                    )}
                                  >
                                    {p.name.split(":")[1]?.replace(/_/g, " ") ||
                                      p.name}
                                  </span>
                                  <span className="text-[9px] font-bold text-slate-400 uppercase tracking-widest mt-0.5">
                                    {p.description ||
                                      `Grant access to ${p.name.replace(/:/g, " ")}`}
                                  </span>
                                </div>
                              </div>
                              {selectedPermissions.includes(p.id) && (
                                <ShieldCheck
                                  size={16}
                                  className="text-blue-500"
                                  strokeWidth={3}
                                />
                              )}
                            </div>
                          ))}
                        </div>
                      </div>
                    ),
                  )}
                </div>
              )}
            </div>
          </div>
        </form>

        {/* Action Footer */}
        <div className="p-6 bg-slate-50 border-t border-slate-100 flex gap-3">
          <button
            type="button"
            onClick={() => setOpen(false)}
            className="flex-1 h-14 rounded-xl bg-white border border-slate-200 text-slate-400 text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-50 transition-all active:scale-[0.98]"
          >
            Cancel
          </button>
          <button
            type="submit"
            form="update-role-form"
            disabled={
              loading ||
              !name ||
              !description ||
              selectedPermissions.length === 0
            }
            className="flex-[1.5] h-14 rounded-xl bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 flex items-center justify-center gap-3 active:scale-[0.98] disabled:opacity-50 disabled:grayscale"
          >
            {loading ? (
              <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
            ) : (
              <>
                <CheckCircle2 className="w-5 h-5" strokeWidth={3} />
                Update Role
              </>
            )}
          </button>
        </div>
      </SheetContent>
    </Sheet>
  );
}
