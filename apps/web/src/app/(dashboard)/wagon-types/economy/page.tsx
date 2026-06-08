import { ParcelList } from "@/components/parcel/parcel-list";
import { Panel } from "@/components/dashboard/dashboard-shell";
import { Box } from "lucide-react";

export default function EconomyWagonPage() {
  return (
    <Panel title="Economy Wagon Parcel" icon={Box} iconColor="text-amber-400">
      <ParcelList wagonType="ECONOMY" />
    </Panel>
  );
}
