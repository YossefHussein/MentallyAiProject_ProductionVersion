import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/features/presentation/get_doctor/bloc/doctor_event.dart';
import 'package:mental_health_app/features/presentation/get_doctor/bloc/doctor_state.dart';
import 'package:mental_health_app/features/presentation/get_doctor/domain/usecases/get_all_doctor.dart';

class GetDoctorBloc extends Bloc<GetDoctorEvent, GetDoctorState> {
  final GetAllDoctor getAllDoctor;

  GetDoctorBloc({required this.getAllDoctor}) : super(GetDoctorInitial()) {
    on<FetchDoctorInfo>((event, emit) async {
      emit(GetDoctorLoading());
      try {
        final getDoctorInfo = await getAllDoctor();
        emit(GetDoctorLoaded(getDoctors: getDoctorInfo));
      } catch (error) {
        emit(GetDoctorError(message: error.toString()));
      }
    });
  }
}
