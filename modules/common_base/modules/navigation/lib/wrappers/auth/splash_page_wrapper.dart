import 'package:auth/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class SplashPageWrapper extends StatelessWidget {
  const SplashPageWrapper({
    super.key,
    this.module = const AuthDiModule(),
  });
  final AuthDiModule module;

  @override
  Widget build(BuildContext context) {
    return DiScopeWidget(
      module: module,
      child: BlocDisposer<AuthBloc>(
        create: (context) =>
            module.get<AuthBloc>()..add(CheckIsRegisteredEvent()),
        builder: (context, state) {
          return SplashPage(
            router: AuthRouterImpl(),
          );
        },
      ),
    );
  }
}
