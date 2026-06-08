import { ParcelList } from "@/components/parcel/parcel-list";
import { Panel } from "@/components/dashboard/dashboard-shell";
import { Box } from "lucide-react";

export default function ExpressWagonPage() {
  return (
    <Panel title="Express Wagon Parcel" icon={Box} iconColor="text-emerald-400">
      <ParcelList wagonType="EXPRESS" />
    </Panel>
  );
}
