import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";
import { toast } from "sonner";

export function useFleet() {
  return useQuery({
    queryKey: ["fleet-registry"],
    queryFn: async () => {
      const { data } = await api.get("/fleet");
      return data.data || data;
    },
  });
}

export function useCreateVehicle() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (payload: any) => {
      const { data } = await api.post("/fleet", payload);
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["fleet-registry"] });
      toast.success("Vehicle registered successfully");
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error || "Failed to register vehicle");
    },
  });
}

export function useUpdateVehicle() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (payload: any) => {
      const { data } = await api.patch("/fleet", payload);
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["fleet-registry"] });
      toast.success("Vehicle updated successfully");
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error || "Failed to update vehicle");
    },
  });
}

export function useDeleteVehicle() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (id: string) => {
      await api.delete(`/fleet?id=${id}`);
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["fleet-registry"] });
      toast.success("Vehicle removed from fleet");
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error || "Failed to remove vehicle");
    },
  });
}
