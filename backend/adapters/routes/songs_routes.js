import express from "express";
import SongController from "../controllers/song_controller.js";

const router = express.Router();

router.get("/all", SongController.allSong);

export default router;
