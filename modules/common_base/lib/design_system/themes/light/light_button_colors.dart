import 'dart:ui';

import 'package:common_base/common_base.dart';

class LightButtonColors extends ButtonColors {
  @override
  Color get bgPrimary => AppColors.green;

  @override
  Color get bgSecondary => AppColors.yellow;

  @override
  Color get loaderColor => AppColors.white;

  @override
  Color get borderSecond => AppColors.greyScale300;

  @override
  Color get shadowColor => AppColors.dark4.withValues(alpha: 0.05);
}
