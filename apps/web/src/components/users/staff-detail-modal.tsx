"use client";

import { useQuery } from "@tanstack/react-query";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
} from "@repo/ui/sheet";
import { Button } from "@repo/ui/button";
import {
  User,
  Mail,
  Phone,
  Building2,
  Calendar,
  Shield,
  Activity,
  PackageCheck,
  Send,
  Truck,
  FolderPlus,
  Loader2,
  Lock,
  BadgeCheck,
  X,
  Edit3,
  CheckCircle2,
  Trash2,
  AlertTriangle,
} from "lucide-react";
import { cn } from "@/lib/utils";
import api from "@/lib/api/client";
import { format } from "date-fns";
import { useState, useEffect } from "react";

function ParcelStatusBadge({ status }: { status: string }) {
  const colors: Record<string, string> = {
    RECEIVED: "bg-blue-50 text-blue-700 border-blue-100",
    DISPATCHED: "bg-indigo-50 text-indigo-700 border-indigo-100",
    IN_TRANSIT: "bg-amber-50 text-amber-700 border-amber-100",
    OFFLOADED: "bg-purple-50 text-purple-700 border-purple-100",
    DELIVERED: "bg-emerald-50 text-emerald-700 border-emerald-100",
    CANCELED: "bg-rose-50 text-rose-700 border-rose-100",
  };
  return (
    <span
      className={cn(
        "text-[8px] font-extrabold px-1.5 py-0.5 rounded-md border uppercase tracking-wider shrink-0",
        colors[status] || "bg-slate-50 text-slate-700 border-slate-100",
      )}
    >
      {status}
    </span>
  );
}

interface StaffDetailModalProps {
  staffId: string | null;
  onClose: () => void;
}

