import { ParcelList } from "@/components/parcel/parcel-list";
import { Panel } from "@/components/dashboard/dashboard-shell";
import { CreditCard } from "lucide-react";

export default function MyPaymentsPayAsYouGoPage() {
  return (
    <Panel
      title="Pay as You Go (Cash on Delivery)"
      icon={CreditCard}
      iconColor="text-indigo-400"
    >
      {/* Sender-pays parcel that has been paid or is awaiting payment */}
      <ParcelList
        receiverPays={false}
        status={["PAYMENT_PENDING", "PAID", "COMPLETED"]}
      />
    </Panel>
  );
}
