import "dotenv/config";
const port = process.env.PORT || 3001;
import { createApp } from "./app";

const app = createApp();

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