export function StaffDetailModal({ staffId, onClose }: StaffDetailModalProps) {
  const [sendingOtp, setSendingOtp] = useState(false);
  const [deleting, setDeleting] = useState(false);
  const [confirmDelete, setConfirmDelete] = useState(false);
  const [activeSubTab, setActiveSubTab] = useState<"overview" | "parcels">(
    "overview",
  );
  const [alertModal, setAlertModal] = useState<{
    isOpen: boolean;
    type: "success" | "error";
    title: string;
    message: string;
  } | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [editName, setEditName] = useState("");
  const [editPhone, setEditPhone] = useState("");
  const [editStationId, setEditStationId] = useState("");
  const [saving, setSaving] = useState(false);
  const [stations, setStations] = useState<any[]>([]);

  const {
    data: responseData,
    isLoading,
    refetch,
  } = useQuery({
    queryKey: ["staff-details", staffId],
    queryFn: async () => {
      const { data } = await api.get(`/users/${staffId}`);
      return data.data || data;
    },
    enabled: !!staffId,
  });

  const staff = responseData;

  useEffect(() => {
    if (staffId) {
      setActiveSubTab("overview");
      setAlertModal(null);
      setIsEditing(false);
    }
  }, [staffId]);

  useEffect(() => {
    if (staff) {
      setEditName(staff.name || "");
      setEditPhone(staff.phone || "");
      setEditStationId(staff.stationId || "");
    }
  }, [staffId, staff]);

  useEffect(() => {
    api
      .get("/stations")
      .then(({ data }) => setStations(data.data || data || []))
      .catch(console.error);
  }, []);

  const { data: parcelsData, isLoading: loadingParcels } = useQuery({
    queryKey: ["staff-parcels", staffId],
    queryFn: async () => {
      const { data } = await api.get(`/users/${staffId}/parcels`);
      return data.data || data || [];
    },
    enabled: !!staffId && activeSubTab === "parcels",
  });

  const handleResendOtp = async () => {
    if (!staff) return;
    setSendingOtp(true);
    try {
      const endpoint = ["ADMIN", "SUPER_ADMIN"].includes(staff.role?.name)
        ? `/admins/${staff.id}/resend-otp`
        : `/operators/${staff.id}/resend-otp`;

      await api.post(endpoint);
      setAlertModal({
        isOpen: true,
        type: "success",
        title: "OTP Dispatched",
        message:
          "New OTP successfully generated and sent to staff member via SMS.",
      });
    } catch (error: any) {
      console.error(error);
      setAlertModal({
        isOpen: true,
        type: "error",
        title: "Reset Failed",
        message:
          error.response?.data?.error?.message ||
          error.message ||
          "Failed to resend OTP",
      });
    } finally {
      setSendingOtp(false);
    }
  };

  const handleDeleteStaff = async () => {
    if (!staff) return;
    setDeleting(true);
    setConfirmDelete(false);
    try {
      await api.delete(`/users/${staff.id}`);
      setAlertModal({
        isOpen: true,
        type: "success",
        title: "Staff Removed",
        message: `${staff.name}'s account has been permanently removed from the system.`,
      });
    } catch (error: any) {
      const msg =
        error.response?.data?.error?.message ||
        error.message ||
        "Failed to delete staff member";
      setAlertModal({
        isOpen: true,
        type: "error",
        title: "Deletion Blocked",
        message: msg,
      });
    } finally {
      setDeleting(false);
    }
  };

  const handleSaveUser = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!staff) return;
    setSaving(true);
    try {
      const endpoint = ["ADMIN", "SUPER_ADMIN"].includes(staff.role?.name)
        ? `/admins/${staff.id}`
        : `/operators/${staff.id}`;

      const payload = ["ADMIN", "SUPER_ADMIN"].includes(staff.role?.name)
        ? { name: editName, phone: editPhone }
        : {
            name: editName,
            phone: editPhone,
            stationId: editStationId || null,
          };

      await api.put(endpoint, payload);
      setIsEditing(false);
      refetch();
      setAlertModal({
        isOpen: true,
        type: "success",
        title: "Profile Updated",
        message: "Staff profile information has been successfully updated.",
      });
    } catch (error: any) {
      console.error(error);
      setAlertModal({
        isOpen: true,
        type: "error",
        title: "Update Failed",
        message:
          error.response?.data?.error?.message ||
          error.message ||
          "Failed to update profile",
      });
    } finally {
      setSaving(false);
    }
  };

  return (
    <Sheet open={!!staffId} onOpenChange={(open) => !open && onClose()}>
      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 rounded-2xl shadow-2xl">
        <div className="flex flex-col h-full max-h-[100vh] overflow-hidden">
          {/* Header Banner */}
          <div className="bg-slate-900 px-8 py-8 flex items-center justify-between shrink-0 relative overflow-hidden">
            <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
            <div className="flex items-center gap-5 relative z-10 pr-24">
              <div className="w-14 h-14 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md text-white">
                <User size={26} strokeWidth={2.5} />
              </div>
              <div className="flex flex-col relative z-10 text-left">
                <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase">
                  {isLoading ? "Loading staff info..." : staff?.name}
                </SheetTitle>
                <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
                  {isLoading
                    ? "Fetching data"
                    : `${staff?.role?.name?.replace("_", " ")} profile telemetry`}
                </SheetDescription>
              </div>
            </div>

            {/* Edit User Action on the Header - Absolutely Positioned */}
            {!isLoading && staff && (
              <button
                id="header-edit-staff-button"
                type="button"
                onClick={() => setIsEditing(!isEditing)}
                className={cn(
                  "absolute right-20 top-8 w-10 h-10 rounded-[10px] flex items-center justify-center z-20 transition-all hover:scale-105 active:scale-95 shadow-md",
                  isEditing
                    ? "bg-blue-600 text-white border border-blue-500 animate-in spin-in-12 duration-200"
                    : "bg-white/10 text-white/80 border border-white/10 hover:bg-white/20 hover:text-white",
                )}
                title={isEditing ? "View Details" : "Edit Staff"}
              >
                <Edit3 className="w-5 h-5" strokeWidth={2.5} />
              </button>
            )}
          </div>

          {/* Tab Navigation */}
          {!isLoading && staff && (
            <div className="flex items-center gap-1 border-b border-slate-100 px-8 py-2.5 bg-slate-50 shrink-0">
              <button
                onClick={() => setActiveSubTab("overview")}
                className={cn(
                  "px-4 py-2 rounded-lg text-[10px] font-black uppercase tracking-wider transition-all",
                  activeSubTab === "overview"
                    ? "bg-white text-slate-900 shadow-sm border border-slate-200"
                    : "text-slate-400 hover:text-slate-600",
                )}
              >
                Overview
              </button>
              <button
                onClick={() => setActiveSubTab("parcels")}
                className={cn(
                  "px-4 py-2 rounded-lg text-[10px] font-black uppercase tracking-wider transition-all flex items-center gap-1.5",
                  activeSubTab === "parcels"
                    ? "bg-white text-slate-900 shadow-sm border border-slate-200"
                    : "text-slate-400 hover:text-slate-600",
                )}
              >
                <span>Parcels Handled</span>
                <span className="bg-slate-200 text-slate-600 text-[8px] font-bold px-1.5 py-0.5 rounded-full">
                  {staff?.stats?.totalHandled || 0}
                </span>
              </button>
            </div>
          )}

          {isLoading ? (
            <div className="flex-1 flex flex-col items-center justify-center gap-3 text-slate-400">
              <Loader2
                className="w-8 h-8 animate-spin text-blue-500"
                strokeWidth={2.5}
              />
              <span className="text-[11px] font-black uppercase tracking-widest">
                Loading Telemetry...
              </span>
            </div>
          ) : staff ? (
            <div className="flex-1 overflow-y-auto bg-white custom-scrollbar p-8">
              {activeSubTab === "overview" && (
                <div className="space-y-8 animate-in fade-in duration-300">
                  {/* Profile Details Block */}
                  <div className="space-y-4">
                    <div className="flex items-center justify-between">
                      <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                        Core Details
                      </h3>
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
                        {!["ADMIN", "SUPER_ADMIN"].includes(
                          staff.role?.name,
                        ) && (
                          <div className="space-y-1.5">
                            <label className="text-[9px] font-black text-slate-400 uppercase tracking-widest ml-1">
                              Assigned Station
                            </label>
                            <div className="relative">
                              <select
                                value={editStationId}
                                onChange={(e) =>
                                  setEditStationId(e.target.value)
                                }
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
                      <div className="grid grid-cols-1 gap-3.5 bg-slate-50 p-5 rounded-[12px] border border-slate-100">
                        <DetailRow
                          icon={<Mail className="w-4 h-4 text-slate-400" />}
                          label="Email"
                          value={staff.email}
                        />
                        <DetailRow
                          icon={<Phone className="w-4 h-4 text-slate-400" />}
                          label="Phone"
                          value={staff.phone || "N/A"}
                        />
                        <DetailRow
                          icon={
                            <Building2 className="w-4 h-4 text-slate-400" />
                          }
                          label="Station"
                          value={staff.station?.name || "Global / All Access"}
                        />
                        <DetailRow
                          icon={<Shield className="w-4 h-4 text-slate-400" />}
                          label="Role"
                          value={staff.role?.name?.replace("_", " ")}
                          isBadge
                        />
                        <DetailRow
                          icon={<Calendar className="w-4 h-4 text-slate-400" />}
                          label="Joined On"
                          value={format(
                            new Date(staff.createdAt),
                            "MMMM dd, yyyy",
                          )}
                        />
                      </div>
                    )}
                  </div>

                  {/* Performance Statistics */}
                  <div className="space-y-4">
                    <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                      Operations Performance
                    </h3>

                    {(() => {
                      const items = [];
                      if (staff.role?.name !== "TRAIN_GUARD") {
                        items.push(
                          <StatBox
                            key="delivered"
                            icon={
                              <PackageCheck className="w-5 h-5 text-emerald-500" />
                            }
                            bg="bg-emerald-50"
                            label="Delivered"
                            value={staff.stats?.delivered || 0}
                          />,
                        );
                      }
                      items.push(
                        <StatBox
                          key="dispatched"
                          icon={<Send className="w-5 h-5 text-blue-500" />}
                          bg="bg-blue-50"
                          label="Dispatched"
                          value={staff.stats?.dispatched || 0}
                        />,
                      );
                      if (staff.role?.name !== "CLERK") {
                        items.push(
                          <StatBox
                            key="offloaded"
                            icon={<Truck className="w-5 h-5 text-indigo-500" />}
                            bg="bg-indigo-50"
                            label="Offloaded"
                            value={staff.stats?.offloaded || 0}
                          />,
                        );
                      }
                      if (staff.role?.name !== "TRAIN_GUARD") {
                        items.push(
                          <StatBox
                            key="registered"
                            icon={
                              <FolderPlus className="w-5 h-5 text-cyan-500" />
                            }
                            bg="bg-cyan-50"
                            label="Registered"
                            value={staff.stats?.created || 0}
                          />,
                        );
                      }

                      return (
                        <div
                          className={cn(
                            "grid gap-4",
                            items.length === 3 ? "grid-cols-3" : "grid-cols-2",
                          )}
                        >
                          {items}
                        </div>
                      );
                    })()}

                    {/* Total handled progress row */}
                    <div className="bg-slate-900 rounded-[10px] p-5 text-white flex items-center justify-between shadow-lg relative overflow-hidden mt-2">
                      <div className="absolute top-0 right-0 w-24 h-24 bg-blue-500/10 rounded-full blur-xl pointer-events-none" />
                      <div className="flex items-center gap-4 relative z-10">
                        <div className="p-2.5 rounded-[8px] bg-white/10 border border-white/5">
                          <Activity className="w-5 h-5 text-blue-400" />
                        </div>
                        <div className="flex flex-col">
                          <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                            Total Operations Handled
                          </span>
                          <span className="text-[9px] font-semibold text-slate-500 uppercase mt-0.5">
                            Sum of all transit steps
                          </span>
                        </div>
                      </div>
                      <span className="text-3xl font-black text-white tabular-nums relative z-10">
                        {staff.stats?.totalHandled || 0}
                      </span>
                    </div>
                  </div>

                  {/* Actions / Admin controls */}
                  <div className="space-y-4 pt-4 border-t border-slate-100">
                    <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                      Security Controls
                    </h3>
                    <div className="flex items-center gap-3">
                      <Button
                        onClick={handleResendOtp}
                        disabled={sendingOtp}
                        className="flex-1 h-12 rounded-xl bg-slate-950 hover:bg-slate-900 border border-slate-800 text-white font-bold text-xs uppercase tracking-widest flex items-center justify-center gap-2.5 active:scale-95 transition-all shadow-sm"
                      >
                        {sendingOtp ? (
                          <Loader2 className="w-4 h-4 animate-spin text-white" />
                        ) : (
                          <Lock className="w-4 h-4 text-orange-400" />
                        )}
                        <span>Reset Credential OTP</span>
                      </Button>

                      {/* Delete — only enabled when totalHandled === 0 */}
                      <button
                        type="button"
                        onClick={() => {
                          if ((staff.stats?.totalHandled ?? 1) > 0) {
                            setAlertModal({
                              isOpen: true,
                              type: "error",
                              title: "Deletion Blocked",
                              message: `${staff.name} has ${staff.stats?.totalHandled} parcel operation(s) on record. Suspend the account instead.`,
                            });
                          } else {
                            setConfirmDelete(true);
                          }
                        }}
                        disabled={deleting}
                        className="h-12 w-12 flex items-center justify-center rounded-xl border border-rose-100 bg-rose-50 hover:bg-rose-100 text-rose-500 hover:text-rose-600 transition-all active:scale-95 shrink-0 disabled:opacity-50"
                        title="Delete Staff"
                      >
                        {deleting ? (
                          <Loader2 className="w-4 h-4 animate-spin" />
                        ) : (
                          <Trash2 className="w-4 h-4" strokeWidth={2.5} />
                        )}
                      </button>
                    </div>
                    <p className="text-[11px] font-semibold text-slate-400 leading-relaxed pl-1">
                      Resetting credentials triggers a new random 6-digit OTP
                      code dispatched via SMS. Deletion is only permitted for
                      staff with zero parcel activity.
                    </p>
                  </div>
                </div>
              )}

              {activeSubTab === "parcels" && (
                <div className="space-y-4 animate-in fade-in duration-300">
                  <div className="flex items-center justify-between">
                    <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-widest">
                      Handled Transit Log
                    </h3>
                    <span className="text-[10px] font-black uppercase text-blue-600 bg-blue-50 px-2.5 py-0.5 rounded-full">
                      {parcelsData?.length || 0} entries
                    </span>
                  </div>

                  {loadingParcels ? (
                    <div className="py-12 flex flex-col items-center justify-center gap-2.5 text-slate-400">
                      <Loader2
                        className="w-6 h-6 animate-spin text-blue-500"
                        strokeWidth={2.5}
                      />
                      <span className="text-[10px] font-black uppercase tracking-widest">
                        Retrieving logs...
                      </span>
                    </div>
                  ) : !parcelsData || parcelsData.length === 0 ? (
                    <div className="p-8 text-center bg-slate-50 border border-slate-100 rounded-xl">
                      <p className="text-[11px] font-bold text-slate-400">
                        No parcels logged under this member's credentials
                      </p>
                    </div>
                  ) : (
                    <div className="space-y-3 max-h-[480px] overflow-y-auto pr-1 custom-scrollbar">
                      {parcelsData.map((parcel: any) => (
                        <div
                          key={parcel.id}
                          className="p-4 bg-white border border-slate-100 rounded-xl shadow-sm flex items-center justify-between gap-4"
                        >
                          <div className="flex flex-col text-left">
                            <div className="flex items-center gap-2">
                              <span className="text-xs font-black text-slate-900 tracking-tight">
                                {parcel.trackingNumber}
                              </span>
                              <ParcelStatusBadge status={parcel.status} />
                            </div>
                            <div className="flex items-center gap-1.5 mt-2.5 text-[10.5px] font-semibold text-slate-500">
                              <span className="truncate max-w-[120px]">
                                {parcel.origin?.name ||
                                  parcel.fromAddress ||
                                  "Hub"}
                              </span>
                              <span className="text-slate-300">➔</span>
                              <span className="truncate max-w-[120px]">
                                {parcel.destination?.name ||
                                  parcel.toAddress ||
                                  "Station"}
                              </span>
                            </div>
                          </div>
                          <div className="flex flex-col items-end shrink-0">
                            <span className="text-[10.5px] font-black text-slate-700">
                              {format(
                                new Date(parcel.createdAt),
                                "MMM dd, yyyy",
                              )}
                            </span>
                            <span className="text-[8px] font-black text-slate-400 uppercase tracking-widest mt-1">
                              Log Date
                            </span>
                          </div>
                        </div>
                      ))}
                    </div>
                  )}
                </div>
              )}
            </div>
          ) : (
            <div className="flex-1 flex items-center justify-center text-slate-400 font-bold uppercase tracking-widest text-xs">
              Staff records unavailable
            </div>
          )}
        </div>
        {alertModal && alertModal.isOpen && (
          <div className="absolute inset-0 bg-slate-950/40 backdrop-blur-sm z-50 flex items-center justify-center p-6 animate-in fade-in duration-200">
            <div className="bg-white rounded-2xl border border-slate-100 p-6 shadow-2xl w-full max-w-[340px] flex flex-col items-center text-center space-y-4 animate-in zoom-in-95 duration-200">
              <div
                className={cn(
                  "w-12 h-12 rounded-full flex items-center justify-center shrink-0 shadow-sm",
                  alertModal.type === "success"
                    ? "bg-emerald-50 text-emerald-600 border border-emerald-100"
                    : "bg-rose-50 text-rose-600 border border-rose-100",
                )}
              >
                {alertModal.type === "success" ? (
                  <BadgeCheck size={24} strokeWidth={2.5} />
                ) : (
                  <X size={24} strokeWidth={2.5} />
                )}
              </div>
              <div className="space-y-1.5">
                <h4 className="text-[13px] font-black uppercase tracking-wider text-slate-900 leading-tight">
                  {alertModal.title}
                </h4>
                <p className="text-[10.5px] font-bold text-slate-400 leading-normal text-center">
                  {alertModal.message}
                </p>
              </div>
              <Button
                type="button"
                onClick={() => {
                  const wasSuccess = alertModal.type === "success" && alertModal.title === "Staff Removed";
                  setAlertModal(null);
                  if (wasSuccess) onClose();
                }}
                className={cn(
                  "w-full h-10 rounded-xl text-[9px] font-black uppercase tracking-[0.2em] transition-all",
                  alertModal.type === "success"
                    ? "bg-emerald-600 hover:bg-emerald-700 text-white"
                    : "bg-slate-900 hover:bg-slate-800 text-white",
                )}
              >
                {alertModal.type === "success" && alertModal.title === "Staff Removed" ? "Close" : "Continue"}
              </Button>
            </div>
          </div>
        )}

        {/* Delete Confirm Dialog */}
        {confirmDelete && (
          <div className="absolute inset-0 bg-slate-950/40 backdrop-blur-sm z-50 flex items-center justify-center p-6 animate-in fade-in duration-200">
            <div className="bg-white rounded-2xl border border-slate-100 p-6 shadow-2xl w-full max-w-[340px] flex flex-col items-center text-center space-y-4 animate-in zoom-in-95 duration-200">
              <div className="w-12 h-12 rounded-full bg-rose-50 text-rose-600 border border-rose-100 flex items-center justify-center shrink-0">
                <AlertTriangle size={22} strokeWidth={2.5} />
              </div>
              <div className="space-y-1.5">
                <h4 className="text-[13px] font-black uppercase tracking-wider text-slate-900 leading-tight">
                  Confirm Deletion
                </h4>
                <p className="text-[10.5px] font-bold text-slate-400 leading-normal">
                  You are about to permanently remove{" "}
                  <span className="text-slate-700">{staff?.name}</span> from the
                  system. This action cannot be undone.
                </p>
              </div>
              <div className="flex gap-3 w-full">
                <Button
                  type="button"
                  onClick={() => setConfirmDelete(false)}
                  className="flex-1 h-10 rounded-xl bg-slate-100 hover:bg-slate-200 text-slate-700 text-[9px] font-black uppercase tracking-[0.2em] transition-all"
                >
                  Cancel
                </Button>
                <Button
                  type="button"
                  onClick={handleDeleteStaff}
                  className="flex-1 h-10 rounded-xl bg-rose-600 hover:bg-rose-700 text-white text-[9px] font-black uppercase tracking-[0.2em] transition-all"
                >
                  Delete
                </Button>
              </div>
            </div>
          </div>
        )}
      </SheetContent>
    </Sheet>
  );
}

