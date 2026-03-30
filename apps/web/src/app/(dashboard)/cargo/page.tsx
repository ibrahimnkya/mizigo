import { CargoList } from "@/components/cargo/cargo-list";
import { RefreshTrigger } from "@/components/utils/refresh-trigger";

export default function CargoPage() {
    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <RefreshTrigger interval={30000} />
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">

                {/* Header */}
                <div className="flex flex-col sm:flex-row sm:items-end justify-between gap-4">
                    <div>
                        <div className="flex items-center gap-2 mb-2">
                            <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-indigo-500 bg-indigo-50 px-2.5 py-1 rounded-full">
                                Logistics
                            </span>
                        </div>
                        <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">
                            Cargo Management
                        </h1>
                        <p className="text-sm text-slate-400 font-medium mt-0.5">
                            View and manage all logistics requests across terminal stations.
                        </p>
                    </div>
                </div>

                {/* Table */}
                <CargoList />

            </div>
        </div>
    );
}