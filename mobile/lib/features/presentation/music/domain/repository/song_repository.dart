import 'package:Mentally/features/presentation/music/domain/entities/song.dart';

abstract class SongRepository{
  // the type this function is future [list song]
  Future<List<Song>> getAllSongs();
}