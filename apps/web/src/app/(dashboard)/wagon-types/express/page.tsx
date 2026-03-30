import { CargoList } from '@/components/cargo/cargo-list'
import { Panel } from '@/components/dashboard/dashboard-shell'
import { Box } from 'lucide-react'

export default function ExpressWagonPage() {
    return (
        <Panel 
            title="Express Wagon Cargo" 
            icon={Box} 
            iconColor="text-emerald-400"
        >
            <CargoList wagonType="EXPRESS" />
        </Panel>
    )
}
