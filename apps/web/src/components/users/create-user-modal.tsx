"use client";

import { useState, useEffect, useCallback } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@repo/ui/button";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import {
  UserPlus,
  User,
  Mail,
  Phone,
  ShieldCheck,
  Building2,
  X,
  BadgeCheck,
  Contact2,
  KeyRound,
  Check,
  RefreshCw,
  Copy,
  Eye,
  EyeOff,
  CheckCheck,
  Loader2,
  ArrowLeft,
  ArrowRight,
  Train,
  Activity,
  Crown,
} from "lucide-react";
import { cn } from "@/lib/utils";
import api from "@/lib/api/client";

interface CreateUserModalProps {
  currentUserRole?: string;
}

// Permission definitions per role
const ROLE_PERMISSIONS: Record<string, { group: string; items: string[] }[]> = {
  SUPER_ADMIN: [
    {
      group: "Platform",
      items: [
        "Full platform access",
        "Manage all organizations",
        "System configuration",
        "Audit logs",
        "Revenue analytics",
      ],
    },
    {
      group: "Users",
      items: ["Create/delete any user", "Assign any role", "Reset credentials"],
    },
    {
      group: "Parcel",
      items: ["View all parcel", "Override any status", "Force approve/reject"],
    },
  ],
  ADMIN: [
    {
      group: "Organization",
      items: ["Manage org members", "View org reports", "Manage stations"],
    },
    { group: "Users", items: ["Create staff", "View team members"] },
    {
      group: "Parcel",
      items: ["Approve/reject parcel", "View org parcel", "Export reports"],
    },
  ],
  STATION_MASTER: [
    {
      group: "Station",
      items: [
        "Manage station cargo",
        "View station analytics",
        "Supervise clerks",
      ],
    },
    {
      group: "Parcel",
      items: ["Approve/reject parcel", "Dispatch wagons", "Offload wagons"],
    },
  ],
  CLERK: [
    {
      group: "Parcel",
      items: [
        "Receive parcel",
        "Check pricing",
        "Deliver to receiver",
        "Scan barcodes",
      ],
    },
  ],
  TRAIN_GUARD: [
    {
      group: "Transit",
      items: ["Inspect manifest", "Confirm wagon seal", "Report delays"],
    },
  ],
  OPERATOR: [
    {
      group: "Parcel",
      items: [
        "Receive parcel",
        "Send parcel",
        "Deliver parcel",
        "Track parcel",
      ],
    },
    {
      group: "Reports",
      items: ["View personal stats", "Generate shift reports"],
    },
  ],
};

function generateOTP(): string {
  return Math.floor(100000 + Math.random() * 900000).toString();
}

const ROLE_DETAILS: Record<string, { icon: any; title: string; desc: string }> =
  {
    SUPER_ADMIN: {
      icon: Crown,
      title: "Platform Admin",
      desc: "Full system administration, global analytics, and tenant management",
    },
    ADMIN: {
      icon: ShieldCheck,
      title: "Organization Admin",
      desc: "Manage branch operations, billing configuration, and staff accounts",
    },
    STATION_MASTER: {
      icon: Building2,
      title: "Station Master",
      desc: "Supervise station inventory, offload triggers, and cargo dispatching",
    },
    CLERK: {
      icon: User,
      title: "Clerk",
      desc: "Register incoming cargo, confirm receipts, and verify final deliveries",
    },
    TRAIN_GUARD: {
      icon: Train,
      title: "Train Guard",
      desc: "Inspect active manifests, verify wagon seals, and register delays",
    },
    OPERATOR: {
      icon: Activity,
      title: "Field Staff",
      desc: "General parcel transit operations, tracking updates, and barcode scanning",
    },
  };

