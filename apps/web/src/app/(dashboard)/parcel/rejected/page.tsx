import { ParcelList } from "@/components/parcel/parcel-list";
import { ReportPageHeader } from "@/components/reports/report-page-header";

export default async function RejectedParcelPage() {
  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto">
        <ReportPageHeader
          title="Terminated Requests"
          subtitle="Archive of parcels rejected or cancelled by the protocol"
          iconName="XCircle"
        />
        <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden">
          <ParcelList status="REJECTED" />
        </div>
      </div>
    </div>
  );
}
