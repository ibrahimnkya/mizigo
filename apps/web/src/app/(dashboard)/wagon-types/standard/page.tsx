import { CargoList } from '@/components/cargo/cargo-list'
import { Panel } from '@/components/dashboard/dashboard-shell'
import { Box } from 'lucide-react'

export default function StandardWagonPage() {
    return (
        <Panel 
            title="Standard Wagon Cargo" 
            icon={Box} 
            iconColor="text-indigo-400"
        >
            <CargoList wagonType="STANDARD" />
        </Panel>
    )
}
