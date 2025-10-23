import 'dart:ui';

import 'package:common_base/common_base.dart';

class LightIconColors implements IconColors {
  @override
  Color get activeIconColor => AppColors.green;

  @override
  Color get notActiveIconColor => AppColors.greyScale500;
}
