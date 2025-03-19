import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    textTheme: GoogleFonts.oswaldTextTheme(
      ThemeData.light().textTheme,
    ),
    // Otros estilos para el tema claro...
  );
}