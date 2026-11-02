import { ParcelStatusPage } from "@/components/parcel/parcel-status-page";

export default function CancelledParcelPage() {
  return (
    <ParcelStatusPage
      status={"CANCELED"}
      title="Cancelled"
      subtitle="Stopped by the customer or staff."
      icon="cancel"
      headline="Cancelled parcels"
      emptyText="No cancelled parcels."
      todayLabel="Cancelled today"
    />
  );
}
