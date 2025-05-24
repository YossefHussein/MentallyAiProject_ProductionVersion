import 'dart:convert';

import 'package:mental_health_app/features/presentation/meditation/domain/entities/mood_message.dart';

// this class for convert from json to dart in mood message section
class MoodMessageModel extends MoodMessage {
  MoodMessageModel({required String text}) : super(text: text);

  factory MoodMessageModel.fromJson(Map<String, dynamic> json) {
    final quotes = jsonDecode(json['text']);
    return MoodMessageModel(text: quotes['advice']);
  }
}
