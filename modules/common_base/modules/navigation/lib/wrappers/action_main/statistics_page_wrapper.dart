import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:statistics/statistics.dart';

@RoutePage()
class StatisticsPageWrapper extends StatelessWidget {
  const StatisticsPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StatisticsPage();
  }
}
