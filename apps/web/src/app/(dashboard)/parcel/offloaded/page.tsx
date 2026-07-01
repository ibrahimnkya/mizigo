import { ParcelList } from "@/components/parcel/parcel-list";
import { ReportPageHeader } from "@/components/reports/report-page-header";

export default async function OffloadedParcelPage() {
  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto">
        <ReportPageHeader
          title="Offloaded Items"
          subtitle="Parcels at intermediate nodes for sorting and redistribution"
          iconName="Truck"
        />
        <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden">
          <ParcelList status="OFFLOADED" />
        </div>
      </div>
    </div>
  );
}
