import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/auth_screens/cubit/auth_cubit.dart';
import 'package:mental_health_app/features/presentation/auth_screens/cubit/auth_state.dart';
import 'package:mental_health_app/features/presentation/auth_screens/pages/login_page.dart';
import 'package:mental_health_app/presentation/auth.dart';
import 'package:mental_health_app/translations/locale_keys.dart';

class LogUpScreen extends StatefulWidget {
  const LogUpScreen({super.key});

  @override
  State<LogUpScreen> createState() => _LogUpScreenState();
}

class _LogUpScreenState extends State<LogUpScreen> {
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password required';
    if (value.length < 8) return 'At least 8 characters';
    if (!value.contains(RegExp(r'[A-Z]'))) return 'Include uppercase letters';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 174, 175, 247),
          body: Stack(
            children: [
              Positioned.fill(
                  child: Image.asset(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                'assets/images/onboarding.png',
                fit: BoxFit.contain,
              )),
             Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Email
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: AutoSizeTextField(
                          maxLines: 1,
                          controller: cubit.emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            errorText: _validateEmail(cubit.emailController.text),
                            // Enabled state border
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Theme.of(context).focusColor,
                                width: 1.0,
                              ),
                            ),
                            // Focused state border
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: DefaultColors.pink,
                                width: 2.0,
                              ),
                            ),
                            // Error state borders (important for validation)
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.red.shade400,
                                width: 1.5,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 2.0,
                              ),
                            ),

                            labelText: LocaleKeys
                                .auth_screen_text_form_email_text_from
                                .tr(),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      // Password
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: AutoSizeTextField(
                          maxLines: 1,
                          obscureText: cubit.obscureText,
                          style: TextStyle(color: Colors.white),
                          controller: cubit.passwordController,
                          decoration: InputDecoration(
                            errorText:
                                _validatePassword(cubit.passwordController.text),
                            labelText: LocaleKeys
                                .auth_screen_text_form_password_text_from
                                .tr(),
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                cubit.obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).focusColor,
                              ),
                              onPressed: () {
                                // Update the state i.e. toggle the state of passwordVisible variable
                                setState(() {
                                  cubit.obscureText = !cubit.obscureText;
                                });
                              },
                            ),
                            // Enabled state border
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Theme.of(context).focusColor,
                                width: 1.0,
                              ),
                            ),
                            // Focused state border
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: DefaultColors.pink,
                                width: 2.0,
                              ),
                            ),
                            // Error state borders (important for validation)
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.red.shade400,
                                width: 1.5,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Password conform
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: AutoSizeTextField(
                          maxLines: 1,
                          obscureText: cubit.obscureText,
                          style: TextStyle(color: Colors.white),
                          controller: cubit.confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: LocaleKeys
                                .auth_screen_text_form_confirm_password_text_from
                                .tr(),
                            errorText:
                                _validatePassword(cubit.passwordController.text),
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                cubit.obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).focusColor,
                              ),
                              onPressed: () {
                                // Update the state i.e. toggle the state of passwordVisible variable
                                setState(() {
                                  cubit.obscureText = !cubit.obscureText;
                                });
                              },
                            ),
                            // Enabled state border
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Theme.of(context).focusColor,
                                width: 1.0,
                              ),
                            ),
                            // Focused state border
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: DefaultColors.pink,
                                width: 2.0,
                              ),
                            ),
                            // Error state borders (important for validation)
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.red.shade400,
                                width: 1.5,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // log up with email
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                cubit.signUpByEmail(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Auth(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF371B34),
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              icon: Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 26,
                              ),
                              label: AutoSizeText(
                                LocaleKeys
                                    .auth_screen_logup_Screen_title_logup_email_button
                                    .tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // login with google
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                cubit.signInWithGoogle();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Auth(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF371B34),
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              icon: Icon(
                                FontAwesome.google_brand,
                                color: Colors.white,
                                size: 26,
                              ),
                              label: AutoSizeText(
                                LocaleKeys
                                    .auth_screen_logup_Screen_title_logup_google_button
                                    .tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // if user have account
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AutoSizeText(
                            LocaleKeys.auth_screen_logup_Screen_if_have_account
                                .tr(),
                            style: TextStyle(
                              color: DefaultColors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogInScreen(),
                                ),
                              );
                            },
                            child: AutoSizeText(
                              LocaleKeys.auth_screen_logup_Screen_login_now.tr(),
                              style: TextStyle(
                                color: DefaultColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
