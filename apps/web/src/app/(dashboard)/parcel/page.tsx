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

  // 1. Received Parcels
  const pendingCount = await prisma.parcel.count({
    where: { status: "PENDING" },
  });

  const now = new Date();
  const sevenDaysAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
  const fourteenDaysAgo = new Date(now.getTime() - 14 * 24 * 60 * 60 * 1000);

  const currentPeriodReceived = await prisma.parcel.count({
    where: {
      status: "RECEIVED",
      createdAt: { gte: sevenDaysAgo },
    },
  });

  const previousPeriodReceived = await prisma.parcel.count({
    where: {
      status: "RECEIVED",
      createdAt: {
        gte: fourteenDaysAgo,
        lt: sevenDaysAgo,
      },
    },
  });

  let receivedTrend = "+0%";
  if (previousPeriodReceived > 0) {
    const pct = ((currentPeriodReceived - previousPeriodReceived) / previousPeriodReceived) * 100;
    receivedTrend = `${pct >= 0 ? "+" : ""}${pct.toFixed(0)}%`;
  } else if (currentPeriodReceived > 0) {
    receivedTrend = "+100%";
  }

  // 2. Dispatched Loads & Delivered Final
  const inTransitCount = await prisma.parcel.count({
    where: { status: "IN_TRANSIT" },
  });

  const deliveredParcelsList = await prisma.parcel.findMany({
    where: { status: "DELIVERED" },
    select: { createdAt: true, updatedAt: true },
  });
  let avgTransitHours = "4h";
  let avgSpeedStr = "2.4d";
  if (deliveredParcelsList.length > 0) {
    let totalDuration = 0;
    deliveredParcelsList.forEach((p) => {
      totalDuration += p.updatedAt.getTime() - p.createdAt.getTime();
    });
    const avgMs = totalDuration / deliveredParcelsList.length;
    const avgHours = avgMs / (60 * 60 * 1000);
    avgTransitHours = avgHours < 24 ? `${avgHours.toFixed(0)}h` : `${(avgHours / 24).toFixed(1)}d`;
    avgSpeedStr = `${(avgHours / 24).toFixed(1)}d`;
  }

  // 3. Offloaded Items
  const totalParcelsCount = await prisma.parcel.count();
  const totalLost = stats.LOST || 0;
  const offloadEfficiencyVal = totalParcelsCount > 0 ? ((totalParcelsCount - totalLost) / totalParcelsCount) * 100 : 100;
  const offloadEfficiency = `${offloadEfficiencyVal.toFixed(0)}%`;

  const activeParcelsCount = await prisma.parcel.count({
    where: {
      status: {
        in: ["RECEIVED", "DISPATCHED", "OFFLOADED", "AT_STATION", "IN_TRANSIT"],
      },
    },
  });
  const loadStatus = activeParcelsCount > 20 ? "High" : activeParcelsCount > 5 ? "Medium" : "Low";

  // 4. Delivered Final Rating
  const avgStationRating = await prisma.station.aggregate({
    _avg: { rating: true },
  });
  const deliveredRatingVal = avgStationRating._avg.rating || 5.0;
  const deliveredRating = `${deliveredRatingVal.toFixed(1)}/5`;

  // 5. Cancelled Requests
  const voidedCount = await prisma.payment.count({
    where: {
      status: { not: "SUCCESS" },
      parcel: { status: "CANCELED" },
    },
  });
  const cancelledCount = stats.CANCELED || 0;
  const cancellationRate = totalParcelsCount > 0 ? ((cancelledCount / totalParcelsCount) * 100).toFixed(1) + "%" : "0%";

  // 6. Lost Shipments
  const criticalLost = await prisma.parcel.count({
    where: {
      status: "LOST",
      OR: [
        { urgency: "High" },
        { isFragile: true },
      ],
    },
  });
  const recoveryStatus = (stats.LOST || 0) > 0 ? "Under Review" : "Clear";

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
        { label: "Queue", value: pendingCount },
        { label: "Trend", value: receivedTrend },
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
        { label: "Active", value: inTransitCount },
        { label: "ETA", value: avgTransitHours },
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
        { label: "Efficiency", value: offloadEfficiency },
        { label: "Load", value: loadStatus },
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
        { label: "Rating", value: deliveredRating },
        { label: "Speed", value: avgSpeedStr },
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
        { label: "Voided", value: voidedCount },
        { label: "Rate", value: cancellationRate },
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
        { label: "Critical", value: criticalLost },
        { label: "Recovery", value: recoveryStatus },
      ],
    },
  ];

  return <ParcelDashboard initialData={parcelCards} />;
}
