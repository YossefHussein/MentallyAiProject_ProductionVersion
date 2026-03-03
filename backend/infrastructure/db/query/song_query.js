import db from "../index.js";

// get the song from songs table
export const getAllSong = async () => {
  // select all thing from songs
  const result = await db.query("SELECT * FROM songs");
  // return the row of database
  return result.rows;
};
