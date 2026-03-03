// import the song fo r make song info
import Song from "../../domain/entities/song.js";
// import the interface to call execute function
import UseCaseInterFace from "../interfaces/use_case_interface.js";
// this destruction objet to
// when pressed ctrl+right click you move to [getAllSong] function direct
// because the [getAllSong] is return in finally object
import { getAllSong } from "../../infrastructure/db/query/song_query.js";

class GetSongs extends UseCaseInterFace {
  async execute() {
    // get song by api
    const songRow = await getAllSong();
    // and for [songRow] by map function to [Song] class
    // and return to user
    return songRow.map(
      (song) =>
        new Song({
          id: song.id,
          title: song.title,
          author: song.author,
          songLink: song.songlink,
          typeSong: song.typesong,
          colorTypeOfSong: song.colortypeofsong,
          thumbnail: song.thumbnail,
        })
    );
  }
}

export default GetSongs;
