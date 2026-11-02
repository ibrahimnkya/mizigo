import { ParcelStatusPage } from "@/components/parcel/parcel-status-page";

export default function DelayedParcelPage() {
  return (
    <ParcelStatusPage
      status={"DELAYED"}
      title="Delayed"
      subtitle="Running late and need follow-up."
      icon="lost"
      headline="Delayed parcels"
      emptyText="Nothing is delayed. Good going."
      todayLabel="Flagged today"
      isQueue
    />
  );
}
