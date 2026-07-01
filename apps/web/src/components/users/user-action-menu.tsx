"use client";

import { useState, useEffect } from "react";
import {
  MoreHorizontal,
  Eye,
  Edit2,
  Edit3,
  Shield,
  Calendar,
  Mail,
  MapPin,
  Flag,
  Trash2,
  User,
  Phone,
  CheckCircle2,
  AlertTriangle,
  Loader2,
} from "lucide-react";
import { cn } from "@repo/ui/utils";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@repo/ui/dropdown-menu";
import api from "@/lib/api/client";
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetDescription,
  SheetFooter,
} from "@repo/ui/sheet";
import {
  Tooltip,
  TooltipContent,
  TooltipProvider,
  TooltipTrigger,
} from "@repo/ui/tooltip";
import { Button } from "@repo/ui/button";

export function UserActionMenu({
  user,
  currentUserRole,
}: {
  user: any;
  currentUserRole?: string;
}) {
  const [viewOpen, setViewOpen] = useState(false);
  const [editOpen, setEditOpen] = useState(false);
  const [deleteOpen, setDeleteOpen] = useState(false);
  const [deleting, setDeleting] = useState(false);

  const [isEditing, setIsEditing] = useState(false);
  const [editName, setEditName] = useState("");
  const [editPhone, setEditPhone] = useState("");
  const [editStationId, setEditStationId] = useState("");
  const [editWagonId, setEditWagonId] = useState("");
  const [saving, setSaving] = useState(false);
  const [stations, setStations] = useState<any[]>([]);
  const [vehicles, setVehicles] = useState<any[]>([]);

  useEffect(() => {
    if (viewOpen && user) {
      setEditName(user.name || "");
      setEditPhone(user.phone || "");
      setEditStationId(user.stationId || "");
      setEditWagonId(user.wagonId || "");
      setIsEditing(false);
    }
  }, [viewOpen, user]);

  useEffect(() => {
    if (viewOpen) {
      api
        .get("/stations")
        .then(({ data }) => setStations(data.data || data || []))
        .catch(console.error);
      api
        .get("/fleet")
        .then(({ data }) => setVehicles(data.data || data || []))
        .catch(console.error);
    }
  }, [viewOpen]);

  const handleSaveUser = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);
    try {
      const endpoint = ["ADMIN", "SUPER_ADMIN"].includes(user.role?.name)
        ? `/admins/${user.id}`
        : `/operators/${user.id}`;

      const payload = ["ADMIN", "SUPER_ADMIN"].includes(user.role?.name)
        ? { name: editName, phone: editPhone }
        : {
            name: editName,
            phone: editPhone,
            stationId: editStationId || null,
            wagonId: editWagonId || null,
          };

      await api.put(endpoint, payload);
      setIsEditing(false);
      setViewOpen(false);
      window.location.reload();
    } catch (error) {
      console.error(error);
      alert("Failed to update profile details");
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async () => {
    setDeleting(true);
    try {
      const res = await fetch(`/api/users/${user.id}`, {
        method: "DELETE",
      });
      if (!res.ok) throw new Error("Failed to delete user");
      setDeleteOpen(false);
      window.location.reload();
    } catch (error) {
      console.error(error);
      alert("Error deleting user");
    } finally {
      setDeleting(false);
    }
  };

  // Only SUPER_ADMIN or ADMIN can edit, and ADMIN can't edit SUPER_ADMIN
  const canEdit =
    currentUserRole === "SUPER_ADMIN" ||
    (currentUserRole === "ADMIN" &&
      user.role?.name !== "SUPER_ADMIN" &&
      user.role?.name !== "ADMIN");

  return (
    <TooltipProvider delayDuration={0}>
      <div className="flex items-center gap-1.5 px-2">
        {/* VIEW ACTION */}
        <Tooltip>
          <TooltipTrigger asChild>
            <button
              onClick={() => setViewOpen(true)}
              className="w-9 h-9 rounded-[10px] flex items-center justify-center bg-white border border-slate-100 text-slate-400 hover:text-blue-600 hover:bg-blue-50 hover:border-blue-100 transition-all active:scale-90 shadow-sm"
            >
              <Eye size={16} strokeWidth={2.5} />
            </button>
          </TooltipTrigger>
          <TooltipContent
            side="top"
            className="bg-slate-900 text-white border-none font-bold text-[11px] px-3 py-1.5 rounded-[10px] shadow-xl"
          >
            View Details
          </TooltipContent>
        </Tooltip>

        {/* EDIT ACTION */}
        {canEdit && (
          <Tooltip>
            <TooltipTrigger asChild>
              <button
                onClick={() => setEditOpen(true)}
                className="w-9 h-9 rounded-[10px] flex items-center justify-center bg-white border border-slate-100 text-slate-400 hover:text-blue-600 hover:bg-blue-50 hover:border-blue-100 transition-all active:scale-90 shadow-sm"
              >
                <Edit2 size={16} strokeWidth={2.5} />
              </button>
            </TooltipTrigger>
            <TooltipContent
              side="top"
              className="bg-slate-900 text-white border-none font-bold text-[11px] px-3 py-1.5 rounded-[10px] shadow-xl"
            >
              Edit Member
            </TooltipContent>
          </Tooltip>
        )}

        {/* DELETE/ARCHIVE ACTION */}
        {canEdit && (
          <Tooltip>
            <TooltipTrigger asChild>
              <button
                onClick={() => setDeleteOpen(true)}
                className={cn(
                  "w-9 h-9 rounded-[10px] flex items-center justify-center bg-white border border-slate-100 transition-all active:scale-90 shadow-sm",
                  user.role?.name === "AGENT"
                    ? "text-slate-400 hover:text-amber-600 hover:bg-amber-50 hover:border-amber-100"
                    : "text-slate-400 hover:text-rose-600 hover:bg-rose-50 hover:border-rose-100",
                )}
              >
                <Trash2 size={16} strokeWidth={2.5} />
              </button>
            </TooltipTrigger>
            <TooltipContent
              side="top"
              className="bg-slate-900 text-white border-none font-bold text-[11px] px-3 py-1.5 rounded-[10px] shadow-xl"
            >
              {user.role?.name === "AGENT" ? "Archive Agent" : "Delete Account"}
            </TooltipContent>
          </Tooltip>
        )}
      </div>

      {/* VIEW MODAL */}
      <Sheet open={viewOpen} onOpenChange={setViewOpen}>
        <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 shadow-2xl flex flex-col rounded-2xl">
          {/* Premium Header */}
          <div className="bg-slate-900 px-8 py-10 flex flex-col items-center gap-6 shrink-0 relative overflow-hidden">
            <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />

            <div className="w-24 h-24 rounded-2xl bg-white/10 border border-white/10 flex items-center justify-center relative z-10 shadow-2xl backdrop-blur-md">
              <div className="w-20 h-20 rounded-xl bg-blue-600 flex items-center justify-center text-white text-3xl font-black border-4 border-slate-900 shadow-xl">
                {user.name?.charAt(0).toUpperCase() || "?"}
              </div>
            </div>

            <div className="flex flex-col items-center relative z-10 text-center">
              <SheetTitle className="text-[22px] font-black text-white tracking-tight leading-tight uppercase mb-2">
                {user.name}
              </SheetTitle>
              <div className="flex items-center gap-3">
                <div className="px-3 py-1 bg-white/10 border border-white/10 rounded-full flex items-center gap-2 backdrop-blur-sm">
                  <Shield size={12} className="text-blue-400" strokeWidth={3} />
                  <span className="text-[10px] font-black text-white/90 uppercase tracking-widest">
                    {user.role?.name || "USER"}
                  </span>
                </div>
                {user.isFirstLogin && (
                  <div className="px-3 py-1 bg-amber-500/10 border border-amber-500/20 rounded-full flex items-center gap-2 backdrop-blur-sm">
                    <div className="w-1.5 h-1.5 rounded-full bg-amber-400 animate-pulse" />
                    <span className="text-[10px] font-black text-amber-400 uppercase tracking-widest">
                      Pending Setup
                    </span>
                  </div>
                )}
              </div>
            </div>
          </div>

          <div className="p-8 space-y-8 flex-1 overflow-y-auto custom-scrollbar">
            <div className="flex items-center justify-between">
              <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                Core Details
              </h3>
              <button
                type="button"
                onClick={() => setIsEditing(!isEditing)}
                className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg border border-slate-100 hover:bg-slate-50 transition-all text-[10px] font-black uppercase tracking-wider text-blue-600 animate-in fade-in"
              >
                <Edit3 size={11} strokeWidth={3} />
                {isEditing ? "Cancel" : "Edit Details"}
              </button>
            </div>

            {isEditing ? (
              <form
                onSubmit={handleSaveUser}
                className="space-y-4 bg-slate-50 p-5 rounded-[12px] border border-slate-100 text-left animate-in slide-in-from-top-2 duration-300"
              >
                <div className="space-y-1.5">
                  <label className="text-[9px] font-black text-slate-400 uppercase tracking-widest ml-1">
                    Full Name
                  </label>
                  <input
                    type="text"
                    value={editName}
                    onChange={(e) => setEditName(e.target.value)}
                    className="w-full h-11 px-4 rounded-[10px] border border-slate-200 bg-white text-[13px] font-bold text-slate-700 focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all"
                    required
                  />
                </div>
                <div className="space-y-1.5">
                  <label className="text-[9px] font-black text-slate-400 uppercase tracking-widest ml-1">
                    Phone Number
                  </label>
                  <input
                    type="text"
                    value={editPhone}
                    onChange={(e) => setEditPhone(e.target.value)}
                    className="w-full h-11 px-4 rounded-[10px] border border-slate-200 bg-white text-[13px] font-bold text-slate-700 focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all"
                    required
                  />
                </div>
                {!["ADMIN", "SUPER_ADMIN"].includes(user.role?.name) && (
                  <div className="space-y-1.5">
                    <label className="text-[9px] font-black text-slate-400 uppercase tracking-widest ml-1">
                      Assigned Station
                    </label>
                    <div className="relative">
                      <select
                        value={editStationId}
                        onChange={(e) => setEditStationId(e.target.value)}
                        className="w-full h-11 px-4 rounded-[10px] border border-slate-200 bg-white text-[13px] font-bold text-slate-700 focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all appearance-none cursor-pointer"
                      >
                        <option value="">Global / All Access</option>
                        {stations.map((s: any) => (
                          <option key={s.id} value={s.id}>
                            {s.name} ({s.code})
                          </option>
                        ))}
                      </select>
                      <div className="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none text-slate-400">
                        <svg
                          width="12"
                          height="12"
                          viewBox="0 0 24 24"
                          fill="none"
                          stroke="currentColor"
                          strokeWidth="3"
                          strokeLinecap="round"
                          strokeLinejoin="round"
                        >
                          <polyline points="6 9 12 15 18 9" />
                        </svg>
                      </div>
                    </div>
                  </div>
                )}
                {user.role?.name === "TRAIN_GUARD" && (
                  <div className="space-y-1.5">
                    <label className="text-[9px] font-black text-slate-400 uppercase tracking-widest ml-1">
                      Assigned Train / Wagon
                    </label>
                    <div className="relative">
                      <select
                        value={editWagonId}
                        onChange={(e) => setEditWagonId(e.target.value)}
                        className="w-full h-11 px-4 rounded-[10px] border border-slate-200 bg-white text-[13px] font-bold text-slate-700 focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all appearance-none cursor-pointer"
                      >
                        <option value="">No Active Train Assigned</option>
                        {vehicles.map((v: any) => (
                          <option key={v.id} value={v.id}>
                            {v.plateNumber} ({v.type})
                          </option>
                        ))}
                      </select>
                      <div className="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none text-slate-400">
                        <svg
                          width="12"
                          height="12"
                          viewBox="0 0 24 24"
                          fill="none"
                          stroke="currentColor"
                          strokeWidth="3"
                          strokeLinecap="round"
                          strokeLinejoin="round"
                        >
                          <polyline points="6 9 12 15 18 9" />
                        </svg>
                      </div>
                    </div>
                  </div>
                )}
                <Button
                  type="submit"
                  disabled={saving}
                  className="w-full h-11 rounded-[10px] bg-blue-600 hover:bg-blue-700 text-white font-bold text-xs uppercase tracking-widest flex items-center justify-center gap-2 active:scale-95 transition-all shadow-sm"
                >
                  {saving ? (
                    <Loader2 className="w-4 h-4 animate-spin text-white" />
                  ) : (
                    <CheckCircle2
                      className="w-4 h-4 text-white"
                      strokeWidth={3}
                    />
                  )}
                  <span>Save Changes</span>
                </Button>
              </form>
            ) : (
              <div className="grid grid-cols-1 gap-6">
                {[
                  {
                    label: "Email Address",
                    value: user.email || "—",
                    icon: Mail,
                    color: "text-blue-500",
                    bg: "bg-blue-50",
                  },
                  {
                    label: "Contact Number",
                    value: user.phone || "—",
                    icon: Phone,
                    color: "text-emerald-500",
                    bg: "bg-emerald-50",
                  },
                  {
                    label: "Primary Station",
                    value: user.station?.name || "Global Access",
                    icon: MapPin,
                    color: "text-indigo-500",
                    bg: "bg-indigo-50",
                  },
                  {
                    label: "Join Date",
                    value: new Date(user.createdAt).toLocaleDateString(
                      "en-GB",
                      {
                        day: "2-digit",
                        month: "short",
                        year: "numeric",
                      },
                    ),
                    icon: Calendar,
                    color: "text-amber-500",
                    bg: "bg-amber-50",
                  },
                ].map((item, i) => (
                  <div
                    key={i}
                    className="flex items-center gap-5 p-5 bg-slate-50 border border-slate-100 rounded-2xl group hover:bg-white hover:shadow-xl hover:shadow-slate-200/50 transition-all duration-300"
                  >
                    <div
                      className={cn(
                        "w-12 h-12 rounded-xl flex items-center justify-center shrink-0 shadow-sm transition-transform group-hover:scale-110",
                        item.bg,
                      )}
                    >
                      <item.icon
                        className={cn("w-5 h-5", item.color)}
                        strokeWidth={2.5}
                      />
                    </div>
                    <div className="flex flex-col min-w-0">
                      <span className="text-[9px] font-black text-slate-400 uppercase tracking-[0.2em] mb-1">
                        {item.label}
                      </span>
                      <span className="text-[14px] font-bold text-slate-900 truncate">
                        {item.value}
                      </span>
                    </div>
                  </div>
                ))}
              </div>
            )}

            {/* Security Notice */}
            <div className="p-6 bg-slate-900 rounded-2xl relative overflow-hidden group">
              <div className="absolute inset-0 bg-gradient-to-br from-blue-600/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity" />
              <div className="flex items-start gap-4 relative z-10">
                <div className="w-10 h-10 rounded-xl bg-white/10 flex items-center justify-center shrink-0">
                  <Shield size={20} className="text-white" strokeWidth={2.5} />
                </div>
                <div>
                  <h4 className="text-[13px] font-black text-white uppercase tracking-tight mb-1">
                    Access Protocol
                  </h4>
                  <p className="text-[11px] font-medium text-white/50 leading-relaxed">
                    This user has{" "}
                    {user.role?.name === "SUPER_ADMIN"
                      ? "complete platform authority"
                      : "restricted workspace access"}{" "}
                    as defined by the {user.role?.name} security profile.
                  </p>
                </div>
              </div>
            </div>
          </div>

          {/* Footer */}
          {!isEditing && (
            <div className="p-6 bg-slate-50 border-t border-slate-100 flex gap-3">
              <button
                onClick={() => setViewOpen(false)}
                className="w-full h-14 rounded-xl bg-white border border-slate-200 text-slate-400 text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-50 transition-all active:scale-[0.98]"
              >
                Close Profile
              </button>
            </div>
          )}
        </SheetContent>
      </Sheet>

      {/* DELETE CONFIRMATION */}
      <Sheet open={deleteOpen} onOpenChange={setDeleteOpen}>
        <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 shadow-2xl flex flex-col rounded-2xl">
          <div className="bg-slate-900 px-8 py-10 flex flex-col items-center text-center gap-6 shrink-0 relative overflow-hidden">
            <div className="absolute inset-0 bg-gradient-to-br from-rose-600/20 to-transparent pointer-events-none" />
            <div className="w-20 h-20 rounded-2xl bg-rose-500/10 border border-rose-500/20 flex items-center justify-center relative z-10 shadow-2xl backdrop-blur-md">
              <AlertTriangle
                size={32}
                className="text-rose-500"
                strokeWidth={2.5}
              />
            </div>
            <div className="relative z-10">
              <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase mb-2">
                {user.role?.name === "AGENT"
                  ? "Archive Agent"
                  : "Terminate Account"}
              </SheetTitle>
              <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em]">
                Irreversible administrative action
              </SheetDescription>
            </div>
          </div>

          <div className="p-8 flex flex-col items-center text-center gap-6">
            <p className="text-[14px] font-medium text-slate-600 leading-relaxed">
              {user.role?.name === "AGENT"
                ? `Are you sure you want to archive agent `
                : `Are you sure you want to terminate the profile for `}
              <span className="font-black text-slate-900">"{user.name}"</span>?
              <br />
              <br />
              <span className="text-[12px] font-bold text-rose-500 bg-rose-50 px-3 py-1 rounded-full border border-rose-100">
                {user.role?.name === "AGENT"
                  ? "Preserves history but revokes active status."
                  : "This will revoke all system access immediately."}
              </span>
            </p>
          </div>

          <div className="p-6 bg-slate-50 border-t border-slate-100 flex flex-col gap-3">
            <button
              onClick={handleDelete}
              disabled={deleting}
              className={cn(
                "w-full h-14 rounded-xl text-white text-[11px] font-black uppercase tracking-[0.2em] shadow-xl transition-all active:scale-[0.98] flex items-center justify-center gap-3",
                user.role?.name === "AGENT"
                  ? "bg-amber-600 hover:bg-amber-700 shadow-amber-200"
                  : "bg-rose-600 hover:bg-rose-700 shadow-rose-200",
              )}
            >
              {deleting ? (
                <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
              ) : (
                <>
                  <Trash2 className="w-5 h-5" strokeWidth={3} />
                  {user.role?.name === "AGENT"
                    ? "Yes, Archive Agent"
                    : "Yes, Terminate Account"}
                </>
              )}
            </button>
            <button
              onClick={() => setDeleteOpen(false)}
              className="w-full h-14 rounded-xl bg-white border border-slate-200 text-slate-400 text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-50 transition-all active:scale-[0.98]"
            >
              Cancel
            </button>
          </div>
        </SheetContent>
      </Sheet>
    </TooltipProvider>
  );
}
