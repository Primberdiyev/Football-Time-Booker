import 'package:auth/auth.dart';
import 'package:auto_route/annotations.dart';
import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class RegisterPageWrapper extends StatelessWidget {
  const RegisterPageWrapper({
    super.key,
    this.authDiModule = const AuthDiModule(),
  });
  final AuthDiModule authDiModule;

  @override
  Widget build(BuildContext context) {
    return DiScopeWidget(
      module: authDiModule,
      child: BlocDisposer<AuthBloc>(
          create: (context) => authDiModule.get<AuthBloc>(),
          builder: (_, bloc) {
            return RegisterPage(
              router: AuthRouterImpl(),
            );
          }),
    );
  }
}
