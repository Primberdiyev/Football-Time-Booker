import 'package:action_main/action_main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class ActionMainPageWrapper extends StatelessWidget {
  const ActionMainPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionMainPage(
      router: ActionMainRouterImpl(),
    );
  }
}
