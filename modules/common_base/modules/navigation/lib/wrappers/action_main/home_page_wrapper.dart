import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

@RoutePage()
class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
