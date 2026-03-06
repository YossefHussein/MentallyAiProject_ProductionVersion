import 'package:flutter/material.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:clipboard/clipboard.dart';
import 'package:mental_health_app/features/presentation/auth_screens/widgets/widgets.dart';

class AboutDeveloper extends StatelessWidget {
  const AboutDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    var styletTtleLarge = Theme.of(context).textTheme.titleLarge;
    var styleBodyMedium =
        Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // youssef
              SizedBox(height: 10),
              const CircleAvatar(
                radius: 53,
                backgroundColor: DefaultColors.orange,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/81009531?s=400&u=9c1942390c70f9fb2f1d84efba50889a36d0be31&v=4'),
                ),
              ),
              Text(
                'Youssef EL-Wazzer',
                style: styletTtleLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInButton(
                    Buttons.gitHub,
                    mini: true,
                    onPressed: () {
                      openUrl('https://github.com/YossefHussein');
                    },
                  ),
                  SignInButton(
                    Buttons.twitter,
                    mini: true,
                    onPressed: () {
                      openUrl('https://x.com/YossefHussinDev');
                    },
                  ),
                  SignInButton(
                    Buttons.linkedIn,
                    mini: true,
                    onPressed: () {
                      openUrl(
                          'https://www.linkedin.com/in/youssef-hussein-aa3b38277/');
                    },
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.topLeft,
                child: Text(
                  'Full-Stack Developer with building scalable mobile apps using JavaScript & Dart(Flutter, Node.js) with a focus on clean architecture and user-centric design.',
                  style: styleBodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> openUrl(url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
