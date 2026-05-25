import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static final TextTheme textTheme = TextTheme(
    headlineLarge: GoogleFonts.cardo(
      fontSize: 32.0,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: GoogleFonts.hind(fontSize: 18),
    bodyMedium: GoogleFonts.hind(fontSize: 16), // Esta se aplica al body
    labelLarge: GoogleFonts.hind(fontSize: 16, fontWeight: FontWeight.w600),
  );
}
