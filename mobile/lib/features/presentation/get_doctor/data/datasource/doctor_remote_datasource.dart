// data source is for fetch data from api or from local database
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mental_health_app/features/presentation/get_doctor/data/model/doctor_model.dart';

abstract class GetDoctorRemoteDataSource {
  Future<List<DoctorModel>> getAllDoctor();
}

class GetDoctorRemoteDataSourceImpl implements GetDoctorRemoteDataSource {

  final http.Client client;

  GetDoctorRemoteDataSourceImpl({required this.client});

  @override
  Future<List<DoctorModel>> getAllDoctor() async {
    // get the api url and parsing from string to url
    // from [client] use get method to getting data form api
    final response = await client.get(Uri.parse('http://${dotenv.env['IpServer']}:6000/meditationClasses/allClasses'));
    // print('statusCode ${response.statusCode}');
    if (response.statusCode == 200) {
      // make list and from [response] to getting the response from api to and decoding as list [jsonResponse]
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((doctor) => DoctorModel.fromJson(doctor)).toList();
    } else {
      throw Exception();
    }
  }
}
