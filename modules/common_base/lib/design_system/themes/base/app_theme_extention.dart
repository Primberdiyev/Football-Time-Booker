import 'package:flutter/material.dart';
import 'package:common_base/common_base.dart';

class AppThemeExtention extends ThemeExtension<AppThemeExtention> {
  const AppThemeExtention({
    required this.colors,
    required this.textStyles,
  });

  final AppThemeColors colors;
  final AppThemeTextStyles textStyles;
  @override
  ThemeExtension<AppThemeExtention> copyWith({
    AppThemeColors? colors,
    AppThemeTextStyles? textStyles,
  }) =>
      AppThemeExtention(
        colors: colors ?? this.colors,
        textStyles: textStyles ?? this.textStyles,
      );

  @override
  ThemeExtension<AppThemeExtention> lerp(
      covariant ThemeExtension<ThemeExtension>? other, double t) {
    if (other is! AppThemeExtention) return this;
    return AppThemeExtention(
      colors: colors,
      textStyles: textStyles,
    );
  }
}
