// import 'package:mental_health_app/features/presentation/music/domain/entities/song.dart';
// import 'package:mental_health_app/features/presentation/music/domain/repository/song_repository.dart';

import 'package:mental_health_app/features/presentation/get_doctor/domain/entities/doctor.dart';
import 'package:mental_health_app/features/presentation/get_doctor/domain/repository/doctor_repository.dart';

class GetAllDoctor {
  // import the song repository
  final DoctorRepository repository;

  GetAllDoctor({required this.repository});

  Future<List<DoctorEntities>> call() async {
    // this abstract function to get all song from api
    return await repository.getAllDoctor();
  }
}
