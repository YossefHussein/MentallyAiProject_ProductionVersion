import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class FontSizes {
  static const extraSmall = 14.0;
  static const small = 16.0;
  static const standard = 18.0;
  static const large = 20.0;
  static const extraLarge = 24.0;
  static const doubleExtraLarge = 32.0;
}

class DefaultColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color pink = Color(0xFFEA2B83);
  static const Color lightPink = Color(0xFFFCDDEC);
  static const Color purple = Color(0xFF8E8FF8);
  static const Color orange = Color(0xFFF18F3B);
  static const Color lightTeal = Color(0xFF58D5D4);

  static Color task1 = Colors.pink[100]!;
  static Color task2 = Colors.orange[100]!;
  static Color task3 = Colors.green[100]!;

  static Color taskDark1 = Colors.pink[300]!;
  static Color taskDark2 = Colors.orange[300]!;
  static Color taskDark3 = Colors.green[300]!;
}

// the app select theme by theme of user device
class AppTheme {
  // light theme
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFFAEAFF7),
      focusColor: const Color(0xFF371B34),
      scaffoldBackgroundColor: DefaultColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: FontSizes.doubleExtraLarge,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawerTheme: DrawerThemeData(
        width: 160,
      ),
      textTheme: TextTheme(
        bodySmall: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.small,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.standard,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.large,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.large,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.extraLarge,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.doubleExtraLarge,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        labelSmall: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.small,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.extraLarge,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.doubleExtraLarge,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  //  dark theme
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: const Color(0xFFAEAFF7),
      // focusColor: const Color(0xFF371B34),
      focusColor: DefaultColors.white,
      scaffoldBackgroundColor: HexColor('#333739'),
      appBarTheme: AppBarTheme(
        backgroundColor: HexColor('#333739'),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        titleTextStyle: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.doubleExtraLarge,
          fontStyle: FontStyle.italic,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawerTheme:
          DrawerThemeData(backgroundColor: HexColor('#333739'), width: 160),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor('#333739'),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: HexColor('#333739'),
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        contentTextStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      textTheme: TextTheme(
        bodySmall: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.small,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.standard,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.large,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.large,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.extraLarge,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.doubleExtraLarge,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        labelSmall: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.small,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.extraLarge,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.doubleExtraLarge,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
