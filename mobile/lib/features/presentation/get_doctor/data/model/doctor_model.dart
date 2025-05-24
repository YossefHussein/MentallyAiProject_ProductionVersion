import 'dart:ffi';

import 'package:mental_health_app/features/presentation/get_doctor/domain/entities/doctor.dart';

class DoctorModel extends DoctorEntities {
  // ignore: use_super_parameters
  DoctorModel({
    required int id,
    required String title,
    required String doctorName,
    required String medicalSpecialty,
    required String place,
    required String dateClass,
    required String timeClass,
    required String doctorPhoto,
    required String colorDoctorSpecialty,
    required dynamic percentSimilarity,
  }) : super(
          id: id,
          title: title,
          doctorName: doctorName,
          medicalSpecialty: medicalSpecialty,
          place: place,
          doctorPhoto: doctorPhoto,
          timeClass: timeClass,
          dateClass: dateClass,
          colorDoctorSpecialty: colorDoctorSpecialty,
          percentSimilarity: percentSimilarity,
        );

  factory DoctorModel.fromJson(Map<dynamic, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      title: json['title'],
      doctorName: json['doctorName'],
      medicalSpecialty: json['medicalSpecialty'],
      place: json['place'],
      dateClass: json['dateClass'],
      timeClass: json['timeClass'],
      doctorPhoto: json['doctorPhoto'],
      colorDoctorSpecialty: json['colorDoctorSpecialty'],
      percentSimilarity: json['percentSimilarity'],
    );
  }
}