export function CreateUserModal({ currentUserRole }: CreateUserModalProps) {
  const router = useRouter();
  const [open, setOpen] = useState(false);
  const [loading, setLoading] = useState(false);
  const [copied, setCopied] = useState(false);
  const isSuperAdmin = currentUserRole === "SUPER_ADMIN";
  const isAdmin = currentUserRole === "ADMIN";

  // Stepper State
  const [step, setStep] = useState<1 | 2 | 3>(1);
  const [validationErrors, setValidationErrors] = useState<
    Record<string, string>
  >({});
  const [checkingAvailability, setCheckingAvailability] = useState(false);
  const [alertModal, setAlertModal] = useState<{
    isOpen: boolean;
    type: "success" | "error";
    title: string;
    message: string;
  } | null>(null);

  // Form Field States
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [selectedRole, setSelectedRole] = useState(
    isAdmin ? "CLERK" : "ADMIN",
  );
  const [selectedOrganization, setSelectedOrganization] = useState<string>("");
  const [selectedStation, setSelectedStation] = useState<string>("");
  const [phoneNumber, setPhoneNumber] = useState<string>("");
  const [generatedOTP, setGeneratedOTP] = useState<string>("");
  const [showOTP, setShowOTP] = useState(false);
  const [rolesList, setRolesList] = useState<any[]>([]);
  const [selectedRoleId, setSelectedRoleId] = useState<string>("");

  const isAdminRole =
    selectedRole === "ADMIN" || selectedRole === "SUPER_ADMIN";
  const isOperatorRole = [
    "OPERATOR",
    "STATION_OPERATOR",
    "CLERK",
    "TRAIN_GUARD",
    "STATION_MASTER",
  ].includes(selectedRole);

  const [organizations, setOrganizations] = useState<any[]>([]);
  const [stations, setStations] = useState<any[]>([]);

  // Reset state when opening/closing
  useEffect(() => {
    if (open) {
      setGeneratedOTP(generateOTP());
      setShowOTP(false);
      setCopied(false);
      setStep(1);
      setName("");
      setEmail("");
      setPhoneNumber("");
      setSelectedRole(isAdmin ? "CLERK" : "ADMIN");
      setSelectedOrganization("");
      setSelectedStation("");
      setSelectedRoleId("");
      setValidationErrors({});
      setAlertModal(null);

      // Pre-fetch roles
      api
        .get("/roles")
        .then(({ data }) => setRolesList(data.data || data || []))
        .catch(console.error);
    }
  }, [open, isAdmin]);

  useEffect(() => {
    if (isSuperAdmin && open) {
      api
        .get("/organizations")
        .then(({ data }) => setOrganizations(data.data || data || []))
        .catch(console.error);
    }
  }, [isSuperAdmin, open]);

  useEffect(() => {
    if (!open) return;
    const fetchStations = async () => {
      try {
        const { data: res } = await api.get("/stations");
        let allStations = res.data || res || [];
        if (selectedOrganization) {
          allStations = allStations.filter(
            (s: any) => s.organizationId === selectedOrganization,
          );
        }
        setStations(allStations);
      } catch (error) {
        console.error(error);
      }
    };
    fetchStations();
  }, [selectedOrganization, open]);

  const handlePhoneChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    let val = e.target.value.replace(/\D/g, "");
    if (val.startsWith("0")) val = "255" + val.substring(1);
    else if (val.length > 0 && !val.startsWith("255")) val = "255" + val;
    setPhoneNumber(val);
    if (validationErrors.phone) {
      setValidationErrors((prev) => ({ ...prev, phone: "" }));
    }
  };

  const refreshOTP = () => {
    setGeneratedOTP(generateOTP());
    setCopied(false);
  };

  const copyOTP = async () => {
    await navigator.clipboard.writeText(generatedOTP);
    setCopied(true);
    setTimeout(() => setCopied(false), 2500);
  };

  const validateStep1 = () => {
    const errors: Record<string, string> = {};
    if (isOperatorRole && !selectedStation) {
      errors.station =
        "A branch station assignment is required for staff-level roles.";
    }
    setValidationErrors(errors);
    return Object.keys(errors).length === 0;
  };

  const validateStep2 = () => {
    const errors: Record<string, string> = {};
    if (!name.trim()) {
      errors.name = "Full name is required.";
    }
    if (!email.trim()) {
      errors.email = "Work email address is required.";
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      errors.email = "Please enter a valid email address.";
    }
    if (!phoneNumber) {
      errors.phone = "Phone number is required.";
    } else if (!phoneNumber.startsWith("255") || phoneNumber.length < 12) {
      errors.phone =
        "Phone number must start with 255 and be at least 12 digits.";
    }
    setValidationErrors(errors);
    return Object.keys(errors).length === 0;
  };

  const handleNextToStep2 = () => {
    if (validateStep1()) {
      setStep(2);
    }
  };

  const handleNextToStep3 = async () => {
    if (!validateStep2()) return;

    setCheckingAvailability(true);
    try {
      const params = new URLSearchParams();
      if (email) params.set("email", email);
      if (phoneNumber) params.set("phone", phoneNumber);
      const { data } = await api.get(`/users/check-availability?${params}`);
      const { emailExists, phoneExists } = data.data ?? data;

      const dupeErrors: Record<string, string> = {};
      if (emailExists) dupeErrors.email = "This email address is already in use. Please use a different one.";
      if (phoneExists) dupeErrors.phone = "This phone number is already registered. Please use a different one.";

      if (Object.keys(dupeErrors).length > 0) {
        setValidationErrors(dupeErrors);
        return;
      }

      setStep(3);
    } catch (err) {
      console.error("Availability check failed", err);
      // Don't block the user if the check fails — just advance
      setStep(3);
    } finally {
      setCheckingAvailability(false);
    }
  };

  async function onSubmit(event: React.FormEvent<HTMLFormElement>) {
    event.preventDefault();
    if (step !== 3) return;

    setLoading(true);

    try {
      let response;
      if (selectedRole === "SUPER_ADMIN") {
        response = await api.post("/admins/super-admins", {
          name,
          email,
          phone: phoneNumber,
          initialOtp: generatedOTP,
        });
      } else if (selectedRole === "ADMIN") {
        response = await api.post("/admins", {
          name,
          email,
          phone: phoneNumber,
          organizationId: selectedOrganization || undefined,
          roleId: selectedRoleId || undefined,
          initialOtp: generatedOTP,
        });
      } else if (isOperatorRole) {
        response = await api.post("/operators", {
          name,
          email,
          phone: phoneNumber,
          role: selectedRole,
          organizationId: selectedOrganization || undefined,
          stationId: selectedStation || undefined,
          initialOtp: generatedOTP,
        });
      }

      if (!response || ![200, 201].includes(response.status)) {
        throw new Error(
          "Failed to create user. Please check your permissions and try again.",
        );
      }

      setAlertModal({
        isOpen: true,
        type: "success",
        title: "Account Created",
        message: `Staff member ${name} has been successfully provisioned. Login OTP has been dispatched.`,
      });
      router.refresh();
    } catch (error: any) {
      console.error(error);
      setAlertModal({
        isOpen: true,
        type: "error",
        title: "Provisioning Failed",
        message:
          error.response?.data?.error?.message ||
          error.message ||
          "Failed to create user",
      });
    } finally {
      setLoading(false);
    }
  }

  const availableRoles = isSuperAdmin
    ? ["SUPER_ADMIN", "ADMIN", "STATION_MASTER", "CLERK", "TRAIN_GUARD"]
    : isAdmin
      ? ["ADMIN", "STATION_MASTER", "CLERK", "TRAIN_GUARD"]
      : ["STATION_MASTER", "CLERK", "TRAIN_GUARD"];

  const roleColors: Record<string, string> = {
    SUPER_ADMIN: "bg-violet-500 text-violet-100 border-violet-600",
    ADMIN: "bg-blue-600 text-blue-100 border-blue-700",
    STATION_MASTER: "bg-amber-600 text-amber-100 border-amber-700",
    CLERK: "bg-emerald-600 text-emerald-100 border-emerald-700",
    TRAIN_GUARD: "bg-cyan-600 text-cyan-100 border-cyan-700",
    OPERATOR: "bg-teal-600 text-teal-100 border-teal-700",
  };

  return (
    <Sheet open={open} onOpenChange={setOpen}>
      <SheetTrigger asChild>
        <Button className="h-11 px-6 rounded-[10px] bg-slate-900 hover:bg-slate-800 text-white transition-all font-bold flex items-center gap-2.5 active:scale-95 group">
          <div className="bg-white/20 p-1 rounded-[10px] group-hover:rotate-12 transition-transform">
            <UserPlus size={16} strokeWidth={2.5} />
          </div>
          <span>Add Member</span>
        </Button>
      </SheetTrigger>

      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden bg-white border border-slate-100 rounded-l-2xl shadow-2xl">
        <div className="flex flex-col max-h-[100vh] overflow-hidden h-full">
          {/* Header Section */}
          <div className="bg-slate-900 px-6 py-6 flex items-center gap-4 shrink-0 relative overflow-hidden">
            <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
            <div
              className={cn(
                "w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md text-white",
              )}
            >
              <UserPlus size={20} strokeWidth={2.5} />
            </div>
            <div className="flex flex-col relative z-10 text-left">
              <SheetTitle className="text-[15px] font-black text-white tracking-tight leading-tight uppercase">
                New Staff Member
              </SheetTitle>
              <SheetDescription className="text-white/40 text-[9px] font-bold uppercase tracking-[0.2em] mt-0.5">
                Establish credentials and permissions
              </SheetDescription>
            </div>
          </div>

          {/* Step Progress Bar Indicator */}
          <div className="flex items-center justify-between px-6 py-3.5 bg-slate-50 border-b border-slate-100 shrink-0">
            <div className="flex items-center justify-between w-full">
              {[
                { num: 1, label: "Role & Scope" },
                { num: 2, label: "Details" },
                { num: 3, label: "Confirm" },
              ].map((s, idx) => (
                <div key={s.num} className="flex items-center gap-1.5">
                  <div className="flex items-center gap-1.5">
                    <div
                      className={cn(
                        "w-5 h-5 rounded-full flex items-center justify-center text-[9px] font-black transition-all duration-300",
                        step === s.num
                          ? "bg-slate-900 text-white shadow-lg shadow-slate-900/10 scale-105"
                          : step > s.num
                            ? "bg-emerald-500 text-white"
                            : "bg-slate-200 text-slate-400",
                      )}
                    >
                      {step > s.num ? (
                        <Check size={10} strokeWidth={3} />
                      ) : (
                        s.num
                      )}
                    </div>
                    <span
                      className={cn(
                        "text-[8.5px] font-black uppercase tracking-wider transition-all",
                        step === s.num ? "text-slate-900" : "text-slate-400",
                      )}
                    >
                      {s.label}
                    </span>
                  </div>
                  {idx < 2 && <div className="h-px w-3 bg-slate-200 ml-1.5" />}
                </div>
              ))}
            </div>
          </div>

          <form
            onSubmit={onSubmit}
            className="flex-1 overflow-hidden bg-white flex flex-col justify-between h-full"
          >
            {/* Scrollable Content Area */}
            <div className="p-6 flex-1 overflow-y-auto custom-scrollbar space-y-6">
              {/* STEP 1: ROLE & SCOPE */}
              {step === 1 && (
                <div className="space-y-6 animate-in fade-in duration-300">
                  <SectionBlock
                    icon={<Contact2 size={15} strokeWidth={2.5} />}
                    color="bg-blue-50 text-blue-600"
                    title="Role Selection"
                    desc="Choose the member access tier in the workspace network."
                  >
                    <div className="space-y-2.5 text-left">
                      <Label className="field-label">System Role</Label>
                      <SelectInput
                        value={selectedRole}
                        onChange={(e) => {
                          setSelectedRole(e.target.value);
                          setValidationErrors((prev) => ({
                            ...prev,
                            station: "",
                          }));
                        }}
                      >
                        {availableRoles.map((role) => {
                          const details = ROLE_DETAILS[role] || {
                            title: role.replace("_", " "),
                          };
                          return (
                            <option key={role} value={role}>
                              {details.title}
                            </option>
                          );
                        })}
                      </SelectInput>

                      {selectedRole && (
                        <div className="mt-3 p-3.5 bg-slate-50 border border-slate-100 rounded-xl flex items-start gap-3 animate-in fade-in duration-200">
                          <div className="w-8 h-8 rounded-lg bg-blue-50 text-blue-600 flex items-center justify-center shrink-0 border border-blue-100">
                            <ShieldCheck size={16} strokeWidth={2.5} />
                          </div>
                          <div className="flex flex-col text-left">
                            <span className="text-[10px] font-black text-slate-800 uppercase tracking-wider">
                              Access Scope Description
                            </span>
                            <span className="text-[9.5px] font-bold text-slate-400 mt-0.5 leading-normal">
                              {ROLE_DETAILS[selectedRole]?.desc ||
                                "Access tier definition"}
                            </span>
                          </div>
                        </div>
                      )}
                    </div>
                  </SectionBlock>

                  <Divider />

                  <SectionBlock
                    icon={<Building2 size={15} strokeWidth={2.5} />}
                    color="bg-emerald-50 text-emerald-600"
                    title="Workspace Assignment"
                    desc="Place the member inside the branch network scope."
                  >
                    <div className="space-y-4">
                      {isSuperAdmin && (
                        <div className="space-y-2">
                          <Label className="field-label">
                            Parent Organization
                          </Label>
                          <SelectInput
                            value={selectedOrganization}
                            onChange={(e) =>
                              setSelectedOrganization(e.target.value)
                            }
                          >
                            <option value="">Platform Global Management</option>
                            {organizations.map((org) => (
                              <option key={org.id} value={org.id}>
                                {org.name}
                              </option>
                            ))}
                          </SelectInput>
                        </div>
                      )}

                      <div className="space-y-2 text-left">
                        <Label className="field-label">
                          Branch Station{" "}
                          {isOperatorRole && (
                            <span className="text-rose-500">*</span>
                          )}
                        </Label>

                        <SelectInput
                          value={selectedStation}
                          onChange={(e) => {
                            setSelectedStation(e.target.value);
                            setValidationErrors((prev) => ({
                              ...prev,
                              station: "",
                            }));
                          }}
                        >
                          {isOperatorRole ? (
                            <>
                              <option value="">
                                Select a Branch Station...
                              </option>
                              {stations.map((station) => (
                                <option key={station.id} value={station.id}>
                                  {station.name} ({station.code})
                                </option>
                              ))}
                            </>
                          ) : (
                            <option value="">
                              Global Station Access (All Stations)
                            </option>
                          )}
                        </SelectInput>

                        {validationErrors.station && (
                          <p className="text-[10px] font-bold text-rose-500 mt-1">
                            {validationErrors.station}
                          </p>
                        )}
                      </div>
                    </div>
                  </SectionBlock>

                  {selectedRole === "ADMIN" && rolesList.length > 0 && (
                    <>
                      <Divider />
                      <SectionBlock
                        icon={<ShieldCheck size={15} strokeWidth={2.5} />}
                        color="bg-violet-50 text-violet-600"
                        title="Permission Group"
                        desc="Optionally select a custom access control template."
                      >
                        <div className="space-y-2 text-left">
                          <Label className="field-label">
                            Custom Role Group (Optional)
                          </Label>
                          <SelectInput
                            value={selectedRoleId}
                            onChange={(e) => setSelectedRoleId(e.target.value)}
                          >
                            <option value="">
                              Default Admin Configuration
                            </option>
                            {rolesList.map((role) => (
                              <option key={role.id} value={role.id}>
                                {role.name.replace(/_/g, " ")}
                              </option>
                            ))}
                          </SelectInput>
                        </div>
                      </SectionBlock>
                    </>
                  )}
                </div>
              )}

              {/* STEP 2: MEMBER DETAILS */}
              {step === 2 && (
                <div className="space-y-6 animate-in fade-in duration-300">
                  <SectionBlock
                    icon={<User size={15} strokeWidth={2.5} />}
                    color="bg-blue-50 text-blue-600"
                    title="Member Details"
                    desc="Enter full name and working contact credentials."
                  >
                    <div className="space-y-4">
                      {/* Full Name */}
                      <div className="space-y-2 text-left">
                        <Label className="field-label">Full Name</Label>
                        <div className="relative group">
                          <span className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-blue-500 transition-colors">
                            <User size={16} />
                          </span>
                          <Input
                            name="name"
                            value={name}
                            onChange={(e) => {
                              setName(e.target.value);
                              setValidationErrors((prev) => ({
                                ...prev,
                                name: "",
                              }));
                            }}
                            placeholder="e.g. Ibrahim Bakari"
                            required
                            className="h-12 pl-11 rounded-[10px] border-slate-200 bg-slate-50 focus-visible:bg-white focus-visible:ring-2 focus-visible:ring-blue-500/20 focus-visible:border-blue-500 transition-all font-bold text-[14px]"
                          />
                        </div>
                        {validationErrors.name && (
                          <p className="text-[10px] font-bold text-rose-500 mt-1">
                            {validationErrors.name}
                          </p>
                        )}
                      </div>

                      {/* Email */}
                      <div className="space-y-2 text-left">
                        <Label className="field-label">
                          Work Email Address
                        </Label>
                        <div className="relative group">
                          <span className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-blue-500 transition-colors">
                            <Mail size={16} />
                          </span>
                          <Input
                            name="email"
                            type="email"
                            value={email}
                            onChange={(e) => {
                              setEmail(e.target.value);
                              setValidationErrors((prev) => ({
                                ...prev,
                                email: "",
                              }));
                            }}
                            placeholder="bakari@mizigo.co.tz"
                            required
                            className="h-12 pl-11 rounded-[10px] border-slate-200 bg-slate-50 focus-visible:bg-white focus-visible:ring-2 focus-visible:ring-blue-500/20 focus-visible:border-blue-500 transition-all font-bold text-[14px]"
                          />
                        </div>
                        {validationErrors.email && (
                          <p className="text-[10px] font-bold text-rose-500 mt-1">
                            {validationErrors.email}
                          </p>
                        )}
                      </div>

                      {/* Phone */}
                      <div className="space-y-2 text-left">
                        <Label className="field-label">
                          Phone Number (SMS Dispatch)
                        </Label>
                        <div className="relative group">
                          <span className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-blue-500 transition-colors">
                            <Phone size={16} />
                          </span>
                          <Input
                            name="phone"
                            type="tel"
                            value={phoneNumber}
                            onChange={handlePhoneChange}
                            placeholder="255 7XX XXX XXX"
                            required
                            className="h-12 pl-11 rounded-[10px] border-slate-200 bg-slate-50 focus-visible:bg-white focus-visible:ring-2 focus-visible:ring-blue-500/20 focus-visible:border-blue-500 transition-all font-bold text-[14px]"
                          />
                        </div>
                        {validationErrors.phone && (
                          <p className="text-[10px] font-bold text-rose-500 mt-1">
                            {validationErrors.phone}
                          </p>
                        )}
                        <p className="text-[10px] text-slate-400 font-bold uppercase tracking-widest pl-1 leading-normal">
                          This phone number will receive the onboarding
                          credential PIN code immediately.
                        </p>
                      </div>
                    </div>
                  </SectionBlock>
                </div>
              )}

              {/* STEP 3: REVIEW & CONFIRM */}
              {step === 3 && (
                <div className="space-y-6 animate-in fade-in duration-300">
                  <SectionBlock
                    icon={<BadgeCheck size={15} strokeWidth={2.5} />}
                    color="bg-emerald-50 text-emerald-600"
                    title="Review Details"
                    desc="Verify the member configuration details before generating credentials."
                  >
                    <div className="space-y-4">
                      {/* Summary Card */}
                      <div className="bg-slate-900 text-white rounded-[12px] p-5 shadow-xl relative overflow-hidden flex flex-col justify-between min-h-[140px] text-left">
                        <div className="absolute top-[-50px] right-[-50px] w-36 h-36 bg-white/5 rounded-full blur-[30px] pointer-events-none" />

                        <div>
                          <span
                            className={cn(
                              "text-[8px] font-black uppercase px-2 py-0.5 rounded-[4px] w-fit tracking-widest border",
                              roleColors[selectedRole] ||
                                "bg-slate-800 text-slate-300 border-slate-700",
                            )}
                          >
                            {selectedRole.replace("_", " ")}
                          </span>
                          <h4 className="text-[16px] font-black tracking-tight mt-3 uppercase leading-none">
                            {name}
                          </h4>
                          <p className="text-slate-400 text-[11px] font-bold tracking-tight mt-1.5 opacity-80">
                            {email}
                          </p>
                          <p className="text-slate-400 text-[10px] font-black tracking-widest mt-0.5 uppercase">
                            {phoneNumber}
                          </p>
                        </div>

                        <div className="border-t border-white/10 pt-3 mt-3 flex items-center justify-between">
                          <span className="text-[8px] font-black text-slate-500 uppercase tracking-widest">
                            Branch Access
                          </span>
                          <span className="text-[10px] font-black uppercase text-blue-400">
                            {stations.find((s) => s.id === selectedStation)
                              ?.name || "ALL STATIONS ACCESS"}
                          </span>
                        </div>
                      </div>

                      {/* Security OTP Card */}
                      <div className="bg-slate-50 border border-slate-100 rounded-[12px] p-5 flex flex-col justify-between text-left">
                        <div>
                          <h5 className="text-[10px] font-black uppercase tracking-widest text-slate-400">
                            Temporary Pin (OTP)
                          </h5>
                          <p className="text-[10px] font-semibold text-slate-500 mt-1 leading-normal">
                            This code is generated automatically. The user will
                            be required to change it on their first login.
                          </p>

                          {/* OTP Block */}
                          <div className="flex items-center gap-2 mt-3">
                            <div className="relative flex-1">
                              <span className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400">
                                <KeyRound size={15} />
                              </span>
                              <input
                                type="text"
                                readOnly
                                value={showOTP ? generatedOTP : "••••••"}
                                className="w-full h-11 pl-10 pr-10 rounded-[10px] border border-slate-200 bg-white font-black text-[14px] tracking-[0.3em] text-slate-900 cursor-default select-none focus:outline-none"
                              />
                              <button
                                type="button"
                                onClick={() => setShowOTP((v) => !v)}
                                className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-700 transition-colors p-1"
                              >
                                {showOTP ? (
                                  <EyeOff size={14} />
                                ) : (
                                  <Eye size={14} />
                                )}
                              </button>
                            </div>
                            <button
                              type="button"
                              onClick={copyOTP}
                              className={cn(
                                "w-11 h-11 flex items-center justify-center rounded-[10px] border transition-all shrink-0",
                                copied
                                  ? "bg-emerald-50 border-emerald-200 text-emerald-600"
                                  : "bg-white border-slate-200 text-slate-400 hover:text-blue-600 hover:border-blue-200",
                              )}
                            >
                              {copied ? (
                                <CheckCheck size={15} />
                              ) : (
                                <Copy size={15} />
                              )}
                            </button>
                            <button
                              type="button"
                              onClick={refreshOTP}
                              className="w-11 h-11 flex items-center justify-center rounded-[10px] border border-slate-200 bg-white text-slate-400 hover:text-blue-600 hover:border-blue-200 transition-all shrink-0"
                            >
                              <RefreshCw size={14} />
                            </button>
                          </div>
                        </div>

                        <span className="text-[9px] font-bold text-slate-400 mt-2 pl-1 leading-normal">
                          Copy the OTP now to share manually if needed.
                        </span>
                      </div>
                    </div>
                  </SectionBlock>

                  {ROLE_PERMISSIONS[selectedRole] && (
                    <>
                      <Divider />
                      <SectionBlock
                        icon={<ShieldCheck size={15} strokeWidth={2.5} />}
                        color="bg-violet-50 text-violet-600"
                        title="Allowed Capabilities"
                        desc="Authorized system actions that will be connected to this role."
                      >
                        <div className="space-y-2 max-h-[160px] overflow-y-auto pr-1 custom-scrollbar">
                          {ROLE_PERMISSIONS[selectedRole].map((group) => (
                            <div
                              key={group.group}
                              className="p-3.5 bg-slate-50 rounded-[10px] border border-slate-100 text-left"
                            >
                              <p className="text-[9px] font-black uppercase tracking-widest text-slate-400 mb-2">
                                {group.group}
                              </p>
                              <ul className="space-y-1.5">
                                {group.items.map((item) => (
                                  <li
                                    key={item}
                                    className="flex items-center gap-2 text-[11px] font-semibold text-slate-700"
                                  >
                                    <div className="w-3.5 h-3.5 rounded-full bg-blue-600/10 text-blue-600 flex items-center justify-center shrink-0">
                                      <Check size={8} strokeWidth={3} />
                                    </div>
                                    {item}
                                  </li>
                                ))}
                              </ul>
                            </div>
                          ))}
                        </div>
                      </SectionBlock>
                    </>
                  )}
                </div>
              )}
            </div>

            {/* Standardized Action Footer */}
            <div className="px-8 py-5 bg-slate-50 border-t border-slate-100 flex items-center justify-between gap-3 shrink-0">
              {/* Left Action: Cancel or Back */}
              {step === 1 ? (
                <Button
                  type="button"
                  variant="ghost"
                  onClick={() => setOpen(false)}
                  className="h-11 px-5 rounded-xl bg-white border border-slate-200 text-slate-400 text-[10px] font-black uppercase tracking-[0.2em] hover:bg-slate-50 transition-all active:scale-[0.98]"
                >
                  Cancel
                </Button>
              ) : (
                <Button
                  type="button"
                  onClick={() => setStep((prev) => (prev - 1) as any)}
                  className="h-11 px-5 rounded-xl bg-white border border-slate-200 text-slate-600 text-[10px] font-black uppercase tracking-[0.2em] hover:bg-slate-50 transition-all active:scale-[0.98] flex items-center gap-2"
                >
                  <ArrowLeft size={13} strokeWidth={3} />
                  Back
                </Button>
              )}

              {/* Right Action: Next or Submit */}
              {step < 3 ? (
                <Button
                  type="button"
                  onClick={step === 1 ? handleNextToStep2 : handleNextToStep3}
                  disabled={checkingAvailability}
                  className="h-11 px-6 rounded-xl bg-slate-900 text-white text-[10px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all shadow-md flex items-center gap-2 active:scale-[0.98] disabled:opacity-60"
                >
                  {checkingAvailability && step === 2 ? (
                    <>
                      <Loader2 size={13} strokeWidth={3} className="animate-spin" />
                      Checking...
                    </>
                  ) : (
                    <>
                      Continue
                      <ArrowRight size={13} strokeWidth={3} />
                    </>
                  )}
                </Button>
              ) : (
                <Button
                  type="submit"
                  disabled={loading}
                  className="h-11 px-8 rounded-xl bg-blue-600 text-white text-[10px] font-black uppercase tracking-[0.2em] hover:bg-blue-700 transition-all shadow-xl shadow-blue-500/20 flex items-center justify-center gap-3 active:scale-[0.98]"
                >
                  {loading ? (
                    <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
                  ) : (
                    <>
                      <BadgeCheck className="w-5 h-5" strokeWidth={3} />
                      Create Account
                    </>
                  )}
                </Button>
              )}
            </div>
          </form>
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
                  <p className="text-[10.5px] font-bold text-slate-400 leading-normal">
                    {alertModal.message}
                  </p>
                </div>
                <Button
                  type="button"
                  onClick={() => {
                    const type = alertModal.type;
                    setAlertModal(null);
                    if (type === "success") {
                      setOpen(false);
                    }
                  }}
                  className={cn(
                    "w-full h-10 rounded-xl text-[9px] font-black uppercase tracking-[0.2em] transition-all",
                    alertModal.type === "success"
                      ? "bg-emerald-600 hover:bg-emerald-700 text-white"
                      : "bg-slate-900 hover:bg-slate-800 text-white",
                  )}
                >
                  Continue
                </Button>
              </div>
            </div>
          )}
        </div>
      </SheetContent>
    </Sheet>
  );
}

