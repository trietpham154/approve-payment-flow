import 'package:flutter/material.dart';

abstract final class BrandColors {
  static const primaryNavy = Color(0xFF0F172A);
  static const primaryNavyLight = Color(0xFF1E293B);
  static const emerald = Color(0xFF10B981);
  static const emeraldDark = Color(0xFF059669);
  static const amber = Color(0xFFF59E0B);
  static const red = Color(0xFFEF4444);
  static const surface = Color(0xFFF8FAFC);
  static const card = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFF0F172A);
  static const textSecondary = Color(0xFF64748B);
  static const border = Color(0xFFE2E8F0);
}

final ThemeData approvePaymentFlowTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: BrandColors.primaryNavy,
    onPrimary: Colors.white,
    primaryContainer: BrandColors.primaryNavyLight,
    onPrimaryContainer: Colors.white,
    secondary: BrandColors.emerald,
    onSecondary: Colors.white,
    error: BrandColors.red,
    onError: Colors.white,
    surface: BrandColors.surface,
    onSurface: BrandColors.textPrimary,
  ),
  scaffoldBackgroundColor: BrandColors.surface,
  appBarTheme: const AppBarTheme(
    backgroundColor: BrandColors.surface,
    foregroundColor: BrandColors.textPrimary,
    elevation: 0,
    centerTitle: false,
  ),
  cardTheme: CardThemeData(
    color: BrandColors.card,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: BrandColors.border),
    ),
  ),
);
