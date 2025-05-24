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
import 'package:mental_health_app/features/presentation/auth_screens/pages/logup_page.dart';
import 'package:mental_health_app/presentation/auth.dart';
import 'package:mental_health_app/translations/locale_keys.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
                  'assets/images/onboarding.png',
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // email
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: AutoSizeTextField(
                      maxLines: 1,
                      controller: cubit.emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: LocaleKeys
                            .auth_screen_text_form_email_text_from
                            .tr(),
                        labelStyle: TextStyle(color: Colors.white),
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
                  // password
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: AutoSizeTextField(
                      maxLines: 1,
                      controller: cubit.passwordController,
                      obscureText: cubit.obscureText,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
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
                  // login with email
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            cubit.signInByEmail();
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
                                .auth_screen_login_screen_title_login_email_button
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
                                .auth_screen_login_screen_title_login_google_button
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
                  // button if user dose not have account
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText(
                        LocaleKeys.auth_screen_login_screen_if_dont_have_account
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
                              builder: (context) => LogUpScreen(),
                            ),
                          );
                        },
                        child: AutoSizeText(
                          LocaleKeys.auth_screen_login_screen_make_account_here
                              .tr(),
                          style: TextStyle(
                            color: DefaultColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
