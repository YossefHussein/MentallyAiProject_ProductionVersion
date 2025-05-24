import 'package:mental_health_app/features/presentation/music/domain/entities/song.dart';

class SongModel extends Song {
  // ignore: use_super_parameters
  SongModel({
    required int id,
    required String title,
    required String author,
    required String songLink,
    required String typeSong,
    required String colorTypeOfSong,
    required String thumbnail,
  }) : super(
          id: id,
          title: title,
          author: author,
          songLink: songLink,
          typeSong: typeSong,
          colorTypeOfSong: colorTypeOfSong,
          thumbnail: thumbnail,
        );

  factory SongModel.fromJson(Map<dynamic, dynamic> json) {
    return SongModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      songLink: json['songLink'],
      typeSong: json['typeSong'],
      colorTypeOfSong: json['colorTypeOfSong'],
      thumbnail: json['thumbnail'],
    );
  }
}
