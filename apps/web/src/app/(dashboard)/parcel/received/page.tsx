import { ParcelStatusPage } from "@/components/parcel/parcel-status-page";

export default function ReceivedParcelPage() {
  return (
    <ParcelStatusPage
      status={"RECEIVED"}
      title="Received"
      subtitle="Logged at the counter and waiting to be dispatched."
      image="/brand/staff_receive.png"
      headline="Waiting to be dispatched"
      emptyText="All caught up. Nothing is waiting to be dispatched."
      todayLabel="Received today"
      isQueue
    />
  );
}
