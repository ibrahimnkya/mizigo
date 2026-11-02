import { UserList } from "@/components/users/user-list";
import { UserListHeader } from "@/components/users/user-list-header";
import { auth } from "@/auth";
import { redirect } from "next/navigation";

export default async function UserPage() {
  const session = await auth();
  const role = session?.user?.role;

  if (role !== "SUPER_ADMIN" && role !== "ADMIN") {
    redirect("/dashboard");
  }

  return (
    <div className="flex flex-col gap-5">
        <UserListHeader />
        <div className="w-full px-4 sm:px-0 pb-10">
          <UserList />
        </div>
    </div>
  );
}