// ── Small helpers ──────────────────────────────────────────────────────────────

function SectionBlock({
  icon,
  color,
  title,
  desc,
  children,
}: {
  icon: React.ReactNode;
  color: string;
  title: string;
  desc: string;
  children: React.ReactNode;
}) {
  return (
    <div className="space-y-3.5 text-left w-full">
      <div className="flex items-center gap-3">
        <div
          className={cn(
            "w-8 h-8 rounded-[10px] flex items-center justify-center shrink-0 shadow-sm",
            color,
          )}
        >
          {icon}
        </div>
        <div className="flex flex-col text-left">
          <h3 className="text-[12px] font-black text-slate-900 uppercase tracking-[0.15em] leading-tight">
            {title}
          </h3>
          <p className="text-[10px] font-bold text-slate-400 leading-normal">
            {desc}
          </p>
        </div>
      </div>
      <div className="w-full">{children}</div>
    </div>
  );
}

function SelectInput({
  value,
  onChange,
  children,
  required,
}: {
  value: string;
  onChange: (e: React.ChangeEvent<HTMLSelectElement>) => void;
  children: React.ReactNode;
  required?: boolean;
}) {
  return (
    <div className="relative text-left">
      <select
        value={value}
        onChange={onChange}
        required={required}
        className="w-full h-11 px-4 rounded-[10px] border border-slate-200 bg-white text-[13px] font-bold text-slate-700 focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all appearance-none cursor-pointer"
      >
        {children}
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
  );
}

function Divider() {
  return <div className="h-px bg-slate-100" />;
}
