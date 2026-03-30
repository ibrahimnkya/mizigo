import { UserListContent } from "@/components/users/user-list-content";
import { auth } from "@/auth";
import { headers } from "next/headers";

async function getUsers() {
    const base = process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000";
    const res = await fetch(`${base}/api/users`, { 
        cache: "no-store",
        headers: await headers()
    });
    if (!res.ok) {
        const text = await res.text();
        console.error("Fetch users error:", res.status, text);
        throw new Error("Failed to fetch users");
    }
    return res.json();
}

export async function UserList() {
    const session = await auth();
    const currentUserRole = session?.user?.role || "USER";
    
    let users: any[] = [];
    try { 
        users = await getUsers() 
    } catch (e: any) { 
        console.error("Failed to fetch users", e.message) 
    }
    
    return <UserListContent users={users} currentUserRole={currentUserRole} />
}