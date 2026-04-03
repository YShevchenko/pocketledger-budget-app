import 'package:flutter/material.dart';

/// Color palette extracted from Stitch design JSON files.
/// Dark-mode-only, editorial/brutalist aesthetic.
class AppColors {
  AppColors._();

  // Primary
  static const Color primary = Color(0xFF3FFF8B);
  static const Color primaryContainer = Color(0xFF13EA79);
  static const Color primaryDim = Color(0xFF24F07E);
  static const Color onPrimary = Color(0xFF005D2C);
  static const Color onPrimaryContainer = Color(0xFF004F24);
  static const Color primaryFixed = Color(0xFF3FFF8B);
  static const Color primaryFixedDim = Color(0xFF24F07E);
  static const Color onPrimaryFixed = Color(0xFF004820);
  static const Color onPrimaryFixedVariant = Color(0xFF006832);
  static const Color inversePrimary = Color(0xFF006E35);

  // Secondary (coral red - used for expenses, overspent)
  static const Color secondary = Color(0xFFFF716C);
  static const Color secondaryContainer = Color(0xFFA00118);
  static const Color secondaryDim = Color(0xFFFF716C);
  static const Color onSecondary = Color(0xFF490006);
  static const Color onSecondaryContainer = Color(0xFFFFD1CD);
  static const Color secondaryFixed = Color(0xFFFFC3BF);
  static const Color secondaryFixedDim = Color(0xFFFFAFAA);
  static const Color onSecondaryFixed = Color(0xFF70000D);
  static const Color onSecondaryFixedVariant = Color(0xFFA4061B);

  // Tertiary (cyan - accents)
  static const Color tertiary = Color(0xFF7AE6FF);
  static const Color tertiaryContainer = Color(0xFF00DCFD);
  static const Color tertiaryDim = Color(0xFF00CDEC);
  static const Color onTertiary = Color(0xFF005360);
  static const Color onTertiaryContainer = Color(0xFF004955);
  static const Color tertiaryFixed = Color(0xFF00DCFD);
  static const Color tertiaryFixedDim = Color(0xFF00CDEC);
  static const Color onTertiaryFixed = Color(0xFF00343D);
  static const Color onTertiaryFixedVariant = Color(0xFF005361);

  // Error
  static const Color error = Color(0xFFFF716C);
  static const Color errorDim = Color(0xFFD7383B);
  static const Color errorContainer = Color(0xFF9F0519);
  static const Color onError = Color(0xFF490006);
  static const Color onErrorContainer = Color(0xFFFFA8A3);

  // Surface hierarchy
  static const Color surface = Color(0xFF0E0E0E);
  static const Color surfaceDim = Color(0xFF0E0E0E);
  static const Color surfaceBright = Color(0xFF2C2C2C);
  static const Color surfaceContainerLowest = Color(0xFF000000);
  static const Color surfaceContainerLow = Color(0xFF131313);
  static const Color surfaceContainer = Color(0xFF1A1A1A);
  static const Color surfaceContainerHigh = Color(0xFF20201F);
  static const Color surfaceContainerHighest = Color(0xFF262626);
  static const Color surfaceVariant = Color(0xFF262626);
  static const Color surfaceTint = Color(0xFF3FFF8B);
  static const Color inverseSurface = Color(0xFFFCF9F8);
  static const Color inverseOnSurface = Color(0xFF565555);

  // On-surface
  static const Color onSurface = Color(0xFFFFFFFF);
  static const Color onSurfaceVariant = Color(0xFFADAAAA);
  static const Color onBackground = Color(0xFFFFFFFF);
  static const Color background = Color(0xFF0E0E0E);

  // Outline
  static const Color outline = Color(0xFF767575);
  static const Color outlineVariant = Color(0xFF484847);

  // Envelope preset colors (16 named colors covering full spectrum)
  static const List<Color> envelopeColors = [
    Color(0xFF3FFF8B), // emerald
    Color(0xFF13EA79), // green
    Color(0xFF00D2D3), // teal
    Color(0xFF7AE6FF), // cyan
    Color(0xFF48DBFB), // sky
    Color(0xFF54A0FF), // blue
    Color(0xFF5F27CD), // indigo
    Color(0xFFA78BFA), // violet
    Color(0xFFFF9FF3), // pink
    Color(0xFFFF6B9D), // rose
    Color(0xFFFF716C), // coral
    Color(0xFFFF6B6B), // red
    Color(0xFFFF9F43), // orange
    Color(0xFFFFD166), // amber
    Color(0xFFFECA57), // yellow
    Color(0xFFB8E994), // lime
    Color(0xFFFFFFFF), // white
    Color(0xFF8395A7), // slate
  ];
}
