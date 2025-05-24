import 'package:mental_health_app/features/presentation/get_doctor/domain/entities/doctor.dart';

abstract class DoctorRepository{
  // the type this function is future [list song]
  Future<List<DoctorEntities>> getAllDoctor();
}