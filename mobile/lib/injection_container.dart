import 'package:get_it/get_it.dart';
import 'package:mental_health_app/features/presentation/auth_screens/cubit/auth_cubit.dart';
import 'package:mental_health_app/features/presentation/get_doctor/bloc/doctor_bloc.dart';
import 'package:mental_health_app/features/presentation/get_doctor/data/datasource/doctor_remote_datasource.dart';
import 'package:mental_health_app/features/presentation/get_doctor/data/repository/doctor_repository_impl.dart';
import 'package:mental_health_app/features/presentation/get_doctor/domain/repository/doctor_repository.dart';
import 'package:mental_health_app/features/presentation/get_doctor/domain/usecases/get_all_doctor.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/daily_quotes/daily_quotes_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/data/datasource/meditation_remote_datasource.dart';
import 'package:mental_health_app/features/presentation/meditation/data/repository/meditation_repository_impl.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/repository/meditation_repository.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/usecase/get_daily_quote.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/usecase/get_mood_message.dart';
import 'package:mental_health_app/features/presentation/music/bloc/song_bloc.dart';
import 'package:mental_health_app/features/presentation/music/data/datasource/song_remote_datasource.dart';
import 'package:mental_health_app/features/presentation/music/data/repository/song_repository_impl.dart';
import 'package:mental_health_app/features/presentation/music/domain/repository/song_repository.dart';
import 'package:mental_health_app/features/presentation/music/domain/usecases/get_all_songs.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // blocs
  sl.registerFactory(() => DailyQuotesBloc(getDailyQuote: sl()));
  sl.registerFactory(() => MoodMessageBloc(getMoodMessage: sl()));
  sl.registerFactory(() => SongBloc(getAllSongs: sl()));
  sl.registerFactory(() => GetDoctorBloc(getAllDoctor: sl()));
  sl.registerFactory(() => AuthCubit());

  // Use cases
  sl.registerLazySingleton(() => GetDailyQuote(repository: sl()));
  sl.registerLazySingleton(() => GetMoodMessage(repository: sl()));
  sl.registerLazySingleton(() => GetAllSongs(repository: sl()));
  sl.registerLazySingleton(() => GetAllDoctor(repository: sl()));

  // Repositories
  sl.registerLazySingleton<MeditationRepository>(
      () => MeditationRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<SongRepository>(
      () => SongRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<DoctorRepository>(
      () => DoctorRepositoryImpl(remoteDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<MeditationRemoteDataSource>(
      () => MeditationRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<SongRemoteDataSource>(
      () => SongRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetDoctorRemoteDataSource>(
      () => GetDoctorRemoteDataSourceImpl(client: sl(),));

  // Http
  sl.registerLazySingleton(() => http.Client());
}
