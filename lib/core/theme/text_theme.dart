import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static final TextTheme textTheme = TextTheme(
    headlineLarge: GoogleFonts.hind(
      fontSize: 32.0,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: GoogleFonts.hind(
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: GoogleFonts.hind(fontSize: 32.0, fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.hind(fontSize: 24.0, fontWeight: FontWeight.bold),
    titleSmall: GoogleFonts.hind(fontSize: 16.0, fontWeight: FontWeight.normal),
    bodyLarge: GoogleFonts.hind(fontSize: 32.0),
    bodyMedium: GoogleFonts.hind(fontSize: 18.0), // Esta se aplica al body
    bodySmall: GoogleFonts.hind(fontSize: 14.0),
    labelLarge: GoogleFonts.hind(fontSize: 16.0, fontWeight: FontWeight.w600),
  );
}
