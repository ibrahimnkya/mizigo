import "dotenv/config";
console.log("Checking environmental variables for SMS gateway...");
console.log("API_ID exists:", !!process.env.API_ID);
console.log("API_PASSWORD exists:", !!process.env.API_PASSWORD);
console.log("SENDER_ID exists:", !!process.env.SENDER_ID);
console.log("NODE_ENV:", process.env.NODE_ENV);
