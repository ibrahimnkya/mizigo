"use client";

import { useQuery } from "@tanstack/react-query";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetClose,
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
  Train,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { ParcelDetailSheet } from "@/components/parcel/parcel-detail-sheet";
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
        "text-[8px] font-semibold px-1.5 py-0.5 rounded-md border uppercase tracking-wider shrink-0",
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
  const [openParcel, setOpenParcel] = useState<any | null>(null);
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
  const [editWagonId, setEditWagonId] = useState("");
  const [saving, setSaving] = useState(false);
  const [stations, setStations] = useState<any[]>([]);
  const [vehicles, setVehicles] = useState<any[]>([]);

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
      setEditWagonId(staff.wagonId || "");
    }
  }, [staffId, staff]);

  useEffect(() => {
    api
      .get("/stations")
      .then(({ data }) => setStations(data.data || data || []))
      .catch(console.error);
    api
      .get("/fleet")
      .then(({ data }) => setVehicles(data.data || data || []))
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
            wagonId: editWagonId || null,
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

  const ROLE_LABELS: Record<string, string> = {
    SUPER_ADMIN: "Super admin",
    ADMIN: "Admin",
    ORG_ADMIN: "Admin",
    STATION_MASTER: "Station master",
    CLERK: "Clerk",
    TRAIN_GUARD: "Train guard",
    AGENT: "Agent",
  };
  const roleName: string = staff?.role?.name ?? "";
  const isAdminRole = ["ADMIN", "SUPER_ADMIN"].includes(roleName);
  const handled = staff?.stats?.totalHandled ?? 0;
  const inputCls =
    "h-12 w-full rounded-2xl border border-[#E2E2E2] bg-white px-4 text-[14px] text-[#1C1C1E] outline-none transition focus:border-orange-500 focus:ring-4 focus:ring-orange-500/10";

  const Row = ({ icon: Icon, label, value }: { icon: React.ElementType; label: string; value?: React.ReactNode }) => (
    <div className="flex items-center gap-3 py-3">
      <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-xl bg-orange-50">
        <Icon size={16} className="text-orange-500" />
      </span>
      <span className="flex-1 text-[14px] text-slate-500">{label}</span>
      <span className="text-right text-[14px] font-medium text-[#1C1C1E]">{value || "—"}</span>
    </div>
  );

  return (
    <Sheet open={!!staffId} onOpenChange={(open) => !open && onClose()}>
      <SheetContent className="flex w-full flex-col gap-0 overflow-hidden border-0 bg-[#F3F3F3] p-0 sm:max-w-[500px] [&>button:last-child]:hidden">
        {/* Header */}
        <div className="bridge-card shrink-0 rounded-none px-6 pb-6 pt-7">
          <div className="flex items-start justify-between gap-3">
            <div className="flex min-w-0 items-center gap-4">
              <span className="flex h-14 w-14 shrink-0 items-center justify-center rounded-full bg-white/15 text-[22px] font-semibold text-white">
                {(staff?.name || "?").charAt(0).toUpperCase()}
              </span>
              <div className="min-w-0">
                <SheetTitle className="truncate text-[20px] font-semibold text-white">
                  {isLoading ? "Loading…" : staff?.name}
                </SheetTitle>
                <SheetDescription className="truncate text-[13px] text-white/70">
                  {isLoading ? "" : [ROLE_LABELS[roleName] ?? roleName, staff?.station?.name].filter(Boolean).join(" · ")}
                </SheetDescription>
              </div>
            </div>
            <div className="flex shrink-0 items-center gap-2">
              {!isLoading && staff && (
                <button
                  type="button"
                  onClick={() => setIsEditing(!isEditing)}
                  aria-label={isEditing ? "Stop editing" : "Edit staff"}
                  className={cn(
                    "flex h-10 w-10 items-center justify-center rounded-full transition",
                    isEditing ? "bg-orange-500 text-white" : "bg-white/15 text-white hover:bg-white/25",
                  )}
                >
                  <Edit3 size={17} />
                </button>
              )}
              <SheetClose
                aria-label="Close"
                className="flex h-10 w-10 items-center justify-center rounded-full bg-white/15 text-white transition hover:bg-white/25 focus:outline-none focus-visible:ring-2 focus-visible:ring-white/60"
              >
                <X size={18} />
              </SheetClose>
            </div>
          </div>

          {!isLoading && staff && (
            <div className="mt-5 grid grid-cols-4 gap-2 text-white">
              {[
                { label: "Received", value: staff.stats?.created },
                { label: "Dispatched", value: staff.stats?.dispatched },
                { label: "Offloaded", value: staff.stats?.offloaded },
                { label: "Delivered", value: staff.stats?.delivered },
              ].map((m) => (
                <div key={m.label} className="rounded-2xl border border-white/15 bg-white/10 px-3 py-2.5 text-center">
                  <p className="text-[18px] font-semibold leading-tight tabular-nums">{(m.value || 0).toLocaleString("en-US")}</p>
                  <p className="text-[11px] text-white/60">{m.label}</p>
                </div>
              ))}
            </div>
          )}
        </div>

        {/* Tabs */}
        {!isLoading && staff && !isEditing && (
          <div className="shrink-0 px-5 pt-4">
            <div className="flex gap-1 rounded-full border border-[#E2E2E2] bg-white p-1">
              {(
                [
                  ["overview", "Profile"],
                  ["parcels", `Parcels handled (${handled})`],
                ] as const
              ).map(([key, label]) => (
                <button
                  key={key}
                  onClick={() => setActiveSubTab(key)}
                  className={cn(
                    "flex-1 rounded-full py-2 text-[13px] font-semibold transition",
                    activeSubTab === key ? "bg-orange-500 text-white" : "text-slate-500 hover:text-[#1C1C1E]",
                  )}
                >
                  {label}
                </button>
              ))}
            </div>
          </div>
        )}

        <div className="flex-1 overflow-y-auto p-5">
          {isLoading ? (
            <div className="flex h-full flex-col items-center justify-center gap-3 text-slate-400">
              <Loader2 className="h-7 w-7 animate-spin text-orange-500" />
              <span className="text-[14px]">Loading staff details…</span>
            </div>
          ) : !staff ? (
            <p className="py-16 text-center text-[14px] text-slate-400">Couldn&apos;t load this staff member.</p>
          ) : isEditing ? (
            /* ── Edit ── */
            <form onSubmit={handleSaveUser} className="flex flex-col gap-4">
              <section className="flex flex-col gap-4 rounded-[20px] border border-[#E2E2E2] bg-white p-5">
                <p className="text-[15px] font-semibold text-[#1C1C1E]">Edit details</p>
                <label className="flex flex-col gap-1.5">
                  <span className="text-[13px] font-medium text-slate-600">Full name</span>
                  <input value={editName} onChange={(e) => setEditName(e.target.value)} required className={inputCls} />
                </label>
                <label className="flex flex-col gap-1.5">
                  <span className="text-[13px] font-medium text-slate-600">Phone</span>
                  <input value={editPhone} onChange={(e) => setEditPhone(e.target.value)} className={inputCls} placeholder="e.g. 0712 345 678" />
                </label>
                {!isAdminRole && (
                  <>
                    <label className="flex flex-col gap-1.5">
                      <span className="text-[13px] font-medium text-slate-600">Station</span>
                      <select value={editStationId} onChange={(e) => setEditStationId(e.target.value)} className={cn(inputCls, "cursor-pointer")}>
                        <option value="">No station</option>
                        {stations.map((st: any) => (
                          <option key={st.id} value={st.id}>
                            {st.name}
                          </option>
                        ))}
                      </select>
                    </label>
                    {roleName === "TRAIN_GUARD" && (
                      <label className="flex flex-col gap-1.5">
                        <span className="text-[13px] font-medium text-slate-600">Wagon</span>
                        <select value={editWagonId} onChange={(e) => setEditWagonId(e.target.value)} className={cn(inputCls, "cursor-pointer")}>
                          <option value="">No wagon</option>
                          {vehicles.map((v: any) => (
                            <option key={v.id} value={v.id}>
                              {v.plateNumber}
                              {v.type ? ` · ${v.type}` : ""}
                            </option>
                          ))}
                        </select>
                      </label>
                    )}
                  </>
                )}
              </section>
              <div className="flex gap-2">
                <button
                  type="button"
                  onClick={() => setIsEditing(false)}
                  className="h-12 flex-1 rounded-full border border-[#E2E2E2] bg-white text-[14px] font-semibold text-[#5C0B19] transition hover:bg-[#FBF1F2]"
                >
                  Cancel
                </button>
                <button
                  type="submit"
                  disabled={saving}
                  className="flex h-12 flex-1 items-center justify-center gap-2 rounded-full bg-[#5C0B19] text-[14px] font-semibold text-white transition hover:bg-[#4F0A0C] disabled:opacity-60"
                >
                  {saving && <Loader2 size={16} className="animate-spin" />} Save changes
                </button>
              </div>
            </form>
          ) : activeSubTab === "overview" ? (
            /* ── Profile ── */
            <div className="flex flex-col gap-4">
              <section className="rounded-[20px] border border-[#E2E2E2] bg-white px-4 py-1">
                <div className="divide-y divide-slate-100">
                  <Row icon={Mail} label="Email" value={staff.email} />
                  <Row icon={Phone} label="Phone" value={staff.phone} />
                  <Row icon={Shield} label="Role" value={ROLE_LABELS[roleName] ?? roleName} />
                  <Row icon={Building2} label="Station" value={staff.station?.name ?? (isAdminRole ? "All stations" : null)} />
                  {roleName === "TRAIN_GUARD" && <Row icon={Train} label="Wagon" value={staff.wagon?.plateNumber} />}
                  <Row icon={Calendar} label="Joined" value={staff.createdAt ? format(new Date(staff.createdAt), "d MMM yyyy") : null} />
                </div>
              </section>

              <section className="rounded-[20px] border border-[#E2E2E2] bg-white p-5">
                <p className="text-[15px] font-semibold text-[#1C1C1E]">Access</p>
                <p className="mt-1 text-[13px] text-slate-500">
                  Send a new 6-digit access code by SMS if they can&apos;t sign in.
                </p>
                <button
                  type="button"
                  onClick={handleResendOtp}
                  disabled={sendingOtp}
                  className="mt-4 flex h-11 w-full items-center justify-center gap-2 rounded-full bg-[#5C0B19] text-[14px] font-semibold text-white transition hover:bg-[#4F0A0C] disabled:opacity-60"
                >
                  {sendingOtp ? <Loader2 size={16} className="animate-spin" /> : <Lock size={16} />} Send new access code
                </button>
              </section>

              <section className="rounded-[20px] border border-rose-100 bg-white p-5">
                <p className="text-[15px] font-semibold text-[#1C1C1E]">Remove staff member</p>
                <p className="mt-1 text-[13px] text-slate-500">
                  {handled > 0
                    ? `${staff.name} has handled ${handled} parcel${handled === 1 ? "" : "s"}, so they can't be removed. Disable the account instead.`
                    : "Only possible for staff who haven't handled any parcels."}
                </p>
                <button
                  type="button"
                  onClick={() => {
                    if (handled > 0) {
                      setAlertModal({
                        isOpen: true,
                        type: "error",
                        title: "Can't remove",
                        message: `${staff.name} has ${handled} parcel operation(s) on record. Disable the account instead.`,
                      });
                    } else {
                      setConfirmDelete(true);
                    }
                  }}
                  disabled={deleting || handled > 0}
                  className="mt-4 flex h-11 w-full items-center justify-center gap-2 rounded-full border border-rose-200 text-[14px] font-semibold text-rose-600 transition hover:bg-rose-50 disabled:cursor-not-allowed disabled:opacity-40"
                >
                  {deleting ? <Loader2 size={16} className="animate-spin" /> : <Trash2 size={16} />} Remove
                </button>
              </section>
            </div>
          ) : (
            /* ── Parcels handled ── */
            <section className="overflow-hidden rounded-[20px] border border-[#E2E2E2] bg-white">
              {loadingParcels ? (
                <div className="space-y-2 p-4">
                  {[1, 2, 3].map((n) => (
                    <div key={n} className="h-14 animate-pulse rounded-2xl bg-slate-100" />
                  ))}
                </div>
              ) : !parcelsData || parcelsData.length === 0 ? (
                <p className="px-6 py-12 text-center text-[14px] text-slate-400">No parcels handled yet.</p>
              ) : (
                <ul className="divide-y divide-slate-100">
                  {parcelsData.map((parcel: any) => (
                    <li key={parcel.id}>
                      <button
                        type="button"
                        onClick={() => setOpenParcel(parcel)}
                        className="flex w-full items-center gap-3 px-4 py-3 text-left transition hover:bg-orange-50/40"
                      >
                        <span className="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-orange-50">
                          <PackageCheck size={17} className="text-orange-500" />
                        </span>
                        <div className="min-w-0 flex-1">
                          <p className="truncate text-[14px] font-semibold tracking-wide text-[#1C1C1E]">{parcel.trackingNumber}</p>
                          <p className="truncate text-[12px] text-slate-500">
                            {parcel.origin?.name || parcel.fromAddress || "—"} → {parcel.destination?.name || parcel.toAddress || "—"}
                          </p>
                        </div>
                        <div className="shrink-0 text-right">
                          <ParcelStatusBadge status={parcel.status} />
                          <p className="mt-1 text-[11px] text-slate-400">
                            {parcel.createdAt ? format(new Date(parcel.createdAt), "d MMM yyyy") : ""}
                          </p>
                        </div>
                      </button>
                    </li>
                  ))}
                </ul>
              )}
            </section>
          )}
        </div>

        {/* Result message */}
        {alertModal && alertModal.isOpen && (
          <div className="absolute inset-0 z-50 flex items-center justify-center bg-black/30 p-6">
            <div className="flex w-full max-w-[340px] flex-col items-center rounded-[24px] bg-white p-6 text-center shadow-premium">
              <span
                className={cn(
                  "flex h-14 w-14 items-center justify-center rounded-full",
                  alertModal.type === "success" ? "bg-emerald-50 text-emerald-600" : "bg-rose-50 text-rose-600",
                )}
              >
                {alertModal.type === "success" ? <BadgeCheck size={26} /> : <AlertTriangle size={26} />}
              </span>
              <p className="mt-4 text-[17px] font-semibold text-[#1C1C1E]">{alertModal.title}</p>
              <p className="mt-1 text-[14px] text-slate-500">{alertModal.message}</p>
              <button
                type="button"
                onClick={() => {
                  const wasRemoved = alertModal.type === "success" && alertModal.title === "Staff Removed";
                  setAlertModal(null);
                  if (wasRemoved) onClose();
                }}
                className="mt-5 h-11 w-full rounded-full bg-[#5C0B19] text-[14px] font-semibold text-white transition hover:bg-[#4F0A0C]"
              >
                {alertModal.type === "success" && alertModal.title === "Staff Removed" ? "Close" : "OK"}
              </button>
            </div>
          </div>
        )}

        {/* Remove confirmation */}
        {confirmDelete && (
          <div className="absolute inset-0 z-50 flex items-center justify-center bg-black/30 p-6">
            <div className="flex w-full max-w-[340px] flex-col items-center rounded-[24px] bg-white p-6 text-center shadow-premium">
              <span className="flex h-14 w-14 items-center justify-center rounded-full bg-rose-50 text-rose-600">
                <AlertTriangle size={26} />
              </span>
              <p className="mt-4 text-[17px] font-semibold text-[#1C1C1E]">Remove {staff?.name}?</p>
              <p className="mt-1 text-[14px] text-slate-500">They&apos;ll lose access straight away. This can&apos;t be undone.</p>
              <div className="mt-5 flex w-full gap-2">
                <button
                  type="button"
                  onClick={() => setConfirmDelete(false)}
                  className="h-11 flex-1 rounded-full border border-[#E2E2E2] text-[14px] font-semibold text-slate-600 transition hover:bg-slate-50"
                >
                  Cancel
                </button>
                <button
                  type="button"
                  onClick={handleDeleteStaff}
                  disabled={deleting}
                  className="flex h-11 flex-1 items-center justify-center gap-2 rounded-full bg-rose-600 text-[14px] font-semibold text-white transition hover:bg-rose-700 disabled:opacity-60"
                >
                  {deleting && <Loader2 size={15} className="animate-spin" />} Remove
                </button>
              </div>
            </div>
          </div>
        )}
      </SheetContent>
      <ParcelDetailSheet parcel={openParcel} onClose={() => setOpenParcel(null)} />
    </Sheet>
  );
}
