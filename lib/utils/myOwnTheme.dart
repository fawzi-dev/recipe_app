import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOwnTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline5: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 28,
      // fontWeight: FontWeight.bold,
      color: Colors.black54,
    ),
    // headlineMedium: GoogleFonts.roboto(
    //   fontSize: 38,
    //   fontWeight: FontWeight.bold,
    //   color: Colors.black54,
    // ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline5: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.black),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.black),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
    );
  }
}
