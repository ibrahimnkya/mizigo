import express from "express";
import cors from "cors";
import cargoRouter from "./routes/cargo";
import authRouter from "./routes/auth";

const app = express();
const port = process.env.PORT || 3001;

app.use(cors());
app.use(express.json());

app.use("/api/cargo", cargoRouter);
app.use("/api/auth", authRouter);

app.get("/", (req, res) => {
    res.json({ message: "Hello from Mizigo API" });
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
