import express from "express";
import MeditationClassesController from "../controllers/meditation_classes_controller.js";

const router = express.Router();

router.get("/allClasses", MeditationClassesController.allClasses);

export default router;
