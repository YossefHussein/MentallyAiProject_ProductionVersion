import 'package:mental_health_app/features/presentation/meditation/domain/entities/mood_message.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/repository/meditation_repository.dart';

class GetMoodMessage {
  final MeditationRepository repository;

  GetMoodMessage({required this.repository});

  // call the api
  Future<MoodMessage> call(mood) async {
    return await repository.getMoodMessage(mood);
  }
}