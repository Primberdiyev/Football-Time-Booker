import 'package:common_base/common_base.dart';

final lightThemeExtension = AppThemeExtention(
  colors: AppThemeColors(
    backgroundColors: LightBackgroundColors(),
    buttonColors: LightButtonColors(),
    inputFieldColors: LightInputFieldColor(),
  ),
  textStyles: AppThemeTextStyles(
    heading: LightThemeHeadingTextStyles(),
    body: LightThemeBodyTextStyles(),
  ),
);
