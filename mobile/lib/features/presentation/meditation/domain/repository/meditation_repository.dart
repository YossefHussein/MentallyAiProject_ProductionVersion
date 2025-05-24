import 'package:mental_health_app/features/presentation/meditation/domain/entities/daily_quotes.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/entities/mood_message.dart';

abstract class MeditationRepository {
  Future<DailyQuote> getDailyQuote();
  Future<MoodMessage> getMoodMessage(String mood);
}
