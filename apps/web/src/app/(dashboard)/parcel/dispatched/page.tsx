import { ParcelStatusPage } from "@/components/parcel/parcel-status-page";

export default function DispatchedParcelPage() {
  return (
    <ParcelStatusPage
      status={"DISPATCHED"}
      title="Dispatched"
      subtitle="Loaded on the train and on the way."
      image="/brand/3d_send.png"
      headline="On the way"
      emptyText="Nothing on the way right now."
      todayLabel="Dispatched today"
      isQueue
    />
  );
}
