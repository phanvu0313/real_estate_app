import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Colors.black,
    ),
    textTheme: GoogleFonts.quicksandTextTheme().copyWith(
      bodyMedium: const TextStyle(fontSize: 16),
      titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}

class AppTypography {
  static final TextStyle heading1 = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading2 = GoogleFonts.quicksand(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle body = GoogleFonts.quicksand(fontSize: 16);

  static final TextStyle bodyBold = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle caption = GoogleFonts.quicksand(
    fontSize: 14,
    color: const Color.fromARGB(255, 82, 82, 82),
  );

  static final TextStyle error = GoogleFonts.quicksand(
    fontSize: 14,
    color: Colors.red,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle redText = GoogleFonts.quicksand(
    color: const Color.fromARGB(255, 168, 43, 35),
    fontWeight: FontWeight.w900,
  );
  static final TextStyle textVip = GoogleFonts.quicksand(
    color: const Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w600,
  );
}
