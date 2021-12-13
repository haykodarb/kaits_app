import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const ColorScheme colorScheme = ColorScheme.dark(
  background: Color(0xFFF4F5F6),
  surface: Color(0xFF39544A),
  primary: Color(0xFF17CF73),
  primaryVariant: Color(0xFF39544A),
  secondary: Color(0xFF3683DC),
  secondaryVariant: Color(0xFF5996DB),
  onBackground: Color(0xFF3A3F46),
  onPrimary: Color(0xFF3A3F46),
  onSecondary: Color(0xFFF4F5F6),
  onSurface: Color(0xFFF4F5F6),
);

final ThemeData theme = ThemeData(
  colorScheme: colorScheme,
  textTheme: GoogleFonts.notoSansTextTheme().apply(
    displayColor: colorScheme.onSurface,
    bodyColor: colorScheme.onBackground,
    decorationColor: colorScheme.onBackground,
  ),
);
