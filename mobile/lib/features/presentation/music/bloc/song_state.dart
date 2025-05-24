
import 'package:mental_health_app/features/presentation/music/domain/entities/song.dart';

abstract class SongState {}

class SongInitial extends SongState {}

class SongLoading extends SongState {}

class SongLoaded extends SongState {
  // this get the song information
  final List<Song> songs;
  SongLoaded({required this.songs});
}

class SongError extends SongState {
  final String message;

  SongError({required this.message});
}
