import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.function,
    required this.buttonColor,
    this.isLoading = false,
    this.textStyle,
  });
  final String text;
  final Function function;
  final Color buttonColor;
  final TextStyle? textStyle;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = context.theme;
    final colors = theme.colors;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          size.width - 60,
          56,
        ),
        backgroundColor: buttonColor,
      ),
      onPressed: () {
        function.call();
      },
      child: !isLoading
          ? Text(
              text,
              style: textStyle,
            )
          : ShowLoader(
              color: colors.buttonColors.loaderColor,
            ),
    );
  }
}
