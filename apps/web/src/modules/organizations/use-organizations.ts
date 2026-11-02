import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { toast } from "sonner";

export function useOrganizations() {
  return useQuery({
    queryKey: ["organizations"],
    queryFn: async () => {
      const response = await api.get("/organizations?includeInactive=true");
      return response.data.data || response.data;
    },
  });
}

export function useCreateOrganization() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (payload: any) => {
      const response = await api.post("/organizations", payload);
      return response.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["organizations"] });
      toast.success("Organization registered successfully");
    },
    onError: (error: any) => {
      toast.error(
        error.response?.data?.error?.message ||
          error.message ||
          "Failed to create organization",
      );
    },
  });
}

export function useUpdateOrganization() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async ({ id, ...payload }: any) => {
      const response = await api.put(`/organizations/${id}`, payload);
      return response.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["organizations"] });
      toast.success("Organization updated successfully");
    },
    onError: (error: any) => {
      toast.error(
        error.response?.data?.error?.message ||
          error.message ||
          "Failed to update organization",
      );
    },
  });
}

export interface OrganizationBranding {
  id?: string;
  name?: string;
  slug?: string | null;
  logoUrl?: string | null;
  faviconUrl?: string | null;
  primaryColor?: string | null;
  secondaryColor?: string | null;
}

export function useOrganizationBranding(enabled: boolean = true) {
  return useQuery({
    queryKey: ["organization-branding"],
    queryFn: async (): Promise<OrganizationBranding> => {
      const response = await api.get("/organizations/branding");
      return response.data.data || response.data;
    },
    enabled,
    staleTime: 5 * 60 * 1000,
    retry: false,
  });
}

export function useUpdateOrganizationBranding() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (payload: OrganizationBranding) => {
      const response = await api.put("/organizations/branding", payload);
      return response.data.data || response.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["organization-branding"] });
      toast.success("Branding updated successfully");
    },
    onError: (error: any) => {
      toast.error(
        error.response?.data?.error?.message ||
          error.message ||
          "Failed to update branding",
      );
    },
  });
}
