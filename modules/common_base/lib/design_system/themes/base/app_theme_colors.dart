import 'package:common_base/common_base.dart';

class AppThemeColors {
  const AppThemeColors(
      {required this.backgroundColors,
      required this.buttonColors,
      required this.inputFieldColors,
      required this.iconColors})
      : textColors = const TextColors();

  final BackgroundColors backgroundColors;
  final ButtonColors buttonColors;
  final TextColors textColors;
  final InputFieldColors inputFieldColors;
  final IconColors iconColors;
}
