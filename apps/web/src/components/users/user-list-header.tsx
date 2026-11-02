"use client";

import { useQuery } from "@tanstack/react-query";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import api from "@/lib/api/client";

const EXPORT_COLUMNS = [
  { header: "Name", key: "name", width: 24 },
  { header: "Email", key: "email", width: 28 },
  { header: "Phone", key: "phone", width: 18 },
  { header: "Role", key: "role.name", width: 16 },
  { header: "Organization", key: "organization.name", width: 22 },
  { header: "Station", key: "station.name", width: 20 },
  { header: "Status", key: "isActive", width: 12 },
];

export function UserListHeader() {
  const { data: users = [] } = useQuery<any[]>({
    queryKey: ["users-export"],
    queryFn: async () => {
      const res = await api.get("/users");
      return res.data.data || res.data || [];
    },
  });

  const exportReady = users.map((u: any) => ({
    ...u,
    isActive: u.isActive ? "Active" : "Inactive",
  }));

  return (
    <ReportPageHeader
      title="User Management"
      subtitle="Manage system users, roles, and account permissions"
      iconName="Users"
      hideBackArrow
      exportData={exportReady}
      exportColumns={EXPORT_COLUMNS}
    />
  );
}
