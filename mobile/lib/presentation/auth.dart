import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/auth_screens/pages/login_page.dart';
import 'package:mental_health_app/presentation/home_screen/home_screen.dart';
// import 'package:mental_health_app/presentation/onboarding.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  // Future<bool> _checkOnboardingCompleted() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await Future.delayed(const Duration(seconds: 4));
  //   return prefs.getBool('onboarding_completed') ?? false;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        // this for user is sing in go to home screen if not go to login
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return  HomeScreen();
          } else {
            // If the user is not authenticated, check if onboarding is completed
            // return FutureBuilder<bool>(
            //   future: _checkOnboardingCompleted(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       // Show a loading indicator while checking onboarding status
            //       return Scaffold(
            //         backgroundColor: DefaultColors.white,
            //         body: Center(
            //           child: SafeArea(
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 // Loading indicator
            //                 LinearProgressIndicator(
            //                   color: DefaultColors.pink,
            //                 ),
            //                 Spacer(
            //                   flex: 3,
            //                 ),
            //                 // Add some spacing
            //                 AnimatedTextKit(
            //                   pause: Duration(milliseconds: 2000),
            //                   animatedTexts: [
            //                     WavyAnimatedText('Loading...'),
            //                   ],
            //                   isRepeatingAnimation: true,
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            //     } else {
            //       if (snapshot.data == false) {
            //         // If onboarding is not completed, show the onboarding screen
            //         return const OnboardingScreen();
                  // } else {
                    // If onboarding is completed, show the login screen
                    return const LogInScreen();
                  }
                }
            //   },
            // );
          // }
        // },
      ),
    );
  }
}
