import { ParcelStatusPage } from "@/components/parcel/parcel-status-page";

export default function RejectedParcelPage() {
  return (
    <ParcelStatusPage
      status={"REJECTED"}
      title="Rejected"
      subtitle="Requests that were turned down."
      icon="cancel"
      headline="Rejected requests"
      emptyText="No rejected requests."
      todayLabel="Rejected today"
    />
  );
}
