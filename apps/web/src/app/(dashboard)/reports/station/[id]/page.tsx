"use client";

import { useQuery } from "@tanstack/react-query";
import { useParams, useSearchParams } from "next/navigation";
import { Suspense } from "react";
import api from "@/lib/api/client";
import { StationReportClient } from "../client";

function StationReportPageInner() {
  const params = useParams();
  const id = params.id as string;
  const searchParams = useSearchParams();
  const timeframe = searchParams.get("timeframe") || "weekly";

  const { data: reportData, isLoading } = useQuery({
    queryKey: ["reports", "station", id, timeframe],
    queryFn: async () => {
      const res = await api.get(
        `/reports/stations/${id}?timeframe=${timeframe}`,
      );
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

  const station = reportData?.station || { name: "Unknown Station" };
  const metrics = reportData?.metrics || {
    received: 0,
    delivered: 0,
    sent: 0,
    atWarehouse: 0,
  };

  return (
    <StationReportClient
      station={station}
      metrics={metrics}
      generatedAt={reportData?.generatedAt || new Date().toISOString()}
      timeframe={timeframe}
    />
  );
}

export default function StationReportPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center text-slate-400">
          Loading station intelligence...
        </div>
      }
    >
      <StationReportPageInner />
    </Suspense>
  );
}
