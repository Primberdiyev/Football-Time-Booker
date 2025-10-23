import 'package:action_main/action_main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class ActionMainRouterImpl implements ActionMainRouter {
  @override
  void navigateToHome(BuildContext context) => context.router.navigate(
        HomePageRoute(),
      );

  @override
  void navigateToStatistics(BuildContext context) => context.router.navigate(
        StatisticsPageRoute(),
      );
}
