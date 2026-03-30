export {};

declare global {
  namespace Express {
    interface Request {
      requestId?: string;
      user?: {
        id: string;
        role: string;
        permissions: string[];
        organizationId?: string | null;
        stationId?: string | null;
        assignedStation?: { id: string; name: string; code: string } | null;
      };
    }
  }
}
