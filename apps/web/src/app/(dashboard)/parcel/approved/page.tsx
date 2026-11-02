import { ParcelStatusPage } from "@/components/parcel/parcel-status-page";

export default function ApprovedParcelPage() {
  return (
    <ParcelStatusPage
      status={"APPROVED"}
      title="Approved"
      subtitle="Approved and ready to be received at a station."
      icon="approved"
      headline="Approved parcels"
      emptyText="No approved parcels right now."
      todayLabel="Approved today"
      isQueue
    />
  );
}
