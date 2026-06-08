import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";

export function useParcelList(filters?: any) {
  return useQuery({
    queryKey: ["parcel", filters],
    queryFn: async () => {
      const { data } = await api.get("/parcel", { params: filters });
      return data.data;
    },
  });
}

export function useCreateParcel() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (payload: any) => {
      const { data } = await api.post("/parcel/receive", payload);
      return data.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["parcel"] });
    },
  });
}

export function useUpdateParcelStatus() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async ({
      id,
      status,
      ...rest
    }: {
      id: string;
      status: string;
      [key: string]: any;
    }) => {
      const { data } = await api.put(`/parcel/${id}`, { status, ...rest });
      return data.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["parcel"] });
    },
  });
}

export function useDeliverParcel() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async ({ id, otp }: { id: string; otp: string }) => {
      const { data } = await api.post(`/parcel/${id}/deliver`, { otp });
      return data.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["parcel"] });
    },
  });
}
