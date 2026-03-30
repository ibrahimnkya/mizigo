import { CargoList } from "@/components/cargo/cargo-list";

export default function CompletedCargoPage() {
    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">
                <div>
                    <div className="flex items-center gap-2 mb-2">
                        <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-green-600 bg-green-50 px-2.5 py-1 rounded-full">
                            Completed
                        </span>
                    </div>
                    <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Completed Deliveries</h1>
                    <p className="text-sm text-slate-400 font-medium mt-0.5">Successfully delivered cargo history.</p>
                </div>
                <CargoList status="COMPLETED" />
            </div>
        </div>
    );
}
