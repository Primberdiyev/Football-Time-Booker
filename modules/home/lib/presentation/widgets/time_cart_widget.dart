import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';

class TimeCartWidget extends StatelessWidget {
  const TimeCartWidget({
    super.key,
    required this.text,
    required this.function,
  });
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colors;
    final locale = context.appLocale;
    final textStyles = theme.textStyles;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: colors.inputFieldColors.iconFieldEmptyColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: textStyles.heading.head5,
          ),
          Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              fixedSize: Size(120, 20),
              alignment: Alignment.center,
              backgroundColor: colors.buttonColors.bgPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              function();
            },
            child: Text(
              locale.book,
              style: textStyles.body.bLBody16.copyWith(
                color: colors.textColors.whiteTextColor,
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
