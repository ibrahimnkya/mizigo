import { notFound } from "next/navigation";
import { prisma } from "@repo/database";
import { auth } from "@/auth";
import { ParcelDetailPanel } from "@/components/parcel/parcel-detail-panel";

async function getParcel(id: string) {
  return prisma.parcel.findUnique({
    where: { id },
    include: {
      user: { select: { name: true, email: true, phone: true } },
      approvedBy: { select: { name: true, email: true } },
      payment: true,
    },
  });
}

export default async function ParcelDetailPage({
  params,
  searchParams,
}: {
  params: Promise<{ id: string }>;
  searchParams: Promise<{ tab?: string }>;
}) {
  const session = await auth();
  if (!session?.user) return notFound();

  const { id } = await params;
  const { tab } = await searchParams;
  const parcel = await getParcel(id);

  if (!parcel) return notFound();

  // ParcelDetailPanel owns its own page shell (bg, padding, header)
  return (
    <ParcelDetailPanel
      parcel={parcel as any}
      defaultTab={tab ?? "details"}
      userRole={session.user.role}
    />
  );
}
