import express from "express";
import MeditationController from "../controllers/meditation_controller.js";

const router = express.Router();

router.get("/dailyQuote", MeditationController.dailyQuote);
router.get("/myMood/:mood", MeditationController.myMood);

export default router;
