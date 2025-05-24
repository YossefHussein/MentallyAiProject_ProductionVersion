import 'package:mental_health_app/features/presentation/meditation/domain/entities/daily_quotes.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/repository/meditation_repository.dart';

class GetDailyQuote {
  final MeditationRepository repository;

  GetDailyQuote({required this.repository});

  Future<DailyQuote> call() async {
    return await repository.getDailyQuote();
  }
}
