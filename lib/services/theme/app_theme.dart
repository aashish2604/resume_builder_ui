import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder_ui/services/theme/custom_colors.dart';

final titleTextStyle =
    GoogleFonts.gruppo(fontSize: 40.0, fontWeight: FontWeight.w800);

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(
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
