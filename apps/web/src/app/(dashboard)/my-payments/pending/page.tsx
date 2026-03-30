import { CargoList } from '@/components/cargo/cargo-list'
import { Panel } from '@/components/dashboard/dashboard-shell'
import { CreditCard } from 'lucide-react'

export default function MyPaymentsPendingPage() {
    return (
        <Panel 
            title="To Pay (Awaiting Payment)" 
            icon={CreditCard} 
            iconColor="text-amber-400"
        >
            {/* Shows cargo approved by operator and waiting for payment */}
            <CargoList status="PAYMENT_PENDING" />
        </Panel>
    )
}
