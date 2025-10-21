import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';

class LightInputFieldColor extends InputFieldColors {
  @override
  Color get activeBorderColor => AppColors.green;

  @override
  Color get bgNotActiveColor => AppColors.greyScale50;

  @override
  Color get enabledBorderColor => AppColors.greyScale50;

  @override
  Color get activeIconColor => AppColors.green;

  @override
  Color get bgActiveColor => AppColors.lineGreen;

  @override
  Color get iconFieldEmptyColor => AppColors.spanishGray;

  @override
  Color get iconFieldNotEmptyColor => AppColors.black;
}
