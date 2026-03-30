import express from "express";
import cors from "cors";
import cargoRouter from "./routes/cargo";
import authRouter from "./routes/auth";
import rolesRouter from "./routes/roles";
import permissionsRouter from "./routes/permissions";
import { requestContext } from "./middleware/request-context";
import { globalErrorHandler, notFoundHandler } from "./middleware/error-handler";
import { sendSuccess } from "./lib/api-response";

const app = express();
const port = process.env.PORT || 3001;
const API_PREFIX = "/api/v1";

app.use(cors());
app.use(express.json());
app.use(requestContext);

app.get("/", (_req, res) => {
  return sendSuccess(res, {
    service: "mizigo-api",
    version: "v1",
    status: "ok",
  });
});

app.get(`${API_PREFIX}/health`, (_req, res) => {
  return sendSuccess(res, {
    status: "ok",
    service: "mizigo-api",
    version: "v1",
  });
});

app.use(`${API_PREFIX}/cargo`, cargoRouter);
app.use(`${API_PREFIX}/auth`, authRouter);
app.use(`${API_PREFIX}/roles`, rolesRouter);
app.use(`${API_PREFIX}/permissions`, permissionsRouter);

app.use(notFoundHandler);
app.use(globalErrorHandler);

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
