import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/theme.dart';

// class for set settings of tech info list
class TechInfo {
  String nameOfTechnology;
  String url;

  TechInfo({required this.url, required this.nameOfTechnology});
}

// ignore: must_be_immutable
class TechUsedScreen extends StatelessWidget {
  Future<void> openUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  List<TechInfo> techInfoList = [
    TechInfo(
      nameOfTechnology: 'nodeJS',
      url: 'https://nodejs.org/en',
    ),
    TechInfo(
      nameOfTechnology: 'express',
      url: 'https://expressjs.com/',
    ),
    TechInfo(
      nameOfTechnology: 'pg',
      url: 'https://www.npmjs.com/package/pg',
    ),
    TechInfo(
      nameOfTechnology: '@google/generative-ai',
      url: 'https://www.npmjs.com/package/@google/generative-ai',
    ),
    TechInfo(
      nameOfTechnology: 'cors',
      url: 'https://www.npmjs.com/package/cors',
    ),
    TechInfo(
      nameOfTechnology: 'dotenv',
      url: 'https://www.npmjs.com/package/dotenv',
    ),
    TechInfo(
      nameOfTechnology: 'nodemon',
      url: 'https://www.npmjs.com/package/nodemon',
    ),
    TechInfo(
      nameOfTechnology: 'google_fonts',
      url: 'https://pub.dev/packages/google_fonts',
    ),
    TechInfo(
      nameOfTechnology: 'flutter_bloc',
      url: 'https://pub.dev/packages/flutter_bloc',
    ),
    TechInfo(
      nameOfTechnology: 'bloc',
      url: 'https://pub.dev/packages/bloc',
    ),
    TechInfo(
      nameOfTechnology: 'audio_video_progress_bar',
      url: 'https://pub.dev/packages/audio_video_progress_bar',
    ),
    TechInfo(
      nameOfTechnology: 'http',
      url: 'https://pub.dev/packages/http',
    ),
    TechInfo(
      nameOfTechnology: 'get_it',
      url: 'https://pub.dev/packages/get_it',
    ),
    TechInfo(
      nameOfTechnology: 'just_audio',
      url: 'https://pub.dev/packages/just_audio',
    ),
    TechInfo(
      nameOfTechnology: 'fluttertoast',
      url: 'https://pub.dev/packages/fluttertoast',
    ),
    TechInfo(
      nameOfTechnology: 'easy_localization',
      url: 'https://pub.dev/packages/easy_localization',
    ),
    TechInfo(
      nameOfTechnology: 'auto_size_text',
      url: 'https://pub.dev/packages/auto_size_text',
    ),
    TechInfo(
      nameOfTechnology: 'auto_size_text_field',
      url: 'https://pub.dev/packages/auto_size_text_field',
    ),
    TechInfo(
      nameOfTechnology: 'firebase_auth',
      url: 'https://pub.dev/packages/firebase_auth',
    ),
    TechInfo(
      nameOfTechnology: 'firebase_core',
      url: 'https://pub.dev/packages/firebase_core',
    ),
    TechInfo(
      nameOfTechnology: 'google_sign_in',
      url: 'https://pub.dev/packages/google_sign_in',
    ),
    TechInfo(
      nameOfTechnology: 'url_launcher',
      url: 'https://pub.dev/packages/google_sign_in',
    ),
    TechInfo(
      nameOfTechnology: 'icons_plus',
      url: 'https://pub.dev/packages/icons_plus',
    ),
    TechInfo(
      nameOfTechnology: 'flutter_dotenv',
      url: 'https://pub.dev/packages/icons_plus',
    ),
    TechInfo(
      nameOfTechnology: 'lottie',
      url: 'https://pub.dev/packages/lottie',
    ),
    TechInfo(
      nameOfTechnology: 'cached_network_image',
      url: 'https://pub.dev/packages/cached_network_image',
    ),
    TechInfo(
      nameOfTechnology: 'go_router',
      url: 'https://pub.dev/packages/go_router',
    ),
    TechInfo(
      nameOfTechnology: 'flutter_native_splash',
      url: 'https://pub.dev/packages/flutter_native_splash',
    ),
    TechInfo(
      nameOfTechnology: 'syncfusion_flutter_charts',
      url: 'https://pub.dev/packages/syncfusion_flutter_charts',
    ),
    TechInfo(
      nameOfTechnology: 'sqflite',
      url: 'https://pub.dev/packages/sqflite',
    ),
    TechInfo(
      nameOfTechnology: 'path_provider',
      url: 'https://pub.dev/packages/path_provider',
    ),
    TechInfo(
      nameOfTechnology: 'path',
      url: 'https://pub.dev/packages/path',
    ),
    TechInfo(
      nameOfTechnology: 'google_mobile_ads',
      url: 'https://pub.dev/packages/google_mobile_ads',
    ),
    TechInfo(
      nameOfTechnology: 'intl',
      url: 'https://pub.dev/packages/intl',
    ),
    TechInfo(
      nameOfTechnology: 'conditional_builder_null_safety',
      url: 'https://pub.dev/packages/conditional_builder_null_safety',
    ),
    TechInfo(
      nameOfTechnology: 'sign_in_button',
      url: 'https://pub.dev/packages/sign_in_button',
    ),
    TechInfo(
      nameOfTechnology: 'flutter_lints',
      url: 'https://pub.dev/packages/flutter_lints',
    ),
    TechInfo(
      nameOfTechnology: 'change_app_package_name',
      url: 'https://pub.dev/packages/change_app_package_name',
    ),
    TechInfo(
      nameOfTechnology: 'firebase_crashlytics',
      url: 'https://pub.dev/packages/firebase_crashlytics',
    ),
    TechInfo(
      nameOfTechnology: 'clipboard',
      url: 'https://pub.dev/packages/clipboard',
    ),
    TechInfo(
      nameOfTechnology: 'flutter_local_notifications',
      url: 'https://pub.dev/packages/flutter_local_notifications',
    ),
    TechInfo(
      nameOfTechnology: 'share_plus',
      url: 'https://pub.dev/packages/share_plus',
    ),
    TechInfo(
      nameOfTechnology: 'share_plus',
      url: 'https://pub.dev/packages/share_plus',
    ),
    TechInfo(
      nameOfTechnology: 'permission_handler',
      url: 'https://pub.dev/packages/permission_handler',
    ),
  ];

  TechUsedScreen({super.key});

  techUsed(TechInfo model, BuildContext context) {
    return GestureDetector(
      onTap: () {
        openUrl(model.url);
      },
      child: AutoSizeText(
        model.nameOfTechnology,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.blue.shade300
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tech Used'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: techInfoList.length,
            itemBuilder: (context, index) => techUsed(
              techInfoList[index],
              context,
            ),
          ),
        ),
      ),
    );
  }
}
