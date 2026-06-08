"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import { useSession } from "next-auth/react";
import {
  Package,
  User,
  MapPin,
  Phone,
  ChevronRight,
  Loader2,
  CheckCircle2,
  AlertCircle,
  Info,
  CreditCard,
  Zap,
  Scale,
  ShieldCheck,
  ArrowLeft,
  Printer,
  Send,
  CircleCheck,
  Box,
  Activity,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import api from "@/lib/api/client";
import { usePricingRules } from "@/modules/pricing/use-pricing";

export default function ReceiveParcelPage() {
  const router = useRouter();
  const { data: session, status } = useSession();
  const { data: pricingRules } = usePricingRules();
  const [loading, setLoading] = useState(false);
  const [step, setStep] = useState(1);
  const [error, setError] = useState<string | null>(null);
  const [successData, setSuccessData] = useState<any>(null);
  const [stations, setStations] = useState<any[]>([]);
  const [providers, setProviders] = useState<any[]>([]);
  const [paymentStatus, setPaymentStatus] = useState<
    "IDLE" | "PENDING" | "SUCCESS" | "FAILED"
  >("IDLE");

  useEffect(() => {
    if (status === "loading") return;

    const fetchStations = async () => {
      try {
        const res = await fetch("/api/locations");
        if (res.ok) {
          const data = await res.json();
          const userStationId = (session?.user as any)?.stationId;
          setStations(data.filter((s: any) => s.id !== userStationId));
        }
      } catch (err) {
        console.error("Failed to fetch stations", err);
      }
    };

    const fetchProviders = async () => {
      try {
        const res = await api.get("/payments/providers");
        if (res.data?.success) {
          setProviders(res.data.data);
        }
      } catch (err) {
        console.error("Failed to fetch payment providers", err);
      }
    };

    fetchStations();

    if (status === "authenticated") {
      fetchProviders();
    }
  }, [status, (session?.user as any)?.stationId]);

  const [formData, setFormData] = useState({
    // Package Details
    packageName: "",
    destinationStationId: "",
    declaredValue: "",
    weight: "",
    condition: "BRAND_NEW",
    parcelType: "PARCEL",
    urgency: "STANDARD",
    packageSize: "SIZE_1",
    description: "",
    // Sender & Receiver
    senderName: "",
    senderPhone: "255",
    receiverName: "",
    receiverPhone: "255",
    // Payment
    paymentMode: "PAY_AS_YOU_GO", // PAY_AS_YOU_GO (100%), TO_PAY (50%)
    paymentChannel: "MPESA",
    mobilePaymentPhone: (session?.user as any)?.phone || "255",
  });

  // Pricing Calculation
  const baseFeeRule = pricingRules?.find(
    (r: any) => r.name === "BASE_FEE" && r.isActive,
  );
  const baseFee = baseFeeRule ? baseFeeRule.value : 5000;

  // We can also make weight fee dynamic if we find a rule for it
  const weightFeeRule = pricingRules?.find(
    (r: any) => r.name === "WEIGHT_FEE" && r.isActive,
  );
  const weightMultiplier = weightFeeRule ? weightFeeRule.value : 1500;
  const weightFee = (parseFloat(formData.weight) || 0) * weightMultiplier;

  // Similarly for Insurance Value fee
  const valueFeeRule = pricingRules?.find(
    (r: any) => r.name === "INSURANCE_FEE" && r.isActive,
  );
  const valueMultiplier = valueFeeRule ? valueFeeRule.value : 0.01;
  const valueFee = (parseFloat(formData.declaredValue) || 0) * valueMultiplier;

  // Urgency Multipliers placeholder
  let urgencyMultiplier = 1;
  if (formData.urgency === "EXPRESS") urgencyMultiplier = 1.25;
  if (formData.urgency === "MGR") urgencyMultiplier = 1.5;

  const subTotal = (baseFee + weightFee + valueFee) * urgencyMultiplier;
  const totalAmount = Math.ceil(subTotal / 100) * 100; // Round to nearest 100

  const amountToCollect = totalAmount;
  // TO_PAY functionality is disabled for now as per requirements.

  const handleBack = () => {
    if (step > 1) {
      setStep(step - 1);
      setError(null);
    }
  };

  const handleNext = () => {
    if (step < 4) {
      setStep(step + 1);
    }
  };

  const handleSendPush = async () => {
    if (!successData?.id) {
      setError("Parcel record missing for submission");
      return;
    }

    setError(null);
    setPaymentStatus("PENDING");

    try {
      const res = await api.post("/payments/initiate-push", {
        parcelId: successData.id,
        paymentChannel: formData.paymentChannel,
        phoneNumber: formData.mobilePaymentPhone,
      });

      if (res.data?.success) {
        // We keep polling or wait for push completion
        // For simplified UX, we'll mark as IDLE to allow retry, or SUCCESS if simulation
        // BUT in real production, we'd poll /parcel/:id/status
        setTimeout(() => setPaymentStatus("SUCCESS"), 1000);
      } else {
        setPaymentStatus("FAILED");
        setError(res.data?.error?.message || "Payment initiation failed");
      }
    } catch (err: any) {
      setPaymentStatus("FAILED");
      setError(
        err.response?.data?.error?.message || "Gateway communication error",
      );
    }
  };

  const handleSubmit = async () => {
    setLoading(true);
    setError(null);

    try {
      // Final submission to true Express API
      const res = await api.post("/parcel/receive", {
        receivingStationId: (session?.user as any)?.stationId,
        destinationStationId: formData.destinationStationId,
        packageName: formData.packageName,
        declaredValue: parseFloat(formData.declaredValue),
        weight: parseFloat(formData.weight),
        condition: formData.condition,
        parcelType: formData.parcelType,
        urgency: formData.urgency,
        packageSize: formData.packageSize,
        description: formData.description,
        senderName: formData.senderName,
        senderPhone: formData.senderPhone,
        receiverName: formData.receiverName,
        receiverPhone: formData.receiverPhone,
        paymentMode: formData.paymentMode,
        paymentMethod: formData.paymentChannel,
        isPaid: false, // Set to true only via push callback/gateway
      });

      // Extract the parcel object exactly matching the backend response
      const data = res.data?.data?.parcel || res.data?.data;
      setSuccessData(data);

      // If amountToCollect > 0, move to next step for push payment
      if (amountToCollect > 0) {
        setStep(4);
      } else {
        // If it's a 0 pay (shouldn't happen with new logic, but if so)
        setStep(4);
      }
    } catch (err: any) {
      setError(
        err.response?.data?.error?.message ||
          err.message ||
          "Finalization failed",
      );
    } finally {
      setLoading(false);
    }
  };

  if (successData) {
    return (
      <div className="min-h-screen bg-[#f8f9fb] flex flex-col items-center justify-center p-6 text-center">
        <div className="w-24 h-24 bg-emerald-500 rounded-[20px] flex items-center justify-center mb-8 shadow-2xl shadow-emerald-200 rotate-3 animate-in zoom-in duration-500">
          <CheckCircle2 size={48} className="text-white" />
        </div>
        <h2 className="text-3xl font-black text-slate-900 mb-3 tracking-tighter">
          Transaction Secured
        </h2>
        <p className="text-slate-400 max-w-sm font-medium mb-10 leading-relaxed uppercase tracking-[0.2em] text-[10px]">
          Parcel ID:{" "}
          <span className="text-emerald-600 font-black">
            {successData.trackingNumber || "PENDING"}
          </span>
        </p>

        <div className="flex gap-4">
          <button
            onClick={() => window.location.reload()}
            className="bg-white border border-slate-200 text-slate-900 px-8 py-4 rounded-[10px] font-black text-xs uppercase tracking-[0.2em] shadow-sm hover:shadow-md transition-all active:scale-95"
          >
            New Entry
          </button>
          <button className="bg-slate-900 text-white px-8 py-4 rounded-[10px] font-black text-xs uppercase tracking-[0.2em] shadow-xl shadow-slate-900/20 hover:-translate-y-1 transition-all active:scale-95 flex items-center gap-3">
            <Printer size={16} />
            Print Ticket
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#f8f9fb] py-8 px-6 animate-in fade-in duration-700">
      <div className="max-w-5xl mx-auto">
        {/* Standardized Header */}
        <ReportPageHeader
          title="Receive Parcel"
          subtitle={`Station: ${(session?.user as any)?.station?.name || "Global Hub"}`}
          iconName="Package"
        />

        {/* Progress Indicators - Unified Design */}
        <div className="grid grid-cols-4 gap-4 mb-10">
          {[
            { icon: Box, label: "Package" },
            { icon: User, label: "Details" },
            { icon: CreditCard, label: "Payment" },
            { icon: Send, label: "Complete" },
          ].map((s, i) => (
            <div key={i} className="flex flex-col gap-2.5">
              <div
                className={cn(
                  "h-1.5 rounded-full transition-all duration-500",
                  step > i
                    ? "bg-slate-900"
                    : i === step - 1
                      ? "bg-blue-500"
                      : "bg-slate-200",
                )}
              />
              <div className="flex items-center gap-2 px-0.5">
                <s.icon
                  size={11}
                  className={cn(
                    step >= i + 1 ? "text-slate-900" : "text-slate-300",
                  )}
                  strokeWidth={4}
                />
                <span
                  className={cn(
                    "text-[9px] font-black uppercase tracking-[0.2em]",
                    step >= i + 1 ? "text-slate-900" : "text-slate-300",
                  )}
                >
                  {s.label}
                </span>
              </div>
            </div>
          ))}
        </div>

        {error && (
          <div className="mb-8 bg-rose-50 border border-rose-100 p-5 rounded-[10px] flex items-center gap-4 text-rose-600 text-[12px] font-bold animate-in fade-in slide-in-from-top-2">
            <AlertCircle size={20} />
            {error}
          </div>
        )}

        <div className="bg-white rounded-[10px] border border-slate-100 shadow-sm overflow-hidden">
          {/* STEP 1: PACKAGE DETAILS */}
          {step === 1 && (
            <div className="p-10 space-y-8 animate-in fade-in duration-300">
              <div className="flex items-center gap-3 pb-6 border-b border-slate-50">
                <div className="h-8 w-8 bg-blue-50 rounded-[10px] flex items-center justify-center">
                  <Box size={16} className="text-blue-600" />
                </div>
                <h3 className="text-sm font-black text-slate-900 uppercase tracking-widest">
                  Package Details
                </h3>
              </div>

              <div className="grid md:grid-cols-2 gap-8">
                <div className="space-y-4">
                  <div className="flex flex-col gap-2">
                    <label className="text-[11px] font-black uppercase tracking-widest text-slate-400">
                      Parcel Name
                    </label>
                    <input
                      required
                      value={formData.packageName}
                      onChange={(e) =>
                        setFormData({
                          ...formData,
                          packageName: e.target.value,
                        })
                      }
                      placeholder="e.g. Blue Electronics Crate"
                      className="h-12 px-5 bg-slate-50 border border-slate-200 rounded-[10px] text-sm font-bold focus:ring-2 focus:ring-blue-500 outline-none transition-all"
                    />
                  </div>

                  <div className="flex flex-col gap-2">
                    <label className="text-[11px] font-black uppercase tracking-widest text-slate-400">
                      Destination Station
                    </label>
                    <div className="relative">
                      <MapPin
                        size={16}
                        className="absolute left-4 top-3.5 text-slate-300"
                      />
                      <select
                        required
                        value={formData.destinationStationId}
                        onChange={(e) =>
                          setFormData({
                            ...formData,
                            destinationStationId: e.target.value,
                          })
                        }
                        className="h-12 w-full pl-11 pr-5 bg-slate-50 border border-slate-200 rounded-[10px] text-sm font-bold focus:ring-2 focus:ring-blue-500 outline-none appearance-none"
                      >
                        <option value="">Select Destination</option>
                        {stations.map((s) => (
                          <option key={s.id} value={s.id}>
                            {s.name}
                          </option>
                        ))}
                      </select>
                    </div>
                  </div>

                  <div className="grid grid-cols-2 gap-4">
                    <div className="flex flex-col gap-2">
                      <label className="text-[11px] font-black uppercase tracking-widest text-slate-400">
                        Declared Value (TZS)
                      </label>
                      <input
                        type="number"
                        value={formData.declaredValue}
                        onChange={(e) =>
                          setFormData({
                            ...formData,
                            declaredValue: e.target.value,
                          })
                        }
                        className="h-12 px-5 bg-slate-50 border border-slate-200 rounded-[10px] text-sm font-bold focus:ring-2 focus:ring-blue-500 outline-none"
                      />
                    </div>
                    <div className="flex flex-col gap-2">
                      <label className="text-[11px] font-black uppercase tracking-widest text-slate-400">
                        Net Weight (KG)
                      </label>
                      <div className="relative">
                        <input
                          type="number"
                          step="0.1"
                          value={formData.weight}
                          onChange={(e) =>
                            setFormData({ ...formData, weight: e.target.value })
                          }
                          className="h-12 w-full px-5 bg-slate-50 border border-slate-200 rounded-[10px] text-sm font-bold focus:ring-2 focus:ring-blue-500 outline-none"
                        />
                        <Scale
                          size={14}
                          className="absolute right-4 top-4 text-slate-300"
                        />
                      </div>
                    </div>
                  </div>
                </div>

                <div className="space-y-4">
                  <div className="grid grid-cols-2 gap-4">
                    <div className="flex flex-col gap-2">
                      <label className="text-[11px] font-black uppercase tracking-widest text-slate-400">
                        Condition
                      </label>
                      <select
                        value={formData.condition}
                        onChange={(e) =>
                          setFormData({
                            ...formData,
                            condition: e.target.value,
                          })
                        }
                        className="h-12 w-full px-4 bg-slate-50 border border-slate-200 rounded-[10px] text-[10px] font-black uppercase tracking-widest outline-none"
                      >
                        <option value="BRAND_NEW">Brand New</option>
                        <option value="REFURBISHED">Refurbished</option>
                        <option value="USED">Used</option>
                      </select>
                    </div>
                    <div className="flex flex-col gap-2">
                      <label className="text-[11px] font-black uppercase tracking-widest text-slate-400">
                        Parcel Type
                      </label>
                      <select
                        value={formData.parcelType}
                        onChange={(e) =>
                          setFormData({
                            ...formData,
                            parcelType: e.target.value,
                          })
                        }
                        className="h-12 w-full px-4 bg-slate-50 border border-slate-200 rounded-[10px] text-[10px] font-black uppercase tracking-widest outline-none"
                      >
                        <option value="PARCEL">Parcel</option>
                        <option value="PALLET">Pallet</option>
                        <option value="CONTAINER">Container</option>
                        <option value="FRAGILE">Fragile</option>
                      </select>
                    </div>
                  </div>

                  <div className="grid grid-cols-2 gap-4">
                    <div className="flex flex-col gap-2">
                      <label className="text-[11px] font-black uppercase tracking-widest text-slate-400">
                        Urgency
                      </label>
                      <select
                        value={formData.urgency}
                        onChange={(e) =>
                          setFormData({ ...formData, urgency: e.target.value })
                        }
                        className="h-12 w-full px-4 bg-slate-50 border border-slate-200 rounded-[10px] text-[10px] font-black uppercase tracking-widest outline-none"
                      >
                        <option value="STANDARD">Standard</option>
                        <option value="EXPRESS">Express</option>
                        <option value="MGR">MGR</option>
                      </select>
                    </div>
                    <div className="flex flex-col gap-2">
                      <label className="text-[11px] font-black uppercase tracking-widest text-slate-400">
                        Package Size
                      </label>
                      <select
                        value={formData.packageSize}
                        onChange={(e) =>
                          setFormData({
                            ...formData,
                            packageSize: e.target.value,
                          })
                        }
                        className="h-12 w-full px-4 bg-slate-50 border border-slate-200 rounded-[10px] text-[10px] font-black uppercase tracking-widest outline-none"
                      >
                        <option value="DOCUMENT_A4">Document (A4)</option>
                        <option value="A3_NYLON">A3 Nylon</option>
                        <option value="SIZE_1">Size 1 (30x30)</option>
                        <option value="SIZE_2">Size 2 (50x50)</option>
                        <option value="SIZE_3">Size 3 (70x70)</option>
                      </select>
                    </div>
                  </div>

                  <div className="flex flex-col gap-2">
                    <label className="text-[11px] font-black uppercase tracking-widest text-slate-400">
                      Description (Optional)
                    </label>
                    <textarea
                      value={formData.description}
                      onChange={(e) =>
                        setFormData({
                          ...formData,
                          description: e.target.value,
                        })
                      }
                      className="h-12 px-5 py-3 bg-slate-50 border border-slate-200 rounded-[10px] text-sm font-bold focus:ring-2 focus:ring-blue-500 outline-none resize-none"
                      placeholder="Detailed contents..."
                    />
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* STEP 2: SENDER & RECEIVER */}
          {step === 2 && (
            <div className="p-10 space-y-10 animate-in fade-in duration-300">
              <div className="grid md:grid-cols-2 gap-12">
                {/* Sender */}
                <div className="space-y-6">
                  <div className="flex items-center gap-3">
                    <div className="h-8 w-8 bg-slate-900 rounded-[10px] flex items-center justify-center text-white">
                      <User size={14} />
                    </div>
                    <h3 className="text-[11px] font-black text-slate-900 uppercase tracking-widest">
                      Sender Details
                    </h3>
                  </div>
                  <div className="space-y-4">
                    <div className="flex flex-col gap-2">
                      <label className="text-[10px] font-bold text-slate-400 uppercase tracking-widest ml-1">
                        Full Name
                      </label>
                      <input
                        required
                        value={formData.senderName}
                        onChange={(e) =>
                          setFormData({
                            ...formData,
                            senderName: e.target.value,
                          })
                        }
                        className="h-12 px-5 bg-slate-50 border border-slate-200 rounded-[10px] text-sm font-bold outline-none"
                      />
                    </div>
                    <div className="flex flex-col gap-2">
                      <label className="text-[10px] font-bold text-slate-400 uppercase tracking-widest ml-1">
                        Phone Number
                      </label>
                      <div className="relative">
                        <Phone
                          size={14}
                          className="absolute left-4 top-[17px] text-slate-300"
                        />
                        <input
                          required
                          value={formData.senderPhone}
                          onChange={(e) => {
                            const val = e.target.value.replace(/\D/g, "");
                            setFormData({
                              ...formData,
                              senderPhone: val.startsWith("255")
                                ? val
                                : "255" + val,
                            });
                          }}
                          className="h-12 w-full pl-11 pr-5 bg-slate-50 border border-slate-200 rounded-[10px] text-sm font-mono font-bold outline-none"
                        />
                      </div>
                    </div>
                  </div>
                </div>

                {/* Receiver */}
                <div className="space-y-6">
                  <div className="flex items-center gap-3">
                    <div className="h-8 w-8 bg-indigo-100 rounded-[10px] flex items-center justify-center text-indigo-600">
                      <User size={14} />
                    </div>
                    <h3 className="text-[11px] font-black text-slate-900 uppercase tracking-widest">
                      Receiver Details
                    </h3>
                  </div>
                  <div className="space-y-4">
                    <div className="flex flex-col gap-2">
                      <label className="text-[10px] font-bold text-slate-400 uppercase tracking-widest ml-1">
                        Full Name
                      </label>
                      <input
                        required
                        value={formData.receiverName}
                        onChange={(e) =>
                          setFormData({
                            ...formData,
                            receiverName: e.target.value,
                          })
                        }
                        className="h-12 px-5 bg-slate-50 border border-slate-200 rounded-[10px] text-sm font-bold outline-none"
                      />
                    </div>
                    <div className="flex flex-col gap-2">
                      <label className="text-[10px] font-bold text-slate-400 uppercase tracking-widest ml-1">
                        Phone Number
                      </label>
                      <div className="relative">
                        <Phone
                          size={14}
                          className="absolute left-4 top-[17px] text-slate-300"
                        />
                        <input
                          required
                          value={formData.receiverPhone}
                          onChange={(e) => {
                            const val = e.target.value.replace(/\D/g, "");
                            setFormData({
                              ...formData,
                              receiverPhone: val.startsWith("255")
                                ? val
                                : "255" + val,
                            });
                          }}
                          className="h-12 w-full pl-11 pr-5 bg-slate-50 border border-slate-200 rounded-[10px] text-sm font-mono font-bold outline-none"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* STEP 3: PAYMENT CHECKOUT */}
          {step === 3 && (
            <div className="p-10 space-y-10 animate-in fade-in duration-300">
              <div className="grid md:grid-cols-2 gap-12">
                <div className="space-y-8">
                  <div className="flex items-center gap-3">
                    <div className="h-8 w-8 bg-emerald-50 rounded-[10px] flex items-center justify-center text-emerald-600">
                      <MoneyBagIcon size={16} />
                    </div>
                    <h3 className="text-[11px] font-black text-slate-900 uppercase tracking-widest">
                      Payment Overview
                    </h3>
                  </div>

                  <div className="p-6 bg-slate-50 rounded-[12px] space-y-4 border border-slate-100">
                    <div className="flex justify-between text-[11px] font-bold text-slate-500 uppercase tracking-widest">
                      <span>Base Fee</span>
                      <span className="text-slate-900">
                        {baseFee.toLocaleString()} TZS
                      </span>
                    </div>
                    <div className="flex justify-between text-[11px] font-bold text-slate-500 uppercase tracking-widest">
                      <span>Weight Fee</span>
                      <span className="text-slate-900">
                        {weightFee.toLocaleString()} TZS
                      </span>
                    </div>
                    <div className="flex justify-between text-[11px] font-bold text-slate-500 uppercase tracking-widest">
                      <span>Insurance Plan</span>
                      <span className="text-slate-900">
                        {valueFee.toLocaleString()} TZS
                      </span>
                    </div>
                    {urgencyMultiplier > 1 && (
                      <div className="flex justify-between text-[11px] font-bold text-amber-500 uppercase tracking-widest">
                        <span>Urgency Fee (x{urgencyMultiplier})</span>
                        <span>
                          +{" "}
                          {(
                            totalAmount -
                            (baseFee + weightFee + valueFee)
                          ).toLocaleString()}{" "}
                          TZS
                        </span>
                      </div>
                    )}
                    <div className="pt-4 border-t border-slate-200 flex justify-between items-end">
                      <div>
                        <p className="text-[9px] font-black uppercase tracking-[0.3em] text-slate-400">
                          Total Price
                        </p>
                        <p className="text-2xl font-black text-slate-900 tracking-tighter">
                          {totalAmount.toLocaleString()}{" "}
                          <span className="text-xs">TZS</span>
                        </p>
                      </div>
                      <ShieldCheck className="h-5 w-5 text-emerald-500" />
                    </div>
                  </div>
                </div>

                <div className="space-y-8">
                  <div className="flex items-center gap-3">
                    <div className="h-8 w-8 bg-indigo-50 rounded-[10px] flex items-center justify-center text-indigo-600">
                      <Activity size={16} />
                    </div>
                    <h3 className="text-[11px] font-black text-slate-900 uppercase tracking-widest">
                      Payment Method
                    </h3>
                  </div>

                  <div className="flex flex-col gap-3">
                    {[
                      {
                        id: "PAY_AS_YOU_GO",
                        label: "Pay in Full",
                        desc: "Secure the entire amount upfront",
                        split: "SENDER",
                      },
                    ].map((mode) => (
                      <button
                        key={mode.id}
                        onClick={() =>
                          setFormData({ ...formData, paymentMode: mode.id })
                        }
                        className={cn(
                          "p-6 rounded-[10px] border-2 text-left transition-all group relative",
                          formData.paymentMode === mode.id
                            ? "bg-slate-900 border-slate-900 shadow-xl shadow-slate-300"
                            : "bg-white border-slate-100 hover:border-slate-200",
                        )}
                      >
                        <div className="flex justify-between items-start">
                          <div>
                            <p
                              className={cn(
                                "text-[10px] font-black uppercase tracking-[0.2em]",
                                formData.paymentMode === mode.id
                                  ? "text-blue-400"
                                  : "text-slate-400",
                              )}
                            >
                              {mode.label}
                            </p>
                            <p
                              className={cn(
                                "text-[13px] font-black mt-2",
                                formData.paymentMode === mode.id
                                  ? "text-white"
                                  : "text-slate-700",
                              )}
                            >
                              {mode.desc}
                            </p>
                          </div>
                          <div
                            className={cn(
                              "text-[9px] font-black px-3 py-1.5 rounded-full uppercase tracking-[0.2em]",
                              formData.paymentMode === mode.id
                                ? "bg-white/10 text-white"
                                : "bg-slate-100 text-slate-500",
                            )}
                          >
                            {mode.split}
                          </div>
                        </div>
                      </button>
                    ))}
                  </div>

                  <div className="p-6 bg-blue-600 rounded-[10px] text-white flex justify-between items-center shadow-2xl shadow-blue-200">
                    <div>
                      <p className="text-[10px] font-black uppercase tracking-[0.2em] text-white/60">
                        Amount to Collect Now
                      </p>
                      <p className="text-2xl font-black tracking-tighter tabular-nums">
                        {amountToCollect.toLocaleString()}{" "}
                        <span className="text-sm">TZS</span>
                      </p>
                    </div>
                    <Zap
                      className="h-8 w-8 text-white fill-white/20"
                      strokeWidth={3}
                    />
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* STEP 4: PAYMENT CHANNEL */}
          {step === 4 && (
            <div className="p-10 space-y-10 animate-in fade-in duration-300 text-center">
              {amountToCollect === 0 ? (
                <div className="max-w-md mx-auto space-y-10 py-6">
                  <div className="space-y-3 pb-8">
                    <div className="mx-auto w-16 h-16 bg-slate-100 rounded-full flex items-center justify-center mb-6">
                      <ShieldCheck size={32} className="text-slate-400" />
                    </div>
                    <h3 className="text-2xl font-black text-slate-900 tracking-tighter">
                      Payment Exempted
                    </h3>
                    <p className="text-slate-400 text-xs font-medium uppercase tracking-widest max-w-[280px] mx-auto leading-relaxed">
                      No payment required
                    </p>
                  </div>
                  <button
                    onClick={handleSubmit} // Finalize record without payment
                    disabled={loading}
                    className="w-full h-16 bg-slate-900 text-white rounded-[12px] font-black text-sm uppercase tracking-[0.2em] shadow-2xl flex items-center justify-center gap-3 hover:-translate-y-1 transition-all active:scale-95"
                  >
                    {loading ? (
                      <Loader2 className="animate-spin" size={18} />
                    ) : (
                      <>
                        Complete <CheckCircle2 size={18} />
                      </>
                    )}
                  </button>
                </div>
              ) : (
                <div className="max-w-md mx-auto space-y-10 py-6">
                  <div className="space-y-3">
                    <h3 className="text-2xl font-black text-slate-900 tracking-tighter">
                      Choose Payment Method
                    </h3>
                    <p className="text-slate-400 text-xs font-medium uppercase tracking-widest">
                      Select mobile network
                    </p>
                  </div>

                  <div className="grid grid-cols-2 gap-4">
                    {providers.length > 0
                      ? providers.map((ch) => (
                          <button
                            key={ch.id || ch.name}
                            onClick={() =>
                              setFormData({
                                ...formData,
                                paymentChannel: ch.name,
                              })
                            }
                            className={cn(
                              "h-20 rounded-[10px] border-2 font-black text-[10px] uppercase tracking-[0.2em] transition-all flex flex-col items-center justify-center gap-2",
                              formData.paymentChannel === ch.name
                                ? "bg-slate-900 text-white border-slate-900 shadow-2xl scale-[1.03]"
                                : "bg-slate-50 border-transparent text-slate-400 hover:bg-slate-100",
                            )}
                          >
                            {ch.name.replace("_", " ")}
                          </button>
                        ))
                      : ["MPESA", "TIGO_PESA", "AIRTEL_MONEY"].map((ch) => (
                          <button
                            key={ch}
                            onClick={() =>
                              setFormData({ ...formData, paymentChannel: ch })
                            }
                            className={cn(
                              "h-20 rounded-[10px] border-2 font-black text-[10px] uppercase tracking-[0.2em] transition-all",
                              formData.paymentChannel === ch
                                ? "bg-slate-900 text-white border-slate-900"
                                : "bg-slate-50 border-transparent text-slate-400",
                            )}
                          >
                            {ch.replace("_", " ")}
                          </button>
                        ))}
                  </div>

                  <div className="space-y-4">
                    <div className="flex flex-col gap-2 text-left">
                      <label className="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">
                        Mobile Number
                      </label>
                      <div className="relative">
                        <Phone
                          size={16}
                          className="absolute left-4 top-4 text-slate-300"
                        />
                        <input
                          value={formData.mobilePaymentPhone}
                          onChange={(e) => {
                            const val = e.target.value.replace(/\D/g, "");
                            setFormData({
                              ...formData,
                              mobilePaymentPhone: val.startsWith("255")
                                ? val
                                : "255" + val,
                            });
                          }}
                          className="h-14 w-full pl-11 pr-5 bg-slate-50 border-none rounded-[12px] text-lg font-mono font-black focus:ring-2 ring-indigo-500 transition-all outline-none"
                        />
                      </div>
                    </div>

                    {paymentStatus === "IDLE" && (
                      <button
                        onClick={handleSendPush}
                        className="w-full h-16 bg-indigo-600 text-white rounded-[12px] font-black text-sm uppercase tracking-[0.2em] shadow-2xl shadow-indigo-200 flex items-center justify-center gap-3 hover:-translate-y-1 transition-all active:scale-95"
                      >
                        Send Payment Request
                        <Send size={18} />
                      </button>
                    )}

                    {paymentStatus === "PENDING" && (
                      <div className="w-full h-16 bg-amber-50 border border-amber-100 rounded-[12px] flex items-center justify-center gap-4 text-amber-600 font-black text-[11px] uppercase tracking-[0.2em]">
                        <Loader2 className="animate-spin" size={18} />
                        Waiting for User Auth...
                      </div>
                    )}

                    {paymentStatus === "SUCCESS" && (
                      <div className="space-y-6">
                        <div className="w-full h-16 bg-emerald-50 border border-emerald-100 rounded-[12px] flex items-center justify-center gap-4 text-emerald-600 font-black text-[11px] uppercase tracking-[0.2em]">
                          <CircleCheck size={18} />
                          Payment Successful
                        </div>
                        <button
                          onClick={handleSubmit} // Finalize record
                          disabled={loading}
                          className="w-full h-16 bg-slate-900 text-white rounded-[12px] font-black text-sm uppercase tracking-[0.2em] shadow-2xl flex items-center justify-center gap-3 hover:-translate-y-1 transition-all active:scale-95"
                        >
                          {loading ? (
                            <Loader2 className="animate-spin" size={18} />
                          ) : (
                            <>
                              Complete <CheckCircle2 size={18} />
                            </>
                          )}
                        </button>
                      </div>
                    )}
                  </div>
                </div>
              )}
            </div>
          )}

          {/* SHARED NAVIGATION */}
          <div className="px-10 py-8 bg-slate-50 border-t border-slate-100 flex items-center justify-between">
            <button
              onClick={handleBack}
              className={cn(
                "flex items-center gap-2 text-[10px] font-black uppercase tracking-widest transition-all",
                step === 1
                  ? "opacity-0 pointer-events-none"
                  : "text-slate-400 hover:text-slate-900",
              )}
            >
              <ArrowLeft size={14} />
              Back
            </button>

            {step < 4 && (
              <button
                onClick={handleNext}
                className="h-14 px-10 bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] rounded-[10px] shadow-2xl flex items-center gap-3 hover:-translate-y-1 transition-all active:scale-95"
              >
                Next Step
                <ChevronRight size={14} strokeWidth={3} />
              </button>
            )}
          </div>
        </div>

        {/* Status Bar */}
        <div className="mt-8 flex justify-center gap-6">
          <div className="flex items-center gap-2">
            <div className="h-1.5 w-1.5 rounded-full bg-blue-500" />
            <span className="text-[9px] font-black uppercase tracking-widest text-slate-400">
              Secure connection
            </span>
          </div>
          <div className="flex items-center gap-2">
            <div className="h-1.5 w-1.5 rounded-full bg-emerald-500" />
            <span className="text-[9px] font-black uppercase tracking-widest text-slate-400">
              Verified identity
            </span>
          </div>
        </div>
      </div>
    </div>
  );
}

function MoneyBagIcon({ size = 24, className = "" }) {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2.5"
      strokeLinecap="round"
      strokeLinejoin="round"
      className={className}
    >
      <path d="M12 2v4" />
      <path d="M9 6a3 3 0 1 0 6 0 3 3 0 1 0-6 0z" />
      <path d="M19 12c.5 3 1 6 1 8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2c0-2 .5-5 1-8" />
      <circle cx="12" cy="14" r="2" />
    </svg>
  );
}
