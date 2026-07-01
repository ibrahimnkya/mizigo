import { ParcelList } from "@/components/parcel/parcel-list";
import { ReportPageHeader } from "@/components/reports/report-page-header";

export default async function LostParcelPage() {
  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto">
        <ReportPageHeader
          title="Lost Parcels"
          subtitle="Anomalies flagged as unlocatable within the network"
          iconName="AlertTriangle"
        />
        <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden">
          <ParcelList status="LOST" />
        </div>
      </div>
    </div>
  );
}
