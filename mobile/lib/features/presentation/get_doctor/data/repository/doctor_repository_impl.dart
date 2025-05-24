import 'package:mental_health_app/features/presentation/get_doctor/data/datasource/doctor_remote_datasource.dart';
import 'package:mental_health_app/features/presentation/get_doctor/domain/entities/doctor.dart';
import 'package:mental_health_app/features/presentation/get_doctor/domain/repository/doctor_repository.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final GetDoctorRemoteDataSource remoteDataSource;

  DoctorRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<DoctorEntities>> getAllDoctor() async {
    final doctorModels = await remoteDataSource.getAllDoctor();
    return doctorModels;
  }
}
