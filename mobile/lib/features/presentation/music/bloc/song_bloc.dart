import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/features/presentation/music/bloc/song_event.dart';
import 'package:mental_health_app/features/presentation/music/bloc/song_state.dart';
import 'package:mental_health_app/features/presentation/music/domain/usecases/get_all_songs.dart';

class SongBloc extends Bloc<SongEvent , SongState>{

  final GetAllSongs getAllSongs;

  SongBloc({required this.getAllSongs}) : super(SongInitial()){
    on<FetchSongs>((event , emit) async{
      emit(SongLoading());
      try {
        final songs = await getAllSongs();
      emit(SongLoaded(songs: songs));
      } catch (error) {
        emit(SongError(message: error.toString()));
      }
    });
  }
}