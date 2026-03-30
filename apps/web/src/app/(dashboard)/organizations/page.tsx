import { auth } from "@/auth";
import { redirect } from "next/navigation";
import { OrganizationList } from "@/components/organizations/organization-list";

export default async function OrganizationsPage() {
    const session = await auth();
    
    // Only SUPER_ADMIN allowed
    if (!session?.user || session.user.role !== 'SUPER_ADMIN') {
        redirect("/dashboard");
    }

    return (
        <div className="flex flex-col gap-6 p-6 h-[calc(100vh-64px)] overflow-hidden bg-slate-50/50">
            <div>
                <h1 className="text-2xl font-bold tracking-tight text-slate-900">Organizations</h1>
                <p className="text-sm text-slate-500 mt-1">
                    Manage and register top-level organizations in the platform.
                </p>
            </div>

            <div className="flex-1 bg-white border border-slate-200 shadow-sm rounded-xl overflow-hidden flex flex-col relative w-full h-full min-h-0">
                <OrganizationList />
            </div>
        </div>
    );
}
