import { ParcelList } from "@/components/parcel/parcel-list";
import { Panel } from "@/components/dashboard/dashboard-shell";
import { CheckCircle2 } from "lucide-react";

export default function LastmileCompletedPage() {
  return (
    <Panel
      title="Lastmile Completed"
      icon={CheckCircle2}
      iconColor="text-emerald-500"
    >
      <ParcelList status="COMPLETED" />
    </Panel>
  );
}
