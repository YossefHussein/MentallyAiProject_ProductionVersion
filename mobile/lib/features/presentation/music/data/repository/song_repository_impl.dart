import 'package:mental_health_app/features/presentation/music/data/datasource/song_remote_datasource.dart';
import 'package:mental_health_app/features/presentation/music/domain/entities/song.dart';
import 'package:mental_health_app/features/presentation/music/domain/repository/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongRemoteDataSource remoteDataSource;

  SongRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Song>> getAllSongs() async {
    final songModels = await remoteDataSource.getAllSongs();
    return songModels;
  }
}
