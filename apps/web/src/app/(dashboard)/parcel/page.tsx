import { ParcelDashboard } from "@/components/parcel/parcel-dashboard";
import { prisma } from "@repo/database";

async function getStatusCounts() {
  const counts = await prisma.parcel.groupBy({
    by: ["status"],
    _count: true,
  });

  const stats: Record<string, number> = {};
  counts.forEach((c) => {
    stats[c.status] = c._count;
  });
  return stats;
}

export default async function ParcelPage() {
  const stats = await getStatusCounts();

  const parcelCards = [
    {
      title: "Received Parcels",
      description:
        "Shipments successfully logged into the terminal node for processing.",
      href: "/parcel/received",
      iconName: "Inbox",
      tag: "Incoming",
      iconBg: "bg-blue-50",
      iconColor: "text-blue-600",
      tagBg: "bg-blue-50",
      tagColor: "text-blue-700",
      accentBar: "bg-blue-600",
      descColor: "text-slate-500",
      ctaColor: "text-blue-600",
      borderColor: "border-slate-100",
      snapColor: "text-blue-900",
      snapMuted: "text-blue-300",
      snapBorder: "border-blue-50",
      titleColor: "text-slate-900",
      snapshot: [
        { label: "Active", value: stats.RECEIVED || 0 },
        { label: "Queue", value: "12" },
        { label: "Trend", value: "+14%" },
      ],
    },
    {
      title: "Dispatched Loads",
      description:
        "Shipments currently assigned to outbound transit vehicles and drivers.",
      href: "/parcel/dispatched",
      iconName: "LogOut",
      tag: "Outbound",
      iconBg: "bg-indigo-50",
      iconColor: "text-indigo-600",
      tagBg: "bg-indigo-50",
      tagColor: "text-indigo-700",
      accentBar: "bg-indigo-600",
      descColor: "text-slate-500",
      ctaColor: "text-indigo-600",
      borderColor: "border-slate-100",
      snapColor: "text-indigo-900",
      snapMuted: "text-indigo-300",
      snapBorder: "border-indigo-50",
      titleColor: "text-slate-900",
      snapshot: [
        { label: "In Transit", value: stats.DISPATCHED || 0 },
        { label: "Active", value: "8" },
        { label: "ETA", value: "Avg 4h" },
      ],
    },
    {
      title: "Offloaded Items",
      description:
        "Shipments reaching intermediate nodes for sorting and redistribution.",
      href: "/parcel/offloaded",
      iconName: "Truck",
      tag: "Processing",
      iconBg: "bg-amber-50",
      iconColor: "text-amber-600",
      tagBg: "bg-amber-50",
      tagColor: "text-amber-700",
      accentBar: "bg-amber-600",
      descColor: "text-slate-500",
      ctaColor: "text-amber-600",
      borderColor: "border-slate-100",
      snapColor: "text-amber-900",
      snapMuted: "text-amber-300",
      snapBorder: "border-amber-50",
      titleColor: "text-slate-900",
      snapshot: [
        { label: "Sorting", value: stats.OFFLOADED || 0 },
        { label: "Efficiency", value: "98%" },
        { label: "Load", value: "Normal" },
      ],
    },
    {
      title: "Delivered Final",
      description:
        "Successfully reached target destination with secured OTP verification.",
      href: "/parcel/delivered",
      iconName: "CheckCircle2",
      tag: "Completed",
      iconBg: "bg-emerald-50",
      iconColor: "text-emerald-600",
      tagBg: "bg-emerald-50",
      tagColor: "text-emerald-700",
      accentBar: "bg-emerald-600",
      descColor: "text-slate-500",
      ctaColor: "text-emerald-600",
      borderColor: "border-slate-100",
      snapColor: "text-emerald-900",
      snapMuted: "text-emerald-300",
      snapBorder: "border-emerald-50",
      titleColor: "text-slate-900",
      snapshot: [
        { label: "Success", value: stats.DELIVERED || 0 },
        { label: "Rating", value: "4.9/5" },
        { label: "Speed", value: "2.4d" },
      ],
    },
    {
      title: "Cancelled Requests",
      description:
        "Shipments terminated by the user or system operational protocol.",
      href: "/parcel/cancelled",
      iconName: "XCircle",
      tag: "Terminated",
      iconBg: "bg-slate-50",
      iconColor: "text-slate-500",
      tagBg: "bg-slate-50",
      tagColor: "text-slate-700",
      accentBar: "bg-slate-600",
      descColor: "text-slate-500",
      ctaColor: "text-slate-600",
      borderColor: "border-slate-100",
      snapColor: "text-slate-900",
      snapMuted: "text-slate-300",
      snapBorder: "border-slate-50",
      titleColor: "text-slate-900",
      snapshot: [
        { label: "Count", value: stats.CANCELED || 0 },
        { label: "Voided", value: "4" },
        { label: "Rate", value: "1.2%" },
      ],
    },
    {
      title: "Lost Shipments",
      description:
        "Anomalies flagged as unlocatable within the global network nodes.",
      href: "/parcel/lost",
      iconName: "AlertTriangle",
      tag: "Anomaly",
      iconBg: "bg-rose-50",
      iconColor: "text-rose-600",
      tagBg: "bg-rose-50",
      tagColor: "text-rose-700",
      accentBar: "bg-rose-600",
      descColor: "text-slate-500",
      ctaColor: "text-rose-600",
      borderColor: "border-slate-100",
      snapColor: "text-rose-900",
      snapMuted: "text-rose-300",
      snapBorder: "border-rose-50",
      titleColor: "text-slate-900",
      snapshot: [
        { label: "Alerts", value: stats.LOST || 0 },
        { label: "Critical", value: "2" },
        { label: "Recovery", value: "In Progress" },
      ],
    },
  ];

  return <ParcelDashboard initialData={parcelCards} />;
}
