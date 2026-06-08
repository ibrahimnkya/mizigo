import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { toast } from "sonner";

export function useStations() {
  return useQuery({
    queryKey: ["stations"],
    queryFn: async () => {
      const { data } = await api.get("/stations");
      return data.data;
    },
  });
}

export function useCreateStation() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (payload: any) => {
      const { data } = await api.post("/stations", payload);
      return data.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["stations"] });
      toast.success("Station registered successfully");
    },
    onError: (error: any) => {
      toast.error(
        error.response?.data?.error ||
          error.message ||
          "Failed to create station",
      );
    },
  });
}

export function useUpdateStation() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async ({ id, ...payload }: any) => {
      const { data } = await api.put(`/stations/${id}`, payload);
      return data.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["stations"] });
      toast.success("Station updated successfully");
    },
    onError: (error: any) => {
      toast.error(
        error.response?.data?.error ||
          error.message ||
          "Failed to update station",
      );
    },
  });
}
