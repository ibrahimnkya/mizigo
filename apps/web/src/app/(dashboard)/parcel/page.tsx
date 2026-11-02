import { ParcelDashboard, type ParcelCardData } from "@/components/parcel/parcel-dashboard";
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

  const parcelCards: ParcelCardData[] = [
    {
      key: "received",
      title: "Received",
      description: "Logged at the counter and waiting to be dispatched.",
      href: "/parcel/received",
      image: "/brand/staff_receive.png",
      tone: "maroon",
      count: stats.RECEIVED || 0,
      snapshot: [
        { label: "Pending requests", value: pendingCount },
        { label: "vs last 7 days", value: receivedTrend },
      ],
    },
    {
      key: "dispatched",
      title: "Dispatched",
      description: "Loaded on the train and on the way.",
      href: "/parcel/dispatched",
      image: "/brand/3d_send.png",
      tone: "orange",
      count: (stats.DISPATCHED || 0) + inTransitCount,
      snapshot: [
        { label: "In transit", value: inTransitCount },
        { label: "Avg. trip", value: avgTransitHours },
      ],
    },
    {
      key: "offloaded",
      title: "Offloaded",
      description: "Arrived at the destination station.",
      href: "/parcel/offloaded",
      image: "/brand/staff_parcel.png",
      tone: "amber",
      count: stats.OFFLOADED || 0,
      snapshot: [
        { label: "Network load", value: loadStatus },
        { label: "Not lost", value: offloadEfficiency },
      ],
    },
    {
      key: "delivered",
      title: "Delivered",
      description: "Collected by the receiver with their OTP.",
      href: "/parcel/delivered",
      image: "/brand/staff_deliver.png",
      tone: "green",
      count: stats.DELIVERED || 0,
      snapshot: [
        { label: "Avg. delivery", value: avgSpeedStr },
        { label: "Station rating", value: deliveredRating },
      ],
    },
    {
      key: "cancelled",
      title: "Cancelled",
      description: "Stopped by the customer or staff.",
      href: "/parcel/cancelled",
      icon: "cancel",
      tone: "neutral",
      count: cancelledCount,
      snapshot: [
        { label: "Unpaid", value: voidedCount },
        { label: "Of all parcels", value: cancellationRate },
      ],
    },
    {
      key: "lost",
      title: "Lost",
      description: "Can't be located and are under review.",
      href: "/parcel/lost",
      icon: "lost",
      tone: "red",
      count: stats.LOST || 0,
      snapshot: [
        { label: "Urgent or fragile", value: criticalLost },
        { label: "Status", value: recoveryStatus },
      ],
    },
  ];

  const summary = {
    total: totalParcelsCount,
    active: activeParcelsCount,
    delivered: stats.DELIVERED || 0,
    received: stats.RECEIVED || 0,
    inTransit: (stats.DISPATCHED || 0) + inTransitCount,
    atStation: (stats.OFFLOADED || 0) + (stats.AT_STATION || 0),
  };

  return <ParcelDashboard cards={parcelCards} summary={summary} />;
}
