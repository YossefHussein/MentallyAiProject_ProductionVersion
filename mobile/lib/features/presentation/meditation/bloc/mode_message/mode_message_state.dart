import 'package:mental_health_app/features/presentation/meditation/domain/entities/mood_message.dart';

abstract class MoodMessageState {}

class MoodMessageInitialState extends MoodMessageState {}

// this for loading the state
class MoodMessageLoadingState extends MoodMessageState {}

class MoodMessageLoadedState extends MoodMessageState {
  // this is from the model of the to get the text in finally
  MoodMessage moodMessage;

  MoodMessageLoadedState({required this.moodMessage});
}

// if there error in meditation screen get the error in the state
class MoodMessageErrorState extends MoodMessageState {
  final  message;

  MoodMessageErrorState({required this.message}) {
    print(message.toString());
  }
// ;
}
