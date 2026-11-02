import { ParcelStatusPage } from "@/components/parcel/parcel-status-page";

export default function PendingParcelPage() {
  return (
    <ParcelStatusPage
      status={"PENDING"}
      title="Pending requests"
      subtitle="Customer requests waiting for approval."
      icon="pending"
      headline="Waiting for approval"
      emptyText="No requests waiting. New customer requests will show here."
      todayLabel="New today"
      isQueue
    />
  );
}
