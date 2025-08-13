import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Font Family
  static const String fontFamily = 'Poppins';

  // Noto Sans - Display styles
  static final TextStyle displayLarge = GoogleFonts.notoSans(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.0, // line-height: 100%
    letterSpacing: 0,
    color: AppColors.white,
  );

  static final TextStyle displayMedium = GoogleFonts.notoSans(
    fontSize: 17,
    fontWeight: FontWeight.w600, // SemiBold
    height: 1.0, // 100% line-height
    letterSpacing: 0,
    color: AppColors.white,
  );

  static final TextStyle displaySmall = GoogleFonts.notoSans(
    fontSize: 14,
    fontWeight: FontWeight.w600, // SemiBold
    height: 1.0, // 100% line-height
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  // Headline Styles
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  // Title Styles
  /// Large Title
  static TextStyle titleLarge = GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 20,
    height: 28 / 20,
    letterSpacing: 0,
  );

  /// Medium Title
  static TextStyle titleMedium = GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 18,
    height: 26 / 18,
    letterSpacing: 0,
    color: AppColors.white,
  );

  /// Small Title
  static TextStyle titleSmall = GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0,
    color: AppColors.gray700,
  );

  // Body Styles
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: AppColors.textPrimary,
  );

  // Label Styles
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );

  // Button Styles
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.white,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.white,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.white,
  );

  // Caption Styles
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: AppColors.textSecondary,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: AppColors.textSecondary,
  );

  // Custom Styles
  static TextStyle get primaryText =>
      bodyLarge.copyWith(color: AppColors.primary);

  static TextStyle get secondaryText =>
      bodyLarge.copyWith(color: AppColors.secondary);

  static TextStyle get successText =>
      bodyLarge.copyWith(color: AppColors.success);

  static TextStyle get errorText => bodyLarge.copyWith(color: AppColors.error);

  static TextStyle get warningText =>
      bodyLarge.copyWith(color: AppColors.warning);

  static TextStyle get infoText => bodyLarge.copyWith(color: AppColors.info);

  static TextStyle get disabledText =>
      bodyLarge.copyWith(color: AppColors.textDisabled);
}
