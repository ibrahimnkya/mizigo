"use client";

import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { useState, Suspense } from "react";
import { useSearchParams, useRouter } from "next/navigation";
import { toast } from "sonner";
import { useSession } from "next-auth/react";
import {
  MessageSquare,
  Search,
  RotateCcw,
  CheckCircle2,
  XCircle,
  AlertTriangle,
  Building2,
  Calendar,
  Phone,
  Eye,
  Loader2,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetDescription,
} from "@repo/ui/sheet";

// ─── Types ────────────────────────────────────────────────────────────────────

interface AuditLog {
  id: string;
  userId: string | null;
  action: string;
  resource: string;
  createdAt: string;
  organizationId: string | null;
  details: {
    phoneNumber: string;
    message: string;
    status: "SENT" | "FAILED" | "PENDING";
    error?: string | null;
    timestamp?: string;
    senderId?: string | null;
  };
}

interface Organization {
  id: string;
  name: string;
}

// ─── Inner Page Component ─────────────────────────────────────────────────────

function SmsLogsPageInner() {
  const queryClient = useQueryClient();
  const { data: session } = useSession();
  const searchParams = useSearchParams();
  const router = useRouter();

  const isSuperAdmin = session?.user?.role === "SUPER_ADMIN";

  // Filter States
  const [phoneNumber, setPhoneNumber] = useState("");
  const [status, setStatus] = useState("");
  const [selectedOrgId, setSelectedOrgId] = useState("");
  const [page, setPage] = useState(1);

  // Selected SMS details for viewing modal
  const [selectedLog, setSelectedLog] = useState<AuditLog | null>(null);

  // ── Queries ──

  // Fetch SMS Logs
  const { data, isLoading, refetch, isFetching } = useQuery({
    queryKey: ["sms-logs", page, phoneNumber, status, selectedOrgId],
    queryFn: async () => {
      const params = new URLSearchParams();
      params.append("page", String(page));
      params.append("limit", "15");
      if (phoneNumber) params.append("phoneNumber", phoneNumber);
      if (status) params.append("status", status);
      if (selectedOrgId) params.append("organizationId", selectedOrgId);

      const { data } = await api.get(`/sms-config/logs?${params.toString()}`);
      return data;
    },
  });

  // Fetch Organizations (for Super Admin selector)
  const { data: organizations = [] } = useQuery<Organization[]>({
    queryKey: ["organizations-list"],
    enabled: isSuperAdmin,
    queryFn: async () => {
      const { data } = await api.get("/organizations");
      return data.data || data;
    },
  });

  // ── Mutations ──

  // Resend SMS Mutation
  const { mutate: resendSms, isPending: isResending } = useMutation({
    mutationFn: async (logId: string) => {
      const { data } = await api.post(`/sms-config/logs/${logId}/resend`);
      return data;
    },
    onSuccess: () => {
      toast.success("SMS resend triggered successfully");
      queryClient.invalidateQueries({ queryKey: ["sms-logs"] });
    },
    onError: (err: any) => {
      toast.error(err.response?.data?.error?.message || "Failed to resend SMS");
    },
  });

  const logs: AuditLog[] = data?.data || [];
  const pagination = data?.pagination || { total: 0, totalPages: 1 };

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">

        <ReportPageHeader
          title="SMS Logs & Reports"
          subtitle="View and manage transactional message dispatches and delivery reports"
          iconName="MessageSquare"
          hideBackArrow={true}
        />

        {/* ── Filter Bar ── */}
        <div className="bg-white border border-slate-100 rounded-[10px] shadow-sm p-6 flex flex-col md:flex-row gap-4 items-end">
          <div className="flex-1 space-y-2">
            <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">Search Recipient</Label>
            <div className="relative">
              <Search size={14} className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400" />
              <Input
                value={phoneNumber}
                onChange={(e) => {
                  setPhoneNumber(e.target.value);
                  setPage(1);
                }}
                placeholder="Enter phone number..."
                className="h-12 pl-10 bg-slate-50 border-slate-100 rounded-[10px] text-[13px] font-bold"
              />
            </div>
          </div>

          <div className="w-full md:w-[200px] space-y-2">
            <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">Status</Label>
            <select
              value={status}
              onChange={(e) => {
                setStatus(e.target.value);
                setPage(1);
              }}
              className="w-full h-12 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-[13px] font-bold text-slate-700 outline-none focus:ring-2 focus:ring-blue-500 cursor-pointer"
            >
              <option value="">All Statuses</option>
              <option value="SENT">Sent</option>
              <option value="FAILED">Failed</option>
              <option value="PENDING">Pending</option>
            </select>
          </div>

          {isSuperAdmin && (
            <div className="w-full md:w-[240px] space-y-2">
              <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400">Company / Organization</Label>
              <select
                value={selectedOrgId}
                onChange={(e) => {
                  setSelectedOrgId(e.target.value);
                  setPage(1);
                }}
                className="w-full h-12 px-4 bg-slate-50 border border-slate-100 rounded-[10px] text-[13px] font-bold text-slate-700 outline-none focus:ring-2 focus:ring-blue-500 cursor-pointer"
              >
                <option value="">All Companies (Platform)</option>
                {organizations.map((org) => (
                  <option key={org.id} value={org.id}>{org.name}</option>
                ))}
              </select>
            </div>
          )}

          <button
            onClick={() => refetch()}
            disabled={isFetching}
            className="h-12 px-5 bg-slate-100 hover:bg-slate-200 disabled:opacity-40 text-slate-700 rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center justify-center gap-2 transition-all active:scale-95 shrink-0"
          >
            <RotateCcw size={13} className={cn(isFetching && "animate-spin")} />
            Refresh
          </button>
        </div>

        {/* ── Table / Logs View ── */}
        <div className="bg-white border border-slate-100 rounded-[10px] shadow-sm overflow-hidden flex flex-col min-h-[500px]">
          {isLoading ? (
            <div className="flex-1 flex flex-col items-center justify-center py-20 gap-3">
              <Loader2 className="w-8 h-8 animate-spin text-slate-400" />
              <span className="text-[11px] font-black text-slate-400 uppercase tracking-widest animate-pulse">Loading logs...</span>
            </div>
          ) : logs.length === 0 ? (
            <div className="flex-1 flex flex-col items-center justify-center py-20 text-center">
              <div className="w-14 h-14 bg-slate-50 border border-slate-100 rounded-full flex items-center justify-center text-slate-400 mb-4">
                <MessageSquare size={24} />
              </div>
              <h3 className="text-sm font-black text-slate-700">No logs found</h3>
              <p className="text-[12px] text-slate-400 max-w-[280px] leading-relaxed mt-1">
                No matching outgoing SMS records found for the selected scopes.
              </p>
            </div>
          ) : (
            <div className="flex-1 overflow-x-auto">
              <table className="w-full text-left border-collapse">
                <thead>
                  <tr className="bg-slate-50/50 border-b border-slate-100">
                    <th className="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Time</th>
                    <th className="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Recipient</th>
                    <th className="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Sender ID</th>
                    {isSuperAdmin && (
                      <th className="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Organization</th>
                    )}
                    <th className="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Message</th>
                    <th className="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Status</th>
                    <th className="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest text-right">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-50 text-[13px] font-bold text-slate-700">
                  {logs.map((log) => {
                    const status = log.details?.status || "SENT";
                    const org = organizations.find((o) => o.id === log.organizationId);

                    return (
                      <tr key={log.id} className="hover:bg-slate-50/50 transition-colors">
                        <td className="px-6 py-4.5 whitespace-nowrap text-slate-500 font-semibold flex items-center gap-2">
                          <Calendar size={13} />
                          {new Date(log.createdAt).toLocaleString()}
                        </td>
                        <td className="px-6 py-4.5 whitespace-nowrap">
                          <span className="flex items-center gap-1.5 font-mono">
                            <Phone size={13} className="text-slate-400" />
                            {log.details?.phoneNumber || "—"}
                          </span>
                        </td>
                        <td className="px-6 py-4.5 whitespace-nowrap text-slate-500 font-mono text-[12px]">
                          {log.details?.senderId || "—"}
                        </td>
                        {isSuperAdmin && (
                          <td className="px-6 py-4.5 whitespace-nowrap">
                            <span className="flex items-center gap-1.5 text-slate-500 font-semibold">
                              <Building2 size={13} className="text-slate-400" />
                              {org?.name || "Platform"}
                            </span>
                          </td>
                        )}
                        <td className="px-6 py-4.5 max-w-[360px] truncate font-medium text-slate-500">
                          {log.details?.message || "—"}
                        </td>
                        <td className="px-6 py-4.5 whitespace-nowrap">
                          <span className={cn(
                            "px-2.5 py-1 text-[9px] font-black uppercase tracking-widest rounded-[6px] flex items-center gap-1.5 w-fit border",
                            status === "SENT" && "bg-emerald-50 text-emerald-700 border-emerald-100",
                            status === "FAILED" && "bg-red-50 text-red-700 border-red-100",
                            status === "PENDING" && "bg-amber-50 text-amber-700 border-amber-100"
                          )}>
                            {status === "SENT" && <CheckCircle2 size={10} />}
                            {status === "FAILED" && <XCircle size={10} />}
                            {status === "PENDING" && <AlertTriangle size={10} />}
                            {status}
                          </span>
                        </td>
                        <td className="px-6 py-4.5 whitespace-nowrap text-right">
                          <div className="flex items-center justify-end gap-2">
                            <button
                              onClick={() => setSelectedLog(log)}
                              className="p-2 text-slate-400 hover:text-slate-900 bg-slate-50 hover:bg-slate-100 rounded-[8px] transition-all"
                              title="View message detail"
                            >
                              <Eye size={14} />
                            </button>
                            <button
                              onClick={() => resendSms(log.id)}
                              disabled={isResending}
                              className="h-8 px-3.5 bg-slate-900 hover:bg-slate-800 disabled:opacity-40 text-white rounded-[8px] text-[10px] font-black uppercase tracking-widest transition-all"
                              title="Resend this message"
                            >
                              Resend
                            </button>
                          </div>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          )}

          {/* ── Pagination ── */}
          {pagination.totalPages > 1 && (
            <div className="p-6 border-t border-slate-50 flex items-center justify-between">
              <span className="text-[11px] font-black text-slate-400 uppercase tracking-widest">
                Showing page {page} of {pagination.totalPages}
              </span>
              <div className="flex gap-2">
                <button
                  disabled={page <= 1}
                  onClick={() => setPage((p) => p - 1)}
                  className="h-10 px-4 border border-slate-100 bg-slate-50 hover:bg-slate-100 disabled:opacity-40 rounded-[8px] text-[11px] font-black uppercase tracking-widest transition-all"
                >
                  Previous
                </button>
                <button
                  disabled={page >= pagination.totalPages}
                  onClick={() => setPage((p) => p + 1)}
                  className="h-10 px-4 border border-slate-100 bg-slate-50 hover:bg-slate-100 disabled:opacity-40 rounded-[8px] text-[11px] font-black uppercase tracking-widest transition-all"
                >
                  Next
                </button>
              </div>
            </div>
          )}
        </div>

        {/* ── Detail Modal (Sheet Drawer) ── */}
        <Sheet open={selectedLog !== null} onOpenChange={(open) => !open && setSelectedLog(null)}>
          <SheetContent className="w-full sm:max-w-[500px] p-8 border-l border-slate-100 bg-white shadow-2xl h-full flex flex-col">
            <SheetHeader className="text-left mb-6">
              <SheetTitle className="text-[18px] font-black text-slate-900 uppercase tracking-tight flex items-center gap-2">
                <MessageSquare size={18} className="text-blue-600" />
                Message Log Details
              </SheetTitle>
              <SheetDescription className="text-slate-400 text-[11px] font-bold uppercase tracking-[0.1em] mt-0.5">
                Detailed SMS dispatch transaction data
              </SheetDescription>
            </SheetHeader>

            {selectedLog && (
              <div className="space-y-6 text-left flex-1 flex flex-col justify-between">
                <div className="space-y-6">
                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <span className="text-[9px] font-black uppercase tracking-widest text-slate-400 block mb-1">Time</span>
                      <span className="text-[13px] font-bold text-slate-800">{new Date(selectedLog.createdAt).toLocaleString()}</span>
                    </div>
                    <div>
                      <span className="text-[9px] font-black uppercase tracking-widest text-slate-400 block mb-1">Recipient</span>
                      <span className="text-[13px] font-mono font-bold text-slate-800">{selectedLog.details?.phoneNumber}</span>
                    </div>
                  </div>

                  <div>
                    <span className="text-[9px] font-black uppercase tracking-widest text-slate-400 block mb-1">Message Text</span>
                    <div className="p-4 bg-slate-50 border border-slate-100 rounded-[10px] text-slate-700 font-mono text-[12px] leading-relaxed whitespace-pre-wrap">
                      {selectedLog.details?.message}
                    </div>
                  </div>

                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <span className="text-[9px] font-black uppercase tracking-widest text-slate-400 block mb-1">Sender ID</span>
                      <span className="text-[13px] font-mono font-bold text-slate-800">{selectedLog.details?.senderId || "—"}</span>
                    </div>
                    <div>
                      <span className="text-[9px] font-black uppercase tracking-widest text-slate-400 block mb-1">Status</span>
                      <span className={cn(
                        "px-2.5 py-1 text-[9px] font-black uppercase tracking-widest rounded-[6px] border block w-fit",
                        selectedLog.details?.status === "SENT" && "bg-emerald-50 text-emerald-700 border-emerald-100",
                        selectedLog.details?.status === "FAILED" && "bg-red-50 text-red-700 border-red-100",
                        selectedLog.details?.status === "PENDING" && "bg-amber-50 text-amber-700 border-amber-100"
                      )}>
                        {selectedLog.details?.status}
                      </span>
                    </div>
                  </div>
                  {selectedLog.details?.error && (
                    <div>
                      <span className="text-[9px] font-black uppercase tracking-widest text-slate-400 block mb-1">Error Remarks</span>
                      <span className="text-[11px] font-bold text-red-600 block">{selectedLog.details.error}</span>
                    </div>
                  )}
                </div>

                <div className="pt-6 border-t border-slate-100 flex gap-3 mt-auto">
                  <button
                    onClick={() => setSelectedLog(null)}
                    className="flex-1 h-12 rounded-[10px] bg-slate-100 hover:bg-slate-200 text-slate-700 text-[11px] font-black uppercase tracking-widest transition-all"
                  >
                    Close
                  </button>
                  <button
                    onClick={() => {
                      resendSms(selectedLog.id);
                      setSelectedLog(null);
                    }}
                    className="flex-1 h-12 rounded-[10px] bg-slate-900 hover:bg-slate-800 text-white text-[11px] font-black uppercase tracking-widest transition-all"
                  >
                    Resend SMS
                  </button>
                </div>
              </div>
            )}
          </SheetContent>
        </Sheet>

      </div>
    </div>
  );
}

// ─── Export ───────────────────────────────────────────────────────────────────

export default function SmsLogsPage() {
  return (
    <Suspense fallback={
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    }>
      <SmsLogsPageInner />
    </Suspense>
  );
}
