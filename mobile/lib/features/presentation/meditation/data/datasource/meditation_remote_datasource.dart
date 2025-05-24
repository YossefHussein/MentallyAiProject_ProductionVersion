import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mental_health_app/features/presentation/meditation/data/model/daily_quote_model.dart';
import 'package:mental_health_app/features/presentation/meditation/data/model/mood_message_model.dart';

abstract class MeditationRemoteDataSource {
  Future<DailyQuoteModel> getDailyQuote();
  Future<MoodMessageModel> getMoodMessage(String mood);
}

class MeditationRemoteDataSourceImpl implements MeditationRemoteDataSource {
  final http.Client client;

  MeditationRemoteDataSourceImpl({required this.client});

  @override
  Future<DailyQuoteModel> getDailyQuote() async {
    final response = await client.get(Uri.parse(
        'http://${dotenv.env['IpServer']}:6000/meditation/dailyQuote'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return DailyQuoteModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load daily quote:${response.body}');
    }
  }

  @override
  Future<MoodMessageModel> getMoodMessage(String mood) async {
    final response = await client.get(Uri.parse(
        'http://${dotenv.env['IpServer']}:6000/meditation/myMood/$mood'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return MoodMessageModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load mood quote:${response.body}');
    }
  }
}
