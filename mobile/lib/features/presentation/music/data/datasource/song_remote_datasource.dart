// data source is for fetch data from api or from local database
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mental_health_app/features/presentation/music/data/model/song_model.dart';

abstract class SongRemoteDataSource {
  Future<List<SongModel>> getAllSongs();
}

class SongRemoteDataSourceImpl implements SongRemoteDataSource {

  final http.Client client;

  SongRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SongModel>> getAllSongs() async {
    // get the api url and parsing from string to url
    // from [client] use get method to getting data form api
    final response = await client.get(Uri.parse('http://${dotenv.env['IpServer']}:6000/songs/all'));
    // print('statusCode ${response.statusCode}');
    if (response.statusCode == 200) {
      // make list and from [response] to getting the response from api to and decoding as list [jsonResponse]
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((song) => SongModel.fromJson(song)).toList();
    } else {
      throw Exception();
    }
  }
}
