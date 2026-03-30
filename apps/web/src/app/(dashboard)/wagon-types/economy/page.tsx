import { CargoList } from '@/components/cargo/cargo-list'
import { Panel } from '@/components/dashboard/dashboard-shell'
import { Box } from 'lucide-react'

export default function EconomyWagonPage() {
    return (
        <Panel 
            title="Economy Wagon Cargo" 
            icon={Box} 
            iconColor="text-amber-400"
        >
            <CargoList wagonType="ECONOMY" />
        </Panel>
    )
}
