import { ReportsDashboard } from "@/components/reports/reports-dashboard";
import { prisma } from "@repo/database";

export default async function ReportsPage() {
  // 1. Station Stats
  const totalStations = await prisma.station.count({
    where: { isActive: true },
  });
  const stationRevenue = await prisma.payment.aggregate({
    _sum: { amount: true },
    where: { status: "SUCCESS" },
  });
  const avgStationRevenue =
    totalStations > 0 ? (stationRevenue._sum.amount || 0) / totalStations : 0;

  const topStationGroupBy = await prisma.parcel.groupBy({
    by: ["originId"],
    _count: true,
    orderBy: { _count: { originId: "desc" } },
    take: 1,
  });
  let topStationName = "N/A";
  const firstTopStation = topStationGroupBy[0];
  if (firstTopStation && firstTopStation.originId) {
    const ts = await prisma.station.findUnique({
      where: { id: firstTopStation.originId },
    });
    topStationName = ts?.name || "N/A";
  }

  // 2. Operator Stats
  const totalOperators = await prisma.user.count({
    where: { role: { name: "OPERATOR" }, isActive: true },
  });
  const totalParcels = await prisma.parcel.count();
  const avgTasks = totalOperators > 0 ? totalParcels / totalOperators : 0;

  // 2.1 Operator Rating (Average Station Rating)
  const avgStationRating = await prisma.station.aggregate({
    _avg: { rating: true },
  });
  const operatorRating = `${(avgStationRating._avg.rating || 5.0).toFixed(1)} ★`;

  // 3. Parcel Stats
  const inTransit = await prisma.parcel.count({
    where: { status: "IN_TRANSIT" },
  });
  const delivered = await prisma.parcel.count({
    where: { status: "DELIVERED" },
  });

  // 4. Revenue Stats
  const collectedRevenue = stationRevenue._sum.amount || 0;
  const pendingRevenue = await prisma.payment.aggregate({
    _sum: { amount: true },
    where: { status: "PENDING" },
  });

  // 4.1 Revenue Growth (Last 30 days vs previous 30 days)
  const now = new Date();
  const thirtyDaysAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000);
  const sixtyDaysAgo = new Date(now.getTime() - 60 * 24 * 60 * 60 * 1000);

  const currentPeriodRevenue = await prisma.payment.aggregate({
    _sum: { amount: true },
    where: {
      status: "SUCCESS",
      createdAt: { gte: thirtyDaysAgo },
    },
  });

  const previousPeriodRevenue = await prisma.payment.aggregate({
    _sum: { amount: true },
    where: {
      status: "SUCCESS",
      createdAt: {
        gte: sixtyDaysAgo,
        lt: thirtyDaysAgo,
      },
    },
  });

  const currentRev = currentPeriodRevenue._sum.amount || 0;
  const prevRev = previousPeriodRevenue._sum.amount || 0;
  let growth = "+0%";
  if (prevRev > 0) {
    const pct = ((currentRev - prevRev) / prevRev) * 100;
    growth = `${pct >= 0 ? "+" : ""}${pct.toFixed(0)}%`;
  } else if (currentRev > 0) {
    growth = "+100%";
  }

  // 5. Org Stats
  const totalStaff = await prisma.user.count({ where: { isActive: true } });
  const efficiency = totalParcels > 0 ? (delivered / totalParcels) * 100 : 0;

  // 6. Turnaround Time
  const deliveredParcelsList = await prisma.parcel.findMany({
    where: { status: "DELIVERED" },
    select: { createdAt: true, updatedAt: true },
  });
  let avgTurnaround = "0 Days";
  let fastestTurnaround = "0h";
  if (deliveredParcelsList.length > 0) {
    let totalDuration = 0;
    let minDuration = Infinity;
    deliveredParcelsList.forEach((p) => {
      const duration = p.updatedAt.getTime() - p.createdAt.getTime();
      totalDuration += duration;
      if (duration < minDuration) {
        minDuration = duration;
      }
    });
    const avgMs = totalDuration / deliveredParcelsList.length;
    const avgDays = avgMs / (24 * 60 * 60 * 1000);
    avgTurnaround = `${avgDays.toFixed(1)} Days`;

    if (minDuration !== Infinity) {
      const minHours = minDuration / (60 * 60 * 1000);
      if (minHours < 24) {
        fastestTurnaround = `${minHours.toFixed(0)}h`;
      } else {
        fastestTurnaround = `${(minHours / 24).toFixed(0)}d`;
      }
    }
  }

  // 6.1 Delay Rate
  const totalDelayed = await prisma.parcel.count({
    where: { status: "DELAYED" },
  });
  const delayRate = totalParcels > 0 ? ((totalDelayed / totalParcels) * 100).toFixed(1) + "%" : "0%";

  const reportCards = [
    {
      title: "Station Performance",
      description: "Revenue and parcel activity across all stations.",
      href: "/reports/stations",
      iconName: "MapPin",
      tag: "Stations",
      gradient: "from-slate-50/50 to-white",
      iconBg: "bg-blue-50",
      iconColor: "text-blue-500",
      tagBg: "bg-blue-50",
      tagColor: "text-blue-600",
      accentBar: "bg-blue-500",
      descColor: "text-slate-400",
      ctaColor: "text-blue-600",
      borderColor: "border-slate-200/60",
      snapColor: "text-slate-900",
      snapMuted: "text-slate-400",
      snapBorder: "border-slate-100",
      snapshot: [
        { label: "Active", value: totalStations.toString() },
        {
          label: "Avg Rev",
          value: `TSh ${(avgStationRevenue / 1000).toFixed(1)}k`,
        },
        { label: "Top", value: topStationName.split(" ")[0] ?? "N/A" },
      ],
      titleColor: "text-slate-900",
    },
    {
      title: "Staff Performance",
      description: "Staff productivity, tasks handled, and ratings.",
      href: "/reports/operators",
      iconName: "Users",
      tag: "Team",
      gradient: "from-slate-50/50 to-white",
      iconBg: "bg-emerald-50",
      iconColor: "text-emerald-500",
      tagBg: "bg-emerald-50",
      tagColor: "text-emerald-600",
      accentBar: "bg-emerald-500",
      descColor: "text-slate-400",
      ctaColor: "text-emerald-600",
      borderColor: "border-slate-200/60",
      snapColor: "text-slate-900",
      snapMuted: "text-slate-400",
      snapBorder: "border-slate-100",
      snapshot: [
        { label: "Active", value: totalOperators.toString() },
        { label: "Avg Tasks", value: avgTasks.toFixed(0) },
        { label: "Rating", value: operatorRating },
      ],
      titleColor: "text-slate-900",
    },
    {
      title: "Parcel Reports",
      description: "Shipments, weights, and movement across locations.",
      href: "/reports/parcel",
      iconName: "Package2",
      tag: "Parcels",
      gradient: "from-slate-50/50 to-white",
      iconBg: "bg-orange-50",
      iconColor: "text-orange-500",
      tagBg: "bg-orange-50",
      tagColor: "text-orange-600",
      accentBar: "bg-orange-500",
      descColor: "text-slate-400",
      ctaColor: "text-orange-600",
      borderColor: "border-slate-200/60",
      snapColor: "text-slate-900",
      snapMuted: "text-slate-400",
      snapBorder: "border-slate-100",
      snapshot: [
        { label: "Total", value: totalParcels.toLocaleString() },
        { label: "In Transit", value: inTransit.toString() },
        { label: "Delivered", value: delivered.toString() },
      ],
      titleColor: "text-slate-900",
    },
    {
      title: "Revenue Overview",
      description: "Earnings, collections, and financial performance.",
      href: "/reports/revenue",
      iconName: "TrendingUp",
      tag: "Finance",
      gradient: "from-slate-50/50 to-white",
      iconBg: "bg-violet-50",
      iconColor: "text-violet-500",
      tagBg: "bg-violet-50",
      tagColor: "text-violet-600",
      accentBar: "bg-violet-500",
      descColor: "text-slate-400",
      ctaColor: "text-violet-600",
      borderColor: "border-slate-200/60",
      snapColor: "text-slate-900",
      snapMuted: "text-slate-400",
      snapBorder: "border-slate-100",
      snapshot: [
        {
          label: "Collected",
          value: `TSh ${(collectedRevenue / 1000).toFixed(1)}k`,
        },
        {
          label: "Pending",
          value: `TSh ${((pendingRevenue._sum.amount || 0) / 1000).toFixed(1)}k`,
        },
        { label: "Growth", value: growth },
      ],
      titleColor: "text-slate-900",
    },
    {
      title: "Organization Overview",
      description: "Complete performance summary across your org.",
      href: "/reports/admin/overview",
      iconName: "Building2",
      tag: "Overview",
      gradient: "from-slate-50/50 to-white",
      iconBg: "bg-cyan-50",
      iconColor: "text-cyan-500",
      tagBg: "bg-cyan-50",
      tagColor: "text-cyan-600",
      accentBar: "bg-cyan-500",
      descColor: "text-slate-400",
      ctaColor: "text-cyan-600",
      borderColor: "border-slate-200/60",
      snapColor: "text-slate-900",
      snapMuted: "text-slate-400",
      snapBorder: "border-slate-100",
      snapshot: [
        { label: "Branches", value: totalStations.toString() },
        { label: "Staff", value: totalStaff.toString() },
        { label: "Success", value: `${efficiency.toFixed(0)}%` },
      ],
      titleColor: "text-slate-900",
    },
    {
      title: "Turnaround Time",
      description: "How fast parcels move from intake to delivery.",
      href: "/reports/turnaround",
      iconName: "Timer",
      tag: "Efficiency",
      gradient: "from-slate-50/50 to-white",
      iconBg: "bg-amber-50",
      iconColor: "text-amber-500",
      tagBg: "bg-amber-50",
      tagColor: "text-amber-600",
      accentBar: "bg-amber-500",
      descColor: "text-slate-400",
      ctaColor: "text-amber-600",
      borderColor: "border-slate-200/60",
      snapColor: "text-slate-900",
      snapMuted: "text-slate-400",
      snapBorder: "border-slate-100",
      snapshot: [
        { label: "Avg Time", value: avgTurnaround },
        { label: "Fastest", value: fastestTurnaround },
        { label: "Delay Rate", value: delayRate },
      ],
      titleColor: "text-slate-900",
    },
  ];

  return <ReportsDashboard initialData={reportCards} />;
}
