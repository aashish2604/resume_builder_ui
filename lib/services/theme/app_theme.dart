import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder_ui/services/theme/custom_colors.dart';

final titleTextStyle =
    GoogleFonts.gruppo(fontSize: 40.0, fontWeight: FontWeight.w800);

final formTitleTextStyle =
    GoogleFonts.oswald(fontSize: 40, fontWeight: FontWeight.w600);

final formFieldTextStyle =
    GoogleFonts.oswald(fontSize: 20, fontWeight: FontWeight.w400);

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        elevation: 5,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.black,
      )),
      scaffoldBackgroundColor: kCatsKillWhiteColor,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: kSmoothBlack,
          onPrimary: kCatsKillWhiteColor,
          secondary: kSmoothBlack,
          onSecondary: kCatsKillWhiteColor,
          error: kSadRed,
          onError: kWhiteColor,
          background: kCatsKillWhiteColor,
          onBackground: kSmoothBlack,
          surface: kCulturedWhiteColor,
          onSurface: kSmoothBlack),
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: kSmoothBlack,
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: kEggShellColor,
          onPrimary: kSmoothBlack,
          secondary: kEggShellColor,
          onSecondary: kSmoothBlack,
          error: kSadRed,
          onError: kWhiteColor,
          background: kSmoothBlack,
          onBackground: kEggShellColor,
          surface: kCulturedWhiteColor,
          onSurface: kEggShellColor),
    );
  }
}
