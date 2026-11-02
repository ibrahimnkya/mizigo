import { ParcelStatusPage } from "@/components/parcel/parcel-status-page";

export default function DeliveredParcelPage() {
  return (
    <ParcelStatusPage
      status={"DELIVERED"}
      title="Delivered"
      subtitle="Collected by the receiver with their OTP."
      image="/brand/staff_deliver.png"
      headline="Delivered parcels"
      emptyText="No deliveries yet. Delivered parcels will show here."
      todayLabel="Delivered today"
    />
  );
}