// Sub-components

function DetailRow({
  icon,
  label,
  value,
  isBadge = false,
}: {
  icon: React.ReactNode;
  label: string;
  value: string;
  isBadge?: boolean;
}) {
  return (
    <div className="flex items-center justify-between py-1.5 first:pt-0 last:pb-0">
      <div className="flex items-center gap-3.5">
        {icon}
        <span className="text-xs font-bold text-slate-400 uppercase tracking-wider">
          {label}
        </span>
      </div>
      {isBadge ? (
        <span
          className={cn(
            "text-[9px] font-extrabold px-2 py-0.5 rounded-md uppercase tracking-wider",
            value === "ADMIN"
              ? "bg-blue-100 text-blue-700"
              : value === "STATION_MASTER"
                ? "bg-amber-100 text-amber-700"
                : value === "CLERK"
                  ? "bg-emerald-100 text-emerald-700"
                  : value === "TRAIN_GUARD"
                    ? "bg-cyan-100 text-cyan-700"
                    : "bg-slate-100 text-slate-700",
          )}
        >
          {value.replace("_", " ")}
        </span>
      ) : (
        <span className="text-xs font-black text-slate-700 uppercase tracking-tight truncate max-w-[240px]">
          {value}
        </span>
      )}
    </div>
  );
}

