import 'package:flutter/material.dart';

/// All your app’s signature colors, extracted from the design.
class AppColors {
  AppColors._(); // no instances

  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color transparent = Colors.transparent;

  /// The deep navy you see on the “Join Privillee” button and iconography.
  static const Color main = Color(0xFF203646);

  /// The bright turquoise accent (pool‑water).
  static const Color primary = Color(0xFF00A3C4);

  /// The muted slate used for the selected chip (“Pool & beach”).
  static const Color accent = Color(0xFFA2B0BC);

  /// The very light grey used for backgrounds.
  static const Color background = Color(0xFFF8F9FA);
  static const Color appBarBackground = Color.fromARGB(223, 243, 243, 243);

  /// Main heading and card‑title text.
  static const Color textPrimary = Color(0xFF1F2D3A);

  /// Secondary, subtitle and body text.
  static const Color textSecondary = Color(0xFF6B7C8A);

  /// Light border color for inputs, cards, etc.
  static const Color border = Color(0xFFE0E0E0);

  static Color lightGray = Color(0xFFABB0BF);
  static Color errorColor = const Color(0xFFF44336);
}
