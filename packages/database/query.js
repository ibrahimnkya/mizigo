import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();
async function main() {
  const roles = await prisma.role.findMany();
  console.log("Roles:", JSON.stringify(roles, null, 2));
  const users = await prisma.user.findMany();
  console.log("Users:", JSON.stringify(users, null, 2));
  await prisma.$disconnect();
}
main().catch(console.error);
