import 'package:auto_route/auto_route.dart';
import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

@RoutePage()
class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({
    super.key,
    this.module = const HomeDiModule(),
  });
  final HomeDiModule module;

  @override
  Widget build(BuildContext context) {
    return DiScopeWidget<HomeDiModule>(
      module: module,
      child: BlocDisposer<HomeBloc>(
        create: (context) => module.get<HomeBloc>(),
        builder: (context, state) {
          return HomePage();
        },
      ),
    );
  }
}
