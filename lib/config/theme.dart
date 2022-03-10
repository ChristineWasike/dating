import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;

  return ThemeData(
    primaryColor: const Color(0xFF2B2E4A),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: const Color(0xFFF4F4F4),
    textTheme: GoogleFonts.poppinsTextTheme(
      textTheme.copyWith(
        headline1: const TextStyle(
          color: Color(0xFF2B2E4A),
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
        headline2: const TextStyle(
          color: Color(0xFF2B2E4A),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        headline3: const TextStyle(
          color: Color(0xFF2B2E4A),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        headline4: const TextStyle(
          color: Color(0xFF2B2E4A),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        headline5: const TextStyle(
          color: Color(0xFF2B2E4A),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        headline6: const TextStyle(
          color: Color(0xFF2B2E4A),
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        bodyText1: const TextStyle(
          color: Color(0xFF2B2E4A),
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        bodyText2: const TextStyle(
          color: Color(0xFF2B2E4A),
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFE84545)),
  );
}
