import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/auth_screens/widgets/widgets.dart';
import 'package:mental_health_app/translations/locale_keys.dart';

class SettingScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  TextEditingController changeEmailTextFormFieldController =
      TextEditingController();
  TextEditingController photoTextFormFieldController = TextEditingController();

  SettingScreen({super.key});

  // this function for selected the profile photo by URL
  void selectProfilePicture(context) async {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          'Editing Profile Picture',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        content: CupertinoTextField(
          controller: photoTextFormFieldController,
          placeholder: 'Should to be URL photo extension like PNG JPEG ETC',
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () async {
              Navigator.pop(context);
            },
            child: Text(
              'cancel',
              style: TextStyle(color: Colors.black),
            ),
          ),
          CupertinoDialogAction(
            onPressed: () async {
              await user?.updatePhotoURL(photoTextFormFieldController.text);
              Navigator.pop(context);
              sendMSG('Restart the app');
            },
            child: Text(
              LocaleKeys.home_screen_okay_button.tr(),
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void deleteAccount(context) async {
    var user = FirebaseAuth.instance.currentUser;

    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          ' Delete Your Account?',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: true == Brightness.light ? Colors.black  : Colors.black),
        ),
        content: Text(
          'We\'re sad to see you go. Deleting your account will permanently remove all your data, including your personal insights, progress, and preferences. This action cannot be undone.If you\'re going through a difficult time, remember—you\'re not alone. We\'re here to support you.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: true == Brightness.light ? Colors.black  : Colors.black),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () async {
              Navigator.pop(context);
            },
            child: Text(
              'No, Keep my account',
              style: TextStyle(color: Colors.red),
            ),
          ),
          CupertinoDialogAction(
            onPressed: () async {
              await user?.delete().then((value) async {
                await FirebaseAuth.instance.signOut();
                await user?.delete();
                Navigator.pop(context);
              });
            },
            child: Text(
              'Yes, delete my account',
              style: TextStyle(
                color: Colors.blue
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mentally Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: user?.photoURL != null
                  ? GestureDetector(
                      onTap: () => selectProfilePicture(context),
                      child: CircleAvatar(
                        radius: 52,
                        backgroundColor: DefaultColors.orange,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(user!.photoURL.toString()),
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 50,
                      child: IconButton(
                        icon: Icon(Icons.account_circle),
                        onPressed: () => selectProfilePicture(context),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  AutoSizeTextField(
                    controller: changeEmailTextFormFieldController,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    onSubmitted: (value) async {
                      await user?.verifyBeforeUpdateEmail(
                          changeEmailTextFormFieldController.text);
                      sendMSG(
                          'we send message to this email:${value.toString()}');
                    },
                    decoration: InputDecoration(
                      labelText: changeEmailTextFormFieldController.text,
                      hintText: user?.email,
                      helper: Text(
                        'email will be change when submitted',
                      ),
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Theme.of(context).focusColor,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: DefaultColors.pink,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      // email verification
                      Text(
                        "Please verify your email address. Tap the button above to resend the verification email.",
                        style: TextStyle(fontSize: 26),
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await user?.sendEmailVerification();
                        },
                        child: Text('Email Verification'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // delete the account
                      Text(
                        'delete the account',
                        style: TextStyle(fontSize: 26),
                      ),
                      ElevatedButton(
                        onPressed: () => deleteAccount(context),
                        child: Text('delete account'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
