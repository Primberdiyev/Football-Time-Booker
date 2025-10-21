import 'package:auth/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class AuthRouterImpl implements AuthRouter {
  @override
  void onPushLogin(BuildContext context) => context.router.replace(
        LoginPageRoute(),
      );
}
