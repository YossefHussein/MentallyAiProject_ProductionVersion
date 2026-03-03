import GetSongs from "../../application/use-cases/get_songs.js";

class SongController {
    static async allSong(req, res) {
        try {
            const getSongs = new GetSongs();
            const songs = await getSongs.execute();
            res.json(songs);
        } catch (error) {
            res.status(500).send({ error: error.message });
        }
    }
}

export default SongController;
