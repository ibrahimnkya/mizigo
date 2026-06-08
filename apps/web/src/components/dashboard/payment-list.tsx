"use client";

import { cn } from "@/lib/utils";
import {
  CreditCard,
  TrendingUp,
  Zap,
  Activity,
  Database,
  Info,
  Wallet,
  CheckCircle2,
  FileText,
  ArrowUpRight,
} from "lucide-react";
import { useQuery } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { DataTable } from "@/components/shared/data-table";
import { format } from "date-fns";

export function PaymentList({
  status,
  tab = "overview",
}: {
  status?: string | string[];
  tab?: string;
}) {
  const { data: payments, isLoading } = useQuery({
    queryKey: ["payments", status],
    queryFn: async () => {
      const params = new URLSearchParams();
      if (status) {
        if (Array.isArray(status)) {
          status.forEach((s) => params.append("status", s));
        } else {
          params.append("status", status);
        }
      }
      const { data } = await api.get(`/payments?${params.toString()}`);
      return data.data || [];
    },
  });

  const rawPayments = Array.isArray(payments) ? payments : [];

  const totalPaid = rawPayments.filter((p: any) => p.status === "SUCCESS");
  const totalPending = rawPayments.filter((p: any) => p.status === "PENDING");

  const totalPaidAmount = totalPaid.reduce(
    (acc: number, p: any) => acc + p.amount,
    0,
  );
  const totalPendingAmount = totalPending.reduce(
    (acc: number, p: any) => acc + p.amount,
    0,
  );

  const successRate = rawPayments.length
    ? ((totalPaid.length / rawPayments.length) * 100).toFixed(1) + "%"
    : "0%";

  const formatAmount = (amt: number) => {
    if (amt >= 1000000) return `TZS ${(amt / 1000000).toFixed(1)}M`;
    if (amt >= 1000) return `TZS ${(amt / 1000).toFixed(1)}K`;
    return `TZS ${amt}`;
  };

  const columns = [
    {
      header: "Transaction",
      accessor: (pay: any) => (
        <div className="flex items-center gap-3">
          <div
            className={cn(
              "h-10 w-10 rounded-[10px] flex items-center justify-center shadow-lg",
              pay.status === "SUCCESS"
                ? "bg-slate-900"
                : "bg-slate-200 grayscale",
            )}
          >
            <FileText className="h-5 w-5 text-white" />
          </div>
          <div className="flex flex-col">
            <span className="font-black text-slate-900 text-[14px] uppercase">
              #
              {pay.parcel?.id?.slice(-8).toUpperCase() ||
                pay.transactionReference?.slice(-8).toUpperCase() ||
                "---"}
            </span>
            <span className="text-[10px] text-slate-400 uppercase mt-1">
              Reference
            </span>
          </div>
        </div>
      ),
    },
    {
      header: "Reference ID",
      accessor: (pay: any) => (
        <span className="text-[12px] font-bold text-blue-600">
          {pay.transactionReference?.slice(0, 10) || "PENDING"}
        </span>
      ),
    },
    {
      header: "Status",
      accessor: (pay: any) => {
        const isSuccess = pay.status === "SUCCESS" || pay.status === "PAID";
        return (
          <div
            className={cn(
              "inline-flex items-center gap-2 px-3 py-1.5 rounded-full border",
              isSuccess
                ? "bg-emerald-50 border-emerald-100 text-emerald-600"
                : "bg-amber-50 border-amber-100 text-amber-600",
            )}
          >
            <Zap
              className={cn(
                "w-3 h-3",
                isSuccess ? "fill-emerald-600" : "fill-amber-500",
              )}
            />
            <span className="text-[10px] font-bold uppercase">
              {isSuccess ? "Paid" : "Pending"}
            </span>
          </div>
        );
      },
    },
    {
      header: "Amount",
      accessor: (pay: any) => (
        <div className="flex items-center gap-1 text-slate-900">
          <Wallet className="w-4 h-4 text-slate-400" />
          <span className="text-[14px] font-black">
            TSh {pay.amount.toLocaleString()}
          </span>
        </div>
      ),
    },
    {
      header: "Date",
      accessor: (pay: any) => (
        <div className="flex flex-col text-right pr-4">
          <span className="text-[12px] font-bold text-slate-900">
            {format(new Date(pay.createdAt || Date.now()), "HH:mm")}
          </span>
          <span className="text-[10px] text-slate-400 uppercase">
            {format(new Date(pay.createdAt || Date.now()), "MMM dd, yyyy")}
          </span>
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-12 py-4 animate-in fade-in duration-700">
      {/* Stats Overview Tab */}
      {tab.toLowerCase() === "overview" && (
        <div className="space-y-6">
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            {[
              {
                label: "Total Paid",
                count: formatAmount(totalPaidAmount),
                icon: CheckCircle2,
                color: "text-emerald-600",
                bg: "bg-emerald-50",
              },
              {
                label: "Pending Payments",
                count: formatAmount(totalPendingAmount),
                icon: ArrowUpRight,
                color: "text-blue-600",
                bg: "bg-blue-50",
              },
              {
                label: "Success Rate",
                count: successRate,
                icon: TrendingUp,
                color: "text-indigo-600",
                bg: "bg-indigo-50",
              },
              {
                label: "Total Transactions",
                count: rawPayments.length,
                icon: Activity,
                color: "text-slate-600",
                bg: "bg-slate-50",
              },
            ].map((stat, i) => (
              <div
                key={i}
                className="flex flex-col p-6 bg-white border border-slate-100 rounded-[10px] shadow-sm group hover:border-slate-300 transition-all hover:shadow-xl hover:shadow-slate-100/50"
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
                    {stat.count}
                  </span>
                </div>
              </div>
            ))}
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
            {/* How It Works Section */}
            <div className="lg:col-span-1 bg-slate-900 rounded-[10px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[400px]">
              <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-blue-500/10 rounded-full blur-[100px]" />

              <div className="relative z-10">
                <div className="h-12 w-12 rounded-[10px] bg-white/10 flex items-center justify-center mb-8 border border-white/10 backdrop-blur-md shadow-2xl shadow-blue-500/10">
                  <Wallet className="h-6 w-6 text-blue-400" strokeWidth={2.5} />
                </div>
                <h3 className="text-[24px] font-black tracking-tight leading-none mb-3">
                  Payment Flow
                </h3>
                <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-80 mb-6">
                  Payments are processed through integrated gateways in
                  real-time. Successful transactions automatically update parcel
                  statuses.
                </p>
              </div>

              <div className="relative z-10 space-y-3">
                <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                  <div className="flex flex-col">
                    <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                      Total Verified
                    </span>
                    <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                      Paid Volume
                    </span>
                  </div>
                  <span className="text-[14px] font-black text-emerald-400 tabular-nums">
                    {formatAmount(totalPaidAmount)}
                  </span>
                </div>
                <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                  <div className="flex flex-col">
                    <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                      Pending
                    </span>
                    <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                      Awaiting
                    </span>
                  </div>
                  <span className="text-[14px] font-black text-amber-400 tabular-nums">
                    {formatAmount(totalPendingAmount)}
                  </span>
                </div>
              </div>
            </div>

            {/* Placeholder for Graphs or other analytical tools */}
            <div className="lg:col-span-2 bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 flex flex-col items-center justify-center text-center">
              <div className="w-16 h-16 rounded-full bg-blue-50 flex items-center justify-center mb-4">
                <TrendingUp className="w-8 h-8 text-blue-500" />
              </div>
              <h4 className="text-[16px] font-black text-slate-900 mb-2">
                Revenue Activity Graph
              </h4>
              <p className="text-[13px] text-slate-400 max-w-md">
                Detailed graphical analysis of payment inflows, transaction
                volumes, and revenue trends will be populated here as
                transactions occur.
              </p>
            </div>
          </div>
        </div>
      )}

      {/* Table Tab */}
      {tab.toLowerCase() === "all" && (
        <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden p-1">
          <DataTable
            title="Payments"
            data={rawPayments}
            columns={columns}
            isLoading={isLoading}
            hideInternalSearch={true}
          />
        </div>
      )}
    </div>
  );
}
