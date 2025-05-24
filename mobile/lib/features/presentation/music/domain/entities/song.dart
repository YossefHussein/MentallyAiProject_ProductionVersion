// this is information of the song the [id,title,authors,songLink]
class Song {
  final int id;
  final String title;
  final String author;
  final String songLink;
  final String typeSong;
  final String colorTypeOfSong;
  final String thumbnail;

  Song({
    required this.id,
    required this.title,
    required this.author,
    required this.songLink,
    required this.typeSong,
    required this.colorTypeOfSong,
    required this.thumbnail,
  });
}
