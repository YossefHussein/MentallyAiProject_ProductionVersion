import 'package:mental_health_app/features/presentation/music/domain/entities/song.dart';
import 'package:mental_health_app/features/presentation/music/domain/repository/song_repository.dart';

class GetAllSongs {
  // import the song repository
  final SongRepository repository;

  GetAllSongs({required this.repository});

  Future<List<Song>> call() async {
    // this abstract function to get all song from api
    return await repository.getAllSongs();
  }
}
