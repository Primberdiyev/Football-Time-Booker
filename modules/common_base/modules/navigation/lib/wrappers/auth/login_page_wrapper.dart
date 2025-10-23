import 'package:auth/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class LoginPageWrapper extends StatelessWidget {
  const LoginPageWrapper({
    super.key,
    this.module = const AuthDiModule(),
  });
  final AuthDiModule module;

  @override
  Widget build(BuildContext context) {
    return DiScopeWidget<AuthDiModule>(
      module: module,
      child: BlocDisposer<AuthBloc>(
        create: (context) => module.get<AuthBloc>(),
        builder: (context, state) {
          return LoginPage(
            router: AuthRouterImpl(),
          );
        },
      ),
    );
  }
}
