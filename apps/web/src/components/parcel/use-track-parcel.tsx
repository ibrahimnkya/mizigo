"use client";

import { useState } from "react";
import { toast } from "sonner";
import api from "@/lib/api/client";
import { ParcelDetailSheet } from "./parcel-detail-sheet";

/**
 * Look a parcel up by tracking number and show it in the portal's parcel
 * panel (not the public tracking page). Render `sheet` once in the component.
 */
export function useTrackParcel() {
  const [parcel, setParcel] = useState<any | null>(null);
  const [loading, setLoading] = useState(false);

  const track = async (raw: string) => {
    const id = raw.trim().toUpperCase();
    if (!id) return false;
    setLoading(true);
    try {
      const { data } = await api.get(`/parcel/track/${encodeURIComponent(id)}`);
      const found = data?.data?.parcel;
      if (!found?.id) throw new Error("not found");
      setParcel({ id: found.id, trackingNumber: found.trackingNumber ?? id, status: found.status });
      return true;
    } catch (e: any) {
      toast.error(e?.response?.status === 404 || e?.message === "not found" ? `No parcel found for ${id}` : "Couldn't look up that parcel");
      return false;
    } finally {
      setLoading(false);
    }
  };

  const sheet = <ParcelDetailSheet parcel={parcel} onClose={() => setParcel(null)} />;
  return { track, loading, sheet };
}
