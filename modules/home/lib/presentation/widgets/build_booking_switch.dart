import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';

class BuildBookingSwitch extends StatelessWidget {
  const BuildBookingSwitch({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.theme.textStyles;
    final colors = context.theme.colors;
    final locale = context.appLocale;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: textStyles.body.bLBody16,
          ),
          Row(
            children: [
              Text(
                value ? locale.yes : locale.no,
                style: textStyles.body.bLBody16.copyWith(
                  color: value
                      ? colors.buttonColors.bgPrimary
                      : colors.textColors.blackText,
                ),
              ),
              const SizedBox(width: 8),
              Switch.adaptive(
                value: value,
                onChanged: onChanged,
                activeColor: colors.buttonColors.bgPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
