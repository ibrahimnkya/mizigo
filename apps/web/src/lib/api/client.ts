import axios from "axios";
import { getSession } from "next-auth/react";
import { useUIStore } from "@/store/ui-store";

const api = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_URL || "http://localhost:3001/api/v1",
  headers: {
    "Content-Type": "application/json",
  },
});

// Interceptor to add auth token if existing
api.interceptors.request.use(
  async (config) => {
    // Client-side session retrieval
    if (typeof window !== "undefined") {
      const session = await getSession();
      const token = (session?.user as any)?.token;

      if (token) {
        config.headers.Authorization = `Bearer ${token}`;
      }
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  },
);

// Interceptor to handle unauthorized responses
api.interceptors.response.use(
  (response) => response,
  (error) => {
    const errorData = error.response?.data;

    // Check for UNAUTHORIZED error code or 401 status
    if (
      error.response?.status === 401 ||
      errorData?.error?.code === "UNAUTHORIZED" ||
      errorData?.message?.includes("UNAUTHORIZED")
    ) {
      // Trigger the lock screen globally
      if (typeof window !== "undefined") {
        useUIStore.getState().setLocked(true);
      }
    }

    return Promise.reject(error);
  },
);

export default api;
