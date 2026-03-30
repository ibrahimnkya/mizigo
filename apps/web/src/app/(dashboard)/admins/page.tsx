import { UserList } from "@/components/users/user-list";
import { auth } from "@/auth";
import { redirect } from "next/navigation";

export default async function AdminsPage() {
    const session = await auth();
    if (session?.user?.role !== 'SUPER_ADMIN') {
        redirect("/dashboard");
    }

    return (
        <div className="min-h-screen bg-[#f8f9fb]">
            <div className="max-w-[1520px] mx-auto px-6 lg:px-10 py-10 flex flex-col gap-8">
                <div>
                    <div className="flex items-center gap-2 mb-2">
                        <span className="text-[10px] font-extrabold uppercase tracking-[0.18em] text-slate-600 bg-slate-100 px-2.5 py-1 rounded-full">
                            Security
                        </span>
                    </div>
                    <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">Admin Management</h1>
                    <p className="text-sm text-slate-400 font-medium mt-0.5">Manage operator accounts and security permissions.</p>
                </div>
                <UserList />
            </div>
        </div>
    )
}