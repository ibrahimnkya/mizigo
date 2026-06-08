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

  // 5. Org Stats
  const totalStaff = await prisma.user.count({ where: { isActive: true } });
  const efficiency = totalParcels > 0 ? (delivered / totalParcels) * 100 : 0;

  // 6. Turnaround Time
  const avgTurnaround = "1.2 Days";

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
      title: "Operator Performance",
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
        { label: "Rating", value: "4.8 ★" },
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
        { label: "Growth", value: "+12%" },
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
        { label: "Fastest", value: "4h" },
        { label: "Delay Rate", value: "2.1%" },
      ],
      titleColor: "text-slate-900",
    },
  ];

  return <ReportsDashboard initialData={reportCards} />;
}
