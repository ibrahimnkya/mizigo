import { CargoList } from '@/components/cargo/cargo-list'
import { Panel } from '@/components/dashboard/dashboard-shell'
import { Clock } from 'lucide-react'

export default function DelayedCargoPage() {
    return (
        <Panel 
            title="Delayed Cargo" 
            icon={Clock} 
            iconColor="text-rose-400"
        >
            <CargoList status="DELAYED" />
        </Panel>
    )
}
