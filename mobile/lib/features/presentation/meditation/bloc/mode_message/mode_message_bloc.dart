import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_event.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_state.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/usecase/get_mood_message.dart';

class MoodMessageBloc extends Bloc<ModeMessageEvent, MoodMessageState> {
  final GetMoodMessage getMoodMessage;

  MoodMessageBloc({required this.getMoodMessage})
      : super(MoodMessageInitialState()) {
    on<FetchMoodMessageEvent>((event, emit) async {
      emit(MoodMessageLoadingState());
      try {
        final moodMessage = await getMoodMessage(event.mood);
        emit(MoodMessageLoadedState(moodMessage: moodMessage));
      } catch (error) {
        emit(MoodMessageErrorState(message: error.toString()));
      }
    });

    on<ResetMoodMessage>((event, emit) {
      emit(MoodMessageInitialState());
    });
  }
}
