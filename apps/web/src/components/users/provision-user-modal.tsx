"use client";

import { useState, useEffect } from "react";
import {
  Users,
  Plus,
  Loader2,
  Shield,
  Building2,
  Phone,
  Mail,
  CheckCircle2,
  MapPin,
  Train,
} from "lucide-react";
import { Button } from "@repo/ui/button";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetTitle,
  SheetTrigger,
  SheetFooter,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import { useOrganizations } from "@/modules/organizations/use-organizations";
import { useStations } from "@/modules/stations/use-stations";
import { cn } from "@/lib/utils";
import api from "@/lib/api/client";
import { EntitySelect } from "@/components/shared/entity-select";

interface ProvisionUserModalProps {
  onSuccess: () => void;
}

export function ProvisionUserModal({ onSuccess }: ProvisionUserModalProps) {
  const [open, setOpen] = useState(false);
  const [loading, setLoading] = useState(false);
  const [fetchingMetadata, setFetchingMetadata] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const [organizations, setOrganizations] = useState<any[]>([]);
  const [roles, setRoles] = useState<any[]>([]);
  const [stations, setStations] = useState<any[]>([]);
  const [vehicles, setVehicles] = useState<any[]>([]);

  // Form State
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState("");
  const [roleId, setRoleId] = useState("");
  const [organizationId, setOrganizationId] = useState("");
  const [stationId, setStationId] = useState("");
  const [wagonId, setWagonId] = useState("");

  const selectedRole = roles.find((r) => r.id === roleId)?.name;
  const isTrainGuard = selectedRole === "TRAIN_GUARD";

  useEffect(() => {
    if (open) {
      fetchMetadata();
    }
  }, [open]);

  const fetchMetadata = async () => {
    setFetchingMetadata(true);
    try {
      const [orgsRes, rolesRes, stationsRes, fleetRes] = await Promise.all([
        api.get("/organizations"),
        api.get("/roles"),
        api.get("/stations"),
        api.get("/fleet"),
      ]);
      setOrganizations(orgsRes.data.data || orgsRes.data || []);
      setRoles(rolesRes.data.data || rolesRes.data || []);
      setStations(stationsRes.data.data || stationsRes.data || []);
      setVehicles(fleetRes.data.data || fleetRes.data || []);
    } catch (err) {
      console.error("Failed to fetch provisioning metadata", err);
    } finally {
      setFetchingMetadata(false);
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError(null);

    try {
      const selectedRole = roles.find((r) => r.id === roleId)?.name;
      let endpoint = "/admins"; // Default for ADMIN/ORG_ADMIN

      const isOperatorRole = [
        "OPERATOR",
        "STATION_MASTER",
        "CLERK",
        "TRAIN_GUARD",
      ].includes(selectedRole);

      if (selectedRole === "SUPER_ADMIN") {
        endpoint = "/admins/super-admins";
      } else if (isOperatorRole) {
        endpoint = "/operators";
      }

      const payload = {
        name,
        email,
        phone,
        organizationId: organizationId || undefined,
        stationId: stationId || undefined,
        wagonId: isTrainGuard ? (wagonId || undefined) : undefined,
        roleId: roleId,
      };

      const response = await api.post(endpoint, payload);

      if (response.status === 201) {
        setOpen(false);
        resetForm();
        onSuccess();
      }
    } catch (err: any) {
      setError(
        err.response?.data?.error?.message ||
          err.message ||
          "Failed to provision user",
      );
    } finally {
      setLoading(false);
    }
  };

  const resetForm = () => {
    setName("");
    setEmail("");
    setPhone("");
    setRoleId("");
    setOrganizationId("");
    setStationId("");
    setWagonId("");
    setError(null);
  };

  return (
    <Sheet open={open} onOpenChange={setOpen}>
      <SheetTrigger asChild>
        <button className="h-12 px-6 bg-slate-900 border border-slate-800 hover:bg-slate-800 text-white rounded-[10px] font-black text-[11px] uppercase tracking-widest flex items-center gap-3 transition-all active:scale-95 group shadow-lg shadow-slate-900/10">
          <Plus
            className="w-4 h-4 group-hover:rotate-90 transition-transform duration-300"
            strokeWidth={3}
          />
          Provision User
        </button>
      </SheetTrigger>

      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 shadow-2xl flex flex-col rounded-2xl">
        {/* Header Section */}
        <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
          <div className="w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md">
            <Users className="w-6 h-6 text-white" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10 text-left">
            <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase">
              Provision User
            </SheetTitle>
            <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
              Grant platform access and workspace credentials
            </SheetDescription>
          </div>
        </div>

        <form
          id="provision-user-form"
          onSubmit={handleSubmit}
          className="p-8 space-y-10 flex-1 overflow-y-auto custom-scrollbar"
        >
          {error && (
            <div className="bg-rose-50 border border-rose-100 text-rose-600 text-[13px] font-bold p-4 rounded-[10px] flex items-center gap-3 animate-in fade-in slide-in-from-top-2">
              <div className="w-2 h-2 rounded-full bg-rose-500 shadow-[0_0_10px_rgba(244,63,94,0.5)]" />
              {error}
            </div>
          )}

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-8 gap-y-10">
            {/* Section 1: Identity */}
            <div className="sm:col-span-2 space-y-8">
              <div className="space-y-3">
                <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
                  Full Legal Name
                </Label>
                <div className="relative">
                  <Users className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-300" />
                  <Input
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    placeholder="Ibrahim Bakari"
                    className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] pl-12 text-[14px] font-bold transition-all"
                    required
                  />
                </div>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-8">
                <div className="space-y-3">
                  <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
                    Email Address
                  </Label>
                  <div className="relative">
                    <Mail className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-300" />
                    <Input
                      type="email"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      placeholder="ibrahim@mizigo.com"
                      className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] pl-12 text-[14px] font-bold transition-all"
                      required
                    />
                  </div>
                </div>

                <div className="space-y-3">
                  <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
                    Phone Number
                  </Label>
                  <div className="relative">
                    <Phone className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-300" />
                    <Input
                      type="tel"
                      value={phone}
                      onChange={(e) => setPhone(e.target.value)}
                      placeholder="255 7XX XXX XXX"
                      className="h-14 bg-slate-50 border-slate-100 focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-50 rounded-[10px] pl-12 text-[14px] font-bold transition-all"
                      required
                    />
                  </div>
                </div>
              </div>
            </div>

            {/* Section 2: Permissions */}
            <div className="sm:col-span-2 space-y-8 pt-4 border-t border-slate-100">
              <div className="space-y-3">
                <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
                  Assigned Platform Role
                </Label>
                <EntitySelect
                  label=""
                  icon={Shield}
                  placeholder="Select security role"
                  value={roleId}
                  onChange={setRoleId}
                  loading={fetchingMetadata}
                  options={roles.map((role) => ({
                    id: role.id,
                    name: role.name.replace(/_/g, " "),
                    description:
                      role.name === "SUPER_ADMIN"
                        ? "Global Platform Access"
                        : "Organization-level access",
                    icon: Shield,
                  }))}
                />
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-8">
                <div className="space-y-3">
                  <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
                    Primary Organization
                  </Label>
                  <EntitySelect
                    label=""
                    icon={Building2}
                    placeholder="Select organization"
                    value={organizationId}
                    onChange={setOrganizationId}
                    loading={fetchingMetadata}
                    options={organizations.map((org) => ({
                      id: org.id,
                      name: org.name,
                      description: `${org.commissionRate * 100}% Service Fee`,
                      icon: Building2,
                    }))}
                  />
                </div>

                <div className="space-y-3">
                  <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
                    Assigned Station
                  </Label>
                  <EntitySelect
                    label=""
                    icon={MapPin}
                    placeholder="Select station (Optional)"
                    value={stationId}
                    onChange={setStationId}
                    loading={fetchingMetadata}
                    options={stations
                      .filter(
                        (s) =>
                          !organizationId ||
                          s.organizationId === organizationId,
                      )
                      .map((station) => ({
                        id: station.id,
                        name: station.name,
                        description: station.code || "Facility",
                        icon: MapPin,
                      }))}
                  />
                </div>
              </div>

              {isTrainGuard && (
                <div className="space-y-3 sm:col-span-2 mt-6">
                  <Label className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
                    Assigned Train / Wagon (Train Guard Specialization)
                  </Label>
                  <EntitySelect
                    label=""
                    icon={Train}
                    placeholder="Select train/wagon (Optional)"
                    value={wagonId}
                    onChange={setWagonId}
                    loading={fetchingMetadata}
                    options={vehicles
                      .filter(
                        (v) =>
                          !organizationId ||
                          v.organizationId === organizationId,
                      )
                      .map((vehicle) => ({
                        id: vehicle.id,
                        name: vehicle.plateNumber,
                        description: vehicle.type || "Vehicle",
                        icon: Train,
                      }))}
                  />
                </div>
              )}
            </div>
          </div>

          {/* Security Protocol */}
          <div className="pt-8 border-t border-slate-100 flex items-center justify-between">
            <div className="flex flex-col gap-1">
              <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                Security Clearance
              </span>
              <p className="text-[10px] font-bold text-slate-400 leading-tight max-w-[320px]">
                Provisioning a new account sends an automated onboarding
                credential set.
              </p>
            </div>
            <div className="flex items-center gap-1.5 px-3 py-1.5 bg-blue-50 text-blue-600 rounded-lg border border-blue-100">
              <Shield size={12} strokeWidth={3} />
              <span className="text-[9px] font-black uppercase tracking-widest">
                Authorized Action
              </span>
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
            form="provision-user-form"
            disabled={loading || !name || !email || !roleId}
            className="flex-[1.5] h-14 rounded-xl bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 flex items-center justify-center gap-3 active:scale-[0.98]"
          >
            {loading ? (
              <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
            ) : (
              <>
                <CheckCircle2 className="w-5 h-5" strokeWidth={3} />
                Provision Account
              </>
            )}
          </button>
        </div>
      </SheetContent>
    </Sheet>
  );
}
