import { prisma } from "./index.ts";

async function main() {
  const configs = await prisma.systemConfig.findMany({});
  console.log("System Configs:", JSON.stringify(configs, null, 2));
}

main().catch(console.error);
