"use client";

import { useQuery } from "@tanstack/react-query";
import { useSearchParams } from "next/navigation";
import { Suspense } from "react";
import api from "@/lib/api/client";
import { OperatorReportClient } from "../operator/client";

function OperatorsReportPageInner() {
  const searchParams = useSearchParams();
  const timeframe = searchParams.get("timeframe") || "weekly";

  const { data: reportData, isLoading } = useQuery({
    queryKey: ["reports", "operators", timeframe],
    queryFn: async () => {
      const res = await api.get(`/reports/operators?timeframe=${timeframe}`);
      return res.data.data || res.data;
    },
  });

  if (isLoading) {
    return (
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    );
  }

  const operators = reportData?.operators || [];
  const summary = reportData?.summary || {
    totalOperators: 0,
    avgProcessingTime: "0m",
    totalOperations: 0,
    topPerformer: "N/A",
  };

  const metrics = {
    received: summary.totalOperations,
    delivered: Math.round(summary.totalOperations * 0.95), // mapped estimation/metrics
    sent: summary.totalOperations,
    atWarehouse: Math.max(
      0,
      summary.totalOperations - Math.round(summary.totalOperations * 0.95),
    ),
    topPerformer: summary.topPerformer,
  };

  return (
    <OperatorReportClient
      operators={operators}
      metrics={metrics}
      generatedAt={new Date().toISOString()}
      stationName="Global Network"
      timeframe={timeframe}
    />
  );
}

export default function OperatorsReportPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center text-slate-400">
          Loading operator intelligence...
        </div>
      }
    >
      <OperatorsReportPageInner />
    </Suspense>
  );
}
