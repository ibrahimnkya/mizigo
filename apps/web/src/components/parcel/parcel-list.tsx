import { prisma } from "@repo/database";
import { auth } from "@/auth";
import { ParcelAdminTable, type ParcelItem } from "./parcel-admin-table";

async function getParcels(filters: {
  status?: string | string[];
  startDate?: string;
  endDate?: string;
  receiverPays?: boolean;
  wagonType?: string;
}): Promise<ParcelItem[]> {
  const session = await auth();
  const isAdmin =
    session?.user?.role === "ADMIN" ||
    session?.user?.role === "SUPER_ADMIN" ||
    session?.user?.role === "OPERATOR";
  const userId = session?.user?.id;

  const where: any = {};
  if (filters.status) {
    if (Array.isArray(filters.status)) {
      where.status = { in: filters.status };
    } else {
      where.status = filters.status;
    }
  }

  if (filters.receiverPays !== undefined) {
    where.receiverPays = filters.receiverPays;
  }

  if (filters.wagonType !== undefined) {
    where.wagonType = filters.wagonType;
  }

  if (filters.startDate || filters.endDate) {
    where.createdAt = {};
    if (filters.startDate) where.createdAt.gte = new Date(filters.startDate);
    if (filters.endDate) where.createdAt.lte = new Date(filters.endDate);
  }

  // Regular users only see their own parcels
  if (!isAdmin && userId) {
    where.userId = userId;
  }

  const isSuperAdmin = session?.user?.role === "SUPER_ADMIN";
  const organizationId = (session?.user as any)?.organizationId;
  if (!isSuperAdmin && organizationId) {
    where.organizationId = organizationId;
  }

  try {
    const parcels = await (prisma.parcel as any).findMany({
      where,
      orderBy: { createdAt: "desc" },
      include: {
        user: {
          select: { name: true, email: true, phone: true },
        },
        origin: {
          select: { id: true, name: true },
        },
        destination: {
          select: { id: true, name: true },
        },
        organization: {
          select: { id: true, name: true },
        },
      },
    });

    return parcels.map((item: any) => ({
      id: item.id,
      fromAddress: item.origin?.name ?? item.fromAddress,
      toAddress: item.destination?.name ?? item.toAddress,
      serviceType: item.serviceType,
      parcelType: item.parcelType,
      parcelSize: item.parcelSize,
      condition: (item as any).condition ?? null,
      urgency: (item as any).urgency ?? null,
      status: item.status as string,
      wagonType: item.wagonType,
      amount: item.amount,
      receiverName: item.receiverName,
      receiverPhone: item.receiverPhone,
      peopleNeeded: item.peopleNeeded,
      createdAt: item.createdAt.toISOString(),
      user: item.user,
      payment: null,
      organization: item.organization,
      origin: item.origin,
      destination: item.destination,
    })) as ParcelItem[];
  } catch (error) {
    console.error("[ParcelList] Database query failed:", error);
    return [];
  }
}

export async function ParcelList(filters: {
  status?: string | string[];
  startDate?: string;
  endDate?: string;
  receiverPays?: boolean;
  wagonType?: string;
}) {
  const items = await getParcels(filters);

  return <ParcelAdminTable initialItems={items} />;
}
