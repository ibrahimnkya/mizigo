"use client";

import { Suspense } from "react";
import { FleetView } from "@/components/fleet/fleet-view";

export default function FleetPage() {
  return (
    <Suspense fallback={<div className="h-40 animate-pulse rounded-[24px] bg-slate-100" />}>
      <FleetView />
    </Suspense>
  );
}
