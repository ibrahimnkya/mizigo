import { PaymentList } from "@/components/dashboard/payment-list";

export default function PaymentsPage() {
    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">
                <div>
                    <div className="flex items-center gap-2 mb-2">
                        <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-emerald-600 bg-emerald-50 px-2.5 py-1 rounded-full">
                            Financial
                        </span>
                    </div>
                    <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Payment Overview</h1>
                    <p className="text-sm text-slate-400 font-medium mt-0.5">Global transaction monitoring and financial history.</p>
                </div>
                <PaymentList />
            </div>
        </div>
    )
}