function StatBox({
  icon,
  bg,
  label,
  value,
}: {
  icon: React.ReactNode;
  bg: string;
  label: string;
  value: number;
}) {
  const colorName = bg.replace("bg-", "").replace("-50", "");
  
  const [counted, setCounted] = useState(0);
  useEffect(() => {
    if (!value) {
      setCounted(0);
      return;
    }
    const steps = 30;
    const increment = value / steps;
    let current = 0;
    const timer = setInterval(() => {
      current += increment;
      if (current >= value) {
        setCounted(value);
        clearInterval(timer);
      } else {
        setCounted(Math.floor(current));
      }
    }, 800 / steps);
    return () => clearInterval(timer);
  }, [value]);

  const colorMap: Record<string, { border: string; bg: string; text: string; bar: string }> = {
    emerald: {
      border: "border-emerald-100/80",
      bg: "bg-emerald-50/50",
      text: "text-emerald-600",
      bar: "bg-emerald-500",
    },
    blue: {
      border: "border-blue-100/80",
      bg: "bg-blue-50/50",
      text: "text-blue-600",
      bar: "bg-blue-500",
    },
    indigo: {
      border: "border-indigo-100/80",
      bg: "bg-indigo-50/50",
      text: "text-indigo-600",
      bar: "bg-indigo-500",
    },
    cyan: {
      border: "border-cyan-100/80",
      bg: "bg-cyan-50/50",
      text: "text-cyan-600",
      bar: "bg-cyan-500",
    },
    rose: {
      border: "border-rose-100/80",
      bg: "bg-rose-50/50",
      text: "text-rose-600",
      bar: "bg-rose-500",
    },
    amber: {
      border: "border-amber-100/80",
      bg: "bg-amber-50/50",
      text: "text-amber-600",
      bar: "bg-amber-500",
    },
  };

  const scheme = colorMap[colorName] || {
    border: "border-slate-100",
    bg: "bg-slate-50",
    text: "text-slate-600",
    bar: "bg-slate-500",
  };

  return (
    <div className="group relative flex items-center gap-4 p-4 border border-slate-100 rounded-xl bg-white transition-all duration-300 hover:shadow-md hover:border-slate-200 overflow-hidden">
      <div className={cn("p-2.5 rounded-xl shrink-0 transition-transform duration-300 group-hover:scale-110 shadow-sm", bg)}>
        {icon}
      </div>

      <div className="flex flex-col min-w-0 flex-1">
        <div className="flex items-center justify-between gap-2">
          <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest leading-none truncate">
            {label}
          </span>
          <span className={cn(
            "text-[8px] font-extrabold uppercase tracking-wider px-1.5 py-0.5 rounded border",
            scheme.bg,
            scheme.border,
            scheme.text
          )}>
            Activity
          </span>
        </div>
        <span className={cn("text-2xl font-black mt-1.5 leading-none tabular-nums", scheme.text)}>
          {counted.toLocaleString()}
        </span>
      </div>

      <div className={cn("absolute left-0 top-0 bottom-0 w-[3px] transition-all duration-300", scheme.bar)} />
    </div>
  );
}
