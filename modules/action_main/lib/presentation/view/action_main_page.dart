import 'package:action_main/action_main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class ActionMainPage extends StatefulWidget {
  const ActionMainPage({super.key, required this.router});
  final ActionMainRouter router;

  @override
  State<ActionMainPage> createState() => _ActionMainPageState();
}

class _ActionMainPageState extends State<ActionMainPage> {
  final PageController _pageController = PageController();
  int value = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colors;
    final locale = context.appLocale;
    final textStyles = theme.textStyles;
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarItem(
                  label: locale.main,
                  selected: value == 0,
                  onTap: () {
                    value = 0;
                    widget.router.navigateToHome(context);
                  },
                  passiveIconPath: Assets.icons.home,
                  activeIconPath: Assets.icons.homeActive,
                  activeTextStyle: textStyles.body.bXSBody10
                      .copyWith(color: colors.textColors.activeTextColor),
                  passiveTextStyle: textStyles.body.mXSBody10.copyWith(
                    color: colors.textColors.notActiveTextColor,
                  ),
                ),
                NavBarItem(
                  label: locale.statistics,
                  selected: value == 1,
                  onTap: () {
                    value = 1;
                    widget.router.navigateToStatistics(context);
                  },
                  passiveIconPath: Assets.icons.chart,
                  activeIconPath: Assets.icons.chartActive,
                  activeTextStyle: textStyles.body.bXSBody10
                      .copyWith(color: colors.textColors.activeTextColor),
                  passiveTextStyle: textStyles.body.mXSBody10.copyWith(
                    color: colors.textColors.notActiveTextColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
