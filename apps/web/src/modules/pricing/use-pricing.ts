import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";

export function usePricingRules(organizationId?: string | null) {
  return useQuery({
    queryKey: ["pricing-rules", organizationId],
    queryFn: async () => {
      const { data } = await api.get("/pricing", {
        params: { organizationId },
      });
      return data.data;
    },
  });
}

export function useCreatePricingRule() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (payload: any) => {
      const { data } = await api.post("/pricing", payload);
      return data.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["pricing-rules"] });
    },
  });
}
export function useUpdatePricingRule() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async ({ id, ...payload }: any) => {
      const { data } = await api.put(`/pricing/${id}`, payload);
      return data.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["pricing-rules"] });
    },
  });
}

export function useDeletePricingRule() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (id: string) => {
      const { data } = await api.delete(`/pricing/${id}`);
      return data.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["pricing-rules"] });
    },
  });
}

export function usePricingTransactions(ruleId: string | null) {
  return useQuery({
    queryKey: ["pricing-transactions", ruleId],
    queryFn: async () => {
      if (!ruleId) return [];
      const { data } = await api.get(`/pricing/${ruleId}/transactions`);
      return data.data || [];
    },
    enabled: !!ruleId,
  });
}

