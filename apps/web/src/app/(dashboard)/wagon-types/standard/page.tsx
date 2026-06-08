import { ParcelList } from "@/components/parcel/parcel-list";
import { Panel } from "@/components/dashboard/dashboard-shell";
import { Box } from "lucide-react";

export default function StandardWagonPage() {
  return (
    <Panel title="Standard Wagon Parcel" icon={Box} iconColor="text-indigo-400">
      <ParcelList wagonType="STANDARD" />
    </Panel>
  );
}
