import 'package:flutter/material.dart';

class AppColorScheme {
  final Color background;

  final Color primary;

  final Color surface;

  final Color onSurface;

  final Color textPrimary;
  final Color textSecondary;

  const AppColorScheme({
    required this.background,
    required this.primary,
    required this.onSurface,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
  });

  static const dark = AppColorScheme(
    background: Color(0xFF0B1E2D),
    primary: Color(0xFF43D049),
    surface: Color(0xFF152A3A),
    onSurface: Color(0xFF24394F),
    textPrimary: Color(0xFFFFFFFF),
    textSecondary: Color(0xFF5B6975),
  );

  static const light = AppColorScheme(
    background: Color(0xFFFCFCFC),
    primary: Color(0xFF22A2BD),
    onSurface: Color(0xFFF2F2F2),
    surface: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF0B1E2D),
    textSecondary: Color(0xFF828282),
  );

  factory AppColorScheme.of(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);

    return brightness == Brightness.light ? light : dark;
  }
}
