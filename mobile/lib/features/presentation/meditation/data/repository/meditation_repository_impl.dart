import 'package:mental_health_app/features/presentation/meditation/data/datasource/meditation_remote_datasource.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/entities/daily_quotes.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/entities/mood_message.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/repository/meditation_repository.dart';

class MeditationRepositoryImpl implements MeditationRepository {
  final MeditationRemoteDataSource remoteDataSource;

  MeditationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DailyQuote> getDailyQuote() async {
    return await remoteDataSource.getDailyQuote();
  }

  @override
  Future<MoodMessage> getMoodMessage(String mood) async {
    return await remoteDataSource.getMoodMessage(mood);
  }
}
