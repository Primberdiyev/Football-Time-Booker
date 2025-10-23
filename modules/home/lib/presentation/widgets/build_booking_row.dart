import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';

class BuildBookingRow extends StatelessWidget {
  const BuildBookingRow({
    super.key,
    required this.label,
    required this.child,
  });
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.theme.textStyles;
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: textStyles.body.bLBody16,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(child: child),
        ],
      ),
    );
  }
}
