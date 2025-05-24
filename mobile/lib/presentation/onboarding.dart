// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mental_health_app/core/routes.dart';
// import 'package:mental_health_app/core/theme.dart';
// import 'package:mental_health_app/translations/locale_keys.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: DefaultColors.purple,
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/onboarding.png',
//               fit: BoxFit.fitWidth,
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: SizedBox(
//               height: 90,
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     // Mark onboarding as completed
//                     final prefs = await SharedPreferences.getInstance();
//                     await prefs.setBool('onboarding_completed', true);
//                     // Navigate to the login screen
//                     // ignore: use_build_context_synchronously
//                     context.go(Routes.authScreenRoute);
//                   },
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Theme.of(context).focusColor,
//                       minimumSize: const Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12))),
//                   child: AutoSizeText(
//                     LocaleKeys.onboarding_screen_title_onboarding_button.tr(),
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyLarge
//                         ?.copyWith(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
