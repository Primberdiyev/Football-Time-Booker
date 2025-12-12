import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    super.key,
    required this.router,
  });
  final AuthRouter router;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.authStatus.isRegistered) {
            router.onPushLogin(context);
          } else if (state.authStatus.isNotRegistered) {
            router.onPushLogin(context);
          }
        },
        child: Center(
          child: Assets.images.logo.image(),
        ),
      ),
    );
  }
}
