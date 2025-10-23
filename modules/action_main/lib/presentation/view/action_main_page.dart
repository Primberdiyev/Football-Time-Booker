import 'package:action_main/action_main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class ActionMainPage extends StatelessWidget {
  const ActionMainPage({super.key, required this.router});
  final ActionMainRouter router;
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colors;
    return AutoTabsScaffold(
      extendBody: true,
      routes: [
        HomePageRoute(),
        StatisticsPageRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SizedBox(
          height: 90,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colors.backgroundColors.scaffoldColor,
            ),
            child: Row(
              children: [],
            ),
          ),
        );
      },
    );
  }
}
