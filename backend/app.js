// import dependencies

import dotenv from "dotenv";
dotenv.config();

import express from "express";
// import cors for security
import cors from "cors";
import rateLimit from "express-rate-limit";
// import song routing
import songRouter from "./adapters/routes/songs_routes.js";
// import meditation routing
import meditationRouter from "./adapters/routes/meditation_routes.js";
import meditationClassRouter from "./adapters/routes/meditation_classes_routes.js";

// using the express
const app = express();
// using cors for security
app.use(cors());
app.use(rateLimit());
app.use(express.json());

// app port
const PORT = process.env.PORT;
// make middleware and routing
app.use("/meditation", meditationRouter);
app.use("/songs", songRouter);
app.use("/meditationClasses", meditationClassRouter);
// run the app
app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}`);
});
