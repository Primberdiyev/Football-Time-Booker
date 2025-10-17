import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';

class LightThemeHeadingTextStyles extends AppThemeHeadingTextStyles {
  const LightThemeHeadingTextStyles();
  @override
  TextStyle get head1 => TextStyle(
        color: AppColors.greyScale900,
        fontFamily: fontFamily,
        fontSize: 48,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get head2 => TextStyle(
        color: AppColors.greyScale900,
        fontFamily: fontFamily,
        fontSize: 40,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get head3 => TextStyle(
        color: AppColors.greyScale900,
        fontFamily: fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get head4 => TextStyle(
        color: AppColors.greyScale900,
        fontFamily: fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get head5 => TextStyle(
        color: AppColors.greyScale900,
        fontFamily: fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get head6 => TextStyle(
        color: AppColors.greyScale900,
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );
}
