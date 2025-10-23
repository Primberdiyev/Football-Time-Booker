import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    required this.passiveIconPath,
    required this.activeIconPath,
    required this.activeTextStyle,
    required this.passiveTextStyle,
    this.width = 24,
    this.height = 24,
    this.spacing = 2,
  });
  final SvgGenImage passiveIconPath;
  final SvgGenImage activeIconPath;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final double width;
  final double height;
  final TextStyle activeTextStyle;
  final TextStyle passiveTextStyle;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selected ? activeIconPath.svg() : passiveIconPath.svg(),
            SizedBox(
              height: spacing,
            ),
            Text(
              label,
              style: selected ? activeTextStyle : passiveTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
