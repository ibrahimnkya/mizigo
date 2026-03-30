import { CargoList } from '@/components/cargo/cargo-list'
import { Panel } from '@/components/dashboard/dashboard-shell'
import { CreditCard } from 'lucide-react'

export default function MyPaymentsPayAsYouGoPage() {
    return (
        <Panel 
            title="Pay as You Go (Cash on Delivery)" 
            icon={CreditCard} 
            iconColor="text-indigo-400"
        >
            {/* Sender-pays cargo that has been paid or is awaiting payment */}
            <CargoList receiverPays={false} status={['PAYMENT_PENDING', 'PAID', 'COMPLETED']} />
        </Panel>
    )
}
