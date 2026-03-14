import 'package:Mentally/features/presentation/get_doctor/domain/entities/doctor.dart';

abstract class DoctorRepository{
  // the type this function is future [list song]
  Future<List<DoctorEntities>> getAllDoctor();
}