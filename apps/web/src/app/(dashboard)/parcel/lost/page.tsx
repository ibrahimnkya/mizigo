import { ParcelStatusPage } from "@/components/parcel/parcel-status-page";

export default function LostParcelPage() {
  return (
    <ParcelStatusPage
      status={"LOST"}
      title="Lost"
      subtitle="Can't be located and are under review."
      icon="lost"
      headline="Lost parcels"
      emptyText="No lost parcels. Everything is accounted for."
      todayLabel="Flagged today"
      isQueue
    />
  );
}
