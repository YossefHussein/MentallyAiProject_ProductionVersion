import 'package:mental_health_app/features/presentation/get_doctor/domain/entities/doctor.dart';

abstract class GetDoctorState {}

class GetDoctorInitial extends GetDoctorState {}

class GetDoctorLoading extends GetDoctorState {}

class GetDoctorLoaded extends GetDoctorState {
  // this get the GetDoctor information
  final List<DoctorEntities> getDoctors;
  GetDoctorLoaded({required this.getDoctors});
}

class GetDoctorError extends GetDoctorState {
  final String message;

  GetDoctorError({required this.message});
}
