import { CargoList } from '@/components/cargo/cargo-list'
import { Panel } from '@/components/dashboard/dashboard-shell'
import { CheckCircle2 } from 'lucide-react'

export default function LastmileCompletedPage() {
    return (
        <Panel 
            title="Lastmile Completed" 
            icon={CheckCircle2} 
            iconColor="text-emerald-500"
        >
            <CargoList status="COMPLETED" />
        </Panel>
    )
}
