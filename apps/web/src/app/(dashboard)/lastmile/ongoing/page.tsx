import { ParcelList } from "@/components/parcel/parcel-list";
import { Panel } from "@/components/dashboard/dashboard-shell";
import { Truck } from "lucide-react";

export default function LastmileOngoingPage() {
  return (
    <Panel title="Lastmile Ongoing" icon={Truck} iconColor="text-indigo-400">
      <ParcelList status="IN_TRANSIT" />
    </Panel>
  );
}
