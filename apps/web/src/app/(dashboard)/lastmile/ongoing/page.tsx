import { CargoList } from '@/components/cargo/cargo-list'
import { Panel } from '@/components/dashboard/dashboard-shell'
import { Truck } from 'lucide-react'

export default function LastmileOngoingPage() {
    return (
        <Panel 
            title="Lastmile Ongoing" 
            icon={Truck} 
            iconColor="text-indigo-400"
        >
            <CargoList status="IN_TRANSIT" />
        </Panel>
    )
}
