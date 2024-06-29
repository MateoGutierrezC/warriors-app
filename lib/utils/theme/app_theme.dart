import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warrior_app/utils/Global.colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    buttonTheme: ButtonThemeData(
      buttonColor: GlobalColors.darkGrey,
      textTheme: ButtonTextTheme.normal,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: GlobalColors.darkGrey,
      ),
    ),
    appBarTheme: AppBarTheme(
      toolbarHeight: 80,
      shadowColor: Colors.grey[800],
      backgroundColor: GlobalColors.darkGrey,
      elevation: 5,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        fontSize: 40,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: const IconThemeData(size: 20),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: GlobalColors.darkGrey,
        brightness: Brightness.dark,
        shadow: GlobalColors.shadow),
    scaffoldBackgroundColor: GlobalColors.darkGrey,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: GlobalColors.darkGrey,
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.montserrat().fontFamily),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: GlobalColors.grey,
      ),
      titleLarge: GoogleFonts.montserrat(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: GlobalColors.white,
      ),
      labelMedium: GoogleFonts.montserrat(
        fontSize: 18,
        color: GlobalColors.darkGrey,
      ),
    ),
  );
}
