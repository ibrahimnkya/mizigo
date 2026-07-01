import { ParcelList } from "@/components/parcel/parcel-list";
import { ReportPageHeader } from "@/components/reports/report-page-header";

export default async function DispatchedParcelPage() {
  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto">
        <ReportPageHeader
          title="Dispatched Loads"
          subtitle="Parcels assigned to outbound transit vehicles"
          iconName="LogOut"
        />
        <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden">
          <ParcelList status="DISPATCHED" />
        </div>
      </div>
    </div>
  );
}
