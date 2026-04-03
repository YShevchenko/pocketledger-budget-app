import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static TextTheme _buildTextTheme() {
    final manrope = GoogleFonts.manropeTextTheme();
    final inter = GoogleFonts.interTextTheme();

    return TextTheme(
      displayLarge: manrope.displayLarge!.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.w800,
        letterSpacing: -1.5,
      ),
      displayMedium: manrope.displayMedium!.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
      ),
      displaySmall: manrope.displaySmall!.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: manrope.headlineLarge!.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
      ),
      headlineMedium: manrope.headlineMedium!.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: manrope.headlineSmall!.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: manrope.titleLarge!.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: manrope.titleMedium!.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: manrope.titleSmall!.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: manrope.bodyLarge!.copyWith(
        color: AppColors.onSurface,
      ),
      bodyMedium: manrope.bodyMedium!.copyWith(
        color: AppColors.onSurface,
      ),
      bodySmall: manrope.bodySmall!.copyWith(
        color: AppColors.onSurfaceVariant,
      ),
      labelLarge: inter.labelLarge!.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
      ),
      labelMedium: inter.labelMedium!.copyWith(
        color: AppColors.onSurfaceVariant,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
      ),
      labelSmall: inter.labelSmall!.copyWith(
        color: AppColors.onSurfaceVariant,
        fontWeight: FontWeight.w500,
        letterSpacing: 2.0,
        fontSize: 10,
      ),
    );
  }

  static ThemeData get darkTheme {
    final textTheme = _buildTextTheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.surface,
      textTheme: textTheme,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryContainer,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondaryContainer,
        tertiary: AppColors.tertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        error: AppColors.error,
        errorContainer: AppColors.errorContainer,
        surface: AppColors.surface,
        surfaceContainerLowest: AppColors.surfaceContainerLowest,
        surfaceContainerLow: AppColors.surfaceContainerLow,
        surfaceContainer: AppColors.surfaceContainer,
        surfaceContainerHigh: AppColors.surfaceContainerHigh,
        surfaceContainerHighest: AppColors.surfaceContainerHighest,
        onPrimary: AppColors.onPrimary,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        onSecondary: AppColors.onSecondary,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        onTertiary: AppColors.onTertiary,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        onError: AppColors.onError,
        onErrorContainer: AppColors.onErrorContainer,
        onSurface: AppColors.onSurface,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
        inverseSurface: AppColors.inverseSurface,
        onInverseSurface: AppColors.inverseOnSurface,
        inversePrimary: AppColors.inversePrimary,
        surfaceTint: AppColors.surfaceTint,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface.withAlpha(178),
        foregroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w800,
          letterSpacing: 2.0,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceContainerHigh,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimaryContainer,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.outlineVariant),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimaryFixed,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surfaceContainer.withAlpha(178),
        indicatorColor: AppColors.primary.withAlpha(25),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return textTheme.labelSmall?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            );
          }
          return textTheme.labelSmall?.copyWith(
            color: AppColors.onSurfaceVariant,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary);
          }
          return const IconThemeData(color: AppColors.onSurfaceVariant);
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceContainerLow,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.outlineVariant.withAlpha(38),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.onSurfaceVariant.withAlpha(102),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceContainer,
        selectedColor: AppColors.primary,
        labelStyle: textTheme.labelSmall!.copyWith(
          fontWeight: FontWeight.w700,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: BorderSide.none,
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.outlineVariant.withAlpha(38),
        thickness: 1,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surfaceContainerHighest,
        contentTextStyle: textTheme.bodyMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surfaceContainerHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.surfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.onPrimaryContainer;
          }
          return AppColors.onSurfaceVariant;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.surfaceContainerHighest;
        }),
      ),
    );
  }
}
