class DoctorEntities {
  final int id;
  final String title;
  final String doctorName;
  final String medicalSpecialty;
  final String place;
  final String dateClass;
  final String timeClass;
  final String doctorPhoto;
  final String colorDoctorSpecialty;
  final dynamic percentSimilarity;

  DoctorEntities({
    required this.id,
    required this.title,
    required this.doctorName,
    required this.medicalSpecialty,
    required this.place,
    required this.timeClass,
    required this.doctorPhoto,
    required this.dateClass,
    required this.colorDoctorSpecialty,
    required this.percentSimilarity,
  });
}
