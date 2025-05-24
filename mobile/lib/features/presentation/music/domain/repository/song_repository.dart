import 'package:mental_health_app/features/presentation/music/domain/entities/song.dart';

abstract class SongRepository{
  // the type this function is future [list song]
  Future<List<Song>> getAllSongs();
}