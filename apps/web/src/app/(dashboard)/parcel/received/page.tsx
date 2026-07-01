import { ParcelList } from "@/components/parcel/parcel-list";
import { ReportPageHeader } from "@/components/reports/report-page-header";

export default async function ReceivedParcelPage() {
  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto">
        <ReportPageHeader
          title="Received Parcels"
          subtitle="Parcels successfully logged into the terminal"
          iconName="Inbox"
        />
        <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden">
          <ParcelList status="RECEIVED" />
        </div>
      </div>
    </div>
  );
}
