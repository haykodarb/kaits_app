import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const ColorScheme _colorScheme = ColorScheme.dark(
  background: Color(0xFFf8f8f7),
  surface: Color(0xFFd7cabd),
  primaryVariant: Color(0xFF5b5a62),
  primary: Color(0xFF89818d),
  secondary: Color(0xFFcfcdd7),
  secondaryVariant: Color(0xFFa09db0),
  onBackground: Color(0xFF2A2D37),
  onPrimary: Color(0xFFf8f8f7),
  onSecondary: Color(0xFFf8f8f7),
  onSurface: Color(0xFF2A2D37),
);

final AppBarTheme _appBarTheme = AppBarTheme(
  backgroundColor: _colorScheme.background,
  iconTheme: const IconThemeData(
    size: 30,
  ),
  centerTitle: true,
  titleTextStyle: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: _colorScheme.onBackground,
  ),
);

final ElevatedButtonThemeData _elevatedButtonThemeData =
    ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    shadowColor: _colorScheme.primaryVariant,
    primary: _colorScheme.primaryVariant,
    onPrimary: _colorScheme.onPrimary,
    onSurface: _colorScheme.onSurface,
    minimumSize: const Size(320, 70),
    textStyle: const TextStyle(
      fontSize: 22,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
);

final OutlinedButtonThemeData _outlinedButtonThemeData =
    OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    primary: _colorScheme.primary,
    side: BorderSide(
      color: _colorScheme.primary,
      width: 2,
    ),
    textStyle: const TextStyle(
      fontSize: 22,
    ),
    minimumSize: const Size(320, 70),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
);

final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  labelStyle: TextStyle(
    color: _colorScheme.primaryVariant,
  ),
  floatingLabelStyle: TextStyle(
    color: _colorScheme.primary,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: _colorScheme.primaryVariant,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: _colorScheme.primary,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: _colorScheme.error,
    ),
  ),
  errorStyle: TextStyle(
    color: _colorScheme.error,
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: _colorScheme.primary,
    ),
  ),
  isDense: true,
  contentPadding: const EdgeInsets.all(20),
);

final IconThemeData _iconThemeData = IconThemeData(
  color: _colorScheme.onSurface,
);

final ThemeData theme = ThemeData(
  colorScheme: _colorScheme,
  textTheme: GoogleFonts.notoSansTextTheme().apply(
    displayColor: _colorScheme.onSurface,
    bodyColor: _colorScheme.onBackground,
    decorationColor: _colorScheme.onBackground,
  ),
  elevatedButtonTheme: _elevatedButtonThemeData,
  outlinedButtonTheme: _outlinedButtonThemeData,
  inputDecorationTheme: _inputDecorationTheme,
  iconTheme: _iconThemeData,
  appBarTheme: _appBarTheme,
);
