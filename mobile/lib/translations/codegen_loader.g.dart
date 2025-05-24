// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "onboarding_screen": {
    "title_onboarding_button": "هل تقدر تخليني اساعدك"
  },
  "auth_screen": {
    "text_form": {
      "email_text_from": "ايمال",
      "password_text_from": "باسورد",
      "confirm_password_text_from": "كونفيرم باسورد"
    },
    "login_screen": {
      "title_login_email_button": "تسجيل دخول بالايمال",
      "title_login_google_button": "تسجيل دخول بالجوجل",
      "if_dont_have_account": "لو معندكش حساب؟",
      "make_account_here": "اعمل حساب من هنا"
    },
    "logup_Screen": {
      "title_logup_email_button": "حساب جديد بالايمال",
      "title_logup_google_button": "حساب جديد بالجوجل",
      "if_have_account": "لو عندك حساب؟",
      "login_now": "سجل دلوقتي"
    }
  },
  "home_screen": {
    "welcome_back": "اهلا بيك",
    "how_are_you_feeling_today": "إزاي بتحس دلوقتي ",
    "today_task": "مهام اليوم",
    "morning": "صبح",
    "noon": "عصر",
    "evening": "بليل",
    "happy_mood_button": "سعيد",
    "calm_mood_button": "هدوء",
    "relax_mood_button": "استرخاء",
    "focus_mood_button": "مركز",
    "my_mood_button": "مسجل \n REC",
    "okay_button": "حسنا"
  },
  "drawer_widget": {
    "settings_app": "إعدادات Mentally",
    "about_developer": "عن المطورين",
    "support_developer": "دعم المطورين",
    "tech_used_to_make_app": "التقنيات المستخدمة في تطبيق",
    "logout": "تسجيل الخروج",
    "title_logout": "هل انت متأكد انك تخرج من تطبيق",
    "my_sir": "سيدي",
    "title_description": "هل انت متأكد انك عايز تخرج من بيئة للتأمل لي مسعادتك في انك تكوين وقت جميل للتأمل, ارجوك فكر من جديد وختر من اختيارين من موجودين تحت نص دة",
    "restart_app": "ريستارت برنامج",
    "title_logout_button": "تسجيل خروج ",
    "title_cancel_button": "كانسيل"
  },
  "song_playlist_screen": {
    "song_mood_angry": "غاضب",
    "song_mood_good": "كويس",
    "song_mood_good_place": "مكان كويس",
    "song_mood_sad": "حزين"
  },
  "mentally_settings": {},
  "no_data_found": "لا توجد بيانات الان"
};
static const Map<String,dynamic> en = {
  "onboarding_screen": {
    "title_onboarding_button": "Let us help you"
  },
  "auth_screen": {
    "text_form": {
      "email_text_from": "Email",
      "password_text_from": "Password",
      "confirm_password_text_from": "Confirm Password"
    },
    "login_screen": {
      "title_login_email_button": "Login with email",
      "title_login_google_button": "Login with google",
      "if_dont_have_account": "If does not have account?",
      "make_account_here": "Make here"
    },
    "logup_Screen": {
      "title_logup_email_button": "Logup with email",
      "title_logup_google_button": "Logup with google",
      "if_have_account": "Are you have account?",
      "login_now": "Login now"
    }
  },
  "home_screen": {
    "welcome_back": "Welcome Back",
    "how_are_you_feeling_today": "How Are You Feeling Today",
    "today_task": "Today Task",
    "morning": "Morning",
    "noon": "Noon",
    "evening": "Evening",
    "happy_mood_button": "Happy",
    "calm_mood_button": "Calm",
    "relax_mood_button": "Relax",
    "focus_mood_button": "Focus",
    "my_mood_button": "My Mood \n REC",
    "okay_button": "okay"
  },
  "drawer_widget": {
    "settings_app": "Mentally Settings",
    "about_developer": "About Developer",
    "support_developer": "Support Developer",
    "tech_used_to_make_app": "Tech Used To Make App",
    "logout": "LogOut",
    "title_logout": "Are You Sure Exit From Meditation",
    "my_sir": "My Sir",
    "title_description": "You Exit From Meditation environment to help YOU for make good Meditation time, Pleas think again and take option from these option under this text section",
    "restart_app": "Restart App",
    "title_logout_button": "LogOut",
    "title_cancel_button": "Cancel"
  },
  "song_playlist_screen": {
    "song_mood_angry": "Angary",
    "song_mood_good": "Good",
    "song_mood_good_place": "Good Place",
    "song_mood_sad": "Sad"
  },
  "mentally_settings": {},
  "no_data_found": "no data found"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
