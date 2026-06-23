import { fetchSgrStations } from "./src/lib/sgr-client";

async function main() {
  try {
    console.log("Calling SGR API fetchSgrStations()...");
    const stations = await fetchSgrStations();
    console.log(`Successfully fetched ${stations.length} stations from SGR API:`);
    stations.forEach(s => {
      console.log(`- ID: ${s.id} | Code: ${s.code} | Name: ${s.name} | Active: ${s.isActive}`);
    });
  } catch (e: any) {
    console.error("Error fetching from SGR:", e.message);
  }
}

main();
