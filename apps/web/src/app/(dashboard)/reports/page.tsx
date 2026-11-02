"use client";

import Link from "next/link";
import { Clock, MapPin, Package, Users, Wallet } from "lucide-react";
import { ReportPageHeader } from "@/components/reports/report-page-header";

const REPORTS = [
  { title: "Parcels", text: "Every parcel by station, status and dates", tag: "Station filter", href: "/reports/parcel", icon: Package },
  { title: "Stations", text: "Parcels and revenue for each station", tag: "Compare", href: "/reports/stations", icon: MapPin },
  { title: "Revenue", text: "Money collected by day, week or month", tag: "Chart", href: "/reports/revenue", icon: Wallet },
  { title: "Staff", text: "Parcels each person received, sent and delivered", tag: "Workload", href: "/reports/operators", icon: Users },
  { title: "Turnaround time", text: "How long parcels take from drop-off to pickup", tag: "Speed", href: "/reports/turnaround", icon: Clock },
];

export default function ReportsPage() {
  return (
    <div className="flex flex-col gap-5 pb-4">
      <ReportPageHeader
        title="Reports"
        subtitle="Filter by station and dates, then export to Excel or PDF"
        iconName="FileBarChart2"
        hideBackArrow
      />

      <section className="overflow-hidden rounded-[24px] border border-[#E2E2E2] bg-white">
        <div className="border-b border-slate-100 px-5 py-4">
          <h2 className="text-[17px] font-semibold text-[#1C1C1E]">All reports</h2>
          <p className="text-[13px] text-slate-500">{REPORTS.length} reports</p>
        </div>
        <div className="grid gap-4 p-5 sm:grid-cols-2 xl:grid-cols-3">
          {REPORTS.map((r) => (
            <Link
              key={r.href}
              href={r.href}
              className="group flex flex-col rounded-[24px] border border-[#E2E2E2] bg-white p-5 transition hover:border-orange-300 hover:shadow-premium"
            >
              <div className="flex items-start justify-between">
                <span className="flex h-12 w-12 items-center justify-center rounded-2xl bg-orange-50">
                  <r.icon size={22} className="text-orange-500" />
                </span>
                <span className="rounded-full bg-orange-500 px-2.5 py-0.5 text-[12px] font-semibold text-white">{r.tag}</span>
              </div>
              <p className="mt-4 text-[16px] font-semibold text-[#1C1C1E]">{r.title}</p>
              <p className="mt-0.5 text-[13px] text-slate-500">{r.text}</p>
              <p className="mt-3 text-[12px] text-slate-400 transition group-hover:text-orange-600">Open report →</p>
            </Link>
          ))}
        </div>
      </section>
    </div>
  );
}
