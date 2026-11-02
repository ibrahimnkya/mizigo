import { ParcelStatusPage } from "@/components/parcel/parcel-status-page";

export default function OffloadedParcelPage() {
  return (
    <ParcelStatusPage
      status={"OFFLOADED"}
      title="Offloaded"
      subtitle="Arrived at the destination station, waiting for pickup."
      image="/brand/staff_parcel.png"
      headline="Waiting for pickup"
      emptyText="No parcels waiting for pickup."
      todayLabel="Offloaded today"
      isQueue
    />
  );
}
