import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mental_health_app/features/presentation/auth_screens/widgets/widgets.dart';
import 'package:mental_health_app/presentation/about_developer.dart';

class SupportDeveloper extends StatelessWidget {
  const SupportDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('QR CODE'),
              Image.asset('assets/images/bitcoin_qr_code.jpg'),
              GestureDetector(
                child: Icon(Icons.copy),
                onTap: () {
                  FlutterClipboard.copy(
                      'bc1qm9m7x43sq3hfe5yc8pct3ud9g9ruesjwyn3r8z')
                      .then((value) => sendMSG('copied'));
                },
              ),
              SizedBox(
                height: 16,
              ),
              Image.asset(
                'assets/images/bmc_qr_code.png',
                scale: 4,
              ),
              GestureDetector(
                child: Icon(Icons.copy),
                onTap: () {
                  FlutterClipboard.copy('https://buymeacoffee.com/futureitway')
                      .then((value) => sendMSG('copied'));
                },
              ),
              SizedBox(
                height: 16,
              ),
              Text('Open support wbsite'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      openUrl('https://www.patreon.com/c/futureitway');
                    },
                    child: Brand(Brands.patreon),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
