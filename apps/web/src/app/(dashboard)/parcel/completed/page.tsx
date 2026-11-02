import { ParcelStatusPage } from "@/components/parcel/parcel-status-page";

export default function CompletedParcelPage() {
  return (
    <ParcelStatusPage
      status={"DELIVERED"}
      title="Delivery history"
      subtitle="Every parcel that reached its receiver."
      image="/brand/staff_deliver.png"
      headline="Delivered parcels"
      emptyText="No deliveries yet. Delivered parcels will show here."
      todayLabel="Delivered today"
    />
  );
}
